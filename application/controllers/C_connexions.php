<?php
class C_connexions extends CI_Controller {
    public function __construct()
    {
        parent::__construct();
        //initialisation de la session
        $this->load->model('M_connexions', 'conn');
        $this->load->model('sys/M_sys_role', 'role');
        $this->load->model('demande/M_demande', 'dem');

        $this->load->helper('form');
        $this->load->library('form_validation');
        $this->load->helper('url');
        $this->load->library('javascript');
        $this->load->model('sys/M_sys_user', 'user');
    }


    public function authentication()
    {
        //$this->load->library('session');
        $suite_req = site_url();
        $ien 	   = $this->input->post('ien');
        $passe 	   = $this->input->post('passe');
       // $ans = $this->param_annee->get_anscours();
        if (strlen(trim($ien)) > 8)
        {

            $info = file_get_contents("http://apps.education.sn/ien-structure/".trim($ien));
            $infos = json_decode($info,true ) ;
            if ($infos["code"] == 1 or $info == false)
            {
                $this->noconn($ien,$suite_req);
                exit();
            }
            else
            {
                $ien = $infos["ien"];
            }

        }

        $data['connexions_data'] = $this->conn->test_connexion($ien,$passe);
        //  var_dump( $data['connexions_data']);exit();
        if(empty($data['connexions_data'])){
            $this->noconn($ien,$suite_req);
        }

        $datas_user = array(
            'ien'		 => $ien,
            'id'		 =>  $data['connexions_data']['id'],
            'prenom'    => $data['connexions_data']['prenom'],
            'nom'    => $data['connexions_data']['nom'],
            'id_profil'	 => $data['connexions_data']['id_profil'],
            'profil'	 => $data['connexions_data']['libelle_type_profil'],
            'email_pro'  => $data['connexions_data']['email_pro'],
            'code_str'   => $data['connexions_data']['code_str'],
            'libelle_structure'=> $data['connexions_data']['libelle_structure'],
            'logged_in'  => TRUE
        );
        $id_profil 	= $data['connexions_data']['id_profil'];

        $tab_mrole	= array();   ///Tableau des roles des menus
        $tab_smrole	= array();  ///Tableau des roles des sous menus
        $cur_menu	= '';

        $tab_role	= $this->role->get_conn_roles($id_profil);

        foreach($tab_role as $val)
        {
            ///Tableau des droits sur les menus
            if($cur_menu != $val->mcode)
            {
                $tab_mrole[$val->mcode] = 1;
                $cur_menu = $val->mcode;
            }

            //Tableau des droits sur les sous menus
            //On ne recup�re que les valeurs positives
            if($val->d_read){ $tab_smrole[$val->smcode]['d_read']	= $val->d_read;}
            if($val->d_add){ $tab_smrole[$val->smcode]['d_add']	= $val->d_add;}
            if($val->d_upd){ $tab_smrole[$val->smcode]['d_upd']	= $val->d_upd;}
            if($val->d_del){ $tab_smrole[$val->smcode]['d_del']	= $val->d_del;}
        }

        ///Chargement des donn�es de la tableau $data
        $data['menu_roles']		= $tab_mrole;
        $data['smenu_roles']	= $tab_smrole;


        //var_dump($tab_smrole);
        //exit();
        // get annee_en_cours

        $this->session->set_userdata('menu_roles', $data['menu_roles']);
        $this->session->set_userdata('smenu_roles', $data['smenu_roles']);
        $this->session->set_userdata($datas_user);

        @$photo = file_get_contents("http://apps.education.sn/C_personnel_api/get_pic_src/".$ien);
        if ($photo !=FALSE)
        {$this->session->set_userdata('photo', $photo);}
        else
        {$this->session->set_userdata('photo', base_url().'assets/images/users/avatar-1.jpg') ;}

        //$this->load->view('template/layout',$data);
        //var_dump($suite_req);exit();
        header("Location:".$suite_req."dashboard");

    }


    //redefinition de Dashbord
    public function home()
    {
        $tab_data_ses = $this->session->all_userdata();
        //var_dump($tab_data_ses);exit();

        if ( !isset($tab_data_ses['ien']) || empty($tab_data_ses['code_str']) || empty($tab_data_ses['prenom']))
        {
            $this->session->sess_destroy();
            header("Location:".site_url()."sign-in?erreur=login");
            exit();
        }
        else
        {
            $data['nb_demande']	= $this->dem->tt_demande();
            $data['nb_encours']	= $this->dem->tt_nb_encours();
            $data['nb_traite']	= $this->dem->tt_traite();
            //var_dump($this->dem->tt_annule());exit();
            $data['nb_annule']	= $this->dem->tt_annule();
            $this->load->view('template/layout',$data);
        }

    }

    //se_deconnecter
    public function noconn($ien,$suite_req)
    {
        $the_data = array(
            'ip' 			=> $_SERVER['REMOTE_ADDR'] ,
            'navigateur' 	=> $_SERVER['HTTP_USER_AGENT'],
            'login' 		=> str_replace("'","",$ien)

        );

        //on log les erreurs
        header("Location:".$suite_req."sign-in?erreur=login");
    }

    public function se_deconnecter()
    {
        $suite_req = site_url();

        $this->session->sess_destroy();	// destruction des donnees de la session
        header("Location:".$suite_req."sign-in");
    }

    public function gen_pass()
    {
        $args = func_get_args();
        //var_dump($args);exit();
        $ien = $args[0];
        //var_dump($ien);exit();
        @$infos = file_get_contents("http://apps.education.sn/C_personnel_api/getIEN_info_all?ien=$ien");
        $infos = json_decode($infos,true ) ;
        //var_dump($infos);exit();
        $infos = $infos["record"];
        //var_dump($infos);exit();
        $prenom = $infos["prenom"];
        $nom = $infos["nom"];
        $mail = $infos["email_pro"];
        $gen_pass = Genere_Password()["ien"];
        $this->conn->up_mdp($ien,$gen_pass);
        $this->sendmail($prenom,$nom,$mail,$gen_pass,$ien);
        $d=array("status" => "success", "message" =>"Authentification envoyée" );

        echo json_encode($d, JSON_HEX_TAG | JSON_HEX_APOS | JSON_HEX_QUOT | JSON_HEX_AMP);
    }

    public function sendmail($prenom,$nom,$mail,$mdp,$ien)
    {

        if (ENVIRONMENT !== 'production')
        {
            $conf = Array(
                'protocol'  => 'smtp',
                'smtp_host' => 'ssl://smtp.googlemail.com',
                'smtp_port' =>	465,
                'smtp_user' => 'info@education.sn',
                'smtp_pass' => 'SimenSupport',
                'mailtype'  => 'html',
                'charset'   => 'utf-8');
        }
        else {
            $conf = Array(
                'protocol' => 'smtp',
                'smtp_host' => 'us2.smtp.mailhostbox.com',
                'smtp_port' => 587,
                'smtp_user' => 'noreply3@education.sn',
                'smtp_pass' => '!HO^$D@5',
                'mailtype' => 'html',
                'charset' => 'utf-8'
            );
        }
        $email = send_mail_affectation1($prenom,$nom,$ien,$mdp);
        $this->load->library('email',$conf);
        $this->email->from('noreply3@education.sn', 'Service technique SIMEN');
        $this->email->to($mail);
        $this->email->subject('Service SIMEN  - Men-Gestion');
        $this->email->message($email);
        $this->email->set_newline("\r\n");
        return $this->email->send();
    }





}

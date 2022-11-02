<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class C_demande extends MY_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->model('demande/M_type_demande', 'type');
        $this->load->model('partenaire/M_partenaire', 'part');
        $this->load->model('structure/M_structure', 'struc');
        $this->load->model('demande/M_demande', 'dem');
    }

    public function index()
    {

        $all_ia                 = $this->struc->get_list_ia();
        $data['select_ia'] 	    = create_select_list($all_ia, 'code_ia', 'value_ia', '');
        $all_ief                = $this->struc->get_list_ief();
        $data['select_ief']     = create_select_list($all_ief,'code_ief', 'value_ief', '','code_ia');

        $all_commune            = $this->struc->get_list_commune();
        $data['select_commune'] = create_select_list($all_commune,'code_area', 'value_area', '','code_ief');

        $data["all_ia"] = $this->struc->get_list_ia();
        $data["all_commune"] = $this->struc->get_list_commune();
        $data['all_data'] = $this->dem->get_data();
        $struc = $this->struc->get_struct_central();
        $type = $this->type->get_data();
        $partenaire = $this->part->get_data();
        $data['select_partenaire'] = create_select_list($partenaire, 'id_partenaire', 'nom_partenaire');
        $data['select_type'] = create_select_list($type, 'id_type_demande', 'libelle','','id_partenaire');
        $data['select_structure'] = create_select_list($struc, 'code_str', 'libelle_structure');
        // var_dump($this->dem->fetch_type(3));exit();

        $this->load->view('demande/V_demande', $data);

    }

    public function change_etat()
    {
        $args = func_get_args();
        $this->dem->id_demande = $args[0];
        $data['info'] = $this->dem->get_record_tr($args[0]);
        //var_dump($this->dem->get_num_ligne(16));exit();

        $this->load->view('demande/V_change_etat',$data);
    }

    public function traitement()
    {
        $id = func_get_args()[0];
        $etat = $_POST["etat"];
        $obs = $_POST["observation"];
        if(isset($_POST["numero_compteur"]))
        {$num_compteur = $_POST["numero_compteur"];}
        else {$num_compteur = null;}

        if(isset($_POST["type_compteur"]))
        {$type_compteur = $_POST["type_compteur"];}
        else {$type_compteur = null;}

        if(isset($_POST["numero_ligne"]))
        {$numero_ligne = $_POST["numero_ligne"];}
        else {$numero_ligne = null;}

        if(isset($_POST["type_connexion"]))
        {$type_conn = $_POST["type_connexion"];}
        else {$type_conn = null;}

        if(isset($_POST["debit"]))
        {$debit = $_POST["debit"];}
        else {$debit = null;}

        if(isset($_POST["nouveau_debit"]))
        {$nouveau_debit = $_POST["nouveau_debit"];}
        else {$nouveau_debit = null;}

        if(isset($_POST["offre"]))
        {$offre = $_POST["offre"];}
        else {$offre = null;}

        if(isset($_POST["nouvelle_offre"]))
        {$nouvelle_offre = $_POST["nouvelle_offre"];}
        else {$nouvelle_offre = null;}

        if(isset($_POST["nouveau_numero"]))
        {$nouveau_numero = $_POST["nouveau_numero"];}
        else {$nouveau_numero = null;}

        if(isset($_POST["etat_numero"]))
        {$etat_numero = $_POST["etat_numero"];}
        else {$etat_numero = null;}

        if(isset($_POST["adresse"]))
        {$adr = $_POST["adresse"];}
        else {$adr = null;}

        if(isset($_POST["nouvelle_adr"]))
        { $nouvelle_adr = $_POST["nouvelle_adr"];}
        else { $nouvelle_adr = null;}

        $this->dem->etat_change($id, $etat, $obs, $num_compteur, $type_compteur, $numero_ligne, $type_conn, $debit, $nouveau_debit, $offre, $nouvelle_offre, $nouveau_numero, $etat_numero, $adr, $nouvelle_adr);
        $result['status']='success';
        $result['message']='demande traitee';
        echo json_encode($result, JSON_HEX_TAG | JSON_HEX_APOS | JSON_HEX_QUOT | JSON_HEX_AMP);

    }



    public function get_record()
    {
        $args = func_get_args();
        $this->dem->id_demande = $args[0];
        $this->dem->get_record();
        echo json_encode($this->dem, JSON_HEX_TAG | JSON_HEX_APOS | JSON_HEX_QUOT | JSON_HEX_AMP);
    }

    public function delete()
    {
        $args = func_get_args();
        $this->dem->id_demande = $args[0];
        echo json_encode($this->dem->delete(), JSON_HEX_TAG | JSON_HEX_APOS | JSON_HEX_QUOT | JSON_HEX_AMP);
    }


    public function save()
    {
        if ($this->input->post('id_demande') != '')
        {
            $this->dem->id_demande = $this->input->post('id_demande');
        }

        $numero = null;
        $str = null;
        $ecole = null;
        $numero = $this->dem->verif_numero($this->input->post('numero_demande'));
        $str = $this->dem->verif_struc($this->input->post('id_structure'));
        $ecole = $this->dem->verif_struc($this->input->post('id_etab'));
//var_dump($ecole);var_dump($_POST['etab']);exit();
        if ($str == null and isset($_POST['nc']))
        {
            $d=array("status" => "error", "message" =>"Veuillez vérifier si vous avez chargé la Structure !" );
            echo json_encode($d, JSON_HEX_TAG | JSON_HEX_APOS | JSON_HEX_QUOT | JSON_HEX_AMP);
            die();
        }

        if ($ecole == null and isset($_POST['etab']))
        {
            $d=array("status" => "error", "message" =>"Veuillez vérifier si vous avez chargé l'établissement !" );
            echo json_encode($d, JSON_HEX_TAG | JSON_HEX_APOS | JSON_HEX_QUOT | JSON_HEX_AMP);
            die();
        }

        if ($numero != null and !isset($this->dem->id_demande))
        {
            $d=array("status" => "error", "message" =>"Cette Demande existe déja (Numero) !" );
            echo json_encode($d, JSON_HEX_TAG | JSON_HEX_APOS | JSON_HEX_QUOT | JSON_HEX_AMP);
            die();
        }
        else
        {
            $this->dem->numero_demande = $this->input->post('numero_demande');
            $this->dem->objet_demande = $this->input->post('objet_demande');
            $this->dem->date_demande = $this->getDatetimeNow();
            $this->dem->etat_demande = '0';
            $this->dem->id_partenaire = $this->input->post('id_partenaire');
            $this->dem->id_type_demande = $this->input->post('id_type_demande');
            if(isset($_POST['nc']))
            {
                $this->dem->code_str = $this->input->post('id_structure');
            }
            elseif(isset($_POST['etab']))
            {
                $this->dem->code_str = $this->input->post('id_etab');
            }
            if($this->dem->get_lib_type($this->input->post('id_type_demande')) == "Ouverture de ligne")
            {
                $this->dem->etat_numero = '1';
            }
            echo json_encode($this->dem->save(), JSON_HEX_TAG | JSON_HEX_APOS | JSON_HEX_QUOT | JSON_HEX_AMP);
        }

    }

    function getDatetimeNow()
    {
        $tz_object = new DateTimeZone('UTC');
        $datetime = new DateTime();
        $datetime->setTimezone($tz_object);
        return $datetime->format('Y\-m\-d\ h:i:s');
    }
}

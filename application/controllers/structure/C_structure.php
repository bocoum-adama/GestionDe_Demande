<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class C_structure extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('structure/M_structure', 'struct');
    }

    public function index()
    {
       $all_ia              = $this->struct->get_list_ia();
	   $data['select_ia'] 	= create_select_list($all_ia, 'code_ia', 'value_ia', '');

       if($this->session->code_ia == null)
       {
            $data["all_data"] = $this->struct->get_data_centr();
       }
       else{
            $data["all_data"] = $this->struct->get_data_centr_by_code_ia($this->session->code_ia);
       }

       $this->load->view('structure/V_structure_centr',$data);
    }

    public function etablissements()
    {
        $data['all_cycle'] = array(
            "1" => "Préscolaire",
            "2" => "Elementaire",
            "3" => "Moyen",
            "4" => "Secondaire",
            "5" => "Moyen secondaire",
            "6" => "Daara",
        );
        
        $all_ia                 = $this->struct->get_list_ia();
		$data['select_ia'] 	    = create_select_list($all_ia, 'code_ia', 'value_ia', '');
        $all_ief                = $this->struct->get_list_ief();
        $data['select_ief']     = create_select_list($all_ief,'code_ief', 'value_ief', '','code_ia');

        $all_commune            = $this->struct->get_list_commune();
        $data['select_commune'] = create_select_list($all_commune,'code_area', 'value_area', '','code_ief');

        $data["all_ia"] = $this->struct->get_list_ia();
        $data["all_commune"] = $this->struct->get_list_commune();
        //var_dump($data["all_cycle"]);exit;
        $data["all_data"]       = $this->struct->get_data_etab();
        if($this->session->code_ia==null)
        {
            $data["all_data"] = $this->struct->get_data_etabl();
        }
        else{
            $data["all_data"] = $this->struct->get_data_etabl_by_code_ia($this->session->code_ia);
        }

        $this->load->view('structure/V_structure_etab',$data);
    }
    
    public function save_struct_central()
    {
        extract($_POST);
        $tab = array();
        $tab_ex = array();

        if($type_structure=="Niveau central")
        {
            //Structure du niveau central
            $data = apiGetData('codeco', 'ien-get/institution');
            $institutions  = $data->institutions;
           
            foreach($institutions as $value)
            {
                $this->struct->code_str = $value->code_institution;
                $this->struct->get_record_by_code_str();
                
                $data_tab = array(
                    "code_str"             => $value->code_institution,
                    "libelle_structure"    => $value->value_institution,
                    "adresse_str"          =>  null,
                    "categorie_structure"  => substr($value->code_institution, 0,1),
                    "etat_str"             => '1',
                    "code_ia"              => null,
                    "code_ief"             => null,
                    "code_commune"          => null,
                    "libelle_ia"           => null,
                    "libelle_ief"          => null,
                    "libelle_commune"      => null,
                    "cycle"                => null,
                    "id_cycle"             => null
                );
                //$la_structure = $this->struct->get_structure_by_id($data_tab['code_str']);
                //var_dump($la_structure);exit;
                if($this->struct->code_str==null)
                {
                    $tab[] = $data_tab;
                }
                else{
                    $tab_ex[] = $data_tab;
                }
                   // $tab[] = $data_tab;
            }
        }
        else{
            //Structure du niveau IA - IEF - CAOS -IME
            $data_d = apiGetData('codeco', 'get-structure-atlas-by-type/'.$type_structure);
            $structures  = $data_d->structures;

            foreach($structures as $value)
            {
                $this->struct->code_str = $value->code_str;
                $this->struct->get_record_by_code_str();
                $data_tab_d = array(
                    "code_str"             => $value->code_str,
                    "libelle_structure"    => $value->libelle_structure,
                    "adresse_str"          => null,
                    "categorie_structure"  => $value->id_categorie,
                    "etat_str"             => '1',
                    "code_ia"              => $value->id_atlas,
                    "code_ief"             => null,
                    "code_commune"         => null,
                    "libelle_ia"           => null,
                    "libelle_ief"          => null,
                    "libelle_commune"      => null,
                    "cycle"                => null,
                    "id_cycle"             => null
                );
                //$la_structure = $this->struct->get_structure_by_id($data_tab['code_str']);
                //var_dump($la_structure);exit;
                if($this->struct->code_str==null)
                {
                    $tab[] = $data_tab_d;
                }
                else{
                    $tab_ex[] = $data_tab_d;
                }
                //$tab[] = $data_tab_d;
            }
        }
        echo json_encode($this->struct->save_structure($tab,$tab_ex),JSON_HEX_TAG | JSON_HEX_APOS | JSON_HEX_QUOT | JSON_HEX_AMP);
    }
    public function save_struct_etablissement()
    {
        $code_cycle =$this->input->post('code_cycle');
        $code_ia =$this->input->post('code_ia');
        $data = apiGetData('codeco', 'ien-get/list_etablissement?code_cycle='.$code_cycle.'&ia='.$code_ia);
        /*$url = 'https://codeco.education.sn/ien-get/list_etablissement?code_cycle='.$code_cycle.'&ia='.$code_ia;
        $data = json_decode(file_get_contents($url));*/
        $etablissements = $data->Etablissements;

        //var_dump($etablissements);exit;

        $tab = array();
        $tab_ex=array();
        foreach($etablissements as $value)
        {
            //var_dump($value);exit;
            $this->struct->code_str = $value->id;
            $this->struct->get_record_by_code_str();
            //ve($this->struct);
            /*if($this->struct->code_str==null)
                {*/
            $data_tab = array(
                "code_str"             => $value->id,
                "libelle_structure"    => $value->libelle,
                "adresse_str"          => $value->adresse,
                "categorie_structure"  => '3',
                "etat_str"             => '1',
                "code_ia"              => $value->id_ia,
                "code_ief"             => $value->id_ief,
                "code_commune"         => $value->id_commune,
                "libelle_ia"           => $value->IA,
                "libelle_ief"          => $value->IEF,
                "libelle_commune"      => $value->libelle_commune,
                "cycle"                => $value->cycle,
                "id_cycle"             =>  $this->input->post('code_cycle')
            );
            if($this->struct->code_str==null)
            {
                $tab[] = $data_tab;
            }
            else{
                $tab_ex[] = $data_tab;
            }

        }
        echo json_encode($this->struct->save_structure($tab,$tab_ex),JSON_HEX_TAG | JSON_HEX_APOS | JSON_HEX_QUOT | JSON_HEX_AMP);
    }

    public function get_record()
    {
        $arg = func_get_args();
		$id = $arg[0];
        $this->struct->id_struct = $id;
        $this->struct->get_record();
        echo json_encode($this->struct,JSON_HEX_TAG | JSON_HEX_APOS | JSON_HEX_QUOT | JSON_HEX_AMP);
    }

    public function delete()
    {
        $arg = func_get_args();
		$id = $arg[0];
        $this->struct->id_struct = $id;
        $this->struct->delete();
        $a = array(
            'status'=>'success',
            'message'=>'Suppression reussie',
        );
        echo json_encode($a,JSON_HEX_TAG | JSON_HEX_APOS | JSON_HEX_QUOT | JSON_HEX_AMP);
    }

    public function fetch_etab()
    {
        if ($this->input->post('code_area'))
        {
            echo $this->struct->fetch_etab($this->input->post('code_area'));
        }
    }

}

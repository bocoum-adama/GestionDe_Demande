<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class C_structureOld extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('structure/M_structureOld', 'struct');
    }

    public function index()
    {
        $data['all_data'] = $this->struct->get_data();
        $liste_ia = $this->struct->get_list_ia();
        $liste_cycle = $this->struct->get_list_cycle();
        $data['liste_ia'] = create_select_list($liste_ia, 'code_ia', 'value_ia');
        $data['liste_cycle'] = create_select_list($liste_cycle, 'code_cycle', 'value_cycle');
        $this->load->view('structure/V_structure_etab', $data);


    }

    public function save_struct_central()
    {
        extract($_POST);
        $tab = array();
        $tab_ex = array();

        //Structure du niveau central
        $instittution = apiGetData('codeco', 'ien-get/institution');
        $institutions  = $instittution->institutions;
        //var_dump($instittution->code);exit;

        //Structure du niveau IA - IEF - CAOS -IME
        $structure = apiGetData('codeco', 'ien-get/list_structure_deconcentre');
        $structures  = $structure->Structures;
        //var_dump($structure->code);exit;

        if($instittution->code == 0)
        {
            foreach($institutions as $value)
            {
                $data_tab = array(
                    "code_str"             => $value->code_institution,
                    "libelle_structure"    => $value->value_institution,
                    "adresse_str"          =>  null,
                    "categorie_structure"  => substr($value->code_institution, 0,1),
                    "etat_str"             => '1',
                    "code_ia"              => null,
                    "code_ief"             => null,
                    "code_commune"         => null,
                    "libelle_ia"           => null,
                    "libelle_ief"          => null,
                    "libelle_commune"      => null,
                    "cycle"                => null,
                    "id_cycle"             => null
                );
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
        if($structure->code == 0)
        {
            foreach($structures as $value)
            {
                if($value->id_parent == 0)
                {
                    $data_tab_d = array(
                        "code_str"             => $value->id,
                        "libelle_structure"    => $value->libelle_structure,
                        "adresse_str"          => null,
                        "categorie_structure"  => substr($value->id, 0,1),
                        "etat_str"             => '1',
                        "code_ia"              => $value->id,
                        "code_ief"             => null,
                        "code_commune"         => null,
                        "libelle_ia"           => null,
                        "libelle_ief"          => null,
                        "libelle_commune"      => null,
                        "cycle"                => null,
                        "id_cycle"             => null
                    );
                    if($this->struct->code_str==null)
                    {
                        $tab[] = $data_tab_d;
                    }
                    else{
                        $tab_ex[] = $data_tab_d;
                    }
                }
                if($value->id_parent != 0)
                {
                    $data_tab_d = array(
                        "code_str"             => $value->id,
                        "libelle_structure"    => $value->libelle_structure,
                        "adresse_str"          => null,
                        "categorie_structure"  => substr($value->id, 0,1),
                        "etat_str"             => '1',
                        "code_ia"              => $value->id_parent,
                        "code_ief"             => $value->id,
                        "code_commune"         => null,
                        "libelle_ia"           => null,
                        "libelle_ief"          => null,
                        "libelle_commune"      => null,
                        "cycle"                => null,
                        "id_cycle"             => null
                    );
                    if($this->struct->code_str==null)
                    {
                        $tab[] = $data_tab_d;
                    }
                    else{
                        $tab_ex[] = $data_tab_d;
                    }
                }

                //$tab[] = $data_tab_d;
            }
        }
        //var_dump($tab);
        //var_dump($tab_ex);
        exit;
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
}

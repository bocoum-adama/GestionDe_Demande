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
        //var_dump($struc);exit;
        $data['select_partenaire'] = create_select_list($partenaire, 'id_partenaire', 'nom_partenaire');
        $data['select_type'] = create_select_list($type, 'id_type_demande', 'libelle');
        $data['select_structure'] = create_select_list($struc, 'code_str', 'libelle_structure');
        $this->load->view('demande/V_demande', $data);

    }

    public function change_etat()
    {

       // $this->load->view('demande/V_change_etat');
        $args = func_get_args();
        $this->dem->id_demande = $args[0];
        $data['info'] = $this->dem->get_record_tr($args[0]);
//        var_dump($_GET);
//        exit;

        $this->load->view('demande/V_change_etat',$data);
//var_dump($data['info_api']);
//exit;
//        $data['module_api'] = $this->api->get_list_module_where();
//        $data['list_module'] = $this->module->get_data();
//        $this->doc->id_api = $this->api->id_api;
//        $data['infos_documentation'] = $this->doc->get_record_tr();
//        $data['all_rubrique'] = $this->rubrique->get_data();
//        $data['list_typeapi'] = $this->typeapi->get_data();

    }

    public function traitement()
    {
        //var_dump($this->input->post('etat'));exit;
        $id = func_get_args()[0];
        $etat = $_POST["etat"];
        $obs = $_POST["observation"];
        //var_dump($id);exit;
        $this->dem->etat_change($id, $etat, $obs );
        //$this->change_etat();
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
        $objet = null;
        $numero = $this->dem->verif_numero($this->input->post('numero'));
        $objet = $this->dem->verif_objet($this->input->post('objet'));

        if ($objet != null and !isset($this->dem->id_demande))
        {
            $d=array("status" => "error", "message" =>"Cette Demande existe déja (Objet) !" );
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
            $this->dem->numero_demande = $this->input->post('numero');
            $this->dem->objet_demande = $this->input->post('objet');
            $this->dem->date_demande = $this->getDatetimeNow();
            $this->dem->etat_demande = '0';
            $this->dem->id_partenaire = $this->input->post('id_partenaire');
            $this->dem->id_type_demande = $this->input->post('id_type_demande');
            $this->dem->code_str = $this->input->post('id_structure');

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

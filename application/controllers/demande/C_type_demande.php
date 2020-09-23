<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class C_type_demande extends MY_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->model('demande/M_type_demande', 'type');
        $this->load->model('partenaire/M_partenaire', 'part');
    }

    public function index()
    {
        $data['all_data'] = $this->type->get_data();
        $partenaire = $this->part->get_data();
        $data['select_partenaire'] = create_select_list($partenaire, 'id_partenaire', 'nom_partenaire');
//
        $this->load->view('demande/V_type_demande', $data);

    }


    public function get_record()
    {
        $args = func_get_args();
        $this->type->id_type_demande = $args[0];
        $this->type->get_record();
        echo json_encode($this->type, JSON_HEX_TAG | JSON_HEX_APOS | JSON_HEX_QUOT | JSON_HEX_AMP);
    }

    public function delete()
    {
        $args = func_get_args();
        $this->type->id_type_demande = $args[0];
        echo json_encode($this->type->delete(), JSON_HEX_TAG | JSON_HEX_APOS | JSON_HEX_QUOT | JSON_HEX_AMP);
    }

    public function save()
    {
        if ($this->input->post('id_type_demande') != '')
        {
            $this->type->id_type_demande= $this->input->post('id_type_demande');
        }

        $libelle = null;
        $libelle = $this->type->verif_libelle($this->input->post('libelle'));

        if ($libelle != null and !isset($this->type->id_type_demande))
        {
            $d=array("status" => "error", "message" =>"Ce type existe déja !" );
            echo json_encode($d, JSON_HEX_TAG | JSON_HEX_APOS | JSON_HEX_QUOT | JSON_HEX_AMP);
            die();
        }
        else
            {
                $this->type->libelle = $this->input->post('libelle');
                $this->type->id_partenaire = $this->input->post('id_partenaire');

            echo json_encode($this->type->save(), JSON_HEX_TAG | JSON_HEX_APOS | JSON_HEX_QUOT | JSON_HEX_AMP);
        }

    }

}

<?php

/**
 * Created by PhpStorm.
 * User: djine
 * Date: 20/08/19
 * Time: 09:59
 */

class C_eleve extends MY_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->model('eleve/M_eleve', 'part');
    }

    public function index()
    {
        $data['all_data']  = $this->part->get_data();
        $this->load->view('eleve/V_eleve', $data);
    }

    public function get_record()
    {
        $args = func_get_args();
        $this->part->id_eleve =  $args[0];
        $this->part->get_record();
        echo json_encode($this->part, JSON_HEX_TAG | JSON_HEX_APOS | JSON_HEX_QUOT | JSON_HEX_AMP);
    }

    public function delete()
    {
        $args = func_get_args();
        $this->part->id_eleve =  $args[0];
        echo json_encode($this->part->delete(), JSON_HEX_TAG | JSON_HEX_APOS | JSON_HEX_QUOT | JSON_HEX_AMP);
    }

    public function save()
    {


        if ($this->input->post('id_eleve') != '') {
            $this->part->id_eleve = $this->input->post('id_eleve');
        }

        $nom = null;
        $tel = null;
        $nom = $this->part->verif_nom($this->input->post('nom_eleve'));
        $tel = $this->part->verif_tel_part($this->input->post('tel_eleve'));

        if ($nom != null and !isset($this->part->id_eleve)) {
            $d = array("status" => "error", "message" => "Cette Eleve existe déja (Nom) !");
            echo json_encode($d, JSON_HEX_TAG | JSON_HEX_APOS | JSON_HEX_QUOT | JSON_HEX_AMP);
            die();
        }

        if ($tel != null and !isset($this->part->id_eleve)) {
            $d = array("status" => "error", "message" => "Cette Eleve existe déja (Telephone) !");
            echo json_encode($d, JSON_HEX_TAG | JSON_HEX_APOS | JSON_HEX_QUOT | JSON_HEX_AMP);
            die();
        } else {
            $this->part->nom_eleve = $this->input->post('nom_eleve');
            $this->part->tel_eleve = $this->input->post('tel_eleve');
            echo json_encode($this->part->save(), JSON_HEX_TAG | JSON_HEX_APOS | JSON_HEX_QUOT | JSON_HEX_AMP);
        }
    }


    // function getDatetimeNow() {
    //     $tz_object = new DateTimeZone('UTC');
    //     $datetime = new DateTime();
    //     $datetime->setTimezone($tz_object);
    //     return $datetime->format('Y\-m\-d\ h:i:s');
    // }

}
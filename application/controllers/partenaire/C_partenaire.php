<?php
/**
 * Created by PhpStorm.
 * User: djine
 * Date: 20/08/19
 * Time: 09:59
 */

class C_partenaire extends MY_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->model('partenaire/M_partenaire', 'part');
    }

    public function index()
    {
        $data['all_data']  = $this->part->get_data();
        $this->load->view('partenaire/V_partenaire', $data);
    }

    public function get_record(){
        $args =func_get_args();
        $this->part->id_partenaire =  $args[0];
        $this->part->get_record();
        echo json_encode($this->part, JSON_HEX_TAG | JSON_HEX_APOS | JSON_HEX_QUOT | JSON_HEX_AMP);
    }

    public function delete(){
        $args =func_get_args();
        $this->part->id_partenaire =  $args[0];
        echo json_encode($this->part->delete(), JSON_HEX_TAG | JSON_HEX_APOS | JSON_HEX_QUOT | JSON_HEX_AMP);
    }

    public function save()
    {


        if ($this->input->post('id_partenaire') != '')
        {
            $this->part->id_partenaire = $this->input->post('id_partenaire');

        }

        if (!empty($this->part->verif_nompart()) and !isset($this->part->id_partenaire))
        {
            $d=array("status" => "error", "message" =>"Partenaire existe déja !" );
            echo json_encode($d, JSON_HEX_TAG | JSON_HEX_APOS | JSON_HEX_QUOT | JSON_HEX_AMP);
            die();
        }
        else {
            $this->part->nom_partenaire = $this->input->post('nom_partenaire');
            $this->part->tel_partenaire = $this->input->post('tel_partenaire');
            $this->part->adr_partenaire = $this->input->post('adr_partenaire');
            $this->part->email_partenaire = $this->input->post('email_partenaire');
            $this->part->date_enregistrement = $this->getDatetimeNow();

            echo json_encode($this->part->save(), JSON_HEX_TAG | JSON_HEX_APOS | JSON_HEX_QUOT | JSON_HEX_AMP);
        }

    }


    function getDatetimeNow() {
        $tz_object = new DateTimeZone('UTC');
        $datetime = new DateTime();
        $datetime->setTimezone($tz_object);
        return $datetime->format('Y\-m\-d\ h:i:s');
    }

}

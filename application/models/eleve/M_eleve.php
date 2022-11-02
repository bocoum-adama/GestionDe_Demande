<?php

class M_eleve extends  MY_Model
{

    public $id_eleve;
    public $nom_eleve;
    public $tel_eleve;
    //public $chemin;

    public function get_db_table()
    {
        return 'eleve';
    }

    public function get_db_table_pk()
    {
        return 'id_eleve';
    }

    public function verif_nom($nom)
    {
        return $this->db->select("*")
            ->from("eleve")
            ->where("nom_eleve", $nom)
            ->get()
            ->row();
    }

    public function verif_tel_part($tel)
    {
        return $this->db->select("*")
            ->from("eleve")
            ->where("tel_eleve", $tel)
            ->get()
            ->row();
    }


    public function get_record_where($id_eleve)
    {
        return $this->db->select("*")
            ->from("eleve")
            ->where("id_eleve", $id_eleve)
            ->get()
            ->row();
    }
}
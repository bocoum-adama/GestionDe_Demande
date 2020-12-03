<?php

class M_partenaire extends  MY_Model{

    public $id_partenaire;
    public $nom_partenaire;
    public $tel_partenaire;
    public $adr_partenaire;
    public $email_partenaire;
    public $date_enregistrement;
    //public $chemin;


    public function get_db_table()
    {
        return 'partenaire';
    }

    public function get_db_table_pk()
    {
        return 'id_partenaire';
    }

    public function verif_nom($nom)
    {
        return $this->db->select("*")
            ->from("partenaire")
            ->where("nom_partenaire" , $nom)
            ->get()
            ->row();
    }

    public function verif_tel_part($tel)
    {
        return $this->db->select("*")
            ->from("partenaire")
            ->where("tel_partenaire" , $tel)
            ->get()
            ->row();
    }

    public function verif_email_part($email)
    {
        return $this->db->select("*")
            ->from("partenaire")
            ->where("email_partenaire" , $email)
            ->get()
            ->row();
    }

    public function get_record_where($id_partenaire)
    {
        return $this->db->select("*")
            ->from("partenaire")
            ->where("id_partenaire" , $id_partenaire)
            ->get()
            ->row();
    }


}

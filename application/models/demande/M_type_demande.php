<?php

class M_type_demande extends MY_Model
{
    public $id_type_demande;
    public $libelle;
    public $id_partenaire;

    public function get_db_table()
    {
        return 'type_demande';
    }

    public function get_db_table_pk()
    {
        return 'id_type_demande';
    }

    public function verif_libelle($libelle)
    {
        return $this->db->select("*")
            ->from("type_demande")
            ->where("libelle" , $libelle)
            ->get()
            ->row();
    }

    public function verif_partenaire($id_partenaire)
    {
        return $this->db->select("*")
            ->from("type_demande")
            ->where("id_partenaire" , $id_partenaire)
            ->get()
            ->row();
    }

    public function get_nom($id_partenaire)
    {
        $partenaire = $this->db->select("nom_partenaire")
            ->from("partenaire")
            ->where("id_partenaire" , $id_partenaire)
            ->get()
            ->row();
        return $partenaire->nom_partenaire;

    }
  }

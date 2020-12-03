<?php

class M_demande extends MY_Model
{
    public $id_demande;
    public $numero_demande;
    public $objet_demande;
    public $date_demande;
    public $etat_demande;
    public $id_partenaire;
    public $id_type_demande;
    public $code_str;

    public function get_db_table()
    {
        return 'demande';
    }

    public function get_db_table_pk()
    {
        return 'id_demande';
    }

    public function verif_numero($nom)
    {
        return $this->db->select("*")
            ->from("demande")
            ->where("numero_demande" , $nom)
            ->get()
            ->row();
    }

    public function verif_objet($objet)
    {
        return $this->db->select("*")
            ->from("demande")
            ->where("objet_demande" , $objet)
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

    public function get_type($id_type)
    {
        $type = $this->db->select("libelle")
            ->from("type_demande")
            ->where("id_type_demande" , $id_type)
            ->get()
            ->row();
        return $type->libelle;

    }

    public function get_struc($code_struc)
    {
        $struc = $this->db->select("libelle_structure")
            ->from("structure")
            ->where("code_str" , $code_struc)
            ->get()
            ->row();
        return $struc->libelle_structure;

    }

    public function etat_change($id, $etat, $observation)
    {
        return $this->db->query( 'UPDATE demande SET etat_demande="'.$etat.'",date_traitement="'.$this->getDatetimeNow().'", observation="'.$observation.'"  WHERE id_demande="'.$id.'"' );
    }

    public function get_record_tr($id_demande )
    {
        return $this->db->select("*")
            ->from('demande')
            ->where("demande.id_demande", $id_demande)
            ->get()
            ->row();
    }

    function getDatetimeNow()
    {
        $tz_object = new DateTimeZone('UTC');
        $datetime = new DateTime();
        $datetime->setTimezone($tz_object);
        return $datetime->format('Y\-m\-d\ h:i:s');
    }

    public function tt_demande()
    {
        $sql = "SELECT COUNT(*) as nb_demande
		FROM demande
      ";
        return $this->db->query($sql)->row()->nb_demande;
    }

    public function tt_nb_encours()
    {
        $sql = "SELECT COUNT(*) as nb_encours FROM demande  
        where etat_demande = '0'";
        return $this->db->query($sql)->row()->nb_encours;
    }


    public function tt_traite()
    {
        $sql = "SELECT COUNT(*) as nb_traite FROM demande where etat_demande = '1'";
        return $this->db->query($sql)->row()->nb_traite;
    }
}

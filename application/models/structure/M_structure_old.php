<?php

class M_structureOld extends MY_Model
{
    public $code_str;
    public $libelle_structure;
    public $adresse_str;
    public $etat_str;
    public $code_ia;
    public $code_ief;
    public $code_commune;
    public $categorie_structure;
    public $libelle_ia;
    public $libelle_ief;
    public $libelle_commune;
    public $cycle;
    public $id_cycle;

    public function get_db_table()
    {
        return 'structure';
    }

    public function get_db_table_pk()
    {
        return 'id_structure';
    }

    public function verif_code_str($code)
    {
        return $this->db->select("*")
            ->from("structure")
            ->where("code_str" , $code)
            ->get()
            ->row();
    }
    public function get_list_cycle()
    {
        @$json = file_get_contents("./JSON/cycle.json");
        $str_data = json_decode(str_replace("\xEF\xBB\xBF", '', $json)); //print_r($str_data); exit;

        if (!empty($str_data->cycles))
        {
            return $str_data->cycles;
        }
        else {
            return [];
        }
    }

    public function get_list_ia()
    {
        $str_data = apiPostData('codeco','ien-get/ia');
        if(!empty($str_data->ias))
        {
            return $str_data->ias;
        }
        else
        {
            return [];
        }
    }

    public function save_structure($tab1,$tab2)
    {
        $this->db->trans_begin();
        if(!empty($tab1)){
            $this->db->insert_batch($this->get_db_table(),$tab1,NULL,count($tab1));
        }
        if(!empty($tab2))
        {
            foreach($tab2 as $str)
            {
                $this->db->where("code_str",$str['code_str']);
                $this->db->update($this->get_db_table(),$str);

            }
        }

        if ($this->db->trans_status() === FALSE)
        {
            $this->db->trans_rollback();
            return array(
                'status'=>'danger',
                'message'=>'Erreur d\'insertion',
            );
        }
        else
        {
            $this->db->trans_commit();
            return array(
                'status'=>'success',
                'message'=>'Insertion réussie avec succès',
            );
        }
    }
}

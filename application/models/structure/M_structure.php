<?php

class M_structure extends MY_Model
{
	public $code_str;
	public $libelle_structure;
	public $adresse_str;
	public $etat_str;
	public $id_type_structure;
	public $code_ia;
	public $categorie_structure;
	public $code_ief;
	public $code_commune;
	public $libelle_ia;
	public $libelle_ief;
	public $libelle_commune;
	public $cycle;

	public function get_db_table(){
		return 'structure';
	}

	public function get_db_table_pk(){
		return 'code_str';
	}
	
	/*public function save_structure_cent($tab1)
	{
		$this->db->trans_begin();
		$this->db->insert_batch($this->get_db_table(),$tab1,NULL,count($tab1));
		
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
	}*/
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
	

	public function get_structure_by_id($code_str)
	{
		$this->db->where('code_str',$code_str);
		$result = $this->db->get('structure');
		return $result->row();
	}
	public function get_array_structure_by_id($code_str)
	{
		$this->db->where('code_str', $code_str);
		$result = $this->db->get('structure');
		return $result->row_array();
	}
	public function get_data_centr()
	{
		$result = $this->db->select()
		->from('structure')
		->where_in('categorie_structure', array('1','2'))
		->get()
		->result();
		return $result;
	}
	public function get_data_centr_by_code_ia($code_ia=null)
	{
		$result = $this->db->select()
		->from('structure')
		->where_in('categorie_structure', array('1','2'))
		->where('code_ia', $code_ia)
		->get()
		->result();
		return $result;
	}

	public function get_data_etabl()
	{
		$result = $this->db->select()
		->from('structure')
		->where('categorie_structure', 3)
		->get()
		->result();
		return $result;
	}
	public function get_data_etabl_by_code_ia($code_ia=null)
	{
		$result = $this->db->select()
		->from('structure')
		->where('categorie_structure', 3)
		->where('code_ia', $code_ia)
		->get()
		->result();
		return $result;
	}
	/*
	public function get_data_centr_by_code_ia($code_ia=null)
	{
		$result = $this->db->select()
		->from('structure')
		->where('code_ia', $code_ia)
		->limit(10)
		->get()
		->result();
		return $result;
	}
	*/
	public function get_list_ief()
	{
		$str_data = apiPostData('codeco','ien-get/ief');
		if(!empty($str_data->iefs))
		{
			return $str_data->iefs;
		}
		else
		{
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

	public function get_list_commune()
	{
		$str_data = apiPostData('codeco','ien-get/area');
		if(!empty($str_data->areas))
		{
		return $str_data->areas;
		}
		else
		{
		return [];
		}
	}

	public function get_data_etab($id=0)
	{
		if($id>0)
		$this->db->where('code_commune',$id);

		$this->db->where('categorie_structure',3);
		$this->db->limit(50);
		$result = $this->db->get('structure');
		return $result->result();
	}

	public function code_struct_existe($code_str)
	{
		return $this->db->select('count(*) as nbr')
			->from('structure')
			->where('code_str',$code_str)
			->get()
			->row();
	}

	public function get_record_by_code_str()
    {
        $row = $this->db->select('*')
            ->from($this->get_db_table())
            ->where($this->get_db_table_pk(), $this->{$this->get_db_table_pk()})
            ->get()
            ->result();
        $row = reset($row);

        if($row == null)
            $this->{$this->get_db_table_pk()} = null;
        else
            foreach ($row as $param => $value){
                $this->{$param} = $value;
            }
	}
	public function liste_etat_by_commune($code_commune)
	{
		$this->db->where('code_commune',$code_commune);
		$result = $this->db->get('structure');
		return $result->result();
	}
	
	public function check_str($code_str)
	{
		$res = $this->db->select()
						->from('structure')
						->where('code_str', $code_str)
						->get()
						->row();
		if(!empty($res))
		{
			return true;
		}
		else
		{
			return false;
		}
	}


	public function update_str($id,$code){
		return $this->db->where('id_ens',$id)
					->set('code_str',$code)
					->set('annee_entree_str', $this->session->ans)
					->set('annee_sortie_str','9999')
					->update('enseignant_structure');
	}

    public function get_struct_central()
    {
        return $struc = $this->db->select("*")
            ->from("structure")
            ->where("etat_str" , 1)
            ->get()
            ->result();
    }

    public function fetch_etab($code_area)
    {
        //https://codeco.education.sn/api-ien/list_etab_by_com?code=233
        $query1 = apiGetData('codeco', 'api-ien/list_etab_by_com?code='.$code_area);
        $query = $query1->Etablissements;

        $output = '<option value="">Selectionner Etablissement</option>';
        foreach ($query as $row)
        {
            $output .= '<option value="'.$row->id.'">'.$row->libelle.'</option>';
        }
        return $output;
    }
}

<?php
class M_connexions extends CI_Model {


	public function test_connexion($ien,$code_acces)
	{

      //  $ien = $this->input->post('ien');
        if (ENVIRONMENT !== 'production')
        {
            $sql = "SELECT
                urs.*,
                pers_str.*,
                pr.*,
                str.*
            FROM
                sys_user urs
            INNER JOIN sys_type_profil pr ON
                (
                    pr.id_type_profil = urs.id_profil
                )
            INNER JOIN personnel pers_str ON
                (pers_str.ien = urs.ien)
            INNER JOIN structure str ON
                (str.code_str = pers_str.code_str)
            WHERE
                urs.ien ='".$ien."' ";
        }
        else
            {
                $sql = "SELECT
                urs.*,
                pers_str.*,
                pr.*,
                str.*
            FROM
                sys_user urs
            INNER JOIN sys_type_profil pr ON
                (
                    pr.id_type_profil = urs.id_profil
                )
            INNER JOIN personnel pers_str ON
                (pers_str.ien = urs.ien)
            INNER JOIN structure str ON
                (
                    str.code_str = pers_str.code_str
                )
            WHERE
                urs.ien = '".$ien."' AND AES_DECRYPT(urs.code_acces,'moz') = '".$code_acces."' " ;
                        }

                    $query = $this->db->query($sql);
                    return $query->row_array();

        }


    public function up_mdp($ien,$gen_mdp)
    {

        //  $ien = $this->input->post('ien');

        $sql = "UPDATE sys_user SET code_acces = AES_ENCRYPT('$gen_mdp','moz')  WHERE ien='".$ien."' ";
//var_dump($sql);exit();
        $query = $this->db->query($sql);
        return 1;

    }

}

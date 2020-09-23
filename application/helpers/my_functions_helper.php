<?php
/**
 * Created by PhpStorm.
 * User: adiouf
 * Date: 22/03/2018
 * Time: 09:41
 */

function inactive_entries_table($table, $colonne, $colone_etat, $id)
{
    $instance = get_instance();
    $sql = "UPDATE $table set $colone_etat='-1' WHERE $colonne =$id";
    $instance->db->query($sql);
}

function get_entries_table_with($table, $colonne1, $colonne2, $colone_etat, $id1, $id2)
{
    $instance = get_instance();
    $result = $instance->db->select('*')
                        ->from($table)
                        ->where($colonne1, $id1)
                        ->where($colonne2, $id2)
                        ->where($colone_etat, '-1')
                        ->get()
                        ->result();
    return $result;
}

<?php


function get_libelle_etab($code_str)
{

    $and = get_instance();
    $and->load->model('M_etablissement');

    $result = $and->M_etablissement->get_libelle_etablissement_by_codestr($code_str);

    return  $result;

}
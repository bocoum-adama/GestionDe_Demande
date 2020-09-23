<?php

function nombre_eleve_affecter($code_etablissement)
{

    $and = get_instance();
    $and->load->model('M_affectation');

    $result = $and->M_affectation->nombre_de_dossier_disponible($code_etablissement);

    return  $result[0]->nombredossier;

}


function nombre_eleve_charger_planete($code_etablissement)
{

    $and = get_instance();
    $and->load->model('M_affectation');

    $result = $and->M_affectation->nombre_eleve_charger_planete($code_etablissement);

    return $result[0]->nombredossier;

}
?>
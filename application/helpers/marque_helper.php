<?php

function get_etat_affectation($id_carte){
    $db = get_instance();
    $db->load->model('M_carte', 'carte');
    return $db->carte->get_si_carte_affecte($id_carte);
}

function get_libelle_marque($id_marque){
    $db = get_instance();
    $db->load->model('M_marque', 'marque');
    return $db->marque->get_libelle_marque($id_marque);
}


<?php

 function get_libelle_cycle($code){

    $d=["1"=>"Préscolaire",
        "2"=>"Elémentaire",
        "3"=>"Moyen",
        "4"=>"Secondaire",
        "5"=>"Moyen secondaire",
        "6"=>"Daara"

    ];
    if(!empty($d[$code])){
        return $d[$code];
    }else{
        return null;
    }
}

function get_code_cycle($libelle){

    $d=["Préscolaire"=>"1",
        "Elémentaire"=>"2",
        "Moyen"=>"3",
        "Secondaire"=>"4",
        "Moyen secondaire"=>"5",
        "Daara"=>"6"

    ];
    if(!empty($d[$libelle])){
        return $d[$libelle];
    }else{
        return null;
    }
}
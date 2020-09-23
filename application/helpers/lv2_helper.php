<?php

 function get_lv2_by_code($code){

    $d=["11"=>"Allemand",
        "8"=>"Espagnol",
        "12"=>"Portugais",
        "21"=>"Turque",
        "22"=>"Italien",
        "23"=>"Russe",
        "90"=>"Grec",
        "6"=>"Arabe"
    ];
    if(!empty($d[$code])){
        return $d[$code];
    }else{
        return null;
    }
}
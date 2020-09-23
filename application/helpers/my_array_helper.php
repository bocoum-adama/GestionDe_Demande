<?php

    /**
    * retourne l'element de list dont $critere_key est $critere_value
    */
    function get_item_array_by_critere_key($list, $critere_key, $critere_value){
        $key = array_search($critere_value, array_column($list, $critere_key));
        return $list[$key];
    }



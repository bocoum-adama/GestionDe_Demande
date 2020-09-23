<?php

//swap object data

function swap_array($data, $key_name, $desc_name)
{
    $result = array();

    $array_key =  explode('|', $key_name);
    $array_desc =  explode('|', $desc_name);


    if(count($array_key) == 1 && count($array_desc) == 1 ){
        //standard
        foreach($data as $row){
            $result["id".$row->$key_name] =  $row->$desc_name;
        }
    }
    else if(count($array_key) >= 1 && count($array_desc) >= 1 ){
        //avancé (avec comme séparation permis l'espace( ), le tiret de 6 (-), le tiret de 8( _ )
        $sep_array = array('',' ','-','_');

        foreach($data as $row){

            $custom_key = '';
            $custom_desc = '';

            //key
            foreach($array_key as $key){
                if(in_array(trim($key),$sep_array)) 
                    $custom_key .= $key;
                else
                    $custom_key .= $row->$key;
            }

            //desc
            foreach($array_desc as $desc){
                if(in_array(trim($desc),$sep_array))
                    $custom_desc .= $desc;
                else
                    $custom_desc .= $row->$desc;
            }

            $result["id".$custom_key] =  $custom_desc;
        }
    }

    return $result;
}


//read json file content swap data

function getDataParam_jsonFile($file_name = '', $type='A'){

    $dir = "./datas/PLANETE_MANAGEMENT/".$file_name;
    $result = [];

    if($file_name == '' || !file_exists($dir))
    {
        if($type == 'A')
            $result =  [];

        if($type == 'O')
            $result = (object)$result;
    }
    else
    {
        $file_content = file_get_contents($dir);
        $data = json_decode($file_content, true);

        if($type == 'A')
            $result = (array)$data;

        if($type == 'O')
            $result = (object)$data;
    }

    return $result;
}


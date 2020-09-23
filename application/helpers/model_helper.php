<?php

    function get_option_by_eleve($id_eleve){
        $db = get_instance();
        $db->load->model('M_eleve_option', 'eleve_option');
        return $db->eleve_option->get_option_by_eleve($db->session->ans, $id_eleve);
    }


    function get_ien_by_id_eleve($id_eleve){
        $db = get_instance();
        $db->load->model('M_eleves', 'eleve');
        return $db->eleve->get_ien_by_id_eleve($id_eleve);
    }

     function check_unique_field($table, $col_name, $val_to_search)
     {
         $db = get_instance();
         $db->load->model('M_table_param', 'param');
         $db->param->check_unique_field($table, $col_name, $val_to_search);
     }


function loadModel($table)
{
    $db = get_instance();


    switch ($table) {

        case "fonction":
            $modele = 'M_types_fonctions';
            break;
        case "periode":
            $modele = 'M_type_periode';
            break;
        case "categorie_fonction":
            $modele = 'M_types_fonction_categorie';
            break;
        case "cycle":
            $modele = 'M_cycle';
            break;
        case "corps":
            $modele = 'M_corps';
            break;
        case "categorie_evaluation":
            $modele = 'M_categorie_evaluation';
            break;
        case "categorie_structure":
            $modele = 'M_categorie';
            break;
        case "grade":
            $modele = 'M_grade';
            break;
        case "diplome_academique":
            $modele = 'M_diplome_academique';
            break;
        case "diplome_professionnel":
            $modele = 'M_diplome_professionnel';
            break;
        case "discipline":
            $modele = 'M_discipline';
            break;
        case "matiere":
            $modele = 'M_matiere';
            break;
        case "section":
            $modele = 'M_section';
            break;
        case "type_evaluation":
            $modele = 'M_type_evaluation';
            break;
        case "evaluation_cycle":
            $modele = 'M_cycle_evaluation';
            break;
        case "programme":
            $modele = 'M_programmes';
            break;
        case "corps_grade":
            $modele='M_corps_grade';
            break;
        case "effectif":
            $modele='M_effectif';
            break;

        default :
            $modele = "M_tables";


    }
    $db->load->model($modele, "table");
    }


function format_json($result, $message)
{
    $code = "1";
        $array = array(
            'code' => $code,
            "message" => $message);
    if (count($result) > 0) {
        $code = "0";
        $message = "success";
        $array = array(
            'code' => $code,
            "message" => $message,
            "records" => $result);
    }


    return $array;

    }


function send_all($table)
{
    $db = get_instance();
    loadModel($table);
    if ($table == "categorie_structure")
    {
        $result = $db->table->get_data();
    }
    elseif ($table == "fonction")
    {
        $result = $db->table->get_functions();
    }
    else
    {
        $result = $db->table->get_active_data();
    }

    echo json_encode(format_json($result, 'pas de fonction ' . $table));

}


function get_by_id($table, $requeste)
{
    $db = get_instance();
    loadModel($table);
    $db->table->{$db->table->get_db_table_pk()} = $requeste;
    if ($table == "categorie_structure")
    {
        $db->table->get_record();
    }
    elseif ($table == "evaluation_cycle")
    {
        $db->table->get_cycle_eval($requeste);
    }
    else if($table == "effectif")
    {
        $db->table->list_eleve();
    }
    else if($table == "categorie_fonction")
    {
        $db->table = $db->table->get_data_by_id($requeste);
    }
    else
    {
        $db->table->get_active_record();
    }
    $result = $db->table;
    echo json_encode(format_json($result, "pas de keyword .$table."));

}

function get_cycle_eval_by($table, $requeste)
{
    $db = get_instance();
    loadModel($table);
    $db->table->get_cycle_eval($requeste);
    $resultat = $db->table->get_cycle_eval($requeste);
    $db->table->{$db->table->get_db_table_pk()} = $resultat[0]->id_evaluation_cycle;
    $db->table->get_cycle_eval($requeste);
    $result = $db->table;
    echo json_encode(format_json($result, "pas de keyword .$table."));
}

function get_api_data($url, $records = "records")
{

    $result = array();
    $data = json_decode(remove_utf8_bom(file_get_contents($url)), true);

    foreach ($data as $param=>$value)
    {
        $result = $value;

    }
    return $result;
}

function db_alias($alias)
{
    return $alias == NULL ? '' : ' ' . $alias;
}

function remove_utf8_bom($text)
{
    $bom = pack('H*','EFBBBF');
    $text = preg_replace("/^$bom/", '', $text);
    return $text;
}

function format_file_name($localite, $id)
{


    $file_name = 'download/data/'. md5($localite . '_' . $id) . '.json';

    return $file_name;
}

function get_json_data($struct, $id_ief, $label)
{
    $filename = format_file_name($struct, $id_ief);



    if(!file_exists($filename) or date_to_modif($filename))
    {
        $tab = get_api_data(url_api_list($struct, $id_ief), $records = $label);
        $tab =json_encode($tab);
        @file_put_contents($filename ,$tab);
    }


    return file_get_contents($filename);
}

function date_to_modif($filename)
{
    return (time() - filemtime($filename)) > 60*60*24*7 ;
}

function url_api_list($extension, $requete = "")
{
    $url_api = "http://codeco.education.sn/codeco/";
    if ($requete == "")
    {

        $url = $url_api . $extension;
    }
    else
    {
        $url =$url_api . $extension .'/' . $requete;
    }


    return $url;
}
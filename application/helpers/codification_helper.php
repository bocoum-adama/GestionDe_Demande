<?php


function codifier_critere($code_type_critere)
{
    $moy_critere_mois = 1000;
    $rand = rand(1000, 1000 + $moy_critere_mois);

    date_default_timezone_set('UTC');
    $annee = date('Y');
    $mois  = date('m');

    $code = $code_type_critere.$rand.$mois.$annee;

    $ci = get_instance();
    $result 	= $ci->db->select('*')
        ->from('param_norme_critere')
        ->where('code_norme_critere',$code)
        ->get()
        ->result();
    if(!empty($result))
    {
        return codifier_critere($code_type_critere);
    }
    else
    {
        return $code;
    }

}

function codeAleatoire($car)
{
    $string = "";
    $chaine = "2643789";
    srand((double)microtime()*1000000);
    for($i=0; $i<$car; $i++)
    {
        $string .= $chaine[rand()%strlen($chaine)];
    }
    return $string;
}

function CodificationEtabTech($cycle) {
    $string= '3'.codeAleatoire(5).$cycle;
    $sad=get_instance();
    $sad->load->model('M_structure_technique');
    if($sad->M_structure_technique->code_exists($string))
        CodificationEtabTech($cycle);
    else
        return $string;
}

function codeAleatoire2($car)
{
    $string = "";
    $chaine = "2643789ABDCEFGHJKMNPRTUVW";
    srand((double)microtime()*1000000);
    for($i=0; $i<$car; $i++)
    {
        $string .= $chaine[rand()%strlen($chaine)];
    }
    return $string;
}

function CodificationIENtemporaire() 
{
    $sad=get_instance();
    $sad->load->model('M_affectation');

    do{
        $string='T_'.codeAleatoire2(5);
    }
    while($sad->M_affectation->codeIENtemporaire_exists($string) == true);
    return $string;

}


<?php


function btn_add_action($smenu_code)
{

    $fall = get_instance();
    $tab_smrole = $fall->session->smenu_roles;
    if($tab_smrole[$smenu_code]['d_add'] == 1 and $fall->session->annee_en_cours == $fall->session->annee_travail)
    {
        echo '<div class="row">
                <div class="col-sm-12" style="margin-bottom: 30px">
                    <button type="button" id="btn_add" class="btn btn-primary">Ajouter <span lass="m-l-5"><i
                                class="fa fa-plus-square"></i></span></button>
                </div>
            </div>';
    }
}


function btn_edit_action($id,$smenu_code)
{
    $fall = get_instance();
    $tab_smrole = $fall->session->smenu_roles;
    if($tab_smrole[$smenu_code]['d_upd'] == 1 and $fall->session->annee_en_cours == $fall->session->annee_travail) {
        echo '<a href="#" class="on-default btn_edit"
		id="' . $id . '" style=""><i class="fa fa-edit"></i></a>';
    }
}


function btn_edit_module($id,$smenu_code)
{
    $fall = get_instance();
    $tab_smrole = $fall->session->smenu_roles;
    if($tab_smrole[$smenu_code]['d_upd'] == 1 and $fall->session->annee_en_cours == $fall->session->annee_travail) {
        echo '<a href="#" class="on-default btn_edit"
		id="' . $id . '" style=""><i class="fa fa-edit"></i></a>';
    }
}


function btn_delete_action($id, $smenu_code)
{
    $fall = get_instance();
    $tab_smrole = $fall->session->smenu_roles;
    if($tab_smrole[$smenu_code]['d_del'] == 1 and $fall->session->annee_en_cours == $fall->session->annee_travail) {
        echo '<a href="#" class="on-default btn_delete"
          id="' . $id . '"><i class="fa fa-trash" style="color:red"></i></a>&nbsp;';
    }
}



/*
* Gestion des roles sans le data-table
*/

function add_role($smenu_code, $contenu)
{
	$tab_smrole = $_SESSION['smenu_roles'];
	if(isset($tab_smrole[$smenu_code]['d_add']))
	{
		echo $contenu;
	}
}

function del_role($smenu_code, $contenu)
{
	$tab_smrole = $_SESSION['smenu_roles'];
	if(isset($tab_smrole[$smenu_code]['d_del']))
	{
		echo $contenu;
	}
}

function upd_role($smenu_code, $contenu)
{
	$tab_smrole = $_SESSION['smenu_roles'];
	if(isset($tab_smrole[$smenu_code]['d_upd']))
	{
		echo $contenu;
	}
}

function read_role($smenu_code, $contenu)
{
	$tab_smrole = $_SESSION['smenu_roles'];
	if(isset($tab_smrole[$smenu_code]['d_read']))
	{
		echo $contenu;
	}
}


function del_accent($str, $encoding='iso-8859-1')
{
    $str = htmlentities($str, ENT_NOQUOTES, $encoding);

    $str = preg_replace('#&([A-za-z])(?:acute|grave|cedil|circ|orn|ring|slash|th|tilde|uml);#', '\1', $str);

    $str = preg_replace('#&([A-za-z]{2})(?:lig);#', '\1', $str); // Supprimer tout le reste

    $str = preg_replace('#&[^;]+;#', '', $str);

    return $str;
}

//Focntion de decoupage de texte en nombre de mots
function nbmot($text, $limit)
{
    $text = strip_tags($text);
    $words = str_word_count($text, 2, '&-');
    $pos = array_keys($words);
    if (count($words) > $limit)
    {
        $text = substr($text, 0, $pos[$limit]);
    }
    return $text;
}



function btn_details($id,$smenu_code)
{
    $fall = get_instance();
    $tab_smrole = $fall->session->smenu_roles;

    if($tab_smrole[$smenu_code]['d_upd'] == 1) {
        echo  '<a href="'.site_url('etablissements/C_etab/lstetabpol/').$id.'" class="on-default btn_detail menu"  id="'.$id.'" >
           <span class="label label-info">Details</span> </a>';
    }
}


function btn_show_action($id, $smenu_code)
{
    $fall = get_instance();
    $tab_smrole = $fall->session->smenu_roles;
    if($tab_smrole[$smenu_code]['d_upd'] == 1) {
        echo '<a href="#" class="on-default btn_edit"
           id="' . $id . '"><i class="fa fa-eye" style="color:#3c6382"></i></a>';
    }
}
function btn_etat($etat, $smenu_code)
{

        if ($etat == 0) {
            # code...
            echo '<span class="on-default btn_active" etat="' . $etat . '" style=""><i class="fa fa-spinner fa-pulse fa-2x fa-fw" style="color:#2c3e50;"></i>En Attente</span>';
        } elseif ($etat == 1) {
            echo '<span class="on-default btn_active" etat="' . $etat . '">En Cours<i class="fa fa-cog fa-spin fa-2x fa-fw" style="color:gray"></i></span>';
        } elseif ($etat == 2) {
            echo '<span class="on-default btn_active" etat="' . $etat . '"><i class="fa fa-on fa-check-square" style="color:#2ed573">Résolu</i></span>';
        } else {
            echo '<span class="on-default btn_default" etat="' . $etat . '"><i class="fa fa-ban fa-fw" style="color:#ff665f">Impossible</i></span>';
        }
}

function edit($id, $etat,$smenu_code)
{
    if ($etat == 0) {
		echo '<a href="#" class="on-default edit"
           id="'.$id.'" style="color:#ff6b81; border:1px solid; border-radius:12%"><i class="fa fa-cogs"></i>Traiter</a>';
	}elseif ($etat == 1 ) {
		echo '<a href="#" class="on-default edit"
           id="'.$id.'" style="color:#; border-left:1px solid;border-right:1px solid; border-radius:35%;"><i class="fa fa-eye"></i>Voir...</a>';
	}elseif ($etat == 2) {
		echo '<a href="#" class="on-default edit"
           id="'.$id.'" style="color:#2f3542; border-top:1px solid;border-bottom:1px solid; border-radius:19%"><i class="fa fa-envelope-o fa-fw"></i>Message</a>';
	}
} 

function btn_editt($id,$smenu_code)
{
		echo '<a href="#" class="on-default btn_editt"
           id="'.$id.'" style="color:#ff4757"><i class="fa fa-cogs"></i>Traiter</a>';
}



function btn_show_list_action($id, $smenu_code)
{

    echo '<a href="#" class="on-default btn_show_list"
           id="'.$id.'"><i class="fa fa-eye" style="color:#3c6382"></i></a>';

}

function btn_affecter_list_action($id, $smenu_code)
{

    echo '<a href="#" class="on-default btn_affecter_list"
           id="'.$id.'"><i class="label label-info" style="color:#3c6382"></i></a>';

}
function send($id,$id_trt, $smenu_code)
{

    echo  '<a href="#" class="on-default btn_affect"  id="'.$id.'" id_trt ="'.$id_trt.'" >
           <span class="label label-info"><i class="fa fa-paper-plane-o m-r-5"></i>Sent Mail</span> </a>';
}
function affecter($id, $smenu_code)
{
    $fall = get_instance();
    $tab_smrole = $fall->session->smenu_roles;
    if($tab_smrole[$smenu_code]['d_upd'] == 1 and $fall->session->annee_en_cours == $fall->session->annee_travail) {
        echo ' <a href="#" class="on-default btn_affect" id="' . $id . '">
            <span class="label label-info">Affecter</span> </a>';
    }
}

function btn_archive_action($id, $smenu_code, $etat = "")
{
    $fall = get_instance();
    $tab_smrole = $fall->session->smenu_roles;
    if($tab_smrole[$smenu_code]['d_upd'] == 1 and $fall->session->annee_en_cours == $fall->session->annee_travail) {
        if ($etat == 1) {
            # code...
            echo '<a href="#" class="on-default btn_archive"
           id="' . $id . '" etat="' . $etat . '"><i class="fa fa-toggle-on" style="color:#2ed573"></i></a>';
        } else {
            echo '<a href="#" class="on-default btn_archive"
           id="' . $id . '" etat="' . $etat . '"><i class="fa fa-toggle-off" style="color:#ff4757"></i></a>';
        }
    }
}



function btn_etat_active($etat)
{
	echo '<span href="#" class="on-default btn_active"
           ><i class="fa fa-toggle-on" style="color:#2ed573"></i></span>';
}

function btn_etat_inactive($etat)
{
	echo '<span href="#" class="on-default btn_inactive"
           ><i class="fa fa-toggle-off" style="color:#ff4757"></i></span>';
}

function format_date($value)
{
    if($value == NULL)
        return '';
    else
        return date('d/m/Y', strtotime($value));
}


function btn_etat_veh($id, $smenu_code,$etat)
{
    $fall = get_instance();
    $tab_smrole = $fall->session->smenu_roles;
    /*$fall->load->model('M_vehicule_personne', 'vehicule_personne');
    $donn = $fall->vehicule_personne->get_etat_vehi($id);*/
    //var_dump($donn);
    if($tab_smrole[$smenu_code]['d_add'] == 1)
    {
        if($etat != "1")
        {

            echo '<button  class="btn_affectation btn btn-primary btn-xs" id="'.$id.'" data-id-val="'.$id.'">
                                    <i class="fa  fa-book"></i> Affecter Vehicule </button>';
        }else{
            echo '<button  class="btn_personne_vehicule btn btn-success btn-xs" id="'.$id.'" data-id-val="'.$id.'">
                                    <i class="fa  fa-car"></i> Visualiser </button>';
        }
    }
}

function infocom($ien){

    $arrContextOptions = array(
        "ssl" => array(
            "verify_peer" => false,
            "verify_peer_name" => false
        ),
    );
    @$infos = file_get_contents("https://apps.education.sn/C_personnel_api/getIEN_info_all?ien=" . $ien, false, stream_context_create($arrContextOptions));
    $infos = json_decode($infos,true ) ;
    $infos = $infos["record"];
    $prenom = $infos["prenom"];
    $nom = $infos["nom"];
    $data["pren"] = $prenom." ".$nom ;
    @$photo = file_get_contents("https://apps.education.sn/C_personnel_api/get_pic_src/" . $ien, false, stream_context_create($arrContextOptions));
    $data["photo"] = $photo;
    $lien = "ien-get/structure_by_code_admin?code=". $infos["code_str"];
    $base = "codeco";
    $co_str = apiGetData($base,$lien,$type = 'array');
    $co_str = $co_str["resultat"];
    $data["structure"] = $co_str["libelle_structure"];

    return $data;
}

function info_conn($ien, $smenu_code)
{
    $fall = get_instance();
    $tab_smrole = $fall->session->smenu_roles;
    if($tab_smrole[$smenu_code]['d_upd'] == 1) {
        echo ' <a href="#" class="on-default info_conn" id="' . $ien . '">
            <span class="label label-info">Send infos</span> </a>';
    }
}

/*
* @$table: 		Tableau dans lequel on fait la recherche
* @$to_find: 	Param�tre de recherche
* @$colonne:  	Colonne sur le sous tableaux
* @$cle:		La colonne du tableau associatif
*/

function multi_array_search($tableau, $valeurConnue, $colonneValeurConnue, $colonneValeurRecherchee)
{
	if(!empty($tableau))
	{
		$tableau = json_decode(json_encode($tableau), true);
		//return array_search($valeurConnue, array_column($tableau, $colonneValeurConnue));
		if(array_search($valeurConnue, array_column($tableau, $colonneValeurConnue)) !== false)
		{
			$val = $tableau[array_search($valeurConnue, array_column($tableau, $colonneValeurConnue))][$colonneValeurRecherchee];
			return $val;
		}else
		{
			return false;
		}
	}else
	{
		return false;
	}
}


function utf8_converter($array)
{
    array_walk_recursive($array, function(&$item, $key)
	{
        if(!mb_detect_encoding($item, 'utf-8', true))
		{
                $item = utf8_encode($item);
        }
    });
 
    return $array;
}


//Transposer tableau
function array_swap($tab, $id, $valeur)
{
	$t_swap = array();
	$tab 	= json_decode(json_encode($tab));
	
	foreach($tab as $val)
	{
		$t_swap['id'.$val->$id] = $val->$valeur;
	}
	
	return $t_swap;
}

function Genere_Password()
{
    // Initialisation des caractères utilisables
    do{
    $characters = array("a", "b", "c", "d", "e", "f", "g", "h", "j", "k", "m", "n", "p", "q", "r", "t", "u", "v", "w", "x", "y", "z", 2, 3, 4, 6, 7, 8, 9);
    $carate = array(2, 3, 4, 6, 7, 8, 9);

    $password = $carate[array_rand($carate)];

    for($i=0;$i<6;$i++)
    {
        $password .= ($i%2) ? strtoupper($characters[array_rand($characters)]) : $characters[array_rand($characters)];
    }

    $new_password = str_split($password);
    $premier_car = $new_password[0];
    $deuxiem_car = $new_password[1];
    $troisiem_car = $new_password[2];
    $tupl = 0;
    $cinquiem_car = $new_password[3];
    $sixieme_car = $new_password[4];
    $septiem_car = $new_password[5];
    $huitiem_car = $new_password[6];

    for ($i=0;$i<6;$i++)
    {
       $tupl = $tupl + intval($new_password[$i]);
    }
    } while($tupl == 0);
    $quatriem_car = ($tupl<22) ? $characters[$tupl-1] : "z" ;

    $ien_array = array( "premier_car" => $premier_car,
                 "deuxiem_car" => $deuxiem_car,
                 "troisiem_car" => $troisiem_car,
                 "quatriem_car" => $quatriem_car,
                 "cinquiem_car" => $cinquiem_car,
                 "sixieme_car" => $sixieme_car,
                 "septiem_car" => $septiem_car,
                 "huitiem_car" => $huitiem_car
                    );
    $data["tupl"] = $tupl ;
    $data["tab_ien"] = $ien_array;
    $data["ien"] = strtoupper(implode($ien_array));
    return $data ;

   // return;
}

function verif_algo_ien($ien)
{
    $characters = array("a", "b", "c", "d", "e", "f", "g", "h", "j", "k", "m", "n", "p", "q", "r", "t", "u", "v", "w", "x", "y", "z", 2, 3, 4, 6, 7, 8, 9);
    $tupl = 0 ;
    $ien_array = str_split($ien);
    for ($i=0;$i<7;$i++)
    {
        $tupl = $tupl + intval($ien_array[$i]);
    }
    $quatriem_car = $ien_array[3];
    $verif = $characters[$tupl-1];
    if (strtoupper($verif) == strtoupper($quatriem_car) and is_numeric($ien_array[0]) == true)
    {
        $d=array("code" => "0", "status" => "succes", "message" =>"Ien Valide" );
        //echo json_encode($d, JSON_HEX_TAG | JSON_HEX_APOS | JSON_HEX_QUOT | JSON_HEX_AMP);
        return $d ;
    }
    else
    {
        $d=array("code" => "1", "status" => "error", "message" =>"Mauvais IEN" );
       // echo json_encode($d, JSON_HEX_TAG | JSON_HEX_APOS | JSON_HEX_QUOT | JSON_HEX_AMP);
        return $d ;
    }

}


function file_get_contents_custom($url){

    $arrContextOptions=array("ssl"=>array(
        "verify_peer"=>false,"verify_peer_name"=>false));

    return file_get_contents($url, false, stream_context_create($arrContextOptions));

}


<?php
defined('BASEPATH') OR exit('No direct script access allowed');




$route['404_override'] = '';
$route['translate_uri_dashes'] = FALSE;

$route['default_controller'] = 'welcome';

$route['sign-in'] 			= 'Welcome/index';

$route['etape'] 			= 'C_etablissement/index/2';
$route['help'] 			    = 'C_aide';
$route['auth'] 				= 'C_connexions/authentication';
$route['commande'] 			= 'C_api/set_commande';
$route['observation_commande'] 			= 'C_api/set_commentaire';


$route['dashboard']         = 'C_connexions/home';


$route['se_deconnecter'] 	= 'C_connexions/se_deconnecter';
$route['verif/(.+)']        = 'C_api/verif_ien/$1';

$route['send_sms']          = 'C_send_sms/send_sms';

//http://localhost/planeteo/verif/ien/Z2AD2PQ
$route['ien/(.+)']    = 'C_api/conn/$1';


//$route['front-office'] 			        = 'Accueil/home';

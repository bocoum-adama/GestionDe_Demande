<?php
function curlPost($t_param, $url)
{
	//Debut du code CURL
	$curl = curl_init();
	$params_string = http_build_query($t_param);
	 
	$opts = array(
		CURLOPT_URL => $url,
		CURLOPT_POST => true,
		CURLOPT_POSTFIELDS => $params_string,
		CURLOPT_RETURNTRANSFER => true,
		CURLOPT_HEADER => false
	);
	 
	curl_setopt_array($curl, $opts);
	 
	$curl_reponse = curl_exec($curl);
	
	return $curl_reponse;
}

function curlGet($url)
{
	$curl = curl_init();
	// Set some options - we are passing in a useragent too here
	curl_setopt_array($curl, array(
		CURLOPT_RETURNTRANSFER => 1,
		CURLOPT_URL => $url,
		CURLOPT_USERAGENT => 'cURL Request'
	));
	// Send the request & save response to $resp
	$curl_reponse = curl_exec($curl);
	// Close request to clear up some resources
	curl_close($curl);
	
	return $curl_reponse;
}
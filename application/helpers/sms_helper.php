<?php
// Télécharger la bibliothèque httpful
// Placer le fichier httpful.phar dans le meme repertoire
include('httpful.phar');

function OrangeSendSMS($login,$api_access_key,$token,$subject,$signature,$recipient,$content,$method='POST')
{
    if($method == 'POST')
        return SendSMS_POST($login,$api_access_key,$token,$subject,$signature,$recipient,$content);

    return SendSMS_GET ($login,$api_access_key,$token,$subject,$signature,$recipient,$content);
}

function SendSMS_POST ($login,$api_access_key,$token,$subject,$signature,$recipient,$content)
{
    $timestamp=time();
    $msgToEncrypt=$token . $subject . $signature . $recipient . $content . $timestamp;
    $key=hash_hmac('sha1', $msgToEncrypt, $api_access_key);
    $params = array(
        'token' => $token,
        'subject' => $subject,
        'signature' => $signature,
        'recipient' => $recipient,
        'content' => $content,
        'timestamp' => $timestamp,
        'key' => $key
    );
    $uri = 'https://api.orangesmspro.sn:8443/api';
    $response = \Httpful\Request::post($uri)
        ->body(http_build_query($params))
        ->authenticateWith($login, $token)
        ->send();
    return $response;
}

function SendSMS_GET ($login,$api_access_key,$token,$subject,$signature,$recipient,$content)
{
    $content = urlencode($content);
    $subject = urlencode($subject);
    $signature = urlencode($signature);
    $timestamp=time();
    $msgToEncrypt=$token . $subject . $signature . $recipient . $content . $timestamp;
    $key=hash_hmac('sha1', $msgToEncrypt, $api_access_key);
    //$key=md5($msgToEncrypt.$api_access_key); //si vous utilisez MD5
    $uri='https://api.orangesmspro.sn:8443/api?token='.$token.'&subject='.$subject.'&signature='.$signature.'&recipient='.$recipient.'&content='.$content.'&timestamp='.$timestamp.'&key='.$key;
    $response = \Httpful\Request::get($uri)
    ->authenticateWith($login, $token)
    ->send();
	echo $response;
}

function SendSMS ($subject, $recipient, $content)
{
	/*Paramètres de base*/
	$login 			= 'Men'; 
	$api_access_key = 'ea42e6fc5971ca78348134c8acac2cc8'; 
	$token 			= '6da40104835272177c0439dfab2b3137';
	$signature		= 'MEN';
	/*Paramètres de base*/
	
	$timestamp		= time();
	$msgToEncrypt	= $token . $subject . $signature . $recipient . $content . $timestamp;
	$key			= hash_hmac('sha1', $msgToEncrypt, $api_access_key);
	$params 		= array(
							 'token' 		=> $token,
							 'subject' 		=> $subject,
							 'signature' 	=> $signature,
							 'recipient' 	=> $recipient,
							 'content' 		=> $content,
							 'timestamp' 	=> $timestamp,
							 'key' 			=> $key
							);
	
	$uri = 'https://api.orangesmspro.sn:8443/api';

    try{
        $response 	= \Httpful\Request::post($uri)
                        ->body(http_build_query($params))
                        ->authenticateWith($login, $token)
                        ->send();
        return $response->meta_data['http_code'];
    }
    catch(Exception $e){
        return '404';
    }

	/*
	Le serveur renvoie le modele de flux ci-dessous
	
	STATUS_CODE: 200
	STATUS_TEXT: Message envoye
	MESSAGE_ID: 16242157
	MESSAGEDETAIL_ID: 42716494
	RECIPIENT: 221776305113
	ID: null
	*/

}


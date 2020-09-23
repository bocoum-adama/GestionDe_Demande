<?php

function api_base_url($base)
{
    if($base == 'ien')
        return 'https://ien.education.sn/';
    else if($base == 'apps')
        return 'http://apps.education.sn/';
    else if($base == 'api')
        return 'https://api.education.sn/';
    //return 'http://w/api/';
    else if($base == 'codeco')
        return 'https://codeco1.education.sn/';
    else if($base == 'management')
        return 'https://management1.education.sn/';
    else if($base == 'planete')
        return 'https://planete.education.sn/';
}

//API Post generic
function apiPostData($base_url, $link_url, $array = array(), $type = 'json')
{
    try{
        $url = api_base_url($base_url).$link_url;
        if($type == 'array') //send array POST
        {
            try{
                $options = array(
                    'http' => array(
                        'method' => 'POST',
                        'content' => $type,
                        'header' => "Content-Type: application/json\r\n" .
                            "Accept: application/json\r\n"
                    ),
                    "ssl" => array(
                        "verify_peer"=>false,
                        "verify_peer_name"=>false
                    )
                );

                $result = file_get_contents($url, false, stream_context_create($options));

                $result = preg_replace('/[\x00-\x1F\x80-\xFF]/', '', $result);

                return json_decode($result, true);
            }
            catch(Exception $e){
                return [];
            }
        }
        else if($type == 'json') //send json POST
        {
            try{
                $json = json_encode($array);
                $options = array(
                    'http' => array(
                        'method' => 'POST',
                        'content' => $json,
                        'header' => "Content-Type: application/json\r\n" .
                            "Accept: application/json\r\n"
                    ),
                    "ssl" => array(
                        "verify_peer"=>false,
                        "verify_peer_name"=>false
                    )
                );

                $result = file_get_contents($url, false, stream_context_create($options));

                $result = preg_replace('/[\x00-\x1F\x80-\xFF]/', '', $result);

                return json_decode($result);
            }
            catch(Exception $e){
                return [];
            }
        }
        else
            return [];
    }
    catch(Exception $e){
        return [];
    }
}

function apiGetData($base_url, $link_url, $type = 'json'){
    try{
        // $url = api_base_url($base_url).$link_url;
        //$json_content = file_get_contents($url);
        $url = api_base_url($base_url) . $link_url;
        $arrContextOptions = array("ssl" => array("verify_peer" => false, "verify_peer_name" => false));
        $json_content = @file_get_contents($url, false, stream_context_create($arrContextOptions));
        $json_content = preg_replace('/[\x00-\x1F\x80-\xFF]/', '', $json_content);
        if($type == 'array')
            return json_decode(remove_utf8_bom($json_content), true);
        else if($type == 'json')
            return json_decode(remove_utf8_bom($json_content));
        else
            return null;
    }
    catch(Exception $e){
        return [];
    }
}

/*

function remove_utf8_bom($text)
{
    $text = mb_convert_encoding($text, 'UTF-8', 'ASCII,UTF-8,ISO-8859-1');
    if(substr($text, 0, 3) == pack("CCC", 0xEF, 0xBB, 0xBF)) $text = substr($text, 3);
    return $text;
    /* old Ndao
    $bom = pack('H*','EFBBBF');
    $text = preg_replace("/^$bom/", '', $text);
    return $text;

}
*/
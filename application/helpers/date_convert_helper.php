<?php

//echo date_pasre_fr2en('15/10/2015');
//echo date_parse_en2fr('2010-11-10');

// dd/mm/yyyy ==> yyyy-mm-dd
function date_pasre_fr2en($date, $sep='/')
{
	if($date == null || $date == '')
		return '';
	else
	{
		$dateConvert = $date == '' ? NULL : date('Y-m-d', strtotime(str_replace($sep, '-', $date)));
		return $dateConvert;
	}
}

    // yyyy-mm-dd ==>  dd/mm/yyyy
function date_parse_en2fr($date)
{
    if($date == null || $date == '')
        return '';
    else
    {
        $new_date = date('d/m/Y',strtotime($date));
        return $new_date;
    }
}

function check_date($date)
{
	$date = str_replace(' ', "", $date);
	
	$date = str_replace('/', "-", $date);
	
	if(preg_match("/^[0-9]{4}-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/",$date))
	{
		return $date;
	} 
	else if (preg_match("/^(0[1-9]|[1-2][0-9]|3[0-1])-(0[1-9]|1[0-2])-[0-9]{4}$/",$date))
	{
		$separ = '-';
		return substr($date, 6, 4).$separ.substr($date, 3, 2).$separ.substr($date, 0, 2);
		
	}else
	{
		return NULL;
	}
}

function calcul_age_by_datenaiss($date)
{
	$date = check_date($date);

	if($date != NULL)
	{
		$datetime1 = new DateTime($date);
		$datetime2 = new DateTime(date('Y-m-d'));
		$interval = $datetime1->diff($datetime2);

		$days = $interval->format('%R%a days');

		$year = intval($days)/365;
		return intval($year);
	}else
	{
		return NULL;
	}
}
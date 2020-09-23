<?php


function date_control_delay($date_debut, $date_fin)
{
   if(strtotime($date_debut) < strtotime($date_fin))
   {
	   return 1;
   }
   elseif(strtotime($date_debut) == strtotime($date_fin))
   {
	   return 0;
   }
   elseif(strtotime($date_debut) > strtotime($date_fin))
   {
	   return -1;
   }
   else
   {
	   return null;
   }
}

function validateDate($date, $format = 'Y-m-d')
{
    $d = DateTime::createFromFormat($format, $date);
    // The Y ( 4 digits year ) returns TRUE for any integer with any number of digits so changing the comparison from == to === fixes the issue.
    return $d && $d->format($format) === $date;
}

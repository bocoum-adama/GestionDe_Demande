<?php
/*Fonction qui renvoie les grid item*/
function grid_item()
{
	return '<div class="timetable-column-grid">
				<div class="grid-item "></div>
				<div class="grid-item "></div>
				<div class="grid-item "></div>
				<div class="grid-item "></div>
				<div class="grid-item "></div>
				<div class="grid-item "></div>
				<div class="grid-item "></div>
				<div class="grid-item "></div>
				<div class="grid-item "></div>
				<div class="grid-item "></div>
			</div>';
}

function horaires()
{
	return '<div class="timetable-axis">
				<div class="axis-item">08:00</div>
				<div class="axis-item">09:00</div>
				<div class="axis-item">10:00</div>
				<div class="axis-item">11:00</div>
				<div class="axis-item">12:00</div>
				<div class="axis-item">13:00</div>
				<div class="axis-item">14:00</div>
				<div class="axis-item">15:00</div>
				<div class="axis-item">16:00</div>
				<div class="axis-item">17:00</div>
				<div class="axis-item">18:00</div>
			</div>';
}

function hr2unit($heure)
{
	$hr_ref = 8;  ////Heure de référence de début des cours: ici 08h
	$t_heure 	= explode(':', $heure);
	$entiere 	= $t_heure[0];
	$decimale 	= intval($t_heure[1])== 0 ? 0 : 0.5;
	$unit		= $entiere + $decimale - $hr_ref;
	
	return $unit;
}

/*Distance vers le bas à partir de l'heure de référence*/
function top_height($heure_debut, $heure_fin)
{
	$hu_debut	= hr2unit($heure_debut);
	$hu_fin		= hr2unit($heure_fin);
	$top 		= $hu_debut*35;
	$height		= ($hu_fin - $hu_debut)*32;

	return 'style="top:'.$top.'px; height:'.$height.'px;"';
}

/*Discipline Classe Salle*/
function content($disc = '', $classe = '', $salle = '', $heure_debut = '', $heure_fin = '')
{
	if($disc != '')
	{
		return '<div class="timetable-column-content">
					<div class="timetable-item">
						<span class="timetable-title color-2" '.top_height($heure_debut, $heure_fin).'">
							<div class="timetable-title-wrap">
								<div class="timetable-name">'.$disc.'</div>
								<div class="timetable-time">'.$classe.' / '.$salle.'</div>
							</div>
						</span>
					</div>
				</div>';
	}else
	{
		return '';
	}
}


/*Affichage du jour en lettre à partir du numero de jour de la semaine*/
function jour($num_jr)
{
	switch($num_jr)
	{
		case '1':
			return 'Lundi';
		break;
		
		case '2':
			return 'Mardi';
		break;
		
		case '3':
			return 'Mercredi';
		break;
		
		case '4':
			return 'Jeudi';
		break;
		
		case '5':
			return 'Vendredi';
		break;
		
		case '6':
			return 'Samedi';
		break;
		
		case '7':
			return 'Dimanche';
		break;
	}
}

/*
* Fait la différence entre deux heures
*/
function heure_diff($heure1, $heure2)
{
	$h1 = strtotime($heure1);
	$h2 = strtotime($heure2);
	return gmdate('H:i',$h2-$h1);
}

/*
* Fait la comparaison entre deux heures
*/
function heure_cmp($heure1, $heure2)
{
	$h1 = strtotime($heure1);
	$h2 = strtotime($heure2);
	return $h2-$h1;
}





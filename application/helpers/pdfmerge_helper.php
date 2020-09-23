<?php
function pdfmerge($tableau, $chemin)
{
	require_once './libraries/PDFMerger.php';

	$pdf = new PDFMerger;
	
	foreach($tableau as $val)
	{
		$pdf->addPDF($val);
	}
	$pdf->merge('file', $chemin);
		
}


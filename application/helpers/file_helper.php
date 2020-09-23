<?php

function check_folder($chemin)
{
    if(!file_exists($chemin))
    {
        mkdir($chemin, 0777, true);
    }

    return file_exists($chemin);
}
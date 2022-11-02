<div class="panel panel-border panel-primary fc-list-table fc-state-default ">
    <div class='panel-heading'>
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true" style="padding-top:10px; padding-right:10px;">×</button>
        <h3 class='panel-title' style="font-family: Ionicons">Liste des Demandes</h3>
        <hr>
    </div>
                    <div class="panel-body">
                        <form id="form_add_doc" name="myForm" method="post" onsubmit="return validateForm()">
                            <div class="form-body"  id="form">
                                <input type="hidden" name="id_demande" id="id_demande" value="<?php echo $info->id_demande?>" >
                                <input type="hidden" name="adresse" id="adresse" value="<?php $this->dem->get_adr_part($info->id_partenaire) ?>" >
                                <div class='form-group' >
                                    <label class='control-label col-md-4'>Etat <span class="text-danger">*</span></label>
                                    <div class='col-md-8'>
                                        <?php
                                        if($info->etat_demande == 1)
                                        {
                                            echo '<div class="radio radio-info radio-inline">
                                                        <input type="radio" id="attente" class="attente" value="0" name="etat" required >
                                                        <label for="inlineRadio1"> En attente </label>
                                                  </div>';
                                            echo '<div class="radio radio-inline">
                                                        <input type="radio" id="valide" class="valider" value="1" name="etat" required checked>
                                                        <label for="inlineRadio2"> Valider </label>
                                                  </div>';
                                            echo '<div class="radio radio-inline">
                                                        <input type="radio" id="annuler" class="annuler" value="-1" name="etat" required>
                                                        <label for="inlineRadio2"> Annuler </label>
                                                  </div>';
                                        }
                                        elseif($info->etat_demande == 0)
                                        {
                                            echo '<div class="radio radio-info radio-inline">
                                                        <input type="radio" id="attente" class="attente" value="0" name="etat" required checked>
                                                        <label for="inlineRadio1"> En attente </label>
                                                  </div>';
                                            echo '<div class="radio radio-inline">
                                                        <input type="radio" id="valide" class="valider" value="1" name="etat" required>
                                                        <label for="inlineRadio2"> Valider </label>
                                                  </div>';
                                            echo '<div class="radio radio-inline">
                                                        <input type="radio" id="annuler" class="annuler" value="-1" name="etat" required>
                                                        <label for="inlineRadio2"> Annuler </label>
                                                  </div>';
                                        }
                                        elseif($info->etat_demande == -1)
                                        {
                                            echo '<div class="radio radio-info radio-inline">
                                                        <input type="radio" id="attente" class="attente" value="0" name="etat" required >
                                                        <label for="inlineRadio1"> En attente </label>
                                                  </div>';
                                            echo '<div class="radio radio-inline">
                                                        <input type="radio" id="valide" class="valider" value="1" name="etat" required>
                                                        <label for="inlineRadio2"> Valider </label>
                                                  </div>';
                                            echo '<div class="radio radio-inline">
                                                        <input type="radio" id="annuler" class="annuler" value="-1" name="etat" required checked>
                                                        <label for="inlineRadio2"> Annuler </label>
                                                  </div>';
                                        }
                                        ?>

                                        </br></br>

                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-md-4">Commentaire </label>

                                    <div class="col-md-8">

                                        <textarea id="observation" name="observation" rows="4" cols="50" ><?php echo $info->observation; ?></textarea>
                                        </br></br>
                                    </div>
                                </div>

                                <div class="form-group type1 hidden">
                                    <?php
                                    if($this->dem->get_nom_part($info->id_partenaire) == "Sonatel" and $this->dem->get_lib_type($info->id_type_demande) == "Ouverture de ligne")
                                    {
                                        echo'<div align="center">
                                                    <h3 class=\'panel-title\' style="font-family: Ionicons">DEMANDE DE '.$this->dem->get_lib_type($info->id_type_demande).'</h3>
                                                    <hr>
                                              </div>
                                              <div class="panel-body">
                                                    <h1 class="panel-title" align="center" style="font-family: Ionicons">PARTENAIRE [: <span class="text-danger">'.$this->dem->get_nom_part($info->id_partenaire).' </span> ]&emsp;&emsp;&emsp;&emsp;&emsp; TYPE DE DEMANDE[: <span class="text-danger">'.$this->dem->get_lib_type($info->id_type_demande).'</span> ]</h1>
                                                    </br>
                                                    <div class="form-group">
                                                            <label class="control-label col-md-4">Numero Ligne<span class="text-danger">*</span></label>
                                                            <div class="col-md-6">
                                                                    <input name="numero_ligne" id="numero_ligne" type="text" class="form-control" required placeholder="Numero ligne">
                                                                    </br>
                                                            </div>
                                                    </div>
                                                    
                                                    <div class=\'form-group\' >
                                                        <label class=\'control-label col-md-4\'>Avec Connexion <span class="text-danger">*</span></label>
                                                        <div class=\'col-md-8\'>                                        
                                                                 <div class="radio radio-info radio-inline">
                                                                        <input type="radio" id="oui" class="oui" value="0" name="oui">
                                                                        <label for="inlineRadio1"> Oui </label>
                                                                 </div>
                                                                 <div class="radio radio-inline">
                                                                        <input type="radio" id="non" class="non" value="1" name="oui">
                                                                        <label for="inlineRadio2"> Non </label>
                                                                 </div>                                      
                                                                </br></br>
                                                        </div>
                                                    </div>

                                                    <div class="form-group conn hidden">
                                                             <label class="control-label col-md-4">Type Connexion<span class="text-danger">*</span></label>
                                                             <div class="col-md-6">
                                                             <input name="debit" id="conn" type="text" class="form-control" required placeholder="Type Connexion">
                                                             </br>
                                                    </div>

                                                    <div class="form-group offre hidden">
                                                            <label class="control-label col-md-4">Offre<span class="text-danger">*</span></label>
                                                            <div class="col-md-6">
                                                                    <input name="offre" id="offre" type="text" class="form-control" required placeholder="Offre">
                                                                    </br>
                                                    </div>
                                                    
                                                    <div class="form-group internet hidden">
                                                            <label class="control-label col-md-4">Débit<span class="text-danger">*</span></label>
                                                            <div class="col-md-6">
                                                                    <input name="debit" id="debit" type="text" class="form-control" required placeholder="Debit">
                                                                    </br>
                                                    </div>
                                            </div>
                                     </div>
                                </div>';
                                    }
                                    elseif($this->dem->get_nom_part($info->id_partenaire) == "Sonatel" and $this->dem->get_lib_type($info->id_type_demande) == "Migration")
                                    {
                                        echo'<div align="center">
                                                    <h3 class=\'panel-title\' style="font-family: Ionicons">DEMANDE DE '.$this->dem->get_lib_type($info->id_type_demande).'</h3>
                                                    <hr>
                                              </div>
                                              <div class="panel-body">
                                                    <h1 class="panel-title" align="center" style="font-family: Ionicons">PARTENAIRE [: <span class="text-danger">'.$this->dem->get_nom_part($info->id_partenaire).' </span> ]&emsp;&emsp;&emsp;&emsp;&emsp; TYPE DE DEMANDE[: <span class="text-danger">'.$this->dem->get_lib_type($info->id_type_demande).'</span> ]</h1>
                                                    </br>
                                                    <div class="form-group">
                                                            <label class="control-label col-md-4">Numero Ligne<span class="text-danger">*</span></label>
                                                            <div class="col-md-6">
                                                                    <input name="numero_ligne" onclick="return isEmpty()" id="numero_ligne" type="text" class="form-control" required placeholder="Numero ligne" value="';?><?php echo $info->numero_ligne; ?><?php echo '">
                                                                    </br>
                                                            </div>
                                                    </div>';
                                                    $num = $this->dem->verif_num_ligne($info->id_demande);
                                                    if($num == null)
                                                    {
                                                        echo '<div class="form-group" >
                                                        <label class="control-label col-md-4">Avec Connexion <span class="text-danger">*</span></label>
                                                        <div class="col-md-8">                                        
                                                                 <div class="radio radio-info radio-inline">
                                                                        <input type="radio" id="oui" class="oui" value="0" name="oui">
                                                                        <label for="inlineRadio1"> Oui </label>
                                                                 </div>
                                                                 <div class="radio radio-inline">
                                                                        <input type="radio" id="non" class="non" value="1" name="oui">
                                                                        <label for="inlineRadio2"> Non </label>
                                                                 </div>                                      
                                                                </br></br>
                                                        </div>
                                                    </div>

                                                    <div class="form-group conn hidden">
                                                             <label class="control-label col-md-4">Type Connexion<span class="text-danger">*</span></label>
                                                             <div class="col-md-6">
                                                             <input name="debit" id="conn" type="text" class="form-control" required placeholder="Type Connexion">
                                                             </br>
                                                    </div>

                                                    <div class="form-group offre hidden">
                                                            <label class="control-label col-md-4">Offre<span class="text-danger">*</span></label>
                                                            <div class="col-md-6">
                                                                    <input name="offre" id="offre" type="text" class="form-control" required placeholder="Offre">
                                                                    </br>
                                                    </div>
                                                    
                                                    <div class="form-group internet hidden">
                                                            <label class="control-label col-md-4">Débit<span class="text-danger">*</span></label>
                                                            <div class="col-md-6">
                                                                    <input name="debit" id="debit" type="text" class="form-control" required placeholder="Debit">
                                                                    </br>
                                                    </div>';
                                                    }
                                                    echo'<div class="form-group">
                                                             <label class="control-label col-md-4">Offre Actuelle<span class="text-danger">*</span></label>
                                                             <div class="col-md-6">
                                                             <input name="offre" id="offre" type="text" class="form-control" required placeholder="Offre Actuelle">
                                                             </br>
                                                             </div>
                                                    </div>
                                                    
                                                    <div class="form-group">
                                                            <label class="control-label col-md-4">Offre Nouvelle<span class="text-danger">*</span></label>
                                                            <div class="col-md-6">
                                                                    <input name="nouvelle_offre" id="nouvelle_offre" type="text" class="form-control" required placeholder="Offre Nouvelle">
                                                                    </br>
                                                            </div>

                                                    </div>
                                            </div>';
                                    }
                                    elseif($this->dem->get_nom_part($info->id_partenaire) == "Sonatel" and $this->dem->get_lib_type($info->id_type_demande) == "Transfert de ligne")
                                    {
                                        echo'<div align="center">
                                                    <h3 class=\'panel-title\' style="font-family: Ionicons">DEMANDE DE '.$this->dem->get_lib_type($info->id_type_demande).'</h3>
                                                    <hr>
                                              </div>
                                              <div class="panel-body">
                                                    <h1 class="panel-title" align="center" style="font-family: Ionicons">PARTENAIRE [: <span class="text-danger">'.$this->dem->get_nom_part($info->id_partenaire).' </span> ]&emsp;&emsp;&emsp;&emsp;&emsp; TYPE DE DEMANDE[: <span class="text-danger">'.$this->dem->get_lib_type($info->id_type_demande).'</span> ]</h1>
                                                    </br>
                                                    <div class="form-group">
                                                            <label class="control-label col-md-4">Numero Ligne<span class="text-danger">*</span></label>
                                                            <div class="col-md-6">
                                                                    <input name="numero_ligne" id="numero_ligne" type="text" class="form-control" required placeholder="Numero ligne" value="'.$this->dem->get_num_ligne($info->id_demande).'">
                                                                    </br>
                                                            </div>
                                                    </div>

                                                    <div class="form-group">
                                                             <label class="control-label col-md-4">Ancien Adresse<span class="text-danger">*</span></label>
                                                             <div class="col-md-6">
                                                             <input name="ancien_adr" id="ancien_adr" type="text" class="form-control" required placeholder="Ancien Adresse" value="'.$this->dem->get_adr_part($info->id_partenaire).'">
                                                             </br>
                                                    </div>

                                                    <div class="form-group">
                                                            <label class="control-label col-md-4">Nouvelle Adresse<span class="text-danger">*</span></label>
                                                            <div class="col-md-6">
                                                                    <input name="nouvelle_adr" id="nouveau_adr" type="text" class="form-control" required placeholder=" Nouvelle Adresse">
                                                                    </br>
                                                    </div>

                                        </div>
                                </div>';
                                    }
                                    elseif($this->dem->get_nom_part($info->id_partenaire) == "Sonatel" and $this->dem->get_lib_type($info->id_type_demande) == "Suspension de ligne" or $this->dem->get_lib_type($info->id_type_demande) == "Rétablissement de ligne")
                                    {
                                        echo'<div align="center">
                                                    <h3 class=\'panel-title\' style="font-family: Ionicons">DEMANDE DE '.$this->dem->get_lib_type($info->id_type_demande).'</h3>
                                                    <hr>
                                              </div>
                                              <div class="panel-body">
                                                    <h1 class="panel-title" align="center" style="font-family: Ionicons">PARTENAIRE [: <span class="text-danger">'.$this->dem->get_nom_part($info->id_partenaire).' </span> ]&emsp;&emsp;&emsp;&emsp;&emsp; TYPE DE DEMANDE[: <span class="text-danger">'.$this->dem->get_lib_type($info->id_type_demande).'</span> ]</h1>
                                                    </br>
                                                    <div class="form-group">
                                                            <label class="control-label col-md-4">Numero Ligne<span class="text-danger">*</span></label>
                                                            <div class="col-md-6">
                                                                    <input name="numero_ligne" id="numero_ligne" type="text" class="form-control" required placeholder="Numero ligne">
                                                                    </br>
                                                            </div>
                                                    </div>
                                                    
                                                    <div class=\'form-group\' >
                                                        <label class=\'control-label col-md-4\'>Etat Numero de Ligne <span class="text-danger">*</span></label>
                                                        <div class=\'col-md-8\'>                                        
                                                                 <div class="radio radio-info radio-inline">
                                                                        <input type="radio" id="actif" class="actif" value="0" name="etat_num">
                                                                        <label for="inlineRadio1"> Actif </label>
                                                                 </div>
                                                                 <div class="radio radio-inline">
                                                                        <input type="radio" id="suspendu" class="suspendu" value="1" name="etat_num">
                                                                        <label for="inlineRadio2"> Suspendu </label>
                                                                 </div>
                                                                  <div class="radio radio-inline">
                                                                        <input type="radio" id="retabli" class="retabli" value="1" name="etat_num">
                                                                        <label for="inlineRadio2"> Rétabli </label>
                                                                 </div>                                      
                                                                </br></br>
                                                        </div>
                                                    </div>
                                </div>';
                                    }
//                                    elseif($this->dem->get_nom_part($info->id_partenaire) == "Sonatel" and $this->dem->get_lib_type($info->id_type_demande) == "Changement de modem")
//                                    {
//                                        echo'<div align="center">
//                                                    <h3 class=\'panel-title\' style="font-family: Ionicons">DEMANDE DE '.$this->dem->get_lib_type($info->id_type_demande).'</h3>
//                                                    <hr>
//                                              </div>
//                                              <div class="panel-body">
//                                                    <h1 class="panel-title" align="center" style="font-family: Ionicons">PARTENAIRE [: <span class="text-danger">'.$this->dem->get_nom_part($info->id_partenaire).' </span> ]&emsp;&emsp;&emsp;&emsp;&emsp; TYPE DE DEMANDE[: <span class="text-danger">'.$this->dem->get_lib_type($info->id_type_demande).'</span> ]</h1>
//                                                    </br>
//                                                    <div class="form-group">
//                                                            <label class="control-label col-md-4">Numero Ligne<span class="text-danger">*</span></label>
//                                                            <div class="col-md-6">
//                                                                    <input name="numero_ligne" id="numero_ligne" type="text" class="form-control" required placeholder="Numero ligne">
//                                                                    </br>
//                                                            </div>
//                                                    </div>
//
//                                                    <div class="form-group">
//                                                             <label class="control-label col-md-4">Ancien Adresse<span class="text-danger">*</span></label>
//                                                             <div class="col-md-6">
//                                                             <input name="ancien_adr" id="ancien_adr" type="text" class="form-control" required placeholder="Ancien Adresse">
//                                                             </br>
//                                                    </div>
//
//                                                    <div class="form-group">
//                                                            <label class="control-label col-md-4">Nouvelle Adresse<span class="text-danger">*</span></label>
//                                                            <div class="col-md-6">
//                                                                    <input name="nouvelle_adr" id="nouveau_adr" type="text" class="form-control" required placeholder=" Nouvelle Adresse">
//                                                                    </br>
//                                                    </div>
//
//                                        </div>
//                                </div>';
//                                    }
                                    elseif($this->dem->get_nom_part($info->id_partenaire) == "Sonatel" and $this->dem->get_lib_type($info->id_type_demande) == "Augmentation de débit")
                                    {
                                        echo'<div align="center">
                                                    <h3 class=\'panel-title\' style="font-family: Ionicons">DEMANDE DE '.$this->dem->get_lib_type($info->id_type_demande).'</h3>
                                                    <hr>
                                              </div>
                                              <div class="panel-body">
                                                    <h1 class="panel-title" align="center" style="font-family: Ionicons">PARTENAIRE [: <span class="text-danger">'.$this->dem->get_nom_part($info->id_partenaire).' </span> ]&emsp;&emsp;&emsp;&emsp;&emsp; TYPE DE DEMANDE[: <span class="text-danger">'.$this->dem->get_lib_type($info->id_type_demande).'</span> ]</h1>
                                                    </br>
                                                    <div class="form-group">
                                                            <label class="control-label col-md-4">Numero Ligne<span class="text-danger">*</span></label>
                                                            <div class="col-md-6">
                                                                    <input name="numero_ligne" id="numero_ligne" type="text" class="form-control" required placeholder="Numero ligne">
                                                                    </br>
                                                            </div>
                                                    </div>

                                                    <div class="form-group">
                                                             <label class="control-label col-md-4">Ancien Débit<span class="text-danger">*</span></label>
                                                             <div class="col-md-6">
                                                             <input name="debit1" id="debit1" type="text" class="form-control" required placeholder="Ancien Débit">
                                                             </br>
                                                    </div>

                                                    <div class="form-group">
                                                            <label class="control-label col-md-4">Nouveau Débit<span class="text-danger">*</span></label>
                                                            <div class="col-md-6">
                                                                    <input name="debit2" id="debit2" type="text" class="form-control" required placeholder=" Nouveau Débit">
                                                                    </br>
                                                    </div>

                                        </div>
                                </div>';
                                    }
                                    ?>
                                    <?php
                                    if($this->dem->get_nom_part($info->id_partenaire) == "Senelec" or $this->dem->get_nom_part($info->id_partenaire) == "Sen'E  au" and $this->dem->get_lib_type($info->id_type_demande) == "Branchement")
                                    {
                                        echo'<div align="center">
                                                    <h3 class=\'panel-title\' style="font-family: Ionicons">DEMANDE DE '.$this->dem->get_lib_type($info->id_type_demande).'</h3>
                                                    <hr>
                                              </div>
                                              <div class="panel-body">
                                                    <h1 class="panel-title" align="center" style="font-family: Ionicons">PARTENAIRE [: <span class="text-danger">'.$this->dem->get_nom_part($info->id_partenaire).' </span> ]&emsp;&emsp;&emsp;&emsp;&emsp; TYPE DE DEMANDE[: <span class="text-danger">'.$this->dem->get_lib_type($info->id_type_demande).'</span> ]</h1>
                                                    </br>
                                                    <div class="form-group">
                                                            <label class="control-label col-md-4">Numero compteur<span class="text-danger">*</span></label>
                                                            <div class="col-md-6">
                                                                    <input name="numero_comptteur" id="numero_compteur" type="text" class="form-control" required placeholder="Numero Compteur">
                                                                    </br>
                                                            </div>
                                                    </div> ';
                                              if($this->dem->get_nom_part($info->id_partenaire) == "Sen'Eau") {
                                                  echo ' <div class="form-group hidden">
                                                             <label class="control-label col-md-4">Type compteur<span class="text-danger">*</span></label>
                                                             <div class="col-md-6">
                                                             <input name="type_compteur" id="type_compteur" type="text" class="form-control" required placeholder="Type Compteur">
                                                             </br>
                                                    </div>';
                                              }
                                              else
                                              {
                                                 echo ' <div class="form-group">
                                                             <label class="control-label col-md-4">Type compteur<span class="text-danger">*</span></label>
                                                             <div class="col-md-6">
                                                             <input name="type_compteur" id="type_compteur" type="text" class="form-control" required placeholder="Type Compteur">
                                                             </br>
                                                    </div>';
                                              }

                                            echo'</div>
                                     </div>
                                </div>';
                                    }
                                    elseif($this->dem->get_nom_part($info->id_partenaire) == "Senelec" or $this->dem->get_nom_part($info->id_partenaire) == "Sen'Eau" and $this->dem->get_lib_type($info->id_type_demande) == "Résiliation d'abonnement")
                                    {
                                        echo'<div align="center">
                                                    <h3 class=\'panel-title\' style="font-family: Ionicons">DEMANDE DE '.$this->dem->get_lib_type($info->id_type_demande).'</h3>
                                                    <hr>
                                              </div>
                                              <div class="panel-body">
                                                    <h1 class="panel-title" align="center" style="font-family: Ionicons">PARTENAIRE [: <span class="text-danger">'.$this->dem->get_nom_part($info->id_partenaire).' </span> ]&emsp;&emsp;&emsp;&emsp;&emsp; TYPE DE DEMANDE[: <span class="text-danger">'.$this->dem->get_lib_type($info->id_type_demande).'</span> ]</h1>
                                                    </br>
                                                    <div class="form-group">
                                                            <label class="control-label col-md-4">Numero compteur<span class="text-danger">*</span></label>
                                                            <div class="col-md-6">
                                                                    <input name="numero_comptteur" id="numero_compteur" type="text" class="form-control" required placeholder="Numero Compteur">
                                                                    </br>
                                                            </div>
                                                    </div>

                                                     <div class="form-group">
                                                        <label class="control-label col-md-4">Etat Compteur <span class="text-danger">*</span></label>
                                                        <div class="col-md-6">                                        
                                                                 <div class="radio radio-info radio-inline">
                                                                        <input type="radio" id="actif" class="actif" value="1" name="etat_cmpt">
                                                                        <label for="inlineRadio1"> Actif </label>
                                                                 </div>
                                                                 <div class="radio radio-inline">
                                                                        <input type="radio" id="resilier" class="resilier" value="0" name="etat_cmpt">
                                                                        <label for="inlineRadio2"> Résilier </label>
                                                                 </div>                                                                                                    
                                                                </br></br>
                                                        </div>
                                        </div>
                                        </div>';
                                        

                                    }
                                    ?>
                                </div>

                            </div>
                            <div class="form-group col-md-12"></div>
                            <div class="form-group col-md-12 text-right">
                                <a href="#" class="on-default valide" id="valide">
                                    <span class="btn btn-info">Enregistrer</span>
                                </a>
                                &nbsp;&nbsp;&nbsp;
                                <button type="reset"  class="btn btn-default"> Annuler</button>
                            </div>
                        </form>
                    </div>


</div>


<script>



    $(document).ready(function (){

        // validate_form('form_add_doc');

        $('#form_add_doc').on('click', '.valide', function () {

            var isvalidate = $('#form_add_doc').valid();

            if(isvalidate){
                $('#modal_add_doc').modal('hide');
                href ="<?php echo site_url('demande/C_demande/traitement/')?>" +  $('#id_demande').val();
                var formulaire = $("#form_add_doc");
                $.ajax({
                    url: href,
                    type: 'POST',
                    data: formulaire.serialize(),
                    dataType: 'JSON',
                    success: function (data) {
                            $.Notification.autoHideNotify(data.status, 'bottom right', 'Ajout', data.message);

                            $('#'+menu_encours).click();
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        alert('Error adding data');
                    }
                });
            }
            return false;
        });

        $('#valide').click(function() {

            if($(this).is(':checked') == true)
            {
                $(".type1").removeClass("hidden");

            }
        });

        $('#attente').click(function() {

            if($(this).is(':checked') == true)
            {
                $(".type1").addClass("hidden");

            }
        });

        $('#annuler').click(function() {

            if($(this).is(':checked') == true)
            {
                $(".type1").addClass("hidden");

            }
        });

        $('#oui').click(function() {

            if($(this).is(':checked') == true)
            {
                $(".internet").removeClass("hidden");
                $(".conn").removeClass("hidden");
                $(".offre").removeClass("hidden");
            }
        });

        $('#non').click(function() {

            if($(this).is(':checked') == true)
            {
                $(".internet").addClass("hidden");
                $(".model").addClass("hidden");
                $(".num_modem").addClass("hidden");
            }
        });

        function isEmpty(){
            var str = document.forms['myForm'].numero_ligne.value;
            if(str = null) {
                alert( "Le champ Name est vide!" );
                return false;
            }
        }

        $('.wysihtml5').wysihtml5({
            "link": true, //Button to insert a link. Default true
            "image": true, //Button to insert an image. Default true,
            "color": true, //Button to insert an image. Default true,
            "blockquote": true, //Blockquote
        });
    });
</script>


<?php

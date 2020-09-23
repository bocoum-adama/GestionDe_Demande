<!-- Right Sidebar -->

<div class="side-bar right-bar nicescroll">
                <h4 class="text-center">Annee scolaire</h4>
                <div class="contact-list nicescroll my_widget ">
                    <form method="post">
                        <?php
                        foreach($all_annee as $an)
                        {
                            ?>
                            
                            <label style="margin-left:10px; cursor: Pointer;">
								<input name="annee_select" value="<?php echo $an->id_annees."bks".$an->libelle_annee; ?>" type="radio" onchange="this.form.submit();" <?php if ($an->id_annees == $_SESSION['annee_travail']){echo "checked ";}?> />
                                <span> <?php echo $an->libelle_annee; ?></span>
							</label>
                            <br>
                            <?php
                        }
                        ?>
                      </form>
                </div>
            </div>
            <!-- /Right-bar --> 
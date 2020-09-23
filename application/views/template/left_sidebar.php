<!-- ========== Left Sidebar Start ========== -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<div class="left side-menu">
    <div class="sidebar-inner slimscrollleft">
         <div class="user-details">
            <div class="pull-left">
                <img src="<?= $this->session->photo?>"
                     alt="" class="thumb-md img-circle"/>
            </div>
           <div class="user-info">
                <div class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                        <?php echo strtoupper($_SESSION["prenom"])." ".strtoupper($_SESSION["nom"]); ?>
                        <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="javascript:void(0)"><i class="md md-face-unlock"></i> Profile<div class="ripple-wrapper"></div></a></li>
                        <li><a href="javascript:void(0)"><i class="md md-settings"></i> Settings</a></li>
                        <li><a href="javascript:void(0)"><i class="md md-lock"></i> Lock screen</a></li>
                        <li><a href="<?php  //echo site_url() ?>se_deconnecter"><i class="md md-settings-power"></i> Logout</a></li>
                    </ul>
                </div>

               <p class="text-muted m-0"><?php
                   echo  $_SESSION['profil'];
                   ?></p>
            </div>
        </div> 

        <!--- Divider -->
        <div id="sidebar-menu">
            <ul>

                <?php
                $menu_roles = $_SESSION['menu_roles'];
                $smenu_roles = $_SESSION['smenu_roles'];

                if (isset($smenu_roles['DASH']['d_read'])): ?>
                    <li>
                        <a href="<?php echo base_url(); ?>dashboard" class="waves-effect"><i class="fa fa-tachometer"></i><span> Tableau de bord </span></a>
                    </li>
                <?php endif; ?>



                <?php if (isset($menu_roles['CONFIGURATION'])): ?>
                    <li class="has_sub">
                        <a href="#" class="waves-effect"><i class="fa fa-handshake-o"></i><span> Partenaire </span><span class="pull-right"><i class="md md-add"></i></span></a>
                        <ul class="list-unstyled">

                            <?php if (isset($smenu_roles['LST_PARTENAIRES']['d_read'])): ?>
                                <li><a href="<?php echo base_url(); ?>partenaire/C_partenaire" class="menu"
                                       id="menu_partenaire"><i ></i>Liste Partenaires</a></li>
                            <?php endif; ?>

                        </ul>
                    </li>
                <?php endif; ?>

                <?php if (isset($menu_roles['DEMANDE'])): ?>
                    <li class="has_sub">
                        <a href="#" class="waves-effect"><i class="fa fa-folder-open-o"></i><span> Demande </span><span class="pull-right"><i class="md md-add"></i></span></a>
                        <ul class="list-unstyled">

                            <?php if (isset($smenu_roles['LST_DEMANDE']['d_read'])): ?>
                                <li><a href="<?php echo base_url(); ?>demande/C_demande" class="menu"
                                       id="id_menu_lst_demande">Liste Demandes</a></li>
                            <?php endif; ?>

                            <?php if (isset($smenu_roles['LST_DEMANDE']['d_read'])): ?>
                                <li><a href="<?php echo base_url(); ?>demande/C_type_demande" class="menu"
                                       id="id_menu_type_demande">Type Demande</a></li>
                            <?php endif; ?>


                        </ul>
                    </li>
                <?php endif; ?>

                <?php if (isset($menu_roles['STRUCTURE'])): ?>
                    <li class="has_sub">
                        <a href="#" class="waves-effect"><i class="fa fa-folder-open-o"></i><span> Structure </span><span class="pull-right"><i class="md md-add"></i></span></a>
                        <ul class="list-unstyled">

                            <?php if (isset($smenu_roles['LST_STRUCTURE']['d_read'])): ?>
                                <li><a href="<?php echo base_url(); ?>structure/C_structure" class="menu"
                                       id="id_menu_lst_structure">Charger les structures</a></li>
                            <?php endif; ?>

                            <?php if (isset($smenu_roles['LST_STRUCTURE']['d_read'])): ?>
                                <li><a href="<?php echo base_url(); ?>structure/C_structure/etablissements" class="menu"
                                       id="id_menu_lst_etablissement">Charger les Etablissements</a></li>
                            <?php endif; ?>

                        </ul>
                    </li>
                <?php endif; ?>

                <?php if (isset($menu_roles['SECURITE'])): ?>
                    <li class="has_sub">
                        <a href="#" class="waves-effect"><i class="md md-security"></i><span> Sécurité </span><span class="pull-right"><i class="md md-add"></i></span></a>
                        <ul class="list-unstyled">

                            <?php if (isset($smenu_roles['USR']['d_read'])): ?>
                                <li><a href="<?php echo base_url(); ?>sys/C_sys_user" class="menu"
                                       id="menu_sys_users">Utilisateurs</a></li>
                            <?php endif; ?>

                            <?php if (isset($smenu_roles['MENU']['d_read'])): ?>
                                <li><a href="<?php echo base_url(); ?>sys/C_sys_menu" class="menu"
                                       id="menu_sys_menu">Menus</a></li>
                            <?php endif; ?>
                            <?php if (isset($smenu_roles['LST_MENU']['d_read'])): ?>
                                <li><a href="<?php echo base_url(); ?>sys/C_sys_menu/list_menu" class="menu"
                                       id="menu_list_menu">Liste Menu</a></li>
                            <?php endif; ?>
                            <?php if (isset($smenu_roles['LST_S_MENU']['d_read'])): ?>
                                <li><a href="<?php echo base_url(); ?>sys/C_sys_menu/list_sous_menu"
                                       class="menu" id="menu_list_sous_menu">Liste Sous Menus</a></li>
                            <?php endif; ?>

                            <?php if (isset($smenu_roles['PROFIL']['d_read'])): ?>
                                <li><a href="<?php echo base_url(); ?>sys/C_sys_profil" class="menu"
                                       id="menu_sys_profils">Profils</a></li>
                            <?php endif; ?>
                            <?php if (isset($smenu_roles['IMPORT_ETABLISSEMENT']['d_read'])): ?>
                                <li><a href="<?php echo base_url(); ?>C_etablissement/load_etablissement" class="menu"
                                       id="menu_sys_profils">Import Etablissement</a></li>
                            <?php endif; ?>
                            <?php if (isset($smenu_roles['PERSTR']['d_read'])): ?>
                                <li><a href="<?php echo base_url(); ?>C_personnel_str" class="menu"
                                       id="menu_PERSTR">Personnels</a></li>
                            <?php endif; ?>
                        </ul>
                    </li>
                <?php endif; ?>

                <li>
                    <a href="<?php echo base_url(); ?>se_deconnecter" class="waves-effect"><i class="ion-power"></i><span> Déconnexion </span></a>
                </li>

			</ul>
            <div class="clearfix"></div>
        </div>
        <div class="clearfix"></div>
    </div>
</div>
<?php 
unset($menu_roles, $smenu_roles, $tab_data_ses);
?>
<!-- Left Sidebar End --> 

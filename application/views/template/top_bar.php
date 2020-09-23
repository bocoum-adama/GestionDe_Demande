<!-- Top Bar Start -->
<div class="topbar">
    <!-- LOGO -->
    <div class="topbar-left">
        <div class="text-center" style="text-align: justify-all">
            <a href="" class="logo" style="text-transform: none" ><img src="" height="50"/> <span>Gestion Demande</span></a>
        </div>
    </div>
    <!-- Button mobile view to collapse sidebar menu -->
    <div class="navbar navbar-default" role="navigation">
        <div class="container">
            <div class="">
                <div class="pull-left" style="color: white;font-size: 20px;font-weight: bold;font-family: 'Roboto', sans-serif;">
                    <button type="button" class="button-menu-mobile open-left">
                        <i class="fa fa-bars"></i>
                    </button>

                    <span class="institut_control" style="font-size: 12px;"> <?php echo $_SESSION['code_str'] .' - '. $_SESSION['libelle_structure'];?></span>

                    <span class="clearfix"></span>
                </div>
                <form class="navbar-form pull-left" role="search">
                    <div class="form-group">
                        <!--input type="text" class="form-control search-bar" placeholder="Recherche..."-->
                    </div>
                    <button type="submit" class="btn btn-search"><i class="fa fa-search"></i></button>
                </form>

                <ul class="nav navbar-nav navbar-right pull-right">
                    <li class="dropdown hidden-xs">
                        <a href="#" data-target="#" class="dropdown-toggle waves-effect waves-light" id="notification_control"
                           data-toggle="dropdown" aria-expanded="true">
                            <i class="md md-live-help md-2x"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-lg">
                            <!--<li class="text-center notifi-title">Assistance</li>-->
                            <li class="list-group">
                                <!-- list item-->
                                <a href="https://assistance.education.sn/help?ien=<?= $_SESSION['ien'] ;?>" class="link" target="_blank" id="">

                                    <div class="media">
                                        <div class="media-left">
                                            <em class="ion-ios7-information fa-3x text-info"></em>
                                        </div>
                                        <div class="media-body clearfix">
                                            <div class="media-heading">Assistance SIMEN</div>
                                            <p class="m-0">
                                                <small>Soumettre des requêtes à l'assistance</small>
                                            </p>
                                        </div>
                                    </div>
                                </a>

                                <a href="https://assistance.education.sn/fondecrean/ien/<?=$_SESSION['ien']?>" type="download" download="Fond_<?= $_SESSION['ien']?>.png" class="link" target="_blank" id="" >
                                    <div class="media">
                                        <div class="media-left">
                                            <em class="md md-image md-3x text-success"></em>
                                        </div>
                                        <div class="media-body clearfix">
                                            <div class="media-heading">Fond d'écran</div>
                                            <p class="m-0">
                                                <small>Fond d'écran pour presentation</small>
                                            </p>
                                        </div>
                                    </div>
                                </a>


                                <!-- list item-->

                                <!-- last list item -->

                            </li>
                        </ul>
                    </li>

                    <li class="hidden-xs">
                        <a href="#" id="btn-fullscreen" class="waves-effect waves-light"><i class="md md-crop-free"></i></a>
                    </li>
                    <li class="hidden-xs">
                                    <a href="#" class="right-bar-toggle waves-effect waves-light">
                                        <?php
                                        // Annee en cours
                                        
                                        echo "<b>".$this->session->lib_annee_travail."</b>";
                                        ?>
                                    </a>
                                </li>

                    <li class="hidden-xs">
                        <a href="<?php echo base_url(); ?>se_deconnecter" id="btn-logout" class="waves-effect waves-light" ><i
                                class="md md-settings-power"></i></a>
                    </li>


                </ul>
            </div>
            <!--/.nav-collapse -->
        </div>
    </div>
</div>
<!-- Top Bar End -->
<style>
    @media (max-width: 600px) {
        .institut_control{
            display: none;
        }
    }
</style>

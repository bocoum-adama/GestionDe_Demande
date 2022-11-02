<div class="row">
    <div class="col-sm-4 col-lg-3">
        <div class="mini-stat clearfix bx-shadow bg-white fc-button fc-state-default ">
            <span class="mini-stat-icon bg-bleu"><i class="fa fa-database"></i></span>
            <div class="mini-stat-info text-right text-dark">
                <span style="color:#333"><?= number_format($nb_demande, 0, ',', ' '); ?></span>
                Total Demandes
            </div>
        </div>
    </div>

    <div class="col-sm-4 col-lg-3">
        <div class="mini-stat clearfix bx-shadow bg-white fc-button fc-state-default ">
            <span class="mini-stat-icon bg-vert"><i class="fa fa-check-circle"></i></span>
            <div class="mini-stat-info text-right text-dark">
                <span style="color:#333"><?= number_format($nb_traite, 0, ',', ' '); ?></span>
                Demandes Traitées
            </div>
        </div>
    </div>

    <div class="col-sm-4 col-lg-3">
        <div class="mini-stat clearfix bx-shadow bg-white fc-button fc-state-default ">
            <span class="mini-stat-icon bg-warning"><i class="fa fa-refresh"></i></span>
            <div class="mini-stat-info text-right text-dark">
                <span style="color:#333"><?= number_format($nb_encours, 0, ',', ' '); ?></span>
                Demandes en Attentes
            </div>
        </div>
    </div>

    <div class="col-sm-4 col-lg-3">
        <div class="mini-stat clearfix bx-shadow bg-white fc-button fc-state-default ">
            <span class="mini-stat-icon bg-danger"><i class="fa fa-times-circle"></i></span>
            <div class="mini-stat-info text-right text-dark">
                <span style="color:#333"><?= number_format($nb_annule, 0, ',', ' '); ?></span>
                Demandes Annulées
            </div>
        </div>
    </div>


</div>

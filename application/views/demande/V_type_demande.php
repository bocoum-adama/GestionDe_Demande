<?php btn_add_action('LST_TYPE_DEMANDE'); ?>

<div class="col-md-8"></div>

<div class="col-md-4">

    <nav aria-label="breadcrumb" style="background-color: #ededed;border-radius: 5px;">

        <ol class="breadcrumb">

            <li class="breadcrumb-item">
                <a href="#"><i class="fa fa-recycle"></i> Dahboard</a>
            </li>

            <li class="breadcrumb-item active" aria-current="page">Listes Types Demandes</li>

        </ol>

    </nav>

</div>

<div class="row">

    <div class="col-md-12">

        <div class="panel panel-border panel-primary">

            <div class="panel-heading">

                <h3 class="panel-title">Liste Types Demandes</h3>

            </div>

            <div class="panel-body">

                <table id="datatable-buttons" class="table table-striped table-bordered">

                    <thead>

                        <tr>

                            <th>Libelle</th>
                            <th>Partenaire</th>
                            <th></th>

                        </tr>

                    </thead>

                    <tbody>

                        <?php foreach ($all_data as $value): ?>

                            <tr>

                                <td><?= $value->libelle; ?></td>

                                <td>

                                    <?php echo $this->type->get_nom($value->id_partenaire); ?>

                                </td>

                                <td class="actions" style="width: 1%; text-align: center; white-space: nowrap">

                                    <?php btn_edit_action($value->id_type_demande, 'LST_TYPE_DEMANDE');?>
                                    <?php btn_delete_action($value->id_type_demande, 'LST_TYPE_DEMANDE');?>

                                </td>

                            </tr>

                        <?php endforeach; ?>

                    </table>
            </div>

        </div>
    </div>
</div>


<!-- sample modal content -->
<div id="modal_form" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="modal_formLabel" aria-hidden="true">

    <form action="#" id="form" class="form-horizontal">

        <div class="modal-dialog">

            <div class="modal-content">

                <div class="modal-header">

                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title" id="modal_formLabel">Title</h4>

                </div>

                <div class="modal-body">

                    <input type="hidden" id="id_type_demande" name="id_type_demande"/>

                    <div class="form-body">

                        <div class="form-group">

                            <label class="control-label col-md-4">Libelle <span class="text-danger">*</span></label>

                            <div class="col-md-8">

                                <input name="libelle" id="libelle" type="text" class="form-control" required placeholder="libelle">

                            </div>

                        </div>

                        <div class="form-group">

                            <label class="control-label col-md-3">Partenaire<span class="text-danger">*</span></label>

                            <div class="col-md-9">

                                <select name="id_partenaire" id="id_partenaire" class="form-control" required value="Selectionner partenaire">

                                    <option selected="selected">Sélectionner le partenaire</option>
                                    <?php echo $select_partenaire; ?>

                                </select>

                            </div>

                        </div>


                    </div>

                </div>

                <div class="modal-footer">

                    <br>
                    <input type="submit" class="btn btn-primary"/>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Fermer</button>

                </div>

            </div>

        </div>
        <!-- /.modal-content -->
</div>
<!-- /.modal-dialog -->
</form>

</div><!-- /.modal -->


<script type="text/javascript">

    $(document).ready(function () {

        $('#datatable-buttons').managing_ajax({
            id_modal_form: 'modal_form',

            id_form: 'form',
            url_submit: "<?php echo site_url('demande/C_type_demande/save')?>",

            title_modal_add: 'Ajouter un Type',
            focus_add: 'libelle',

            title_modal_edit: 'Modifier un Type',
            focus_edit: 'libelle',

            url_edit: "<?php echo site_url('demande/C_type_demande/get_record')?>",
            url_delete: "<?php echo site_url('demande/C_type_demande/delete')?>",
        });

    });

</script>
<?php if (ENVIRONMENT !== 'production'): ?>{elapsed_time} seconds&nbsp;|&nbsp;{memory_usage}<?php endif ?>

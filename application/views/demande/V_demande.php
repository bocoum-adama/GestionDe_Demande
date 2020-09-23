<?php btn_add_action('LST_DEMANDE'); ?>

<div class="col-md-8"></div>

<div class="col-md-4">

    <nav aria-label="breadcrumb" style="background-color: #ededed;border-radius: 5px;">

        <ol class="breadcrumb">

            <li class="breadcrumb-item">
                <a href="#"><i class="fa fa-recycle"></i> Dahboard</a>
            </li>

            <lsi class="breadcrumb-item active" aria-current="page">Liste Demande</lsi>

        </ol>

    </nav>

</div>

<div class="row">

    <div class="col-md-12">

        <div class="panel panel-border panel-primary">

            <div class="panel-heading">

                <h3 class="panel-title">Liste Demandes</h3>

            </div>

            <div class="panel-body">

                <table id="datatable-buttons" class="table table-striped table-bordered">

                    <thead>

                    <tr>

                        <th>Numero</th>
                        <th>Objet</th>
                        <th>Date</th>
                        <th>Etat</th>
                        <th>Partenaire</th>
                        <th>Type</th>
                        <th>Structure</th>
                        <th></th>

                    </tr>

                    </thead>

                    <tbody>

                    <?php foreach ($all_data as $value): ?>

                        <tr>

                            <td><?= $value->numero_demande; ?></td>
                            <td><?= $value->objet_demande; ?></td>
                            <td><?= $value->date_demande; ?></td>
                            <td>
                                <?php
                                    if($value->etat_demande == 0)
                                    {
                                        echo '<span href="#" class="on-default btn_active">
                                                    <i class="fa fa-toggle-on" style="color:#2ed573;font-size: 18px;"></i>
                                              </span>';
                                    }
                                    else
                                    {
                                        echo '<span href="#" class="on-default btn_inactive">
                                                    <i class="fa fa-toggle-off" style="color:#ff4757;font-size: 18px;"></i>
                                              </span>';
                                    }
                                ?>
                            </td>

                            <td>

                                <?php echo $this->dem->get_nom($value->id_partenaire); ?>

                            </td>
                            <td>

                                <?php echo $this->dem->get_type($value->id_type_demande); ?>

                            </td>
                            <td>

                                <?php echo $this->dem->get_struc($value->id_structure); ?>

                            </td>

                            <td class="actions" style="width: 1%; text-align: center; white-space: nowrap">

                                <?php btn_edit_action($value->id_demande, 'LST_DEMANDE');?>
                                <?php btn_delete_action($value->id_demande, 'LST_DEMANDE');?>

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

                    <input type="hidden" id="id_demande" name="id_type_demande"/>

                    <div class="form-body">

                        <div class="form-group">

                            <label class="control-label col-md-4">Numero <span class="text-danger">*</span></label>

                            <div class="col-md-8">

                                <input name="numero" id="numero" type="text" class="form-control" required placeholder="Numero Demande">

                            </div>

                        </div>

                        <div class="form-group">

                            <label class="control-label col-md-4">Objet <span class="text-danger">*</span></label>

                            <div class="col-md-8">

                                <input name="objet" id="objet" type="text" class="form-control" required placeholder="Objet Demande">

                            </div>

                        </div>

                        <div class="form-group">

                            <label class="control-label col-md-4">Type Demande<span class="text-danger">*</span></label>

                            <div class="col-md-8">

                                <select name="id_type_demande" id="id_type_demande" class="form-control" required value="Selectionner le type">

                                    <option selected="selected">Sélectionner le type</option>
                                    <?php echo $select_type; ?>

                                </select>

                            </div>

                        </div>

                        <div class="form-group">

                            <label class="control-label col-md-4">Type Structure <span class="text-danger">*</span></label>

                            <div class="col-md-8">
                                <select name="type_structure" id="structure" class="form-control">
                                    <option value="">Selection type Structure</option>
                                    <option value="Niveau central">Niveau central</option>
                                    <option value="19">IA</option>
                                    <option value="29">CAOSP</option>
                                    <option value="30">IME</option>
                                    <option value="23">IEF</option>
                                    <option value="32">CRFPE</option>
                                </select>
                            </div>

                        </div>

                        <div class="form-group">

                            <label class="control-label col-md-4">Partenaire<span class="text-danger">*</span></label>

                            <div class="col-md-8">

                                <select name="id_partenaire" id="id_partenaire" class="form-control" required value="Selectionner partenaire">

                                    <option selected="selected">Sélectionner le partenaire</option>
                                    <?php echo $select_partenaire; ?>

                                </select>

                            </div>

                        </div>

                        <div class="form-group">

                            <label class="control-label col-md-4">IA<span class="text-danger">*</span></label>

                            <div class="col-md-8">

                                <select name="code_ia" class="form-control md-form" id="code_ia2">
                                    <option value="" disabled selected>Selectionner un IA</option>
                                    <?php echo $select_ia ?>
                                </select>

                            </div>

                        </div>

                        <div class="form-group">

                            <label class="control-label col-md-4">IEF<span class="text-danger">*</span></label>

                            <div class="col-md-8">

                                <select name="code_ief" class="form-control md-form" id="code_ief">
                                    <option disabled selected value="">Selectionner un IEF</option>
                                    <?php echo $select_ief ?>
                                </select>

                            </div>

                        </div>

                        <div class="form-group">

                            <label class="control-label col-md-4">Commune<span class="text-danger">*</span></label>

                            <div class="col-md-8">

                                <select name="code_area" class="form-control md-form" id="code_area">
                                    <option value="" disabled selected>Selectionner une commune</option>
                                    <?php echo $select_commune ?>
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
            url_submit: "<?php echo site_url('demande/C_demande/save')?>",

            title_modal_add: 'Ajouter un Type',
            focus_add: 'numero',

            title_modal_edit: 'Modifier un Type',
            focus_edit: 'numero',

            url_edit: "<?php echo site_url('demande/C_demande/get_record')?>",
            url_delete: "<?php echo site_url('demande/C_demande/delete')?>",
        });

        $("#code_ief").chained("#code_ia");
        $("#code_area").chained("#code_ief");

    });

</script>
<?php if (ENVIRONMENT !== 'production'): ?>{elapsed_time} seconds&nbsp;|&nbsp;{memory_usage}<?php endif ?>

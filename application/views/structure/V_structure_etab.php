<!-- Page-Title -->
<div class="row">
    <div class="col-sm-12" style="margin-bottom: 30px">
        <button type="button" id="btn_add" class="btn btn-primary" id="loadingModal">Charger <span class="m-l-5"><i class="fa fa-plus-square"></i></span></button>
    </div>
</div>
<!--<div class="row panel panel-body">-->
<!--    <form class="form-inline" id="form_recherche">-->
<!--        <div class="form-group col-lg-3">-->
<!--            <label class="" for="ia">IA:</label>-->
<!--            <select name="code_ia" class="form-control md-form" id="code_ia2">-->
<!--                <option value="" disabled selected>Selectionner un IA</option>-->
<!--                --><?php //echo $select_ia ?>
<!--            </select>-->
<!--        </div>-->
<!--        <div class="form-group col-lg-3">-->
<!--            <label class="" for="ief">IEF:</label>-->
<!--            <select name="code_ief" class="form-control md-form" id="code_ief">-->
<!--                <option disabled selected value="">Selectionner un IEF</option>-->
<!--                --><?php //echo $select_ief ?>
<!--            </select>-->
<!--        </div>-->
<!--        <div class="form-group col-lg-3">-->
<!--            <label class="" for="commune">Commune:</label>-->
<!--            <select name="code_area" class="form-control md-form" id="code_area">-->
<!--                <option value="" disabled selected>Selectionner une commune</option>-->
<!--                --><?php //echo $select_commune ?>
<!--            </select>-->
<!--        </div>-->
<!--        <div class="form-group col-lg-3">-->
<!--            <button type="submit" class="btn btn-primary btn-affiche">Afficher</button>-->
<!--        </div>-->
<!--    </form>-->
<!--</div>-->


<div class="row">
    <div class="col-md-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">Liste des établissements</h3>
            </div>
            <div class="panel-body" id="tabl_etab">
                <table id="datatable-buttons" class="table table-striped table-bordered">
                    <thead>
                        <tr>
                            <th>Code</th>
                            <th>Libelle</th>
                            <th>Commune</th>
                            <th>Cycle</th>

                    </thead>
                    <tbody>
                        <?php foreach ($all_data as $value) : ?>
                            <tr>
                                <td style="width: 20%;"><?php echo $value->code_str; ?></td>
                                <td style="width: 20%;"><?php echo $value->libelle_structure; ?></td>
                                <td style="width: 20%;"><?php echo $value->libelle_commune; ?></td>
                                <td style="width: 20%;"><?php echo $value->cycle; ?></td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</div> <!-- End Row -->


<!-- sample modal content -->
<div id="modal_form" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="modal_formLabel" aria-hidden="true">
    <form action="<?= base_url() ?>C_structure/liste_etat_by_commune" id="form" class="form-horizontal" method="POST">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title" id="modal_formLabel">Title</h4>
                </div>
                <div class="modal-body">
                    <input type="hidden" id="id_structure" name="id_structure" />
                    <div class="form-group">
                        <label for="code_ia">IA:</label>
                        <select name="code_ia" class="form-control" id="code_ia">
                            <option value="">Selectionner l'IA</option>
                            <?php foreach ($all_ia as $value) : ?>
                                <option value="<?= $value->code_ia ?>"><?= $value->value_ia ?></option>
                            <?php endforeach; ?>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="code_cycle">Cycle:</label>
                        <select name="code_cycle" class="form-control" id="code_cycle">
                            <option value="">Selectionner le cycle</option>
                            <?php foreach ($all_cycle as $key => $value) : ?>
                                <option value="<?= $key ?>"><?= $value ?></option>
                            <?php endforeach; ?>
                        </select>
                    </div>

                </div>
                <div class="modal-footer">
                    <input type="submit" class="btn btn-primary" value="Enrégistrer" />
                    <button type="button" class="btn btn-default" data-dismiss="modal">Fermer</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </form>
</div><!-- /.modal -->

<script type="text/javascript">
    $(document).ready(function() {
        $('.dependance').hide();
        $('#datatable-buttons').managing_ajax({
            order: [1, "asc"],

            id_modal_form: 'modal_form', //id du modal qui contient le formulaire

            id_form: 'form', //id du formulaire
            url_submit: "<?php echo site_url('structure/C_structure/save_struct_etablissement') ?>", //url du save (données envoyés par post)

            title_modal_add: 'Nouvel de stucture', //Title du modal à l'ouverture en mode ajout
            focus_add: 'libelle_structure', //l'emplacement du focus en mode ajout

            title_modal_edit: 'Edition d\'un de structure', //Title du modal à l'ouverture en mode edit
            focus_edit: 'libelle_structure', //l'emplacement du focus en mode edit

            url_edit: "<?php echo site_url('C_structureOld/get_record') ?>", //url le fonction qui recupére la données de la ligne
            url_delete: "<?php echo site_url('C_structureOld/delete') ?>", //url de la fonction supprimé



        });
        $("#code_ief").chained("#code_ia2");
        $("#code_area").chained("#code_ief");
        $('#').on('click', '.', function() {
            swal({
                    title: 'Alerte',
                    text: "Voulez vous générer les taches",
                    type: 'warning',
                    showCancelButton: true,
                    dangerMode: true,
                    confirmButtonColor: '#f36464',
                    cancelButtonColor: '#f36464',
                    cancelButtonText: 'Annuler',
                    confirmButtonText: 'Confirmer',
                    closeOnConfirm: true
                },
                function(isConfirm) {
                    if (isConfirm) {
                        $('#loadingModal').modal({
                            show: true,
                            keyboard: false,
                            backdrop: 'static'
                        });

                        $.ajax({

                        });
                    }
                });
        });


        $('.btn-affiche').click(function() {
            //$('#loadingModal').modal({
            //  show: true,
            //keyboard: false,
            //backdrop: 'static'
            // });

            var code_area = $('#code_area').val();
            var href = "<?php echo site_url(); ?>structure/C_structure/liste_etat_by_commune/" + code_area;
            //alert(code_area);
            //alert(href);return false;
            $.ajax({
                url: href,
                type: 'POST',
                dataType: 'html',
                success: function(data) {
                    $('#tabl_etab').empty().append(data);
                    // $('#loadingModal').modal('hide');
                },
                error: function(jqXHR) {
                    content.html(jqXHR.responseText);
                    content.show();
                }
            });
            return false;


        });
    });
</script>

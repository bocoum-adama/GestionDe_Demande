<!-- Page-Title -->

<style>

</style>
<div class="row">
    <div class="col-md-12">
        <?php btn_add_action('listeeleve'); ?>
    </div>

    <div class="col-md-12">
        <div class="col-md-9"></div>
        <div class="col-md-3">
            <nav aria-label="breadcrumb" style="background-color: #ededed;border-radius: 5px;">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#"><i class="fa fa-recycle"></i> Dashboard</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Eleve </li>
                </ol>
            </nav>
        </div>
    </div>

</div>

<div class='row'>
    <div class='col-md-12'>
        <div class='panel panel-border panel-primary '>
            <div class='panel-heading'>
                <h3 class='panel-title'>Liste des Eleves</h3>
            </div>
            <div class='panel-body  table-responsive' style="margin-right: 10px">
                <table id='datatable' class='table table-striped table-bordered'>
                    <thead>
                        <tr>
                            <th>Nom </th>
                            <th>Telephone</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($all_data as $value) { ?>
                        <tr>
                            <td><?= $value->nom_eleve; ?></td>
                            <td><?= $value->tel_eleve; ?></td>
                            <td class="actions" style="width: 1%; text-align: center; white-space: nowrap">
                                <?php btn_edit_action($value->id_eleve, 'listeeleve'); ?>
                                <!--?php btn_delete_action($value->id_partenaire, 'LST_PART'); ?-->
                                <?php btn_delete_action($value->id_eleve, 'listeeleve'); ?>
                            </td>
                        </tr>
                        <?php } ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!--- modal partenaire --->

    <div id='modal_form' class='modal fade' tabindex='-1' role='dialog' aria-labelledby='modal_formLabel'
        aria-hidden='true'>
        <form action='#' id='form' class='form-horizontal'>
            <div class='modal-dialog'>
                <div class='modal-content'>
                    <div class='modal-header'>
                        <button type='button' class='close' data-dismiss='modal' aria-hidden='true'> × </button>
                        <h4 class='modal-title' id='modal_formLabel'>Title</h4>
                    </div>
                    <div class='modal-body'>
                        <div class='form-body'>
                            <div class='form-group'>
                                <br>
                                <label class='control-label col-md-3'>Nom <span style="color: brown">*</span></label>
                                <div class='col-md-9'>
                                    <input id='nom_eleve' name='nom_eleve' class='form-control' type='text' required
                                        trim />
                                </div>
                            </div>

                            <div class='form-group'>
                                <br>
                                <label class='control-label col-md-3'>Telephone <span
                                        style="color: brown">*</span></label>
                                <div class='col-md-9'>
                                    <input id='tel_eleve' name='tel_eleve' class='form-control' type='text'
                                        onblur="valid_tel(tel_eleve)" required trim />
                                </div>
                            </div>
                            <div class='modal-footer'>
                                <br>
                                <input type='submit' class='btn btn-primary' value='Enregistrer' />

                                <button type='button' class='btn btn-default' data-dismiss='modal'>Fermer</button>
                            </div>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
        </form>

    </div><!-- /.modal -->

    <script type="text/javascript">
    $(document).ready(function() {
        $('#datatable').managing_ajax({
            id_modal_form: 'modal_form',

            id_form: 'form',
            url_submit: "<?php echo site_url('eleve/C_eleve/save') ?>",

            title_modal_add: 'Nouveau Eleve',
            focus_add: 'nom_eleve',

            title_modal_edit: 'Modifier un Eleve',
            focus_edit: 'nom_eleve',

            url_edit: "<?php echo site_url('eleve/C_eleve/get_record') ?>",
            url_delete: "<?php echo site_url('eleve/C_eleve/delete') ?>"
        });

        $('#datatable').on('click', '.menu_lst_utilisateur', function() {
            $("#menu_LST_UTILISATEUR").attr('href', '');
            $("#menu_LST_UTILISATEUR").attr('href', $(this).attr('href')).click();
            return false;
        });
    });

    function valid_tel(tel_partenaire) {
        if (tel_partenaire == '' || !tel_partenaire.match(/^7[0-9]{8}$/)) {
            $('#tel_eleve').css({
                'background': '#FFEDEF',
                'border': 'solid 1px red'
            });
            return false;
        } else {
            $('#tel_eleve').css({
                'background': '#99FF99',
                'border': 'solid 1px #99FF99'
            });
            return true;
        }
    }
    </script>
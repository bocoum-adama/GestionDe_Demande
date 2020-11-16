<!-- Page-Title -->
<div class="row">
    <!--div class="col-sm-12" style="margin-bottom: 30px" id="add_user">
        <button type="button" id="<?php //echo $info_partenaire->id_partenaire ?>" class="btn btn-success add_user">Ajouter <span lass="m-l-5"><i
                        class="fa fa-plus-square"></i></span></button>
    </div-->
    <?php btn_add_action('LST_DEMANDE'); ?><div class="col-md-12">

    <div class="col-md-12">
        <div class="col-md-8"></div>
        <div class="col-md-4">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">

                </ol>
            </nav>
        </div>
    </div>

</div>

<div class='row'>
    <div class='col-md-12'>
        <div class='panel panel-border panel-purple fc-list-table fc-state-default'>
            <div class='panel-heading'>
                <h3 class='panel-title' style="font-family: Ionicons">Liste des Demandes</h3>
            </div>
            <div class='panel-body'>
                <table id='datatable' class='table table-striped table-bordered   '>
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
                                if($value->etat_demande == 1)
                                {
                                    echo '<span href="#" class="on-default btn_active">
                                                    <i class="fa fa-toggle-on" style="color:#2ed573;font-size: 18px;"></i>
                                              </span>';
                                }
                                else if($value->etat_demande == 0)
                                {
                                    echo '<span href="#" class="on-default btn_inactive">
                                                    <i class="fa fa-toggle-off" style="color:#ff941c;font-size: 18px;"></i>
                                              </span>';
                                }
                                else
                                {
                                    echo '<span href="#" class="on-default btn_inactive">
                                                    <i class="fa fa-toggle-off" style="color:#ff0c0b;font-size: 18px;"></i>
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

                                <?php echo $this->dem->get_struc($value->code_str); ?>

                            </td>

                            <td class="actions" style="width: 1%; text-align: center; white-space: nowrap">
                                <a href="#" class="btn_add_doc" id="<?php echo $value->id_demande;?>" name="id_demande">
                                    <span class="label label-info"  style="border-radius: 5px">&nbsp;Traiter <i class="fa fa-plus label-info" ></i>&nbsp;</span>
                                </a>

                                <?php btn_edit_action($value->id_demande, 'LST_DEMANDE');?>
                                <?php btn_delete_action($value->id_demande, 'LST_DEMANDE');?>

                            </td>

                        </tr>

                    <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</div> <!-- End Row -->

<div class="modal fade bd-example-modal-lg col-md-12" tabindex="-1" id="modal_add_user" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">

    <div class="col-md-3"></div>
    <div class="modal-dialog col-md-6">

        <div class="modal-content" id="modal_content_add_user">



        </div>

    </div>

</div>


<div class="modal fade bd-example-modal-lg" tabindex="-1" id="modal_list" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">

    <div class="modal-dialog modal-md">

        <div class="modal-content" id="modal_content_list">



        </div>

    </div>

</div>

    <!--  Ajout documentation -->
    <div class="modal fade bd-example-modal-lg" tabindex="-1" id="modal_add_doc" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">

        <div class="modal-dialog modal-lg">

            <div class="modal-content" id="modal_content_add_doc">


            </div>

        </div>

    </div>

<div id='modal_form' class='modal fade' tabindex='-1' role='dialog' aria-labelledby='modal_formLabel'
     aria-hidden='true'>
    <form action='#' id='form' class='form-horizontal'>
        <div class='modal-dialog'>
            <div class='modal-content'  style="background-color: white">
                <div class='modal-header'>
                    <button type='button' class='close' data-dismiss='modal' aria-hidden='true'> × </button>
                    <h4 class='modal-title' id='modal_formLabel'>Title</h4>
                </div>
                <div class='modal-body' >
                    <input type='hidden' id='id_demande' name='id_demande' />
                    <div class='form-body'>

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

                            <label class="control-label col-md-4">Partenaire<span class="text-danger">*</span></label>

                            <div class="col-md-8">

                                <select name="id_partenaire" id="id_partenaire" class="form-control" required value="Selectionner partenaire">

                                    <option selected="selected">Sélectionner le partenaire</option>
                                    <?php echo $select_partenaire; ?>

                                </select>

                            </div>

                        </div>


                        <div class='form-group' id="div1">
                            <label class='control-label col-md-4'>Type Structure <span class="text-danger">*</span></label>
                            <div class='col-md-8'>
                                <div class="radio radio-info radio-inline">
                                    <input type="radio" id="nc" class="nc" value="nc" name="nc" >
                                    <label for="inlineRadio1"> Structure </label>
                                </div>
                                <div class="radio radio-inline">
                                    <input type="radio" id="ecole" class="ecole" value="ecole" name="etab">
                                    <label for="inlineRadio2"> Etablissement </label>
                                </div>
                            </div>
                        </div>

                            <div class="form-group structure hidden">

                                <label class="control-label col-md-4">Structure<span class="text-danger">*</span></label>

                                <div class="col-md-8">

                                    <select name="id_structure" class="form-control md-form" id="structure">
                                        <option disabled selected value="">Selectionner une Structure</option>
                                        <?php echo $select_structure ?>
                                    </select>

                                </div>

                            </div>

                        <div class="form-group ia hidden">

                            <label class="control-label col-md-4">IA<span class="text-danger">*</span></label>

                            <div class="col-md-8">

                                <select name="code_ia" class="form-control md-form" id="code_ia2">
                                    <option value="" disabled selected>Selectionner un IA</option>
                                    <?php echo $select_ia ?>
                                </select>

                            </div>

                        </div>

                        <div class="form-group ief hidden">

                            <label class="control-label col-md-4">IEF<span class="text-danger">*</span></label>

                            <div class="col-md-8">

                                <select name="code_ief" class="form-control md-form" id="code_ief">
                                    <option disabled selected value="">Selectionner un IEF</option>
                                    <?php echo $select_ief ?>
                                </select>

                            </div>

                        </div>

                        <div class="form-group area hidden">

                            <label class="control-label col-md-4">Commune<span class="text-danger">*</span></label>

                            <div class="col-md-8">

                                <select name="code_area" class="form-control md-form" id="code_area">
                                    <option value="" disabled selected>Selectionner une commune</option>
                                    <?php echo $select_commune ?>
                                </select>

                            </div>

                        </div>

                        <div class="form-group etab hidden">
                            <label class="control-label col-md-4">Etablissement<span class="text-danger">*</span></label>

                            <div class="col-md-8">
                                <select  name="id_structure" id="code_etab" class="form-control" required >
                                    <option selected="selected">Sélectionner Etablissement</option>

                                </select>
                            </div>
                        </div>

                        <div class='modal-footer'>
                            <br>
                            <input type='submit' class='btn btn-primary' value='Enregistrer'/>

                            <button type='button' class='btn btn-default' data-dismiss='modal'>Fermer</button>
                        </div>

                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>
        </div>
        < </form>

</div><!-- /.modal -->


<!-- Modal -->

<!-- sample modal content -->


<script type="text/javascript">
    $(document).ready(function (){


        $('#datatable').managing_ajax({
            id_modal_form: 'modal_form',

            id_form: 'form',
            url_submit: "<?php echo site_url('demande/C_demande/save')?>",

            title_modal_add: 'Nouveau Demande',
            focus_add: 'numero',


            title_modal_edit: 'Modifier Demande',
            focus_edit: 'numero',

            url_edit: "<?php echo site_url('demande/C_demande/get_record')?>",
            url_delete: "<?php echo site_url('demande/C_demande/delete')?>",
        });

        $('#datatable tbody').on('click', '.btn_add_doc', function () {

            var id_demande = $(this).attr('id');
            if (id_demande == undefined)
                return false;
            var href = "<?php echo site_url('demande/C_demande/change_etat/')?>"  + id_demande;

            $('#modal_content_add_doc').empty().load(href, function () {
                cache: false
            }).fadeIn('slow');
            $('#modal_add_doc').modal('show');
            // $('#modal_add_doc').on('hidden.bs.modal', function (event) {
            //     $('#'+menu_encours).click();
            // });
        });


        $('#datatable tbody').on('click', '.btn_edit', function () {
            $('#div1').remove();
            $('.partie2').remove();
        });


        $('#nc').click(function() {

            if($(this).is(':checked') == true)
            {
                $(".structure").removeClass("hidden");
                $('.ia').addClass('hidden');
                $('.ief').addClass('hidden');
                $('.area').addClass('hidden');
                $('.etab').addClass('hidden');
            }
        });

        $('#ecole').click(function() {

            if($(this).is(':checked') == true)
            {
                $(".structure").addClass("hidden");
                $("#code_ief").chained("#code_ia2");
                $("#code_area").chained("#code_ief");
                $('.ia').removeClass('hidden');
                $('.ief').removeClass('hidden');
                $('.area').removeClass('hidden');
            }
        });

        $('#code_area').change(function() {

            $('.etab').removeClass('hidden');
            var code_area = $('#code_area').val();
            if(code_area != '')
            {
                $.ajax({
                    url:"<?php echo base_url();?>structure/C_structure/fetch_etab",
                    method: "POST",
                    data:{code_area:code_area},
                    success:function(data)
                    {
                        $('#code_etab').html(data);
                    }

                })
            }
        });

    });


</script>

<?php if (ENVIRONMENT !== 'production'): ?>{elapsed_time} seconds&nbsp;|&nbsp;{memory_usage}<?php endif ?>

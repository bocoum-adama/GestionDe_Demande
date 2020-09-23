
<!-- Page-Title -->
<div class="row" id="btn_add_str">
    <div class="col-sm-12" style="margin-bottom: 30px">
        <!--button type="button" class="btn btn-primary btn_add_str">Nouveau <span
                class="m-l-5"><i class="fa fa-plus-square"></i></span></button-->
        <button type="button" class="btn btn-primary" id="btn_add">Nouveau <span
        class="m-l-5"><i class="fa fa-plus-square"></i></span></button>
    </div>
</div>


<div class="row">
    <div class="col-md-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">Liste des structures administratif</h3>
            </div>
            <div class="panel-body">
                <table id="datatable-buttons" class="table table-striped table-bordered">
                    <thead>
                    <tr>
                        <th>Code</th>
                        <th>Libelle</th>
                    </tr>
                    </thead>
                    <tbody>
                    <?php  foreach ($all_data as $value) : ?>
                        <tr>
                            <td style="width: 20%;"><?php  echo $value->code_str; ?></td>
                            <td style="width: 20%;"><?php  echo $value->libelle_structure; ?></td>
                        </tr>
                    <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</div> <!-- End Row -->




<!-- sample modal content -->
<div id="modal_form" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="modal_formLabel"
     aria-hidden="true">
    <form action="#" id="form" class="form-horizontal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title" id="modal_formLabel">Title</h4>
                </div>
                <div class="modal-body">
                    <input type="hidden" id="id_type_structure" name="id_type_structure"/>
                    <div class="form-body">
                        <label for="">Type de structure</label>
                        <select name="type_structure" id="structure" class="form-control">
                            <option value="">--------</option>
                            <option value="Niveau central">Niveau central</option>
                            <option value="19">IA</option>
                            <option value="29">CAOSP</option>
                            <option value="30">IME</option>
                            <option value="23">IEF</option>
                            <option value="32">CRFPE</option>
                        </select>
                    </div>
                    
                </div>
                <div class="modal-footer">
                    <input type="submit" class="btn btn-primary" value="Charger"/>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Fermer</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </form>
</div><!-- /.modal -->


<script type="text/javascript">
    $(document).ready(function () {
        $('#ia').hide();
        $("body").on('change','#structure',function(){
            var structure = $('#structure').val();
            if(structure=="rattachement")
            {
                $('#ia').show();
            }
            else{
                $('#ia').hide();
            }
            
        });


        $('#datatable-buttons').managing_ajax({
            order: [ 1, "asc" ],

            id_modal_form: 'modal_form', //id du modal qui contient le formulaire

            id_form: 'form', //id du formulaire
            url_submit: "<?php echo site_url('structure/C_structure/save_struct_central')?>", //url du save (données envoyés par post)

            title_modal_add: 'Chargement des structures', //Title du modal à l'ouverture en mode ajout
            focus_add: 'libelle_type_structure', //l'emplacement du focus en mode ajout

            title_modal_edit: 'Edition d\'un type de structure', //Title du modal à l'ouverture en mode edit
            focus_edit: 'libelle_type_structure',//l'emplacement du focus en mode edit

        });
        
        $('#btn_add_str').on('click','.btn_add_str',function(){
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

                        url: '<?php echo site_url('C_structureOld/save_struct_central') ?>',
                        dataType: "JSON",
                        type:"GET",
                        success: function(data) {
                            if (data.status == 'success') {
                                $.Notification.autoHideNotify('success', 'bottom right', 'Alerte', data.message);
                                $('#loadingModal').hide();
                            } else {
                                $.Notification.autoHideNotify('error', 'bottom right', 'Alerte', data.message);
                            }
                        },
                        error: function(jqXHR, textStatus, errorThrown) {
                            alert('Error adding / update data');
                        }
                    });
                }
            });
        });
       
    });
</script>




















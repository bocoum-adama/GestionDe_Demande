<div class="row">

    <div class="col-md-12" style="margin-top: 20px">
        <div class="bx-shadow bg-white" style="padding: 15px">
            <div class="">
                <div class="ibox-title">
                    <h5>Formulaire</h5>
                </div>
                <div class="ibox-content" style="">
                    <form role="form" id='form_chargement_etablissement' class="form-inline">
                        <div class="form-group">
                            <select class="form-control m-b" name="code_ia">
                                <?php echo $liste_ia; ?>
                            </select>
                        </div>
                        <div class="form-group">
                            <select class="form-control m-b" name="code_cycle">
                                <?php echo $liste_cycle; ?>
                            </select>
                        </div>
                        <button id="btn_charger" class="btn btn-white" type="submit">Charger</button>
                    </form>
                </div>
            </div>

        </div>
    </div>


    <div class="col-md-6" style="margin-top: 20px">

    </div>
</div>



<div class="row" style="margin-top: 20px" id="table_non_filtre">
    <div class="col-md-12">
    </div>
</div>
</div>
<div class="row" style="margin-top: 30px">
    <div class="col-md-12">

        <div class="panel panel-border panel-primary fc-list-table fc-state-default ">
            <div class="panel-heading" >
                <h1 class="panel-title" style="font-family: Ionicons">Etablissements</h1>
            </div>
            <div class="panel-body">
                <table id="datatable" class="table table-striped table-bordered">
                    <thead>
                    <tr>
                        <th>Code etablissement</th>
                        <th>Nom etablissement</th>
                        <th>Cycle</th>
                        <th>IA</th>
                        <th>IEF</th>
                        <th>COMMUNE</th>
                    </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($all_data as $value) { ?>
                            <tr>
                                <td><?= $value->code_str; ?></td>
                                <td><?= $value->libelle_structure; ?></td>
                                <td><?= $value->cycle; ?></td>
                                <td><?= $value->libelle_ia; ?></td>
                                <td><?= $value->libelle_ief; ?></td>
                                <td><?= $value->libelle_commune; ?></td>
                            </tr>
                            <?php
                        }
                        ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function () {

        $('#datatable').dataTable({"orderable": false});

        $('#form_chargement_etablissement').divcrud({
            id_form: 'form_chargement_etablissement',
            id_btn_submit: 'btn_charger',
            url_submit: "<?=site_url("structure/C_structureOld/import_etablissement")?>"
        });

        $.fn.afterSave_divcrud = function(args){
            if(args.args.status=='success')
            {
                my_callBack('<?php echo base_url()."structure/C_structureOld"?>');
            }

        };

    });


</script>

    <?php if (ENVIRONMENT !== 'production'): ?>{elapsed_time} seconds&nbsp;|&nbsp;{memory_usage}<?php endif ?>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <meta content="Ministère de l'Education nationale - SENEGAL" name="description" />
        <meta content="PLANETE" name="author" />

        <title>AUTHENTIFICATION Planete Orientation</title>

        <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="assets/css/core.css" rel="stylesheet" type="text/css">
        <link href="assets/css/components.css" rel="stylesheet" type="text/css">
        <link href="assets/css/pages.css" rel="stylesheet" type="text/css">


        
    </head>
    <body>


        <div class="wrapper-page">
            <div class="panel panel-color panel-primary panel-pages">
                <div class="panel-heading"> 
                    <div class="bg-overlay"></div>
                    <h3 class="text-center m-t-10 text-white">Planete Orientation</h3>
                </div> 


                <div class="panel-body">
<!--                <form class="form-horizontal m-t-20" action="index.html">
-->                <form id="sign_in" method="POST" class="form-horizontal m-t-20" action="<?php echo base_url(); ?>tmp_auth">   
                    <div class="form-group">
                        <div class="col-xs-12">
                            <input class="form-control input-lg" type="text" required="" placeholder=" Votre IEN " name="ien">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-xs-12">
                            <input class="form-control input-lg" type="password" required="" placeholder=" Votre mot de passe " name="password">
                        </div>
                    </div>
                    
                    <div class="form-group text-center m-t-40">
                        <div class="col-xs-12">
                            <button class="btn btn-primary btn-lg w-lg waves-effect waves-light" type="submit"> Se connecter </button>
                        </div>
                    </div>

                </form> 
                </div>                                 
                
            </div>
        </div>

	</body>
</html>
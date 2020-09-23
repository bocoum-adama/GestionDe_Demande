/**
* Theme: Montran Admin Template
* Author: Coderthemes
* Form wizard page
*/

!function($) {
    "use strict";

    var FormWizard = function() {};

    FormWizard.prototype.createBasic = function($form_container) {
        $form_container.children("div").steps({
            headerTag: "h3",
            bodyTag: "section",
            transitionEffect: "slideLeft"
        });
        return $form_container;
    },
    //creates form with validation
    FormWizard.prototype.createValidatorForm = function($form_container) {

        $form_container.validate({
            //focusCleanup: true,
            rules: {                
                "code": { required:true  },
                "nom": { required:true  },
                "status": { required:true  },
                "responsable": { required:true  },
                "date_creation": { required:true  },
            },
            messages: {                
                "code": { required: "le code  est obligatoire"  },
                "nom": { required: "le nom est obligatoire"  },
                "status": { required:"le status  est obligatoire"  },
                "date_creation": { required:"la date de creation  est obligatoire"  },
            },
            errorPlacement: function errorPlacement(error, element) {
                element.after(error);
            }
        });


        $form_container.children("div").steps({
            headerTag: "h3",
            bodyTag: "section",
            transitionEffect: "slideLeft",
            labels: {
                current: "current step:",
                pagination: "Pagination",
                finish: "Valider",
                next: "Suivant",
                previous: "Précédent",
                loading: "Loading ..."
            },
            onStepChanging: function (event, currentIndex, newIndex) {
                $form_container.validate().settings.ignore = ":disabled,:hidden";
                return $form_container.valid();
            },
            onFinishing: function (event, currentIndex) {
                $form_container.validate().settings.ignore = ":disabled";
                return $form_container.valid();
            },
            onFinished: function (event, currentIndex) {

                $.ajax({
                    type: "POST",
                    url: $('#wizard-validation-form').attr('action'),
                    data: $('#wizard-validation-form').serialize(),
                    dataType: "JSON",
                    success: function (data) {
                        if (data.status == 'success') {
                            $.Notification.autoHideNotify('success', 'bottom right', 'Alerte', data.message)
                        }
                        else {
                            $.Notification.autoHideNotify('error', 'bottom right', 'Alerte', data.message)
                        }

                        $('#menu_validation_ien').click();
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        alert('Error adding / update data');
                    }
                });

            }
        });

        return $form_container;
    },

    //creates vertical form
    FormWizard.prototype.createVertical = function($form_container) {
        $form_container.steps({
            headerTag: "h3",
            bodyTag: "section",
            transitionEffect: "fade",
            stepsOrientation: "vertical"
        });
        return $form_container;
    },

    FormWizard.prototype.init = function() {
        //initialzing various forms

        //basic form
        //this.createBasic($("#basic-form"));

        //form with validation
        this.createValidatorForm($("#wizard-validation-form"));

        //vertical form
        //this.createVertical($("#wizard-vertical"));
    },

    //init
    $.FormWizard = new FormWizard, $.FormWizard.Constructor = FormWizard
}(window.jQuery),

//initializing 
function($) {
    "use strict";
    $.FormWizard.init()
}(window.jQuery);

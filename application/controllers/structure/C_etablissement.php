<?php defined('BASEPATH') OR exit('No direct script access allowed');

class C_etablissement extends MY_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->model('structure/M_structureOld', 'structure');
        $this->load->helper('api');
        $this->load->library('session');
    }

    public function index()
    {
        $data['all_data'] = $this->structure->get_data();
        $liste_ia = $this->structure->get_list_ia();
        $liste_cycle = $this->structure->get_list_cycle();
        //var_dump($liste_cycle);exit;
        $data['liste_ia'] = create_select_list($liste_ia, 'code_str', 'libelle_structure');
        $data['liste_cycle'] = create_select_list($liste_cycle, 'code_cycle', 'value_cycle');
        $this->load->view('structure/V_structure', $data);
    }

    public function import_etablissement(){
        $args =func_get_args();
        $code_ia = $this->input->post('code_ia');
        $code_cycle = $this->input->post('code_cycle');
        $link_url = "ien-get/list_etablissement?code_cycle=$code_cycle&ia=$code_ia";
        $etablissement = apiGetData("codeco", $link_url);
        $tabetablissment = array();
        if(!empty($etablissement->Etablissements)){
            foreach($etablissement->Etablissements as $etabs){
                $verife= $this->etablissement->get_libelle_etablissement_by_codestr($etabs->id);
                if(isset($verife)) {

                    unset($etabs);
                }else{
                    $tabetablissment = array(
                        'code_str'              => $etabs->id,
                        'libelle_structure'     => $etabs->libelle,
                        'adr_structure'         => $etabs->adresse,
                        'etat_str'              => 1,
                        'cade_ia'               => $etabs->IA,
                        'code_ief'              => $etabs->IEF,
                        'code_commune'          => $etabs->id_commune,
                        'categorie_structure'   => substr($etabs->code_id, 0,1),
                        'libelle_ia'            => $etabs->IA,
                        'libelle_ief'           => $etabs->IEF,
                        'libelle_commune'       => $etabs->libelle_commune,
                        'cycle'                 => $etabs->cycle,
                        'id_cycle'              => null

                    );
                    $this->db->insert('structure',$tabetablissment);
                    //echo json_encode($this->etablissement->saveetablissement($tabetablissment), JSON_HEX_TAG | JSON_HEX_APOS | JSON_HEX_QUOT | JSON_HEX_AMP);

                }

            }

        }
        $d['status'] = 'success';
        $d['message'] = 'importer avec success';
        echo json_encode($d, JSON_HEX_TAG | JSON_HEX_APOS | JSON_HEX_QUOT | JSON_HEX_AMP);

    }

    function get_list_ajax_etab()
    {

        $id=$this->session->code_ia;
        $this->etablissement->get_data_liste_etablissement_all($id);

    }

    public function liste_eleve_by_etablissement(){

        $args = func_get_args();
        $code_etablissements = $args[0];
        $data['etablissement'] = $this->etablissement->get_info_etablissement_by_codestr($code_etablissements);
        $data['nbr_fille'] = $this->etablissement->nombre_de_fille($code_etablissements);
        $data['nbr_garcon'] = $this->etablissement->nombre_de_garcon($code_etablissements);
        $data['liste_eleve'] = $this->etablissement->get_liste_eleve_by_etablissement($code_etablissements);
        $data['effectif_total'] = $this->etablissement->effectif_total_etablissement($code_etablissements);
        // var_dump( $data['liste_eleve']);exit;
        $this->load->view('eleve/V_eleve_by_etablissement',$data);
    }

    public function donnee_eleve_by_etablissement(){

        $args =func_get_args();
        $code_etablissements=$args[0];
        $data['nbr_fille']= $this->etablissement->nombre_de_fille($code_etablissements);
        $data['nbr_garcon']= $this->etablissement->nombre_de_garcon($code_etablissements);
        $data['effectif_total'] = $this->etablissement->effectif_total_etablissement($code_etablissements);
        $data['liste_eleve'] = $this->etablissement->get_liste_eleve_by_etablissement($code_etablissements);
        //var_dump($data['nbr_fille'][0]->nbrfille);exit;
        $this->load->view('eleve/donnee_eleve',$data);
    }


}

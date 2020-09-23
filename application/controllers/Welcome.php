<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Welcome extends CI_Controller {


	public function index()
	{
		//$data['contents'] = 'dashboard/container';
		//$this->load->view('template/layout', $data);
		$data = array();

		$this->load->view('dashboard/sign-in', $data);
	}

	public function login()
    {
        //$data['contents'] = 'dashboard/container';
        //$this->load->view('template/layout', $data);
        $data = array();
        $this->load->view('dashboard/login', $data);
    }
}

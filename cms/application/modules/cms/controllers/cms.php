<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * User management controller.
 * 
 * @package App
 * @category Controller
 * @author Muhamad Jafar Sidik
 */
class Cms extends Admin_Controller 
{
	private $ci;
	
	
	function __construct()
	{
		parent::__construct();
		$this->load->model('mgeneral');
		
	}
	
	function index()
	{	
	
		$this->template
		->set_title('Registration')
		->set_css('assets/DT_bootstrap')
		//->set_css('vendors/datatables/css/ColumnFilterWidgets')
		->set_js('vendors/datatables/js/jquery.dataTables.min',true)
		->set_js('vendors/datatables/js/ColumnFilterWidgets',true)
		->set_js('assets/DT_bootstrap',true)
		->set_js_script('
			$(function() {
            
			});
		','jeff',true);
		//$this->data['registration'] = $this->mgeneral->getAll('auth_users','name','asc');
		$this->data['reg'] =$this->db->query('SELECT * 
		FROM  auth_users au
		left join live_account la on au.email = la.contact_info_email 
					JOIN (SELECT id 
					FROM   auth_users
					ORDER  BY registered 
					LIMIT  0, 10) AS t ON t.id = au.id;')->result();
					
		$this->template->build('index');
		
	}
 	
	
}

/* End of file user.php */
/* Location: ./application/modules/auth/controllers/user.php */
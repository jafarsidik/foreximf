<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Base controller for public controllers.
 * 
 * @package CI-Beam
 * @category Controller
 * @author Ardi Soebrata
 * 
 * @property CI_Config $config
 * @property HMVC_Loader $load
 * @property CI_URI $uri
 * @property MY_Form_validation $form_validation
 * @property CI_Input $input
 * @property CI_Email $email
 * @property CI_DB_active_record $db
 * @property CI_DB_forge $dbforge
 * @property CI_Table $table
 * @property CI_Session $session
 * @property CI_FTP $ftp
 * @property CI_Pagination $pagination
 * 
 * @property Auth $auth
 * @property Acl $acl
 * @property Template $template
 * @property Doctrine $doctrine
 * @property User_model $user_model
 * @property Role_model $role_model
 * 
 */
class MY_Controller extends CI_Controller
{
	/**
	 * View's Data
	 * 
	 * @var array 
	 */
	public $data = array();
	
	public function __construct()
	{
		parent::__construct();
		
		// Get auth data.
		if ($this->auth->loggedin())
		{
			// Get current user id
			$id = $this->auth->userid();

			// Get user from database
			$user = $this->user_model->get_by_id($id);
			$this->data['auth_user'] = array(
				'id'			=> $user->id,
				'first_name'	=> $user->first_name,
				'last_name'		=> $user->last_name,
				'username'		=> $user->username,
				'email'			=> $user->email,
				'lang'			=> $user->lang,
				'role_id'		=> $user->role_id,
				'role_name'		=> $user->role_name
			);
		}
		else
		{
			$this->session->set_userdata('role_name', 'Guest');
		}
		
		// Setting up language.
		$languages = $this->config->item('languages');
		// Lang has already been set and is stored in a session
		$lang = $this->session->userdata('lang');
		// No Lang. Lets try some browser detection then
		if (empty($lang) and !empty( $_SERVER['HTTP_ACCEPT_LANGUAGE'] ))
		{
			// explode languages into array
			$accept_langs = explode(',', $_SERVER['HTTP_ACCEPT_LANGUAGE']);

			log_message('debug', 'Checking browser languages: '.implode(', ', $accept_langs));

			// Check them all, until we find a match
			foreach ($accept_langs as $lang)
			{
				// Turn en-gb into en
				$lang = substr($lang, 0, 2);

				// Check its in the array. If so, break the loop, we have one!
				if(in_array($lang, array_keys($languages)))
				{
					break;
				}
			}
		}
		// If no language has been worked out - or it is not supported - use the default (first language)
		if (empty($lang) or !in_array($lang, array_keys($languages)))
		{
			reset($languages);
			$lang = key($languages);
			$this->session->set_userdata('lang', $lang);
		}
		$this->config->set_item('language', $languages[$lang]['folder']);
		$this->load->language('application');
		
		// Check ACL
		$this->acl->build();
		$allowed = $this->acl->is_allowed($this->uri->uri_string());
		if (!$allowed) show_error(lang('error_401'), 401, lang('error_401_title'));
		
		// Set redirect 
		$this->data['redirect'] = urldecode($this->input->get_post('redirect'));
	}
	
	/**
	 * Generate options from data tree
	 * 
	 * @param array $tree
	 * @param string $sep
	 * @return array
	 */
	function generate_options($tree, $sep = '')
	{
		$result = array();
		foreach($tree as $node)
		{
			$result[$node['id']] = $sep . $node['name'];
			if (isset($node['children']))
				$result = $result + $this->generate_options($node['children'], $sep . '&nbsp;&nbsp;');
		}
		return $result;
	}
}

include_once(APPPATH . '/core/Admin_Controller.php');

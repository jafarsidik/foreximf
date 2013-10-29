<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Live Account controller.
 * 
 * @package App
 * @category Controller
 * @author Muhamad Jafar Sidik
 */
class Live_account extends Admin_Controller 
{
	private $ci;
	
	/**
	 * Redirect to index if cancel-button clicked.
	 */
	function __construct()
	{
		parent::__construct();
		$this->load->model('mgeneral');
		$this->load->helper('code');
		$this->ci =& get_instance();
		$this->ci->load->library('PasswordHash', array('iteration_count_log2' => 8, 'portable_hashes' => FALSE));
		$this->load->library('upload');
	}
	
	/**
	 * Display Form. 
	 */
	function index()
	{	
		$id 					= $this->auth->userid();
		$email 					= $this->db->query("select * from auth_users where id='".$id."'")->row();
		$this->data['negara']	= $this->mgeneral->getAll('country','name','asc');
		
		$user = $this->db->query("select *
		
		from acl_roles role,auth_users au,demo_account p where  au.email ='".$email->email."' and p.email= au.email and role.id = au.role_id ")->row_array();

		 $this->data['demo'] = array(
			'id'			=> $user['id'],
			'first_name'	=> $user['first_name'],
			'last_name'		=> $user['last_name'],
			'username'		=> $user['username'],
			'email'			=> $user['email'],
			'lang'			=> $user['lang'],
			'role_id'		=> $user['role_id'],
			'role_name'		=> $user['name'],
			'title'			=> $user['title'],
			'tanggal_lahir'	=> $user['tanggal_lahir'],
			'bulan_lahir'	=> $user['bulan_lahir'],
			'tahun_lahir'	=> $user['tahun_lahir']
		); 
		$this->template->build('live_account_form');		
	}
 	function search()
	{
      // tangkap variabel keyword dari URL
      $keyword = $this->uri->segment(4);
	  //echo $keyword;
 
      // cari di database
      $data = $this->db->from('agent_code')->like('code',strtolower($keyword))->get(); 
 
      // format keluaran di dalam array
      foreach($data->result() as $row)
      {
         $arr['query'] = $keyword;
         $arr['suggestions'][] = array(
            'value'  	=>htmlentities(stripslashes($row->full_name)),
            'key'   	=>htmlentities(stripslashes($row->code)),
            'agent_picture' =>htmlentities(stripslashes($row->picture))
         );
      }
      echo json_encode($arr);
	}	
	
	/**
	 * Send data to Database and Email. 
	 */
	function send(){
		
		$result		= array();
		$id			= $this->input->post('id');
		$username	= $this->input->post('username');
		$date 		= date('Y-m-d H:i:s');
		$data_login	= array(
				'title' 		=>$this->input->post('title'),
				'first_name'	=>$this->input->post('first_name'),
				'last_name'		=>$this->input->post('last_name'),				
				'registered'	=>$date,
		);
		$phone = $this->input->post('ccodephone')." - ".$this->input->post('cphone');
		$mobile = $this->input->post('ccodemobile')." - ".$this->input->post('cmobile');
		$fax = $this->input->post('ccodefax')." - ".$this->input->post('cfax');
		
		$checked = $_POST['invest'];
		for($i=0; $i < count($checked); $i++){
			$inves[] = $checked[$i];
		}
		$data_live	= array(
				'reg_option' 	=>$this->input->post('reg_option'),
				'tanggal_lahir'	=>$this->input->post('tanggal_lahir'),
				'bulan_lahir'	=>$this->input->post('bulan_lahir'),
				'tahun_lahir'	=>$this->input->post('tahun_lahir'),
				
				
				'personal_name'	=>$this->input->post('name_personal'),
				'personal_idnumber'	=>$this->input->post('passport'),
				//'personal_iddocument'	=>'',
				'personal_citizenship'	=>$this->input->post('pnegara'),
				'contact_info_email'	=>$this->input->post('cemail'),
				'contact_info_address'	=>$this->input->post('caddress'),
				'contact_info_country'	=>$this->input->post('ccountry'),
				'contact_info_provinsi'	=>$this->input->post('cstate'),
				'contact_info_city'	=>$this->input->post('ccity'),
				'contact_info_zip'	=>$this->input->post('czip'),
				'contact_info_phone'	=>$phone,
				'contact_info_mobile'	=>$mobile,
				'contact_info_fax'	=>$fax,
				'contact_info_correspondence'	=>$this->input->post('ccorespondeaddress'),
				//'contact_info_profofresidance'	=>$this->input->post('cprof'),
				'account_info_agentcode'	=>$this->input->post('ai'),
				
				'bank_info_bankname'	=>$this->input->post('bankname'),
				'bank_info_bankaddress'	=>$this->input->post('bankaddress'),
				'bank_info_bankswiftcode'	=>$this->input->post('bankswiftcode'),
				'bank_info_bankaccount'	=>$this->input->post('bankaccount'),
				'bank_info_bankaccountholder'	=>$this->input->post('bankaccountholder'),
				'account_info_agentcode'	=>$this->input->post('textyes'),
				
				'tranding_info_invenstments'	=>implode(",",$inves),
				'tranding_info_annualincome'	=>$this->input->post('anualincome'),
				'tranding_info_trandingexperience'	=>$this->input->post('tradingex'),
				'tranding_info_riskprofile'	=>$this->input->post('risk'),
				'additional_info_manageaccount'	=>$this->input->post('maccount'),
				'additional_info_manageaccount'	=>$this->input->post('wk'),
				'additional_info_aboutme'	=>$this->input->post('hd')
				
			);
			
			$links = "http://client.mysmartfx.vmt.co.id/index.php/live_account/live_account/active/?key=".$username; // change your url
			$pesan = "Dear All Valuable Customer,

					Terima kasih  telah menggunakan  imfutures  sebagai pilihan anda untuk melakukan transaksi trading, dan itu PILIHAN YANG TEPAT .

					Melalui  Email ini, kami mengingatkan kembali kepada anda tentang Layanan  dari imfutures :

					Livechat 24 jam ( Senin -  Jum’at ), layanaan ini dalam bentuk Customer Support dan Technical Support
					Analysis Support , adalah bagian yang  membantu anda memberikan analisa pergerakan pasar terupdate. Kami sangat menyarankan kepada anda untuk memanfaat fasilitas layanan ini untuk membantu anda melakukan trading, sehingga bisa memaksimalkan profit dan menekan resiko anda.
					WEBINAR, adalah Training Live , kami sangat menyarankan anda bisa mengikuti webinar ini, karena dalam webinar akan dibahas mengenai Pengetahuan Trading dari Basic – Advance, dan dalam webinar ini membahas Tips dan Trik dalam melakukan trading, sehingga bisa menekan resiko dan memaksimalkan profit anda.
					Lakukan aktivasi account dengan mengklik tautan berikut: ".$links."
					Demikian diinformasikan kepada Anda , agar menjadi informasi yg berguna.

					Terima kasih

					Customer Care  - imfutures

					 

					-----------------------

					Mohon diperhatikan !! Bisnis online trading merupakan bisnis yang memiliki resiko yang sangat  tinggi Sebaiknya anda meminta pendapat  dari Independent Financial Advisor, dan bertindak selalu berhati-hati dalam mengambil keputusan, karena dalam hal ini imfutures tidak bertanggung jawab atas kerugian yang diderita oleh anda";
			if($data_login != null and $data_live != null){
				
				$query1 = $this->mgeneral->update(array('id'=>$id),$data_login,'auth_users');
				$query2 = $this->mgeneral->save($data_live,'live_account');
				$this->email->from('noreply@foreximf.com','Marketing - IMFutures');
				$this->email->to($this->input->post('cemail')); 			
				$this->email->subject('Live Account Register');
				$this->email->message($pesan);
				$result['retCode'] = '00';
				$result['url']		= 'http://localhost/foreximf/live/'; //change your url
				$result['retMsg'] = 'Success To Registrasi but not active your account.';
				$result['result'] = TRUE;
			}else{				
				$result['retCode'] = '01';
				$result['retMsg'] = 'Error Registration.';
				$result['result'] = TRUE;
			}
		$this->output->set_content_type('application/json')->set_output(json_encode($result));
		
	}
	
	function active(){	
		$key 					= $this->input->get('key');
		if(!isset($_GET['key']) or $_GET['key'] == ''){
			show_error('Silahkan masukan url dengan benar');
		}else{
			
			$date	= date('Y-m-d H:i:s');
			$data_login	= array(
				'active'		=>'2',
				'registered'	=>$date,
				'lang'			=>'id'				
			);
			$query1 = $this->mgeneral->update(array('username'=>$key), $data_login,'auth_users');			
			
			
			
			$this->template->build('active');
		}
		
	}/* 
	function exe_active(){
		$result	= array();
		if(!isset($_POST['password']) and !isset($_POST['c_password'])){
			$result['retCode'] = '10';
			$result['retMsg'] = 'Invalid param.';
			$result['result'] = FALSE;
		}else{
			
			$date	= date('Y-m-d H:i:s');
			$id 	= $this->input->post('id');
			$hash	= $this->input->post('c_password');
			$data_login	= array(
				
				'password'		=> $this->ci->passwordhash->HashPassword($hash),
				'active'		=>'1',
				'registered'	=>$date,
				'lang'			=>'id',
				'role_id'		=>5,
				'investor_password'	=>$this->input->post('investor_p'),
			);
			if($data_login != null){
				
				$query1 = $this->mgeneral->update(array('id'=>$id), $data_login,'auth_users');
				
				$result['retCode'] = '00';
				$result['retMsg'] = 'Success To Activation Register your account.';
				$result['result'] = TRUE;
			}else{				
				$result['retCode'] = '01';
				$result['retMsg'] = 'Error Activation Register your account.';
				$result['result'] = TRUE;
			}
		}
		echo json_encode($result);
			
	} */
	
	function agent_code(){
		// tangkap variabel keyword dari URL
      $keyword = $this->uri->segment(3);
 
      // cari di database
      $data = $this->db->from('agent_code')->like('code',$keyword)->get(); 
 
      // format keluaran di dalam array
      foreach($data->result() as $row)
      {
         $arr['query'] = $keyword;
         $arr['suggestions'][] = array(
            'agent_picture'  =>$row->picture,
            'agent_name'   =>$row->full_name,
            'agent_code'   =>$row->code
         );
      }
      // minimal PHP 5.2
      echo json_encode($arr);
	}
	
}

/* End of file user.php */
/* Location: ./application/modules/auth/controllers/user.php */
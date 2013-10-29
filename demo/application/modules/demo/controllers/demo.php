<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Demo controller.
 * 
 * @package App
 * @category Controller
 * @author Muhamad Jafar Sidik
 */
class Demo extends MY_Controller 
{
	private $ci;
	
	function __construct()
	{
		parent::__construct();
		$this->load->model('mgeneral');
		$this->load->helper('code');
		$this->ci =& get_instance();
		$this->ci->load->library('PasswordHash', array('iteration_count_log2' => 8, 'portable_hashes' => FALSE));
		$config['upload_path'] = './uploads/file';
		$config['max_size']	= '2000';
		$this->load->library('upload', $config);
	}
	
	/**
	 * Display Form. 
	 */
	 
	function index()
	{		
		$this->data['city'] = $this->mgeneral->getAll('alamat_kabupaten');
		$this->template->build('form-regis');
	}
	/**
	 * Send data to Database and Email. 
	 */
	function send(){
		$result	= array();
		if(!isset($_POST['email']) and !isset($_POST['first_name'])){
			$result['retCode'] = '10';
			$result['retMsg'] = 'Invalid param.';
			$result['result'] = FALSE;
		}else{
			$user_code 		= rand(66669,99999);			
			$date 			= date('Y-m-d H:i:s');
			$data_login		= array(
									'title'			=>$this->input->post('title'),
									'first_name'	=>$this->input->post('first_name'),
									'last_name'		=>$this->input->post('last_name'),
									'username' 		=>$user_code,
									'email' 		=>$this->input->post('email'),
									'lang'			=>'id',
									'registered'	=>$date,
									'active'		=>'0',
									'role_id'		=>2,
									'approval'		=>'0',
								);
			$data_demo		= array(				
									'email' 		=>$this->input->post('email'),				
									'city'			=>$this->input->post('city'),
									'tanggal_lahir'	=>$this->input->post('tanggal'),
									'bulan_lahir'	=>$this->input->post('bulan'),
									'tahun_lahir'	=>$this->input->post('tahun'),
									'phone'			=>$this->input->post('phone'),
									'balance'		=>$this->input->post('balance')
								);
			
			$links 			="http://client.mysmartfx.vmt.co.id/index.php/demo/demo/active/?key=".$user_code; //change your url
			$pesan 			=
								"
								Dear All Valuable Customer,

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

								Mohon diperhatikan !! Bisnis online trading merupakan bisnis yang memiliki resiko yang sangat  tinggi Sebaiknya anda meminta pendapat  dari Independent Financial Advisor, dan bertindak selalu berhati-hati dalam mengambil keputusan, karena dalam hal ini imfutures tidak bertanggung jawab atas kerugian yang diderita oleh anda
								";
			if(isset($_POST['email']))
			{
				$email = mysql_real_escape_string($_POST['email']);
				$check_for_email = $this->db->query("select * from auth_users where email ='".$_POST['email']."'");
				if($check_for_email->num_rows())
				{
					$result['retCode'] = '20';
					$result['retMsg'] = 'Email Not Available';
					$result['result'] = true;
				}
				else
				{					
					$query1 = $this->mgeneral->save($data_login,'auth_users');
					$query2 = $this->mgeneral->save($data_demo,'demo_account');					
					$this->email->from('noreply@foreximf.com','Marketing - IMFutures');
					$this->email->to($this->input->post('email')); 			
					$this->email->subject('Demo Account Register');
					$this->email->message($pesan);
					$this->email->send();
					$result['retCode']	= '00';
					$result['url']		= 'http://localhost/foreximf/demo/'; //change your url
					$result['retMsg']	= 'Success To Registrasi but not active your account.';
					$result['result']	= TRUE;				
				}
			}
			else{				
				$result['retCode'] 	= '01';
				$result['retMsg'] 	= 'Error Registration.';
				$result['result']	= TRUE;
			}
		}
		$this->output->set_content_type('application/json')->set_output(json_encode($result));
	}
	function active()
	{
		$key	= $this->input->get('key');
		if(!isset($_GET['key']) or $_GET['key'] == ''){
			show_error('Silahkan masukan url dengan benar');
		}else{			
			$this->data['user'] 	=  $this->mgeneral->getWhere(array('username'=>$key),'auth_users');
			$this->template->build('active');
		}
		
	}
	function exe_active()
	{
		$result	= array();
		if(!isset($_POST['password']) and !isset($_POST['c_password'])){
			$result['retCode'] 	= '10';
			$result['retMsg']	= 'Invalid param.';
			$result['result']	= FALSE;
		}else{
			
			$date	= date('Y-m-d H:i:s');
			$id 	= $this->input->post('id');
			$username	= $this->input->post('username');
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
				$pesan = "Username = ".$username." Password = ".$hash."";
				$query1 = $this->mgeneral->update(array('id'=>$id), $data_login,'auth_users');
				$this->email->from('noreply@foreximf.com','Marketing - IMFutures');
				$this->email->to($this->input->post('email')); 			
				$this->email->subject('Demo Account Activation');
				$this->email->message($pesan);
				$this->email->send();
				$result['retCode']	= '00';
				$result['url']		= 'http://localhost/foreximf/live'; //change your url
				$result['retMsg']	= 'Success To Activation your account.';
				$result['result']	= TRUE;
			}else{				
				$result['retCode']	= '01';
				$result['retMsg']	= 'Error Activation Register your account.';
				$result['result']	= TRUE;
			}
		}
		echo json_encode($result);			
	}
	function cek_email(){
		if(isset($_POST['email']))//If a username has been submitted
		{
			$email = mysql_real_escape_string($_POST['email']);//Some clean up :)
			$check_for_email = $this->db->query("select * from auth_users where email ='".$email."'");
			
			if($check_for_email->num_rows())
			{
				echo '1';//If there is a  record match in the Database - Not Available
			}
			else
			{
				echo '0';//No Record Found - Username is available
			}
		}
	}
	
	
}

/* End of file user.php */
/* Location: ./application/modules/auth/controllers/user.php */
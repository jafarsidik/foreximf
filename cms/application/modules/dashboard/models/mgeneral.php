<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Mgeneral extends MY_Model {
	
	var $table_name ='member';
	function __construct(){
		parent::__construct();
	}
	#querry semua data dalam tabel
	#ex akses : $this->mgeneral->getAll('nama_tabel');
	function getAll($tabel, $order_field="", $order_tipe=""){
		if($order_field!="" && $order_tipe!=""){ $this->db->order_by($order_field,$order_tipe); }
		return $this->db->get($tabel)->result();
	}
	
	#fungsi untuk melakukan query standar
	#ex akses : $this->mgeneral->getWhere(array('field1'=>'data','field2'=>'data'),'nama_tabel');
	function getWhere($where,$tabel,$order_field="",$order_tipe=""){
		$this->db->where($where);
		if($order_field!=""){ $this->db->order_by($order_field,$order_tipe); }
		return $this->db->get($tabel)->result();
	}
	
	#fungsi untuk melakukan query standar menggunakan like
	#ex akses : $this->mgeneral->getLike(array('field1'=>'data','field2'=>'data'),'nama_tabel');
	function getLike($where,$tabel){
		$this->db->like($where);
		return $this->db->get($tabel)->result();
	}
	
	#fungsi save data
	#ex akses : $this->mgeneral->save(array_data_insert,nama_tabel);
	function save($varData,$tabel){
		$this->db->insert($tabel, $varData);
		//echo $this->db->last_query();
		return $this->db->insert_id();
	}
	
	#fungsi update data
	#ex akses : $this->mgeneral->update(array('field1'=>'data','field2'=>'data'),array_data_udate,nama_tabel);
	function update($where, $data, $tabel){
		$this->db->where($where);
		$this->db->update($tabel, $data);
	}
	
	#fungsi hapus data
	#ex akses : $this->mgeneral->delete(array('field1'=>'data','field2'=>'data'),nama_tabel);
	function delete($where,$tabel){
		$this->db->where($where);
		$this->db->delete($tabel);
	}
	function get_member_by_id($member_id = null){
		$result = 'invalid input';
		if($member_id!=null ){
			$this->db->where('member_id', $member_id);
			$result = $this->db->get($this->table_name);
			//my_dump_exit($this->db->last_query());
		}	
		return $result;
	}
}

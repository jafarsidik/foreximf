<?php

function userencode($data = ''){
	$key2 = array(30,15,27,11,4,23,14,26,2);
	$choose = array(2,5,11,7,0,3,13);
	$rand = md5(time().rand(5555, 9999));
	$str2 = str_split($rand,1);
	$str1 = str_split($data,1);
	$str = '';
	$x = 0;
	$y = 0;
	$code = '';
	for($i = 0; $i<15 ; $i++){
		if(array_key_exists($i, array_flip($choose))){
			$str.=$str1[$x];
			$code.=$str1[$x];
			//echo $i.'A'.$x.'<br>';
			$x++;
		}else{
			$str.=$str2[$key2[$y]];
			//echo $i.'B'.$y.'<br>';
			$y++;
		}
	}
	//my_dump($code);
	return $str;
}

function userdecode($data = ''){
	if(strlen($data)<15)return false;
	
	$str = '';
	$code = str_split($data,1);
	$choose = array(2,5,11,7,0,3,13);
	for($i = 0; $i<15 ; $i++){
		if(array_key_exists($i, array_flip($choose))){
			$str.=$code[$i];
		}
	}
	return $str;
}
function genRandomString($length = 10) {
    $characters = '0123456789abcdefghijklmnopqrstuvwxyzQWERTYUIOPLKJHGFDSAZXCVBNM';
    $string = "";
    for ($p = 0; $p < $length; $p++) {
        $string .= $characters[mt_rand(0, strlen($characters))];
    }
  
  return $string;
}

function validPassword($password){
        //Empty error array for the errors if any
		$error = array();
		// Password Strength check
		if( strlen($password) < 6 ) {
			$error[] = 'Password need to have at least 6 characters!';
		}
 
		if( strlen($password) > 20 ) {
			$error[] = 'Password needs to have less than 20 characters!';
		}
 
		if( !preg_match("#[0-9]+#", $password) ) {
			$error[] = 'Password must include at least one number!';
		}
 
 
		if( !preg_match("#[a-z]+#", $password) ) {
			$error[] = 'Password must include at least one letter!';
		}
 
 
		if( !preg_match("#[A-Z]+#", $password) ) {
			$error[] = 'Password must include at least one uppercase letter!';
		}
 
				// Make the array readable
				$errors=implode('<br />', $error);
				return $errors;
}
?>
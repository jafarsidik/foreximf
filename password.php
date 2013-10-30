<?php
      function validPassword($password) {
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
$pw = 'Pa55w*rd';
 
validPassword($pw);
?>
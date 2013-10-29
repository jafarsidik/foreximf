<?php
/* 
	Created By Muhamad Jafar Sidik
	mailtype : html or text
	priority : Email Priority. 1 = highest. 5 = lowest. 3 = normal.
*/


$config['useragent']	= 'smartfx';
$config['protocol']		= 'sendmail';
//$config['mailpath']		= '/usr/sbin/sendmail';
$config['smtp_host']	= '';
$config['smtp_user']	= '';
$config['smtp_pass']	= '';
$config['smtp_port']	= '25';
$config['smtp_timeout']	= '10';
$config['wordwrap'] 	= TRUE;
$config['wrapchars'] 	= '76';
$config['mailtype'] 	= 'text'; 
$config['charset'] 		= 'utf-8';
$config['validate'] 	= FALSE;
$config['priority'] 	= '1';
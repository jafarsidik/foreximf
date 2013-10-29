<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Default number of rows to display on data tables 
 * 
 */
$config['rows_limit']		= 20;

/*
 * Supported Languages
 * 
 */
$config['languages']		= array(
	'en' => array('name' => 'English', 'folder' => 'english'),
	'id' => array('name' => 'Bahasa Indonesia', 'folder' => 'indonesian')
);

/**
 * Main Navigation.
 * Primarily being used in views/navbar.php
 * 
 */
$config['main_nav']			= array(
	'//'								=> 'Home',	
	'live_account/live_account'			=> 'Live Account'	
	
);
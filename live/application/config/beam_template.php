<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * Beam-Template
 * 
 * @package Beam-Template
 * @category Config
 * @author Ardi Soebrata
 */
/**
 * Beam-Template Configuration.
 */

/**
 * Path to Template Layout.
 * 
 * Default: 'application/views/layouts' 
 */
$config['beam_template']['layout_path'] = 'layouts';

/**
 * Default Template Layout
 * 
 * The default layout to use 
 * Default: 'default'
 */
$config['beam_template']['default_layout'] = 'default';


/**
 * Path to Assets
 * 
 * Path to your assets files, default to 'assets'.
 */
$config['beam_template']['assets_path'] = 'assets';

/**
 * Default Site Title
 */
$config['beam_template']['base_title'] = 'Live-forexIMF';

/**
 * Title Separator 
 */
$config['beam_template']['title_separator'] = ' | ';

/**
 * Default Site Metas
 */
$config['beam_template']['metas'] = array(
	'description'	=> 'My Site description',
	'author'		=> 'Venus Media Technology'
);

/**
 * Default CSS 
 */
$config['beam_template']['css'] = array(
	'bootstrap',
	'default-style' => array(
		'style' => '
		body {
			padding-top: 60px; /* 60px to make the container go all the way to the bottom of the topbar */
		}'
	),
	'bootstrap-responsive',
	'datepicker',
	'jquery.pnotify.default',
);

/**
 * Default Javascript
 */
$config['beam_template']['js_header'] = array(
	'jquery',
	'bootstrap.min',
	'jquery.validate',
	'jquery.pnotify',
	'bootstrap-datepicker',
	'jquery.bootstrap.wizard.min',
	'jquery.tinyscrollbar.min',
	'jquery.autocomplete',
	'password_strength_plugin',
	
);
$config['beam_template']['js_footer'] = array(
	
	
);

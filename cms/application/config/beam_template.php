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
$config['beam_template']['default_layout'] = 'beckend';


/**
 * Path to Assets
 * 
 * Path to your assets files, default to 'assets'.
 */
$config['beam_template']['assets_path'] = 'assets';

/**
 * Default Site Title
 */
$config['beam_template']['base_title'] = 'CMS-forexIMF';

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
	'bootstrap/css/bootstrap.min',
    'bootstrap/css/bootstrap-responsive.min',    
    'assets/styles'
);

/**
 * Default Javascript
 */
$config['beam_template']['js_header'] = array(
	'vendors/modernizr-2.6.2-respond-1.1.0.min',
	'vendors/jquery-1.9.1.min',
	'bootstrap/js/bootstrap.min',
	'assets/jquery.validate',
	'assets/scripts',
	
);
$config['beam_template']['js_footer'] = array(
	
);

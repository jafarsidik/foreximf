<!DOCTYPE html>
<html class="no-js">
    
    <head>
        <title><?php echo $template['title']; ?></title>
        <!-- Bootstrap -->
		<?php echo $template['css']; ?>
       
        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
        
		<?php echo $template['js_header']; ?>
    </head>
    
    <body>
	<?php $this->load->view('navbar', $template); ?>
        <div class="container-fluid">
            <div class="row-fluid">
               
                <?php $this->load->view('left', $template); ?>
                <!--/span-->
                <div class="span9" id="content">
					<?php echo $template['content']; ?>                      
                </div>
            </div>
           <?php $this->load->view('footer'); ?>
        </div>
        <!--/.fluid-container-->
        
       <?php echo $template['js_footer']; ?>
	 
    </body>

</html>
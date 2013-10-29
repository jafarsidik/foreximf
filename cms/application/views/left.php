 <style type="text/css">
 .wrapper-dropdown-5 {
    
}
 
.wrapper-dropdown-5:after { /* Little arrow */
    content: "";
    width: 0;
    height: 0;
    position: absolute;
    top: 50%;
    right: 15px;
    margin-top: -3px;
    border-width: 6px 6px 0 6px;
    border-style: solid;
    border-color: #4cbeff transparent;
}
.wrapper-dropdown-5 .dropdown {
    /* Size & position */
    position: absolute;
    top: 100%;
    left: 0;
    right: 0;
 
    /* Styles */
    background: #fff;
    border-radius: 0 0 5px 5px;
    border: 1px solid rgba(0,0,0,0.2);
    border-top: none;
    border-bottom: none;
    list-style: none;
    transition: all 0.3s ease-out;
 
    /* Hiding */
    max-height: 0;
    overflow: hidden;
}
.wrapper-dropdown-5 .dropdown li {
    padding: 0 10px ;
}
 
.wrapper-dropdown-5 .dropdown li a {
    display: block;
    text-decoration: none;
    color: #333;
    padding: 10px 0;
    transition: all 0.3s ease-out;
    border-bottom: 1px solid #e6e8ea;
}
 
.wrapper-dropdown-5 .dropdown li:last-of-type a {
    border: none;
}
 
.wrapper-dropdown-5 .dropdown li i {
    margin-right: 5px;
    color: inherit;
    vertical-align: middle;
}
 
/* Hover state */
 
.wrapper-dropdown-5 .dropdown li:hover a {
    color: #57a9d9;
}
/* Active state */
 
.wrapper-dropdown-5.active {
    border-radius: 5px 5px 0 0;
    background: #4cbeff;
    box-shadow: none;
    border-bottom: none;
    color: white;
}
 
.wrapper-dropdown-5.active:after {
    border-color: #82d1ff transparent;
}
 
.wrapper-dropdown-5.active .dropdown {
    border-bottom: 1px solid rgba(0,0,0,0.2);
    max-height: 400px;
}
 </style>
 <?php if (isset($auth_user)): ?>
 <div class="span3" id="sidebar">
 <?php $menus = $this->config->item('main_nav'); ?>
                    
					<ul class="nav nav-list bs-docs-sidenav nav-collapse collapse">
                  
						<?php
							foreach($menus as $url => $label):
								if (!$this->acl->is_allowed($url)) continue;
								if (is_array($label)):
							?>
							
								<div id="dd" class="wrapper-dropdown-5" tabindex="1"><?php echo ucwords($url); ?>
								<ul class="dropdown">
								<?php foreach($label as $sub_url => $sub_label): ?>
									<?php if (!$this->acl->is_allowed($sub_url)) continue; ?>
									<li <?php if (substr(uri_string(), 0, strlen($sub_url)) == $sub_url) echo 'class="active"'; ?>>
										<a  href="<?php echo site_url($sub_url); ?>"><?php echo $sub_label; ?></a>
									</li>
								<?php endforeach; ?>
								</ul>
							</div>
							<?php
								else:
							?>
							<li <?php if (substr(uri_string(), 0, strlen($url)) == $url) echo 'class="active"'; ?>>
								<a href="<?php echo site_url($url); ?>"><i class="icon-chevron-right"></i><?php echo $label; ?></a>
							</li>
							<?php endif; ?>
							<?php endforeach; ?>
                    </ul>
                </div>
<?php endif;?>

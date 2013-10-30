<?php if (isset($auth_user)): ?>
 <div class="span3" id="sidebar">
 <?php $menus = $this->config->item('main_nav'); ?>
                    
                  
					<ul class="nav nav-list bs-docs-sidenav nav-collapse collapse">
						<?php
							foreach($menus as $url => $label):
								if (!$this->acl->is_allowed($url)) continue;
								if (is_array($label)):
							?>
							
								<!--
								<ul class="dropdown">
								<?php foreach($label as $sub_url => $sub_label): ?>
									<?php if (!$this->acl->is_allowed($sub_url)) continue; ?>
									<li <?php if (substr(uri_string(), 0, strlen($sub_url)) == $sub_url) echo 'class="active"'; ?>>
										<a  href="<?php echo site_url($sub_url); ?>"><?php echo $sub_label; ?></a>
									</li>
								<?php endforeach; ?>
								</ul>
							-->
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

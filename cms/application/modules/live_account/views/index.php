
                     <div class="row-fluid">
                        <div class="navbar">
                            	<div class="navbar-inner">
	                                <ul class="breadcrumb">
									<li>
									 <i class="icon-chevron-left hide-sidebar"><a href='#' title="Hide Sidebar" rel='tooltip'>&nbsp;</a></i>
	                                    <i class="icon-chevron-right show-sidebar" style="display:none;"><a href='#' title="Show Sidebar" rel='tooltip'>&nbsp;</a></i>
									</li>
	                                   
	                                  
	                                </ul>
                            	</div>
                        	</div>
						<!-- block -->
                        <div class="block">
						
                            <div class="navbar navbar-inner block-header">
                                <div class="muted pull-left"><?=$template['title']; ?></div>
                            </div>
                            <div class="block-content collapse in">
                                <div class="span12">
  									<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
										<thead>
											<tr>
												<th>Name</th>
												<th>Email</th>
												<th>Status Account</th>
												<th>Register Date</th>
												<th>Action</th>
											</tr>
										</thead>
										<tbody>
										<?php foreach ($reg as $r){ ?>
											<tr>
												<td><?=$r->first_name;?> <?=$r->last_name;?></td>
												<td><a href="<?php echo base_url().'auth/user/edit/'.$r->email;?>"><?=$r->email;?></a></td>
												<td>
													<?php 
													if($r->approval =="0"){
														echo "<strong style='color:red'>Un Approval</strong>";
													}else{
														echo "<strong style='color:green'>Approval</strong>";
													}
													?>
												</td>
												
												<td><?=$r->registered;?></td>
												<td>
												<?php 
													if($r->approval =="0"){
														echo "<a href='#' class='btn btn-info btn-small'>Approval</a>";
													}else{
														echo "<a href='#' class='btn btn-info btn-small'>Un Approval</a>";
													}
													?>
												</td>
												
											</tr>
										<?php }?>
											
										</tbody>
									</table>
                                </div>
                            </div>
                        </div>
                        <!-- /block -->
                    </div>
					
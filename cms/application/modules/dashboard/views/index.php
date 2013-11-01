
                     <div class="row-fluid">
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
												<th>Agent Code</th>
												<th>Option</th>
												<th>Delivery</th>
												<th>Status</th>
												<th>Date</th>
											</tr>
										</thead>
										<tbody>
										<?php foreach ($reg as $r){ ?>
											<tr>
												<td><?=$r->first_name;?> <?=$r->last_name;?></td>
												<td><?=$r->email;?></td>
												<td><?=$r->account_info_agentcode;?></td>
												<td><?=$r->reg_option;?></td>
												<td></td>
												<td></td>
												<td><?=$r->registered;?></td>
												
												
											</tr>
										<?php }?>
											
										</tbody>
									</table>
                                </div>
                            </div>
                        </div>
                        <!-- /block -->
                    </div>
					

                     <div class="row-fluid">
                        <div class="navbar">
                            	<div class="navbar-inner">
	                                <ul class="breadcrumb">
									<li>
									 <i class="icon-chevron-left hide-sidebar"><a href='#' title="Hide Sidebar" rel='tooltip'>&nbsp;</a></i>
	                                    <i class="icon-chevron-right show-sidebar" style="display:none;"><a href='#' title="Show Sidebar" rel='tooltip'>&nbsp;</a></i>
									</li>
	                                   
	                                    <li>
	                                        <a href="<?=base_url().'index.php/demo/demo/add';?>" class="btn btn-primary">Add</a> <span class="divider">|</span>	
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
								<form action="" method="GET" id="my-form" class="form-inline">
									
										   <select name="bulan" id="bulan" class="span2">
                                            	<option value="0">All Dates</option>
                                            	<option value="1">Januari <?=date("Y");?></option>
                                            	<option value="2">Febuari <?=date("Y");?></option>
                                            	<option value="3">Maret <?=date("Y");?></option>
                                            	<option value="4">April <?=date("Y");?></option>
                                            	<option value="5">Mei <?=date("Y");?></option>
                                            	<option value="6">Juni <?=date("Y");?></option>
                                            	<option value="7">Juli <?=date("Y");?></option>
                                            	<option value="8">Agustus <?=date("Y");?></option>
                                            	<option value="9">September <?=date("Y");?></option>
                                            	<option value="10">Okotber <?=date("Y");?></option>
                                            	<option value="11">November <?=date("Y");?></option>
                                            	<option value="12">Desember <?=date("Y");?></option>
                                            </select>
										
										   <select name="status" id="status" class="span2">
                                            	<option value="10">All Status</option>
                                            	<option value="1">Verified Account</option>
                                            	<option value="0">Un Verified Account</option>
                                            </select>
											<input onclick="cek(this);" type="button" class="btn btn-small" value="Filter">
                                          
								</form>
  									<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
										<thead>
											<tr>
												<th>Name</th>
												<th>Email</th>
												<th>Status Account</th>
												<th>Register Date</th>
											</tr>
										</thead>
										<tbody>
										<?php foreach ($reg as $r){ ?>
											<tr>
												<td><?=$r->first_name;?> <?=$r->last_name;?></td>
												<td><a href="<?php echo base_url().'auth/user/edit/'.$r->email;?>"><?=$r->email;?></a></td>
												<td>
													<?php 
													if($r->active =="0"){
														echo "<strong style='color:red'>Un Verified Account</strong>";
													}else{
														echo "<strong style='color:green'>Verified Account</strong>";
													}
													?>
												</td>
												
												<td><?=$r->registered;?></td>
												
												
											</tr>
										<?php }?>
											
										</tbody>
									</table>
									<div id="result"></div>
                                </div>
                            </div>
                        </div>
                        <!-- /block -->
                    </div>
<script type="text/javascript">
function cek(){
var date = $('#bulan').val();
var status = $('#status').val();

$.ajax({
			url: "<?=site_url('demo/demo/cek');?>",				
			type: "GET",
			//dataType:"json",
			data: $("#my-form").serialize(),
			beforeSend: function(){
				$("#loading").show();				
			},				
			success:function(data){
				
				$("#result").html(data)
			}
});
}
</script>
					
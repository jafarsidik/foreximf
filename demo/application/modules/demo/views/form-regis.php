<style type="text/css">
	
    input.error {
        color: #B94A48 !important;
        background-color: #F2DEDE !important;
        border: 1px solid #EED3D7 !important;
		
    }
	
	label.error {		
		display: inline-block;
		text-align:center;
		margin: 10px;
	}
	label.valid {
		display: inline-block;
		text-align:center;
		margin: 10px;
		background: url(<?=base_url()?>assets/img/valid.png) center center no-repeat;
				
	}
	#availability_status {
		font-size:15px;
		margin-left:5px;
	}
</style>
<div class="row">
	<div class="span12">
		<h3>Demo Register - ForexIMF</h3>
	<hr />
	</div>
</div>
<div class="row">	
	<div class="span8">		
		<form method="post" action="" class="form-horizontal" id="my-form">
			<fieldset>
			<div class="control-group">
				<label class="control-label" for="inputTitle">Title*</label>				
					<div class="controls">					
						<select name="title" id="title" data-required="true">
							<option value="Mr." selected>Mr.</option>
							<option value="Mrs.">Mrs.</option>
							<option value="Miss.">Miss.</option>
						</select>					
					</div>				
			</div>
			<div class="control-group">
				<label class="control-label" for="inputfirstname">First Name*</label>
				<div class="controls">
					<input class="input-xlarge"type="text" name="first_name" id="first_name" placeholder="First Name" data-required="true">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="inputfirstname">Last Name*</label>
				<div class="controls">
					<input class="input-xlarge" type="text" name="last_name" id="last_name" placeholder="Last Name" data-required="true">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="inputTitle">City*</label>				
					<div class="controls">					
						<select name="city" id="city" >							
							<?php 
								foreach($city as $c){
								echo "<option value='".$c->NAMA_KABUPATEN."'>".$c->NAMA_KABUPATEN."</option>";
								}
							?>
						</select>						
					</div>				
			</div>
			<div class="control-group">
				<label class="control-label" for="inputfirstname">Email*</label>
				<div class="controls">
					<input class="input-xlarge" type="text" id="email" name="email"  placeholder="yourmail@email.com"/>
					<span id="availability_status"></span> 
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="inputfirstname">Date Of Birth</label>
				<div class="controls">
					Tanggal :
					<input class="input-small" type="text" id="tanggal" name="tanggal"  placeholder="dd"/>
					Bulan :
					<input class="input-small" type="text" id="bulan" name="bulan"  placeholder="mm"/>
					Tahun :
					<input class="input-small" type="text" id="tahun" name="tahun"  placeholder="yyyy"/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="inputfirstname">Phone*</label>
				<div class="controls">
					<input type="text" name="phone" id="phone" class="input-medium bfh-phone" data-country="ID" data-required="true">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="inputfirstname">Balance*</label>
				<div class="controls">
						<select name="balance" id="balance">
							<option value="$5000" selected>$5000</option>
							<option value="$10000" >$10000</option>
							<option value="$20000" >$20000</option>
							<option value="$30000" >$30000</option>
							<option value="$50000" >$50000</option>
							<option value="$100000" >$100000</option>							
						</select>
				</div>
			</div>
			<div class="form-actions ">
				<input type="button" class="btn pull-right" value="Cancel"/> &nbsp; &nbsp;&nbsp;&nbsp;
				<input  onclick="save(this);" type="submit" class="btn btn-primary pull-right" value="Save">
				<div id="loading" class="pull-right"><img src="<?=base_url();?>assets/img/loader.gif" alt="" /></div>
		</div>
		</fieldset>	
</form>
	</div>
	<div class="span4">
		
		<div id="demo-form-valid">
		
		</div>
	</div>
</div>
<script type="text/javascript">
function validateEmail(email) {
        var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
        if( !emailReg.test( email ) ) {
        return false;
        } else {
        return true;
       }
     }
$("#email").change(function()
	{
		//if theres a change in the email textbox
		var email = $("#email").val();//Get the value in the email textbox
		//var email = 'emails='+ $(this).val();
		if(validateEmail(email))//if the lenght greater than 3 characters
		{
			$("#availability_status").html('Checking availability...');
			//Add a loading image in the span id="availability_status"
			$.ajax({
				//Make the Ajax Request
				type: "POST",
				url: "<?=site_url();?>/demo/demo/cek_email",
				data: "email="+email,
				success: function(server_response){
					$("#availability_status").ajaxComplete(function(event, request){
						if(server_response == '0')
						{
							$("#availability_status").html('<font color="Green">Tersedia </font>');
							//add this image to the span with id "availability_status"
						}
						else if(server_response == '1')//if it returns "1"
						{
							$("#availability_status").html('<font color="red">Sudah Digunakan </font>');
						}
					});
				}
			});
		}
		/* else
		{
			$("#availability_status").html('<font color="#cc0000">Email too short</font>');
			//if in case the username is less than or equal 3 characters only
		} */
	return false;
});
$("#loading").hide();
$('#tanggal input').datepicker({
	format: "yyyy-mm-dd",
    orientation: "auto left",
    startView: 2,
	autoclose: true,
	todayHighlight: true,
});
function save(){
	$("#my-form").validate({
		rules:{
			title		:"required",
			first_name	:"required",
			last_name	:"required",
			city		:"required",
			email: {
				required:true,
				email	:true
			},
		},
		highlight: function(element) {
			$(element).closest('input').removeClass('success').addClass('error');
		},
		unhighlight:function(element){
			$(element).closest('input').removeClass('error').addClass('success');
		},
		success: function(element) {
			element
			.addClass('valid')
			.closest('input').removeClass('error').addClass('success');
		},
		submitHandler: function(form){
				//form.submit();
				
			$.ajax({
			url: '<?=site_url('demo/demo/send');?>',				
			type: "POST",
			dataType:"json",
			data: $("#my-form").serialize(),
			beforeSend: function(){
				$("#loading").show();				
			},				
			success:function(data){
				console.log(data);
					if(data.retcode==="10"){
						$.pnotify({
							title: 'Invalid Parameter',
							text: 'Invalid Parameter.',
							animation: {
								effect_in: 'show',
								effect_out: 'slide'
							},
							type : "notice",
						});
					$("#loading").hide();
					//form.reset("#my-form");
					}else if(data.retCode==="20"){
						$.pnotify({
							title: 'Email Not Available',
							text: 'Email Not Available',
							animation: {
								effect_in: 'show',
								effect_out: 'slide'
							},
							type : "notice",
						});
					$("#loading").hide();
					//form.reset("#my-form");
					
					}else if(data.retCode==='00'){
						$.pnotify({
							title: 'Sukses',
							text: 'Cek Your Email For Validation. Thks',
							animation: {
								effect_in: 'show',
								effect_out: 'slide'
							},
							type : "success",
						});
					$("#loading").hide();
					form.reset("#my-form");
					window.setTimeout( function(){ window.location = data.url;}, 3000 );
					}else{
						$.pnotify({
							title: 'Error',
							text: 'Error System.',
							animation: {
								effect_in: 'show',
								effect_out: 'slide'
							},
							type : "error",
						});
						$("#loading").hide();
					}
			},
			error: function (request, status, error) {
				//show_stack_bottomright('error');				
					$.pnotify({
						title: 'System Bussy',
						text: 'System Bussy.',
						animation: {
								effect_in: 'show',
								effect_out: 'slide'
						},
						type : "info",
					});
					$("#loading").hide();
			}, 	
			});
		}
	});		    
}


</script>
<style type="text/css">
	input.success {
        color: #468847 !important;
        background-color: #DFF0D8 !important;
        border: 1px solid #D6E9C6 !important;		
      }
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
	


/* 	RESULT STYLE  */

.testresult span{
	font-size:15px;
	margin-left:5px;
	
}

.shortPass span{
	color:red;
}
.badPass span{
	color:red;
}

.goodPass span{
	color:gold;
}

.strongPass span{
	color:green;
}
</style>
<div class="row">
	<div class="span12">
		<h3>Account Verification - ForexIMF</h3>
	<hr />
	</div>
</div>
<div class="row">	
	<div class="span8">		
		<form method="post" action="" class="form-horizontal" id="my-form">
			<?php foreach($user as $u){?>
			<fieldset>
			<div class="control-group">
				<label class="control-label" for="inputfirstname">Login ID</label>
				<div class="controls">
					<input class="input-xlarge" type="text" name="login" id="login" value="<?=$u->username;?>" data-required="true" readonly="readonly">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="inputfirstname">Password*</label>
				<div class="controls">
					<input class="input-xlarge" type="password" name="password" id="password" placeholder="password" data-required="true" >
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="inputfirstname">Confirm New Password*</label>
				<div class="controls">
					<input class="input-xlarge" type="password" name="c_password" id="c_password" placeholder="Confirm new password" data-required="true">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="inputfirstname">Investor password</label>
				<div class="controls">
					<input class="input-xlarge" type="text" name="investor_p" id="investor_p" value="<?php echo genRandomString(6);?>" data-required="true" readonly="readonly">
				</div>
			</div>
			
			<div class="form-actions ">
			<input type="hidden" value="<?=$u->id; ?>" name="id" id="id" />
			<input type="hidden" value="<?=$u->email; ?>" name="email" id="email" />
			<input type="hidden" value="<?=$u->username; ?>" name="username" id="username" />
				<input type="button" class="btn pull-right" value="Cancel"/> &nbsp; &nbsp;&nbsp;&nbsp;
				<input  onclick="save(this);" type="submit" class="btn btn-primary pull-right" value="Save">
				<div id="loading" class="pull-right"><img src="<?=base_url();?>assets/img/loader.gif" alt="" /></div>
		</div>
		</fieldset>
		<?php } ?>
</form>
	</div>
	<div class="span4">
		
		<div id="demo-form-valid">
		
		</div>
	</div>
</div>
<script type="text/javascript">
$("#loading").hide();
$("#password").passStrength({
	userid:	"#login"
});
function save(){
	$("#my-form").validate({
		rules:{
			password		:"required",
			c_password		:{equalTo: "#password"},			
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
			url: '<?=site_url('demo/demo/exe_active');?>',				
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
					form.reset("#my-form");
					}else if(data.retCode==='00'){
						$.pnotify({
							title: 'Sukses',
							text: 'Your Account Actived. Thks',
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
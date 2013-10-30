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
		color: #FF0066;
	}
	

</style>
<div class="row">
	<div class="span12">
		<h3>Live Account - ForexIMF</h3>
		
	<hr />
	</div>
</div>
<div class="row">	
	<div class="span1"></div>
	<div class="span9">
		<form method="post" action="" class="form-horizontal" id="my-form" enctype= "multipart/form-data">
		<input type="hidden" value="<?=$demo['id'];?>" name="id" id="id" />
		<input type="hidden" value="<?=$demo['username'];?>" name="username" id="username" />
		
		<div id="rootwizard" class="tabbable tabs-left">
			<ul>
				<li><a href="#tab1" data-toggle="tab">Join</a></li>
				<li><a href="#tab2" data-toggle="tab">Registration Option</a></li>
				<li><a href="#tab3" data-toggle="tab">Account Information</a></li>				
			</ul>
		<div class="tab-content">
			<div class="tab-pane" id="tab1">
				<div class="control-group">
					<label class="control-label" for="inputPassword">Registration Options</label>
					<div class="controls">
						<label class="radio">
							<input type="radio" name="reg_option" id="optionsRadios1" value="Individual" checked>
							Individual
						</label>
						<label class="radio">
							<input type="radio" name="reg_option" id="optionsRadios2" value="Join">
							Join
						</label>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut sed purus elementum, tincidunt mi non, semper tellus. In rhoncus odio sit amet aliquam dignissim. Praesent vehicula nunc et nulla sodales scelerisque. Donec fringilla, enim nec malesuada tincidunt, quam sapien malesuada libero, ac ultricies quam turpis eget nisi. Ut vel nisl nec tellus placerat vulputate.</p>
					</div>
				</div>
				<hr/>
				<div class="control-group">
				<label class="control-label" for="inputTitle">Title*</label>				
					<div class="controls">					
						<select name="title" id="title" data-required="true">
							<option value="<?php echo $demo['title'];?>" selected><?php echo $demo['title'];?></option>
							<hr/>
							<option value="Mr.">Mr.</option>
							<option value="Mrs.">Mrs.</option>
							<option value="Miss.">Miss.</option>
						</select>					
					</div>				
			</div>
			<div class="control-group">
				<label class="control-label" for="inputfirstname">First Name*</label>
				<div class="controls">
					<input class="input-xlarge"type="text" value="<?php echo $demo['first_name'];?>" name="first_name" id="first_name" placeholder="First Name" data-required="true">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="inputfirstname">Last Name*</label>
				<div class="controls">
					<input class="input-xlarge" type="text" value="<?php echo $demo['last_name'];?>" name="last_name" id="last_name" placeholder="Last Name" data-required="true">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="inputfirstname">Date Of Birth*</label>
				<div class="controls">
					Tanggal :
					<input  value="<?php echo $demo['tanggal_lahir']; ?>" class="input-small" type="text" id="tanggal" name="tanggal"  placeholder="dd"/>
					Bulan :
					<input value="<?php echo $demo['bulan_lahir']; ?>" class="input-small" type="text" id="bulan" name="bulan"  placeholder="mm"/>
					Tahun :
					<input value="<?php echo $demo['tahun_lahir']; ?>" class="input-small" type="text" id="tahun" name="tahun"  placeholder="yyyy"/>
				</div>
			</div>
			</div>
			<div class="tab-pane" id="tab2">
			  <div class="well" style="background-color:#ffffff">
					<h5 style="color:blue">Personal Detail - Primary Account Holder</h5>
					<div class="control-group">
						<label class="control-label" for="inputfirstname">Name</label>
							<div class="controls">
							<input class="input-xlarge"type="text"  name="name_personal" id="name_personal" placeholder="Full Name " data-required="true">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="inputfirstname">ID Number / Passport*</label>
							<div class="controls">
							<input class="input-xlarge"type="text"  name="passport" id="passport" placeholder="Passport" data-required="true">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="inputfirstname">Send Attach ID Document</label>
							<div class="controls">
							<input class="input-xlarge" type="file"  name="docs" id="docs" placeholder="Document" data-required="true">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="inputfirstname">Citizenship</label>
						<div class="controls">
						<input type="text" name="pnegara" id="pnegara" data-required="true" />
							
						</div>
					</div>
			  </div>
			  <div class="well">
				<h5 style="color:blue">Contact Information</h5>
					<div class="control-group">
						<label class="control-label" for="inputfirstname">Email*</label>
						<div class="controls">
							<input class="input-xlarge"type="text" value="<?php echo $demo['email'];?>" name="cemail" id="cemail" placeholder="Email" data-required="true">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="inputfirstname">Address*</label>
						<div class="controls">
							
							<textarea rows="3" name="caddress" id="caddress" style="margin: 0px; width: 361px; height: 90px;" ></textarea>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="inputfirstname">Country*</label>
						<div class="controls">
							<select name="ccountry" id="ccountry" data-required="true">
								<?php foreach($negara as $n){?>								
									<option value="<?=$n->nicename;?>"><?=$n->nicename;?></option>
								<?php }?>						
							</select>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="inputfirstname">State/Province*</label>
							<div class="controls">
							<input class="input-xlarge"type="text"  name="cstate" id="cstate" placeholder="State / Province " data-required="true">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="inputfirstname">City*</label>
							<div class="controls">
							<input class="input-xlarge"type="text"  name="ccity" id="ccity" placeholder="City " data-required="true">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="inputfirstname">Zip/Postal Code*</label>
							<div class="controls">
							<input class="input-xlarge"type="text"  name="czip" id="czip" placeholder="Zip / Postal Code" data-required="true">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="inputfirstname">Phone*</label>
							<div class="controls">
							
							<input class="input-large"type="text"  name="cphone" id="cphone" placeholder="Phone" data-required="true">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="inputfirstname">Mobile*</label>
							<div class="controls">
							
							<input class="input-large"type="text"  name="cmobile" id="cmobile" placeholder="Mobile" data-required="true">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="inputfirstname">Fax*</label>
							<div class="controls">
							
							<input class="input-large" type="text"  name="cfax" id="cfax" placeholder="Fax" data-required="true">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="inputfirstname">Corespondence Address</label>
						<div class="controls">
							
							<textarea rows="3" name="ccorespondeaddress" id="ccorespondeaddress" style="margin: 0px; width: 361px; height: 90px;"></textarea>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="inputfirstname">Prof Of Residance</label>
							<div class="controls">
							<input class="input-xlarge"type="file"  name="cprof" id="cprof" placeholder="Document" data-required="true">
						</div>
					</div>					
			  </div>
			  <div class="well" style="background-color:#ffffff">
				<h5 style="color:blue">Account Information</h5>
					<div class="control-group">
					<label class="control-label" for="inputfirstname">Agent Code*</label>
						<div class="controls">
							<input class="input-xlarge" type="text"  name="ai" id="ai" placeholder="Agent Code" data-required="true">
						</div>
				</div>
			  </div>
			</div>
			<div class="tab-pane" id="tab3">
				<div class="well">
				<h5 style="color:blue">Bank Information</h5>
					<div class="control-group">
					<label class="control-label" for="inputfirstname">Bank Name*</label>
						<div class="controls">
							<input class="input-xlarge" type="text"  name="bankname" id="bankname" placeholder="Bank Name" data-required="true">
						</div>
					</div>
					<div class="control-group">
					<label class="control-label" for="inputfirstname">Bank Address*</label>
						<div class="controls">
							<textarea name="bankaddress" id="bankaddress"  rows="3" style="margin: 0px; width: 361px; height: 90px;"></textarea>
						</div>
					</div>
					<div class="control-group">
					<label class="control-label" for="inputfirstname">Bank SWIFT code</label>
						<div class="controls">
							<input class="input-xlarge" type="text"  name="bankswiftcode" id="bankswiftcode" placeholder="Bank SWIFT code" data-required="true">
						</div>
					</div>
					<div class="control-group">
					<label class="control-label" for="inputfirstname">Bank Account*</label>
						<div class="controls">
							<input class="input-xlarge" type="text"  name="bankaccount" id="bankaccount" placeholder="Bank Account" data-required="true">
						</div>
					</div>
					<div class="control-group">
					<label class="control-label" for="inputfirstname">Bank Account Holder*</label>
						<div class="controls">
							<input class="input-xlarge" type="text"  name="bankaccountholder" id="bankaccountholder" placeholder="Bank Account Holder" data-required="true">
							<br />Dou you have or have ?* <br />
							<input type="radio" name="textyes" id="yes" value="Yes" checked> Yes
							<input type="radio" name="textyes" id="no" value="No"> No
							
						</div>
					</div>
					</div>
					<div class="well" style="background-color:#ffffff">
						<h5 style="color:blue">Tranding Information</h5>
						<div class="control-group">
						<label class="control-label" for="inputfirstname">Annual Income*</label>
						<div class="controls">
							<label class="radio">
								<input type="radio" name="anualincome" id="a1" value="50.000" checked>
								< USD 50.000
							</label>
							<label class="radio">
								<input type="radio" name="anualincome" id="a2" value="50.000 - 100.000" >
								USD 50.000 - USD 100.000
							</label>
							<label class="radio">
								<input type="radio" name="anualincome" id="a3" value="100.000 - 200.000" >
								USD 100.000 - USD 200.000
							</label>
							<label class="radio">
								<input type="radio" name="anualincome" id="a3" value="200.000" >
								> USD 200.000
							</label>
						</div>
						</div>
						<div class="control-group">
						<label class="control-label" for="inputfirstname">Trading Experience*</label>
						<div class="controls">
							<label class="radio">
								<input type="radio" name="tradingex" id="t1" value="< 1 Year" checked>
								< 1 Year
							</label>
							<label class="radio">
								<input type="radio" name="tradingex" id="t2" value="1 - 3 Year" >
								1 - 3 Year
							</label>
							<label class="radio">
								<input type="radio" name="tradingex" id="t3" value="> 3 Years" >
								> 3 Years
							</label>						
						</div>
						</div>
						<div class="control-group">
						<label class="control-label" for="inputfirstname">Investments you have previosly*</label>
						<div class="controls">
							<label class="checkbox "> Forex
								<input type="checkbox" name="invest[]" id="forex" value="forex"> 
							</label>
							<label class="checkbox ">Stocks
								<input type="checkbox" name="invest[]" id="stocks" value="stocks"> 
							</label>
							<label class="checkbox "> Futures
								<input type="checkbox" name="invest[]" id="futures" value="futures">
							</label>
							<label class="checkbox ">Bonds
								<input type="checkbox" name="invest[]" id="bonds" value="bonds"> 
							</label>
							<label class="checkbox ">Options
								<input type="checkbox" name="invest[]" id="options" value="options"> 
							</label>
							<label class="checkbox "> Other
								<input type="checkbox" name="invest[]" id="options" value="Other">
							</label>
						</div>
						</div>
						<div class="control-group">
						<label class="control-label" for="inputfirstname">Risk Profile*</label>
						<div class="controls">
							<label class="radio">
								<input type="radio" name="risk" id="low1" value="Low" checked>
								Low
							</label>
							<label class="radio">
								<input type="radio" name="risk" id="medium3" value="Medium" >
								Medium
							</label>						
							<label class="radio">
								<input type="radio" name="risk" id="high2" value="High" >
								High
							</label>
							
						</div>
						</div>
			  </div>
			  <div class="well">
				<h5 style="color:blue">Additional Information</h5>
				<div class="control-group">
						<label class="control-label" for="inputfirstname">How You Manage Your Account?*</label>
						<div class="controls">
							<label class="radio">
								<input type="radio" name="maccount" id="be" value="By Yourself" checked>
								By Yourself
							</label>
							<label class="radio">
								<input type="radio" name="maccount" id="be2" value="By help from other" >
								By help from other
							</label>						
						</div>
				</div>
				<div class="control-group">
						<label class="control-label" for="inputfirstname">What kind of website?*</label>
						<div class="controls">
							<label class="radio">
								<input type="radio" name="wk" id="sport" value="Sport" checked>
								Sport
							</label>
							<label class="radio">
								<input type="radio" name="wk" id="entertaint" value="Entertainment" >
								Entertainment
							</label>
							<label class="radio">
								<input type="radio" name="wk" id="financial" value="Financial" >
								Financial
							</label>
							<label class="radio">
								<input type="radio" name="wk" id="other" value="Other" >
								Other
							</label>
						</div>
				</div>
				<div class="control-group">
						<label class="control-label" for="inputfirstname">How did your hear about my smartfx ?*</label>
						<div class="controls">
							<label class="radio">
								<input type="radio" name="hd" id="Friend" value="Friend" checked>
								Friend
							</label>
							<label class="radio">
								<input type="radio" name="hd" id="Internet" value="Internet" >
								Internet
							</label>
							<label class="radio">
								<input type="radio" name="hd" id="other" value="Other" >
								Other
							</label>
						</div>
				</div>
			  </div>
			  <div class="well" style="background-color:#fffff">
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent neque ipsum, aliquam non quam quis, varius condimentum libero. Nulla semper tempor lorem et viverra. Ut at libero nec lorem rutrum aliquet et eu dui. Duis quam justo, egestas eu consectetur nec, tempor eget ligula. Morbi ullamcorper mattis neque ac laoreet. Praesent rhoncus dolor quis leo vestibulum, ut congue nisl porta. Maecenas commodo, tortor et viverra iaculis, ipsum lectus laoreet est, vel vestibulum quam ante a sapien.

Praesent consequat quis nibh tristique faucibus. Suspendisse sed turpis sed metus lobortis venenatis ac et lorem. Fusce pharetra velit felis, quis blandit sem hendrerit facilisis. Nullam risus augue, rutrum nec diam ac, feugiat eleifend justo. Vivamus id nulla ullamcorper, eleifend eros vel, dignissim nisi. Pellentesque nec ante ac leo rutrum blandit. Vivamus aliquam neque ligula, convallis aliquam metus tempus eu. Suspendisse laoreet urna vitae nunc tempus aliquam. Mauris quis leo tellus. Sed metus justo, placerat interdum felis in, laoreet sollicitudin quam.</p>
				<div class="well" >
				<p style="overflow: scroll; height: 500px !important;">
				Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent neque ipsum, aliquam non quam quis, varius condimentum libero. Nulla semper tempor lorem et viverra. Ut at libero nec lorem rutrum aliquet et eu dui. Duis quam justo, egestas eu consectetur nec, tempor eget ligula. Morbi ullamcorper mattis neque ac laoreet. Praesent rhoncus dolor quis leo vestibulum, ut congue nisl porta. Maecenas commodo, tortor et viverra iaculis, ipsum lectus laoreet est, vel vestibulum quam ante a sapien.
				Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent neque ipsum, aliquam non quam quis, varius condimentum libero. Nulla semper tempor lorem et viverra. Ut at libero nec lorem rutrum aliquet et eu dui. Duis quam justo, egestas eu consectetur nec, tempor eget ligula. Morbi ullamcorper mattis neque ac laoreet. Praesent rhoncus dolor quis leo vestibulum, ut congue nisl porta. Maecenas commodo, tortor et viverra iaculis, ipsum lectus laoreet est, vel vestibulum quam ante a sapien.
				Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent neque ipsum, aliquam non quam quis, varius condimentum libero. Nulla semper tempor lorem et viverra. Ut at libero nec lorem rutrum aliquet et eu dui. Duis quam justo, egestas eu consectetur nec, tempor eget ligula. Morbi ullamcorper mattis neque ac laoreet. Praesent rhoncus dolor quis leo vestibulum, ut congue nisl porta. Maecenas commodo, tortor et viverra iaculis, ipsum lectus laoreet est, vel vestibulum quam ante a sapien.

Praesent consequat quis nibh tristique faucibus. Suspendisse sed turpis sed metus lobortis venenatis ac et lorem. Fusce pharetra velit felis, quis blandit sem hendrerit facilisis. Nullam risus augue, rutrum nec diam ac, feugiat eleifend justo. Vivamus id nulla ullamcorper, eleifend eros vel, dignissim nisi. Pellentesque nec ante ac leo rutrum blandit. Vivamus aliquam neque ligula, convallis aliquam metus tempus eu. Suspendisse laoreet urna vitae nunc tempus aliquam. Mauris quis leo tellus. Sed metus justo, placerat interdum felis in, laoreet sollicitudin quam.</p>
				</p>
				
			  </div>
			
			<label class="checkbox "> I've Read, Understood and accepted the trading rules
					<input type="checkbox" name="ivread" id="forex" value="forex">
			</label>
			
			</div>
			
				
			</div>		
			<ul class="pager wizard">				
				<li class="previous"><a href="#">Previous</a></li>				
				<li class="next"><a href="#">Next</a></li>
				<li class="next finish" style="display:none;"><a href="javascript:;">Finish</a></li>
			</ul>
		</div>
	
		<div id="bar" class="progress progress-striped active">
		  <div class="bar"></div>
		</div>
		</div>
			</form>
	</div>
	<div class="span2"></div>
</div>
<script type="text/javascript">
	var url='<?=base_url()?>uploads/pics_agent';
	$("#ai").autocomplete({
		serviceUrl:'<?=site_url();?>/live_account/live_account/search',
		lookupFilter: function(suggestion, originalQuery, queryLowerCase) {
                var re = new RegExp('\\b' + $.Autocomplete.utils.escapeRegExChars(queryLowerCase), 'gi');
                return re.test("<img src='" + url.suggestion.agent_picture + "' />, " + suggestion.key);
        }, 
		// fungsi ini akan dijalankan ketika user memilih salah satu hasil request
		onSelect: function (suggestion) {
			//var exe = new RegExp('\\b' + $.Autocomplete.utils.escapeRegExChars(queryLowerCase), 'gi');
			//return exe("<img src='" + url.suggestion.agent_picture + "' />, " + suggestion.value);
		},
	});
	
$(document).ready(function() {
	
	$('#tanggal input').datepicker({
		format: "yyyy-mm-dd",
		startView: 2,
		orientation: "auto left",
		autoclose: true,
		todayHighlight: true
	});
	var $validator = 
		$("#my-form").validate({
		//onfocusout: false,onkeyup: false,onclick: false,
		rules:{			
			 title		:{required:true},
			first_name	:{required:true},
			last_name	:{required:true},
			date		:{required:true},
			passport	:{required:true},
			cemail		:{required:true,email:true},
			caddress	:{required:true},
			ccountry	:{required:true},
			cstate		:{required:true},
			ccity		:{required:true},
			czip		:{required:true,number:true},
			cphone		:{required:true,number:true},
			cmobile		:{required:true,number:true},
			cfax		:{required:true,number:true},
			ai			:{required:true},
			bankname	:{required:true},
			bankaddress	:{required:true},
			bankaccount	:{required:true},
			bankaccountholder	:{required:true},
			textyes		:{required:true},
			anualincome	:{required:true},
			tradingex	:{required:true},
			'invest[]'	:{required:true},
			risk		:{required:true},
			maccount	:{required:true},
			wk			:{required:true},
			hd			:{required:true},
			ivread			:{required:true},
			
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
		});
	$('#rootwizard').bootstrapWizard({
		'tabClass': 'nav nav-tabs',
		'onTabShow': function(tab, navigation, index){		
			var $total = navigation.find('li').length;
			var $current = index+1;
			var $percent = ($current/$total) * 100;
			$('#rootwizard').find('.bar').css({width:$percent+'%'});
			// If it's the last tab then hide the last button and show the finish instead
			if($current >= $total) {
				$('#rootwizard').find('.pager .next').hide();
				$('#rootwizard').find('.pager .finish').show();
				$('#rootwizard').find('.pager .finish').removeClass('disabled');
			} else {
				$('#rootwizard').find('.pager .next').show();
				$('#rootwizard').find('.pager .finish').hide();
			}
		},
		'onTabClick': function(tab, navigation, index) {
			alert('on tab click disabled');
			return false;
		},
		'onNext': function(tab, navigation, index) {
	  			var $valid = $("#my-form").valid();
	  			if(!$valid) {
	  				$validator;
	  				return false;
	  			}
	  	},
		
	});
	$('#rootwizard .finish').click(function() {
		var $valid = $("#my-form").valid();
	  		if(!$valid) {
	  			$validator;
	  			return false;
	  		}else{
			$.ajax({
			url: "<?=site_url('live_account/live_account/send');?>",
			type: "POST",
			data: $("#my-form").serialize(),
			beforeSend: function(){
				$("#loading").show();				
			},				
			success:function(data){
				console.log(data);
					if(data.retcode=="10"){
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
					}else if(data.retCode=='00'){
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
		$('#rootwizard').find("a[href*='tab1']").trigger();
	});
	
});

</script>
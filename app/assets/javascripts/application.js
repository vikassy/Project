// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree . 
$(document).ready(function  () {
	//alert('h')
	$('#date_month').live('change',function(){
		//alert('hello');
		$('#sub_cal').submit();
	});
	$('#date_year').live('change',function(){
		//alert('hello');
			$('#sub_cal').submit();
	});
	//this is to make a submit call
	$('#sub_cal').bind('submit',function  () {
		$.get($('#sub_cal').action , $(this).serialize() , null , 'script')
		get_dates();	
			return false;
		});
});
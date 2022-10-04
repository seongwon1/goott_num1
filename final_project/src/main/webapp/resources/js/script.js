$(document).ready(function(){
	$('.blind').click(function() {
		$('#ally_Menu_Ul').toggle();
	});
	
	$(window).on("scroll", function(){
		  var scroll_top = $(this).scrollTop();
		  
		  if(scroll_top > 0){
			  $('#header').css({"position": "fixed", "top": "0px",});
			  
		  }
		  if(scroll_top < 10){
			  $('#header').css('position','relative');
			  
		  }
		});
	
	$('#reply_Modal').on('click',function(){
		$('#reply_InsertWrap').css('display','flex');
	})
	$('.close').on('click',function(){
		$('#reply_InsertWrap').css('display','none');
	})
});
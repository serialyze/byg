$(document).ready(function(){
    
    $('#artist_facebook_update').click(function() {
		if($('span.error').length > 0){
			alert('Please fix entry errors first!');
		} else {
	    	$.ajax({
			  type: 'post',
			  url: '/_includes/GetSocial.php',
			  data: {action: "GetFacebookCount", name: $('#artist_facebook').val()}
			}).done(function( data ) {
				alert(data);
				$('#artist_facebook_count').val(data);
			});
		}
    });
    
    $('#artist_twitter_update').click(function() {
    	if($('span.error').length > 0){
			alert('Please fix entry errors first!');
		} else {
	    	$.ajax({
			  type: 'post',
			  url: '/_includes/GetSocial.php',
			  data: {action: "GetTwitterCount", name: $('#artist_twitter').val()}
			}).done(function( data ) {
				alert(data);
				$('#artist_twitter_count').val(data);
			});
		}
    });
    
    $('#artist_youtube_update').click(function() {
    	$.ajax({
		  type: 'post',
		  url: '/_includes/GetSocial.php',
		  data: {action: "GetYoutubeCount", name: $('#artist_youtube').val()}
		}).done(function( data ) {
			alert(data);
			$('#artist_youtube_count').val(data);
		});
    });
    
    $('#artist_soundcloud_update').click(function() {
    	$.ajax({
		  type: 'post',
		  url: '/_includes/GetSocial.php',
		  data: {action: "GetSoundcloudCount", name: $('#artist_soundcloud').val()}
		}).done(function( data ) {
			$('#artist_soundcloud_count').val(data);
		});
    });
    
    $('#button_submit').click(function() {
    	if($('span.error').length > 0){
			alert('Please fix entry errors first!');
			return false;
		}
    });
    
    $('#artist_facebook').keyup(function() {
    	$('#error_artist_facebook').remove();
    	var inputVal = $(this).val();
    	var urlReg = /\//ig; //  Matches /
    	if(urlReg.test(inputVal)) {
    		$(this).after('<span id="error_artist_facebook" class="error input_error">Facebook Page Name ONLY - no URL</span>');
    	}
    });
    
    $('#artist_twitter').keyup(function() {
    	$('#error_artist_twitter').remove();
    	var inputVal = $(this).val();
    	var urlReg = /\@/
    	if(urlReg.test(inputVal)) {
    		$(this).after('<span id="error_artist_twitter" class="error input_error">No @ symbol needed. Please remove.</span>');
    	}
    });
    
    $('#artist_instagram').keyup(function() {
    	$('#error_artist_instagram').remove();
    	var inputVal = $(this).val();
    	var urlReg = /\@/
    	if(urlReg.test(inputVal)) {
    		$(this).after('<span id="error_artist_instagram" class="error input_error">No @ symbol needed. Please remove.</span>');
    	}
    });
    
});
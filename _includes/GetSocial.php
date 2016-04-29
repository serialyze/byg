<?php


include("SocialCounter.php");
	$sc = new SocialCounter();

if(isset($_POST['action']) ) {
    $action = $_POST['action'];
    $var = isset($_POST['name']) ? $_POST['name'] : null;
    
    switch($action) {
    case 'GetFacebookCount':
    	echo $sc->GetFacebookCount($var);
   		break;
    case 'GetTwitterCount':
    	echo $sc->GetTwitterCount($var);
    	break;
    case 'GetYoutubeCount':
    	echo $sc->GetYoutubeCount($var);
    	break;
    case 'GetSoundcloudCount':
    	echo $sc->GetSoundcloudCount($var);
        break;
    default:
        die('Access denied for this function!');
	}
}

?>
<?php

require_once('_includes/SocialCounter.php'); 

$sc = new SocialCounter();

$dbhost = 'localhost';
$dbuser = 'root';
$dbpass = '';
$dbname = 'byg';
$conn = mysqli_connect( $dbhost, $dbuser, $dbpass, $dbname );
if ( mysqli_connect_errno() ) { die( mysqli_connect_errno() . " : " . mysqli_connect_error() ); }

$sql = "SELECT entry_id, field_id_5, field_id_6, field_id_8, field_id_9 FROM exp_channel_data WHERE channel_id=2";
$rs = $conn->query($sql);

if ( $rs->num_rows == 0 ) { 
	$conn->close();
	die( "No db results" ); 
}

while ( $row = $rs->fetch_object() ) { 
	$primary_key = $row->entry_id;
	$facebook_id = $row->field_id_5;
	$twitter_id = $row->field_id_6;
	$soundcloud_id = $row->field_id_8;
	$youtube_id = $row->field_id_9;
	
	$facebook_count = $sc->GetFacebookCount($facebook_id);
	$twitter_count = $sc->GetTwitterCount($twitter_id);
	$soundcloud_count = $sc->GetSoundcloudCount($soundcloud_id);
	$youtube_count = $sc->GetYouTubeCount($youtube_id);
	
	$updateSql = "UPDATE exp_channel_data SET field_id_10 = $facebook_count, field_id_field_id_11 = $twitter_count, field_id_14 = $soundcloud_id, field_id_13 = $youtube_id WHERE entry_id = $primary_key";
	$updateRs = $conn->query($updateSql);
}

$conn->close();

?>
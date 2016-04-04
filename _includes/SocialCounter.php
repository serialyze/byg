<?php

require_once('TwitterAPIExchange.php'); 

class SocialCounter{  

/*----- PRIVATE MEMBERS -----*/

    private $social_counter_settings = array( 
		//twitter       
		'twitter_user' => '@seejaneworkit',
		'consumer_key' => 'Tj6OXyNFzKC6aDViqCR4WUIJz',
		'consumer_secret' => 'oULVGdnJZNpmBT2dWK5sx8cXi4S6WVw2n9xzlqAnhIDgMB94kb',
		'oauth_access_token' => '51386858-04faURwbwH4YsPef47F5glJB4gLx8BzbuWoZgPj8m',
		'oauth_access_token_secret' => 'wsL6kg2r6VMQpsaGpDkCtUvoH7m1oUsq414RKk4kNPGZs',
		
		//facebook      
		'facebook_id' => 'darwenstheory',
		
		//Google API Key for Google related services
		'google_api_key' => 'AIzaSyCZaJdB2dK7Tj8VsSJaBY-hvlrBoj6oZJI',
		
		//Youtube           
		'youtube_channel_id' => 'UCfDMgit4HkthQ45fdgI7THA',
		
		//Soundcloud
		'soundcloud_user' => 'kipmoore',
		'soundcloud_client_id' => 'cbf0c4ebc61a0392bd9f1b5fd6e09faf',
		'soundcloud_secret' => 'd4175e90f0a06b633e63fdb92640ebfe',
		
		//Instagram
		'instagram_client_id' => 'c6780730da3b45d0a95e0d738a6725ce',
		'instagram_secret' => '6fa5b47b83944af0905a219b01ad7b6f',
		'instagram_access_token' => ''
	);
	private $last_update_date;
    
/*----- CONSTRUCTOR -----*/

    function SocialCounter(){}
    
/*----- PUBLIC METHODS -----*/

	/**
	* Facebook Like Count
	*/
	function GetFacebookCount( $facebookUserName ) {
		$facebookUserName = substr(strrchr($facebookUserName, "/"), 1);

	    $fql  = "SELECT like_count FROM link_stat WHERE url = 'https://www.facebook.com/" . $facebookUserName . "'"; 
	    $fqlURL = "https://api.facebook.com/method/fql.query?format=json&query=" . urlencode($fql);
	    
	    $ch = curl_init($fqlURL);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
		$response = '';
		if( ($json = curl_exec($ch) ) === false)
		{
    		return 0;
		}
		else
		{
			$response = curl_exec($ch);
		}
		curl_close($ch);
	    $json = json_decode($response);
	    
	    $count = 0;
	    if ( isset( $json[0]->like_count ) ) {             
			$count = intval( $json[0]->like_count );                   
		}
	    return $count;
	}
	
	/**
	* Twitter Follower Count
	*/
	//to get follower count
	function GetTwitterCount( $twitterUserName ){
		$twitterUserName = substr(strrchr($twitterUserName, "/"), 1);
	   	
	   	$apiUrl = "https://api.twitter.com/1.1/users/show.json";
		$requestMethod = 'GET';
		$getField = '?screen_name=' . $twitterUserName; 
		
		$twitter = new TwitterAPIExchange($this->social_counter_settings);
		$response = $twitter->setGetfield($getField)->buildOauth($apiUrl, $requestMethod)->performRequest(); 
		$json = json_decode($response);
		
		$count = 0;
		if ( isset( $json->followers_count ) ) {
			$count = $json->followers_count;
		}
	    return $count;
	}
	
	/**
	* YouTube Follower Count
	*/
	function GetYoutubeCount($youtubeChannelId) {
		$youtubeUrl = "https://www.googleapis.com/youtube/v3/channels?part=statistics&id=". $youtubeChannelId . "&key=" . $this->social_counter_settings['google_api_key'];
	    
	    $ch = curl_init($youtubeUrl);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
		$response = '';
		if( ($json = curl_exec($ch) ) === false)
		{
    		return 0;
		}
		else
		{
			$response = curl_exec($ch);
		}
		curl_close($ch);
	    
	    $json = json_decode($response);
	    
	    $count = 0;
		if ( isset( $json->items[0]) ) {
			if ( $json->items[0]->statistics->subscriberCount !== NULL ) {
				$count = intval( $json->items[0]->statistics -> subscriberCount);
			}                
	    }                   
	    return $count;
	}
	
	/**
	* Soundcloud Follower Count
	*/
	function GetSoundcloudCount( $soundcloudUserName ) {  
		$soundcloudUserName = substr(strrchr($soundcloudUserName, "/"), 1);
		
	    $soundcloudUrl = "http://api.soundcloud.com/users/" . $soundcloudUserName . "?client_id=" . $this->social_counter_settings['soundcloud_client_id'];
	    
	    $ch = curl_init($soundcloudUrl);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
		$response = '';
		if( ($json = curl_exec($ch) ) === false)
		{
    		return 0;
		}
		else
		{
			$response = curl_exec($ch);
		}
		curl_close($ch);
	    
	    $json = json_decode($response);
	    
	    $count = 0;
		if ( isset( $json->followers_count ) ) {
			$count = intval( $json->followers_count);                    
	    }                   
	    return $count;
	}
	
}

?>
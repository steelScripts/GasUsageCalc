<!-- 
	Miniature calculator app that is intended to make it easy to budget or
	calculate gas cost for those who frequently drive.
	
	Updates that would be cool:
		-Using Google distance matrix to allow for easier distance calculations
		-More in depth car maintenance calculators
		-Saved User accounts
		-Search bar to find locations easier

 -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link href="./styles.css" rel="stylesheet" type="text/css" />	    
	    
		<title>Gas Calculator</title>
	</head>
	
	<body>				
	    
		<!-- Map function -->
		<script>
			function myMap() {
				var startLatLng = {lat: 35.23, lng: -80.84};
				var endLatLng = {lat: 35.3, lng: -80.81};
			    var mapOptions = {
			        center: new google.maps.LatLng(35.2481706,-80.7503157),
			        zoom: 10,
			        mapTypeId: google.maps.MapTypeId.HYBRID
			    }
				
			    //Creates new map instance
			    var map = new google.maps.Map(document.getElementById("map"), mapOptions);
			    
			    //Creates Markers for map
			    
			    var start = new google.maps.Marker({
			    	position: startLatLng,
			    	map: map			    	
			    });
			    var end = new google.maps.Marker({
			    	position: endLatLng,
			    	map: map			    	
			    });
			    
				function moveEndMarker(coords){
			    	end.postion = coords;
			    }
			    
			    var infoWindow = new google.maps.InfoWindow({
			    	content:'<h3>Charlotte, NC</h3>'
			    });
			    
			    start.addListener(map, 'click', function(event){
			    	moveEndMarker(event.latLng);
			    });
			    
			    //Try HTML5 geolocation
		        if (navigator.geolocation) {
		          navigator.geolocation.getCurrentPosition(function(position) {
		            var pos = {
		              lat: position.coords.latitude,
		              lng: position.coords.longitude
		            };
					startLatLng = pos;
		            infoWindow.setPosition(pos);
		            infoWindow.setContent('Location found.');
		            infoWindow.open(map);
		            map.setCenter(pos);
		          }, function() {
		            handleLocationError(true, infoWindow, map.getCenter());
		          });
		        } else {
		          // Browser doesn't support Geolocation
		          handleLocationError(false, infoWindow, map.getCenter());
		        }
		      }
	
	      	function handleLocationError(browserHasGeolocation, infoWindow, pos) {
		        infoWindow.setPosition(pos);
		        infoWindow.setContent(browserHasGeolocation ?
		                              'Error: The Geolocation service failed.' :
		                              'Error: Your browser doesn\'t support geolocation.');
		        infoWindow.open(map);
	     	 }
		    
		</script>
				
		<!-- The Google Map API Link -->
		<script async defer
	    	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAxZ_2NGujdBJnaBoaa0lDQwGAkYQR52gY&callback=myMap">
		
	    </script>
	    
	    <!--Main Title of the Page-->	
		<div id="title">
			<h1>Gas Usage Calculator</h1>
			<h3>Calculate the cost of your trip.</h3>
		</div>	
		
		<!--Container for Map and Form  -->
		<div id="container">	
			<div id="map" action="myMap"></div>			
			<form action="calculate" method="post">
				<div class="form-text">Enter your car's MPG: <input type="text" name="mpg" size="5" /></div>
				<div class="form-text">Enter the distance in miles to your destination: <input type="text" name="distance" size="5" /></div>
				<div class="form-text">Enter the price per gallon of your last fillup: <input type="text" name="pricePerGallon" size = "5" /></div><br>
				<center><input id="submit" type="submit" value="Calculate" /></center>		
			</form>			
		</div>		
	</body>
</html> 
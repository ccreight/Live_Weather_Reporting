<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="ccreight_CSCI201_Weather1.*"%>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "CityData.*" %>
<!DOCTYPE html>
<html>
	<head>
	
		<meta charset="ISO-8859-1">
		<title>WeatherMeister</title>
		<link rel="stylesheet" href="style.css">
		
		<style>
		
			img{
				width: 200px;
                height: 200px;
			}
			#header{
            	height: 100px;
            	font-size: 2em;
            }
            #name{
            	margin-left: 50px;
            }
			.img-container{
				margin: 0px;
				padding: 20px;
				width: 220px;
				height: 220px;
				display: inline;
				float: left;
				text-align: center;
			}
			.img-row{
				margin-top: 60px;
				width: 1200px;
			}
            #body{
            	margin-left: 22%;
            	margin-right: auto;
            	margin-top: 0px;
            	position: relative;
            	top: -40px;
            }
            input[type=radio]{
            	
            	font-size: .5em;
            	class: with-gap;
            	/*z-index: 2;*/
            	background: rgba(90,90,90,0.6);
            }
			h1{
				font-size: 3em;
			}
			h3{
				font-size: 1.8em;
				font-family: "AvenirNextLight", sans-serif;
			}
			#search{
				position: absolute;
				width: 400px;
				display: inline;
				top: 20px;
				right: 150px;
			}
			a{
 				color: white;
 				text-decoration: none;
 			}
 			#overlay1,#overlay2,#overlay3,#overlay4,#overlay5,#overlay6,#overlay7,#overlay8{
 				display: none;
				width: 220px;
				height: 174px;
				font-size: 2em;
				text-align: center;
 			}
 			#title{
 				font-family: "AvenirNextLight", sans-serif;
 				float: left;
 				margin-top: 100px;
 				font-size: 1.3em;
 				margin-left: 150px;
 			}
 			label{
            	font-family: "AvenirNextLight", sans-serif;
            	font-size: 1.3em;
            }
           
            input[type=text]{
            	width: 400px;
            	height: 32px;
            	padding: 10px;
            	font-size: 1.7em;
            	font-style: oblique;
            	border-radius: 2px;
            	border: none;
            }
            input[type=text]:focus{
            	font-style: normal;
            }
            #twotextbox{
            	display: none;
            	margin-left: auto;
            	margin-right: auto;
            }
            #twotextbox input[name="lat"]{
            	width: 165px;
            	display: inline;
            }
            #twotextbox input[name="lon"]{
            	width: 165px;
            	display: inline;
            	margin-left: 5px;
            }
            #twotextbox input[type=image]{
            	position: relative;
            	top: 10px;
            	right: 45px;
            }
            #header{
            	height: 100px;
            	font-size: 2em;
            }
            #name{
            	margin-left: 50px;
            }
			#search{
				position: absolute;
				width: 600px;
				float: left;
				display: inline;
				top: 20px;
				right: 400px;
			}
			#radio{
				position: absolute;
				width: 300px;
				float: left;
				display: inline;
				top: 30px;
				right: 250px;
			}
			            /* Got code from https://www.w3schools.com/howto/howto_css_custom_checkbox.asp */
            .container {
			  padding-right: 10px;
			  position: relative;
			  padding-left: 25px;
			  margin-bottom: 10px;
			  cursor: pointer;
			  -webkit-user-select: none;
			  -moz-user-select: none;
			  -ms-user-select: none;
			  user-select: none;
			}
			
			/* Hide the browser's default radio button */
			.container input {
			  position: absolute;
			  opacity: 0;
			  cursor: pointer;
			  height: 15px;
			  width: 15px;
			  left: 0px;
			}
			
			/* Create a custom radio button */
			.checkmark {
			  position: absolute;
			  top: 0;
			  left: 0;
			  height: 15px;
			  width: 15px;
			  /*background: rgba(90,90,90,0);*/
			  background: none;
			  border-radius: 50%;
			  border: 1px solid white;
			}
		 
			/* Create the indicator (the dot/circle - hidden when not checked) */
			.checkmark:after {
			  content: "";
			  position: absolute;
			  display: none;
			}
			
			/* Show the indicator (dot/circle) when checked */
			.container input:checked ~ .checkmark:after {
			  display: block;
			}
			
			/* Style the indicator (dot/circle) */
			.container .checkmark:after {
			 	top: 3px;
				left: 3px;
				width: 9px;
				height: 9px;
				border-radius: 50%;
				background: dodgerblue;
			}
			input[type=image]{
            	width: 40px;
            	height: 40px;
            	position: relative;
            	top: 10px;
            	right: 50px;
            }
            #mapbutton{
            	display: none;
            }
            #mapsearch{
				position: absolute;
				border-radius: 5px;
				right: 570px;
				top: 31px;
			}
			#floatmap{
				display: none;
				position: fixed;
				height: 100%;
				width: 100%;
				top:0px;
				left: 0px;
				z-index: 1;
				background-color: rgba(0,0,0,.6);
			}
			#map{
				height: 600px;
				width: 1200px;
				margin-left: auto;
				margin-right: auto;
				margin-top: 200px;
			}
 			
		</style>
		
		<script>
		
			function switchone(){
				if(document.getElementById("image1").offsetParent === null){
					document.getElementById("image1").style.display = 'block';
					document.getElementById("overlay1").style.display = 'none';
				}
				else{
					document.getElementById("image1").style.display = 'none';
					document.getElementById("overlay1").style.display = 'block';
				}
			}
			function switchtwo(){
				if(document.getElementById("image2").offsetParent === null){
					document.getElementById("image2").style.display = 'block';
					document.getElementById("overlay2").style.display = 'none';
				}
				else{
					document.getElementById("image2").style.display = 'none';
					document.getElementById("overlay2").style.display = 'block';
				}
			}
			function switchthree(){
				if(document.getElementById("image3").offsetParent === null){
					document.getElementById("image3").style.display = 'block';
					document.getElementById("overlay3").style.display = 'none';
				}
				else{
					document.getElementById("image3").style.display = 'none';
					document.getElementById("overlay3").style.display = 'block';
				}
			}
			function switchfour(){
				if(document.getElementById("image4").offsetParent === null){
					document.getElementById("image4").style.display = 'block';
					document.getElementById("overlay4").style.display = 'none';
				}
				else{
					document.getElementById("image4").style.display = 'none';
					document.getElementById("overlay4").style.display = 'block';
				}
			}
			function switchfive(){
				if(document.getElementById("image5").offsetParent === null){
					document.getElementById("image5").style.display = 'block';
					document.getElementById("overlay5").style.display = 'none';
				}
				else{
					document.getElementById("image5").style.display = 'none';
					document.getElementById("overlay5").style.display = 'block';
				}
			}
			function switchsix(){
				if(document.getElementById("image6").offsetParent === null){
					document.getElementById("image6").style.display = 'block';
					document.getElementById("overlay6").style.display = 'none';
				}
				else{
					document.getElementById("image6").style.display = 'none';
					document.getElementById("overlay6").style.display = 'block';
				}
			}
			function switchseven(){
				if(document.getElementById("image7").offsetParent === null){
					document.getElementById("image7").style.display = 'block';
					document.getElementById("overlay7").style.display = 'none';
				}
				else{
					document.getElementById("image7").style.display = 'none';
					document.getElementById("overlay7").style.display = 'block';
				}
			}
			function switcheight(){
				if(document.getElementById("image8").offsetParent === null){
					document.getElementById("image8").style.display = 'block';
					document.getElementById("overlay8").style.display = 'none';
				}
				else{
					document.getElementById("image8").style.display = 'none';
					document.getElementById("overlay8").style.display = 'block';
				}
			}
			function oneText(){
				document.getElementById("onetextbox").style.display = 'block';
				document.getElementById("twotextbox").style.display = 'none';
				document.getElementById("mapbutton").style.display = 'none';
			}
			function twoText(){
				document.getElementById("twotextbox").style.display = 'block';
				document.getElementById("onetextbox").style.display = 'none';
				document.getElementById("mapbutton").style.display = 'block';
			}
			
		</script>
		
	</head>
	<body>
	
		<div id = "bg-image"></div>
		<div id = "vignette"></div>
		<div id = "border"></div>
		
		<div id = "floatmap">
			<div id = "map"></div>
		</div>
		
		<div id = "header">
			<p id = "name"><b><a href = "index.jsp">WeatherMeister</a></b></p>
		</div>
		
		<form action = "Parser" method = "GET">
			<span id = "search">
				<span id = "onetextbox">
					<input type = "text" name = "city" placeholder = "Los Angeles">
					<input type="image" src="Assignment2Images/magnifying_glass.png" alt="Search">
				</span>
				<span id = "twotextbox">
					<input type = "text" name = "lat" id = "lat" placeholder = "Latitude">
					<input type = "text" name = "lon" id = "lon" placeholder = "Longitude">
					<input type="image" src="Assignment2Images/magnifying_glass.png" alt="Search">
				</span>
			</span>
			<span id = "radio">
				
				<span class = "container">
					<span class="checkmark"></span>
	                <input type = "checkbox" name = "radio" onclick = "oneText()" checked> 
	                
	                <label for = "format1">City</label>
	            </span>
	            <span class = "container">
	           	 	<span class="checkmark"></span>
	                <input type = "checkbox" name = "radio" onclick = "twoText()">
	                
	                <label for = "format2">Location (Lat/Long)</label>
	            </span>
	               	
	        </span>
        </form>
        
        <div id = "mapbutton">
			<input type = "image" id = "mapsearch" src = "Assignment2Images/MapIcon.png" alt = "Maps" onclick = "initMap();">
		</div>
		
		<div class = "clearfloat"></div>
		
		<%
			String str = request.getParameter("cityid");
            @SuppressWarnings("unchecked")
            ArrayList<CityData> cities = (ArrayList<CityData>)session.getAttribute("cityList");
            CityData c = new CityData();
            
            for(int x = 0; x < cities.size(); x++){
            	if(cities.get(x).getId() == Integer.parseInt(str)){
            		c = cities.get(x);
            		break;
            	}
            }
            
		%>
		
		<div id = "title"><h1><%= c.getName() %></h1></div>
		<div class = "clearfloat"></div>
		
		<div id = "body">
			
			<div class = "img-row">
				<div class = "img-container">
					<div id = "image1">
		            	<img src = "Assignment2Images/planet-earth.png" onclick = "switchone()">
		            </div>
		            <% String s1 = c.getSys().getCountry(); %>
		            <div id = "overlay1" onclick = "switchone()"><p><%= s1 %></p></div>
		            <h3>Location</h3>
		        </div>
		        <div class = "img-container">
		        	<div id = "image2">
		            	<img src = "Assignment2Images/snowflake.png" onclick = "switchtwo()">
		            </div>
		            <% String s2 = Math.floor(((9.0/5)*(c.getMain().getTempMin() - 273) + 32)*100)/100 + " degrees\nFahrenheit"; %>
		            <div id = "overlay2" onclick = "switchtwo()"><p><%= s2 %></p></div>
		            <h3>Temp Low</h3>
		        </div>
		        <div class = "img-container">
		            <div id = "image3">
		            	<img src = "Assignment2Images/sun.png" onclick = "switchthree()">
		            </div>
		            <% String s3 = Math.floor(((9.0/5)*(c.getMain().getTempMax() - 273) + 32)*100)/100 + " degrees\nFahrenheit"; %>
		            <div id = "overlay3" onclick = "switchthree()"><p><%= s3 %></p></div>
		            <h3>Temp High</h3>
		        </div>
		        <div class = "img-container">
		        	<div id = "image4">
		            	<img src = "Assignment2Images/wind.png" onclick = "switchfour()">
		            </div>
		            <% String s4 = c.getWind().getSpeed() + "\nmiles/hour"; %>
		            <div id = "overlay4" onclick = "switchfour()"><p><%= s4 %></p></div>
		            <h3>Wind</h3>
		        </div>
		    </div>
		    
		    <div class = "clearfloat"></div>
		    
		    <div class = "img-row">
		        <div class = "img-container">
		        	<div id = "image5">
		            	<img src = "Assignment2Images/drop.png" onclick = "switchfive()">
		            </div>
		            <% String s5 = c.getMain().getHumidity() + "%"; %>
		            <div id = "overlay5" onclick = "switchfive()"><p><%= s5 %></p></div>
		            <h3>Humidity</h3>
		        </div>
		        <div class = "img-container">
		        	<div id = "image6">
		           		<img src = "Assignment2Images/LocationIcon.png" onclick = "switchsix()">
		           	</div>
		           	<% String s6 = c.getCoord().getLon() + ",\n" + c.getCoord().getLat(); %>
		            <div id = "overlay6" onclick = "switchsix()"><p><%= s6 %></p></div>
		            <h3>Coordinates</h3>
		        </div>
		        <div class = "img-container">
		            <div id = "image7">
		            	<img src = "Assignment2Images/thermometer.png" onclick = "switchseven()">
		            </div>
		            <% String s7 = (float)((9.0/5)*(c.getMain().getTemp() - 273) + 32) - (float)((9.0/5)*(c.getMain().getTemp() - 273) + 32)%.01 + " degrees\nFahrenheit"; %>
		            <div id = "overlay7" onclick = "switchseven()"><p><%= s7 %></p></div>
		            <h3>Current Temp</h3>
		        </div>
		        <div class = "img-container">
		        	<div id = "image8">
		            	<img src = "Assignment2Images/sunrise-icon.png" onclick = "switcheight()">
		            </div>
		            <% String s8 = c.getSys().getSunrise() + ",\n" + c.getSys().getSunset(); %>
		            <div id = "overlay8" onclick = "switcheight()"><p><%= s8 %></p></div>
		            <h3>Sunrise/set</h3>
		        </div>
			</div>
		</div>
	
		<div class = "clearfloat"></div>
		
		<script>
		
			var map = null;
		
			function initMap() {
				
		        map = new google.maps.Map(document.getElementById('map'), {
		          zoom: 4,
		          center: {lat: 38.63, lng: -90.2},
		          mapTypeControl: true,
		          mapTypeControlOptions: {
		            style: google.maps.MapTypeControlStyle.DROPDOWN_MENU,
		            mapTypeIds: ['roadmap', 'terrain']
		          }
		        });
		        
		        map.addListener('click', function(event) {
				    var lat = event.latLng.lat();
				    lat = Math.floor(lat*100) / 100;
				    document.getElementById('lat').value = lat;
				    var lng = event.latLng.lng();
				    lng = Math.floor(lng*100) / 100;
				    document.getElementById('lon').value = lng;
				    mapfloat.style.display = 'none';
				  });
		      }
		
			  var mapfloat = document.getElementById('floatmap');
			  var img = document.getElementById('mapsearch');
			  img.onclick = function(){
				  mapfloat.style.display = 'block';
			  }
			
		</script>
		
		<script async defer
	    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD7UkQ1Y6GVfYRqx0vEJzCxAzugagsUvpc&callback=initMap">
	    </script>
	
	</body>
</html>
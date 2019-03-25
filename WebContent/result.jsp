<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="ccreight_CSCI201_Weather1.*"%>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "java.util.Comparator" %>
<%@ page import = "java.util.Collections" %>
<%@ page import = "CityData.*" %>
    
<%

	//@SuppressWarnings("unchecked")
	//ArrayList<CityData> cities =  (ArrayList<CityData>)request.getAttribute("cityList");
	@SuppressWarnings("unchecked")	
	ArrayList<CityData> cities =  (ArrayList<CityData>)session.getAttribute("cityList");
	
	String str = (String)request.getAttribute("cityname");
	if(str != null){
		session.setAttribute("cityname", str);
	}
	str = (String)session.getAttribute("cityname");
	
%>    


<!DOCTYPE html>
<html>
	<head>
	
		<meta charset="ISO-8859-1">
		<title>WeatherMeister</title>
		<link rel="stylesheet" href="style.css">
		
		<style>
		
			#body{
				margin-top: 75px;
			}
			table{
				
				float: left;
				background: rgba(90,90,90,0.6);
				border: 1px solid #CCC;
				border-radius: 5px;
				font-size: 2em;
				margin-left: 100px;
				border-radius: 15px;
			}
			th,td{
				padding-left: 10px;
				padding-right: 10px;
				border-bottom: 1px solid #ddd;
				text-align: center;
			}
			th{
				padding-top: 10px;
				padding-bottom: 10px;
				width: 350px;
				height: 60px;
				font-size: 1.3em;
			}
			tr{
				height: 50px;
			}
			td{
				font-family: "AvenirNextLight", sans-serif;
			}
			#header{
				display: block;
			}
            input[type=radio]{
            	
            	font-size: .5em;
            	class: with-gap;
            	/*z-index: 2;*/
            	background: rgba(90,90,90,0.6);
            }
			h1{
				font-size: 2em;
			}
			h2{
				text-align: center;
				font-family: "AvenirNextLight", sans-serif;
				font-size: 2em;
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
			#sorting{
				width: 30%;
				margin-left: 7%;
				display: inline;
				position: absolute;
				top: 200px;
				right: 50px;
			}
			select{
				font-size: 1.7em;
				background-color: white;
			  	display: inline-block;
			}
			.dropdown{
				width: 150px;
				margin-left: 270px;
			}
			.dropdown input[type=submit]{
				-webkit-appearance: none;
				-moz-appearance: none;
				appearance: none;
				
				display: block;
				width: 250px;
				height: 50px;
				float: right;
				margin: 5px 0px;
				padding-left: 25px;
				padding-right: 75px;
				padding-top: 10px;
				padding-bottom: 10px;
				font-size: 1.3em;
				line-height: 10px;
				color: #333;
				background-color: #ffffff;
				background-image: none;
				border: 1px solid #cccccc;
				-ms-word-break: normal;
				word-break: normal;
				margin-bottom: 0px;
				margin-top: 0px;
			}
			/*.dropdown{
				position: relative;
				float: left;
				min-width: 200px;
				margin: 50px 33%;
				margin-top: 0px;
				margin-left: 30%;
			}*/
			
			/*Code below is inspired by https://codepen.io/vkjgr/pen/VYMeXp 
				and https://fabriceleven.com/design/clever-way-to-change-the-drop-down-selector-arrow-icon/*/
			#arrow:after {
				content: 'V';
				color: #333;
				/*Adjust for position however you want*/
				  
				top: 116px;
				right: 154px;
				color: white;
				font-size: 1.7em;
				padding: 7px;
				padding-top: 10px;
				padding-bottom: 4px;
				padding-left: 15px;
				width: 25px;
				height: 22x;
				border-bottom: 1px solid #999;
				
				background-image: linear-gradient(to right, deepskyblue, deepskyblue);
				  
				position: absolute;
				pointer-events: none;
			}
			
			/*Code below is inspired by https://codepen.io/vkjgr/pen/VYMeXp 
				and https://fabriceleven.com/design/clever-way-to-change-the-drop-down-selector-arrow-icon/*/
			/*.selectdiv select {
				-webkit-appearance: none;
				-moz-appearance: none;
				appearance: none;
				
				  
				display: block;
				width: 100%;
				max-width: 320px;
				height: 50px;
				float: right;
				margin: 5px 0px;
				padding: 0px 24px;
				font-size: 16px;
				line-height: 1.75;
				color: #333;
				background-color: #ffffff;
				background-image: none;
				border: 1px solid #cccccc;
				-ms-word-break: normal;
				word-break: normal;
			}*/
			#tab{
				margin-left: 50px;
				font-family: "AvenirNextLight", sans-serif;
				font-size: 1.7em;
			}
 			#sortheader{
 				display: inline;
 				font-size: 1.2em;
 			}
 			a{
 				color: white;
 				text-decoration: none;
 			}
 			input[type=image]{
            	width: 40px;
            	height: 40px;
            	position: relative;
            	top: 10px;
            	right: 50px;
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
            .last{
            	border-bottom: none;
            }
            label{
            	font-family: "AvenirNextLight", sans-serif;
            	font-size: 1.3em;
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
		
		<div id = "body">
		
			<br>
			<div id = tab><h1><%= str %></h1></div>
		
			<div id = "table">
			
				<table id = "mytable">
					<tr>
						<th>City Name</th>
						<th>Temp. Low</th>
						<th>Temp. High</th>
					</tr>
					
					<% for(int x = 0; x < cities.size(); x++){ %>
					
						<tr>
							<td><a href = "citypage.jsp?cityid=<%=cities.get(x).getId()%>"><%= cities.get(x).getName()%>, <%= cities.get(x).getSys().getCountry() %></a></td>
							<td><%= Math.floor(((9.0/5)*(cities.get(x).getMain().getTempMin() - 273) + 32)*100)/100%>&#176;</td>
							<td><%= Math.floor(((9.0/5)*(cities.get(x).getMain().getTempMax() - 273) + 32)*100)/100%>&#176;</td>		
						</tr>
						
					<% } %>
					
					<% for(int x = 8 - cities.size(); x > 0; x--){ %>
					
					<tr>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					
					<% } %>
					
				</table>
			
			</div>
			
			<div id = "sorting">
			
				<% if(cities.size() > 1){ %>
				<div id = "sortheader">
					<h2>Sort by:</h2>
				</div>
			
				<div id = "arrow"></div>
				<div class = "dropdown">
					<form method = "POST" action = "Sort">
					
						<input type = "submit" name = "sort1" id = "sort1" value = "City Name A-Z">
						<input type = "submit" name = "sort2" id = "sort2" value = "City Name Z-A">
						<input type = "submit" name = "sort3" id = "sort3" value = "Temp. Low ASC">
						<input type = "submit" name = "sort4" id = "sort4" value = "Temp. Low DESC">
						<input type = "submit" name = "sort5" id = "sort5" value = "Temp. High ASC">
						<input type = "submit" name = "sort6" id = "sort6" value = "Temp. High DESC">
					
					</form>
					
				</div>
			
				<% } %>
			
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
	
		<script>
		
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
	
		<script async defer
	    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD7UkQ1Y6GVfYRqx0vEJzCxAzugagsUvpc&callback=initMap">
	    </script>
	
	</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="ccreight_CSCI201_Weather1.*"%>
<%@ page import = "java.util.Vector" %>
<%@ page import = "java.net.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.io.*" %>
<%@ page import = "CityData.*" %>
<%@ page import = "com.google.gson.*" %>


<%
	
%>
    
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>WeatherMeister</title>
		<link rel="stylesheet" href="style.css">
		
		<style>
		
			form{
				width: 500px;
				margin-left: auto;
				margin-right: auto;
				/*z-index: -5;*/
			}
			
			input[type=text]{
				width: 400px;
				margin-left: 10%;
                padding: 10px;
                font-size: 1.5em;
                border: 3px solid #666;
                margin-top: 0px;
                color: #666;
                background: rgba(90,90,90,0.7);
                font-family: "AvenirNext";
                font-style: italic;
                /*background-image: url(Assignment2Images/magnifying_glass.png);*/
			    background-position: right; 
			    background-repeat: no-repeat;
				padding: 5px 5px 5px 5px;
				/*z-index: 2;*/
            }
            input[type=text]:focus{
            	color: #CCC;
            	font-style: normal;
            }
            #header{
            	height: 100px;
            	font-size: 2em;
            }
            #name{
            	margin-left: 50px;
            }
            input[type=image]{
            	width: 40px;
            	height: 40px;
            	position: relative;
            	top: -45px;
            	left: 415px;
            }
            #twotextbox{
            	display: none;
            	margin-left: auto;
            	margin-right: auto;
            	margin-top: 0px;
            }
            #mapbutton{
            	display: none;
            }
            #twotextbox input[name="lat"]{
            	width: 168px;
            	display: inline;
            }
            #twotextbox input[name="lon"]{
            	width: 168px;
            	display: inline;
            	margin-left: 4px;
            }
            #mag{
            	position: absolute;
            	top: 560px;
            	left: 1090px;
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
			#bullet{
				width: 300px;
				margin-left: auto;
				margin-right: auto;
			}
            input[type="submit"]{
				border: 1px solid #666;
                border-radius: 3px;
                background: rgba(90,90,90,0.6);
                color: white;
                padding-left: 30px;
                padding-right: 30px;
                padding-top: 4px;
                padding-bottom: 4px;
                font-size: 1.6em;
                /*z-index: 2;*/
			}
			#button{
				margin-left: auto;
				margin-right: auto;
				width: 182px;
			}
			#login{
				color: white;
				font-size: 1.4em;
				position: absolute;
				right: 170px;
				margin-top: 20px;
				width: 160px;
			}
			#login input[type=submit]{
				font-family: "AvenirNextLight", sans-serif;
				background: none;
				border: none;
			}
			#register{
				color: white;
				width: 160px;
				font-family: "AvenirNextLight", sans-serif;
				font-size: 1.4em;
				position: absolute;
				right: 20px;
				margin-top: 20px;
			}
			#register input[type=submit]{
				font-family: "AvenirNextLight", sans-serif;
				background: none;
				border: none;
			}
			#account{
				position: fixed; 
				right: 60px;
				top: 0px;
			}
			#accountsignedin{
				position: fixed; 
				right: 60px;
				top: 0px;
			}
			#content{
				width: 600px;
			}
			table{
				font-size: 1.4em;
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
			tr{
				height: 50px;
			}
			td{
				font-family: "AvenirNextLight", sans-serif;
				padding-left: 50px;
				padding-right: 50px;
				font-size: 1.4em;
			}
			h1{
				font-family: "AvenirNextLight", sans-serif;
				font-size: 2em;
			}
			#tabletitle{
				width: 450px;
				margin-right: auto;
				margin-left: auto;
			}
			#scroll{
				height: 500px;
				overflow: scroll;
			}
			/* Code for this from https://stackoverflow.com/questions/48960404/how-to-change-overflow-y-scrollbar-styles*/
			#scroll::-webkit-scrollbar {
		        width: 25px;
		    }
		    #scroll::-webkit-scrollbar-thumb {
		        box-shadow: inset 0 0 6px rgba(0,0,0,.3);
		        background-color: #CCC;
		        border: 1px solid #000;
		    }
					
		</style>
		
		<script>
		
			function oneText(){
				document.getElementById("onetextbox").style.display = 'block';
				document.getElementById("twotextbox").style.display = 'none';
				document.getElementById("mapbutton").style.display = 'none';
			}
			function twoText(){
				document.getElementById("twotextbox").style.display = 'block';
				document.getElementById("mapbutton").style.display = 'block';
				document.getElementById("onetextbox").style.display = 'none';
			}
			function signout(){
				session.setAttribute("log","false");
				session.setAttribute("username","null");
			}
		</script>
		
	</head>
	<body>
	
		<div id = "bg-image"></div>
		<div id = "vignette"></div>
		<div id = "border"></div>
		
		<div class = "clearfloat"></div>
		
		<div id = "floatmap">
			<div id = "map"></div>
		</div>
		
		<div id = "header">
			<p id = "name"><b><a href = "index.jsp">WeatherMeister</a></b></p>
		</div>
		
		<%
			String log = (String)session.getAttribute("log");
			if(log == null || log.trim() == ""){
				log = "false";
			}
		%>
		
		<% if(log.equals("true")){ %>
		<div id = "accountsignedin">
			<div id = "login">
				<form action = "profile.jsp" method = "POST">
					<input type = "submit" name = "submit" value = "Profile">
				</form>
			</div>
			<div id = "register">
				<form action = "ChangeSession" method = "POST">
					<input type = "submit" name = "submit" value = "Sign Out" onclick = "signout()">
				</form>
			</div>
		</div>
		<% } %>
		
		<% if(log.equals("false")){ %>
		<div id = "account">
			<div id = "login">
				<form action = "accountlogin.jsp" method = "POST">
					<input type = "submit" name = "submit" value = "Login">
				</form>
			</div>
			<div id = "register">
				<form action = "accountregistration.jsp" method = "POST">
					<input type = "submit" name = "submit" value = "Register">
				</form>
			</div>
		</div>
		<% } %>

		<%
			String s1 = (String)session.getAttribute("username");
		
			SQLMethods s = new SQLMethods();
			Vector<String> v = s.getData(s1);
		
		%>
	
		<div id = "content">
		
			<div id = "tabletitle"><h1><%= s1 %>'s Search History</h1></div>
			
			<div id = "scroll">
				
				<table>
				
						<% for(int x = 0; x < v.size(); x++){ %>
							<tr>
								<td><%= v.get(x) %></td>
							</tr>
						<% } %>
				
				</table>
			
			</div>
		
		</div>
		
	</body>
</html>
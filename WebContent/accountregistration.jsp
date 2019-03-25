<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="ccreight_CSCI201_Weather1.*"%>
<%@ page import = "java.util.Vector" %>
    
<%
	String perror = (String)request.getAttribute("perror");

	if(perror == null || perror.trim().length() == 0){
		perror = "";
	}
	String password = request.getParameter("password");
	if(password == null || password.trim().length() == 0){
		password = "";
	}
%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>WeatherMeister</title>
		<link rel="stylesheet" href="style.css">
		
		<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD7UkQ1Y6GVfYRqx0vEJzCxAzugagsUvpc&callback=initMap"
  type="text/javascript"></script>
		
		<style>
		
			form{
				width: 500px;
				margin-left: auto;
				margin-right: auto;
				/*z-index: -5;*/
			}
            #header{
            	height: 100px;
            	font-size: 2em;
            }
            #name{
            	margin-left: 50px;
            }
			#content{
				width: 600px;
				font-size: 2.1em;
			}
			input[type=text]{
				width: 500px;
				margin-left: 0px;
                padding: 10px;
                font-size: .7em;
                border: none;
                margin-top: 0px;
                color: black;
                background: white;
                font-family: "AvenirNext";
                /*background-image: url(Assignment2Images/magnifying_glass.png);*/
			    background-position: right; 
			    background-repeat: no-repeat;
				padding: 5px 5px 5px 5px;
				padding-top: 10px;
				padding-bottom: 10px;
				margin-bottom: 10px;
				/*z-index: 2;*/
            }
			#blur{
				position: fixed;
				top: 26%;
				width: 600px;
				height: 600px;
				margin-left: 35%;
				background-color: rgba(100,100,100,.7);
				filter: blur(3px);
				border-radius: 30px;
				z-index: -1;
			}
			#logo{
				width: 200px;
				height: 200px;
				margin-left: 35%;
				margin-bottom: 0px;
			}
            input[type="submit"]{
            	border: none;
            	margin-top: 25px;
                border-radius: 25px;
                background: orange;
                color: white;
                padding-left: 15px;
                padding-right: 25px;
                width: 130px;
                padding-top: 10px;
				padding-bottom: 10px;
                font-size: 1.4em;
                /*z-index: 2;*/
			}
			#button{
				margin-left: auto;
				margin-right: auto;
				width: 100px;
				font-size: .6em;
				margin-top: 0px;
			}
			#login{
				color: white;
				font-size: 1.6em;
				position: absolute;
				right: 170px;
				margin-top: 20px;
				width: 160px;
			}
			#login input[type=submit]{
				font-family: "AvenirNextLight", sans-serif;
				width: 130px;
				background: none;
				border: none;
			}
			#register{
				color: white;
				width: 160px;
				font-family: "AvenirNextLight", sans-serif;
				font-size: 1.6em;
				position: absolute;
				right: 20px;
				margin-top: 20px;
			}
			#register input[type=submit]{
				font-family: "AvenirNextLight", sans-serif;
				width: 160px;
				background: none;
				border: none;
			}
			#account{
				position: fixed;
				right: 45px;
				top: -30px;
			}
			a{
 				color: white;
 				text-decoration: none;
 			}
 			#error{
 				margin-left: auto;
 				margin-right: auto;
 				width: 300px;
 				font-size: .7em;
 			}
		</style>
		
	</head>
	<body>
	
		<div id = "bg-image"></div>
		<div id = "vignette"></div>
		<div id = "border"></div>
		
		<div class = "clearfloat"></div>
		
		<div id = "header">
			<p id = "name"><b><a href = "index.jsp">WeatherMeister</a></b></p>
		</div>
		
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
	
		<div id = "blur"></div>
	
		<div id = "content">
		
			<img src = "Assignment2Images/new-account-icon-256x256.png" alt = "Logo" id = "logo">
			
			<form action = "VerifyRegistration" method = "POST">
			
				<div id = "search-container">
					Username<input type = "text" name = "username">
					Password<input type = "text" name = "password">
					Confirm Password<input type = "text" name = "cpassword">
				</div>
				
            	<div id = "error"><font color = pink><%= perror %></font></div>
            	
            	<div id = "button"><input type = "submit" name = "submit" value = "Register"></div>
            	
			</form>
			
		</div>
		
	</body>
</html>
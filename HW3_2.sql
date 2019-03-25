DROP DATABASE IF EXISTS usersearches;
CREATE DATABASE usersearches;
USE usersearches; 

CREATE TABLE Searches(
	username VARCHAR(50) NOT NULL,
    password VARCHAR(50),
    pagename VARCHAR(50)
);

INSERT INTO Searches(username,password)
	VALUES ('admin','root');
    
INSERT INTO Searches(username,password,pagename)
	VALUES ('admin','root','New York');
package ccreight_CSCI201_Weather1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Collections;
import java.util.Vector;

public class SQLMethods {

	public String validation(String u, String p) {
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null; //stores the table returned by SELECT
		
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/usersearches?user=root&password=root");
			ps = conn.prepareStatement("SELECT * FROM Searches WHERE username=? AND password=?");
			ps.setString(1,  u); //specifies that first ? should be the fname from request
			ps.setString(2, p);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				return "success";
			}
			else {
				rs.close();
				ps.close();
				conn.close();
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/usersearches?user=root&password=root");
				ps = conn.prepareStatement("SELECT * FROM Searches WHERE username=?");
				ps.setString(1,  u); //specifies that first ? should be the fname from request
				rs = ps.executeQuery();
				
				if(rs.next()) {
					return "Incorrect Password";
				}
				else {
					return "Username Does Not Exist";
				}
			}
			
		} catch(SQLException sqle) {
			System.out.println("sqle: " + sqle.getMessage());
		} catch(ClassNotFoundException cnfe) {
			System.out.println("cnfe: " + cnfe.getMessage());
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(ps != null) {
					ps.close();
				}
				if(conn != null) {
					conn.close();
				}
			} catch(SQLException sqle) {
				System.out.println("sqle: " + sqle.getMessage());
			}
		}
		
		return "";
		
	}
	
	public void addPage(String u, String c) {
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null; //stores the table returned by SELECT
		
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/usersearches?user=root&password=root");
			Statement s = conn.createStatement();
			s.executeUpdate("INSERT INTO Searches(username,pagename) VALUES ('" + u + "','" + c + "');");
			
		} catch(SQLException sqle) {
			System.out.println("sqle: " + sqle.getMessage());
		} catch(ClassNotFoundException cnfe) {
			System.out.println("cnfe: " + cnfe.getMessage());
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(ps != null) {
					ps.close();
				}
				if(conn != null) {
					conn.close();
				}
			} catch(SQLException sqle) {
				System.out.println("sqle: " + sqle.getMessage());
			}
		}
		
	}
	
	public String registerUser(String u, String p1, String p2) {
		
		if(!p1.equals(p2)) {
			return "Passwords Do Not Match";
		}
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null; //stores the table returned by SELECT
		
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/usersearches?user=root&password=root");
			ps = conn.prepareStatement("SELECT * FROM Searches WHERE username=?");
			ps.setString(1,  u); //specifies that first ? should be the fname from request
			rs = ps.executeQuery();
			
			if(rs.next()) {
				rs.close();
				ps.close();
				conn.close();
				return "Username Already Exists";
			}
			else {
				rs.close();
				ps.close();
				conn.close();
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/usersearches?user=root&password=root");
				Statement s = conn.createStatement();
				s.executeUpdate("INSERT INTO Searches(username,password) VALUES ('" + u + "','" + p1 + "');");
			}
			
		} catch(SQLException sqle) {
			System.out.println("sqle: " + sqle.getMessage());
		} catch(ClassNotFoundException cnfe) {
			System.out.println("cnfe: " + cnfe.getMessage());
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(ps != null) {
					ps.close();
				}
				if(conn != null) {
					conn.close();
				}
			} catch(SQLException sqle) {
				System.out.println("sqle: " + sqle.getMessage());
			}
		}
		
		return "success";
		
	}
	
	public Vector<String> getData(String u) {
		
		Vector<String> v = new Vector<String>();
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null; //stores the table returned by SELECT
		
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/usersearches?user=root&password=root");
			ps = conn.prepareStatement("SELECT pagename FROM Searches WHERE username=?");
			ps.setString(1,  u);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				
				String str = rs.getString("pagename");
				if(str != null) {
					v.add(str);
				}
				
			}
			
			Collections.reverse(v);
			
		} catch(SQLException sqle) {
			System.out.println("sqle: " + sqle.getMessage());
		} catch(ClassNotFoundException cnfe) {
			System.out.println("cnfe: " + cnfe.getMessage());
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(ps != null) {
					ps.close();
				}
				if(conn != null) {
					conn.close();
				}
			} catch(SQLException sqle) {
				System.out.println("sqle: " + sqle.getMessage());
			}
		}
		
		return v;
		
	}
	
}

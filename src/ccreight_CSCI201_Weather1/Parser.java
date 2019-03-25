package ccreight_CSCI201_Weather1;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import CityData.CityData;

@WebServlet("/Parser")
public class Parser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String cityname = request.getParameter("city");
		String name = cityname;
		cityname = cityname.toLowerCase();
		String targetPage = "/result.jsp";
		@SuppressWarnings("unchecked")
		ArrayList<CityData> c = (ArrayList<CityData>)(request.getSession(false).getAttribute("cities"));
		ArrayList<CityData> cities = new ArrayList<CityData>();
		String lat = request.getParameter("lat");
		String lon = request.getParameter("lon");
		
		if((lat == null && lon == null) || (lat.trim() == "" && lon.trim() == "")) {
			if((cityname == null || cityname.trim() == ""))  {
				request.setAttribute("errorMessage", "Please enter a value or Display All.");
				targetPage = "/index.jsp";
			}
			else {
				cityname.replace(' ','-');
				for(int x = 0; x < c.size(); x++) {
					if(c.get(x).getName().toLowerCase().equals(cityname)) {
						CityData temp = new CityData();
						URL u = new URL("http://api.openweathermap.org/data/2.5/weather?id=" + java.net.URLEncoder.encode(Integer.toString(c.get(x).getId()), "UTF-8") + "&appid=3781c9885a848d247cc540b4a72ca245");
						BufferedReader br2 = new BufferedReader(new InputStreamReader(u.openStream()));
						Gson g = new Gson();
						temp = g.fromJson(br2, CityData.class);
						cities.add(temp);
					}
				}
				if(cities.isEmpty()) {
					request.setAttribute("errorMessage", "City not found. Please try again.");
					targetPage = "/index.jsp";
				}
				else {
					if(request.getSession(false).getAttribute("log") != null && !request.getSession(false).getAttribute("log").equals("false")){
						String user = (String)request.getSession(false).getAttribute("username");
						SQLMethods sql = new SQLMethods();
						sql.addPage(user, name);
					}
					request.setAttribute("errorMessage", "none");
					request.getSession(false).setAttribute("cityList", cities);
				}
				String user = (String)request.getSession(false).getAttribute("username");
				SQLMethods sql = new SQLMethods();
				sql.addPage(user, name);
			}
		}
		else {
			
			if((lat == null || lon == null || lat.trim() == "" || lon.trim() == "")) {
				request.setAttribute("errorMessage", "Please enter a value or Display All.");
				targetPage = "/index.jsp";
			}
			else{
				
				CityData temp = new CityData();
				//URL u = new URL("http://api.openweathermap.org/data/2.5/weather?id=" + java.net.URLEncoder.encode(Integer.toString(c.get(x).getId()), "UTF-8") + "&appid=3781c9885a848d247cc540b4a72ca245");
				URL u = new URL("http://api.openweathermap.org/data/2.5/weather?lat=" + lat + "&lon=" + lon + "&appid=3781c9885a848d247cc540b4a72ca245");
				BufferedReader br2 = new BufferedReader(new InputStreamReader(u.openStream()));
				Gson g = new Gson();
				temp = g.fromJson(br2, CityData.class);
				cities.add(temp);

				if(temp.getSys().getCountry() == null) {
					request.setAttribute("errorMessage", "City not found. Please try again.");
					targetPage = "/index.jsp";
				}
				else {
					//if(request.getSession(false).getAttribute("log") != null && !request.getSession(false).getAttribute("log").equals("false")){
						//String user = (String)request.getSession(false).getAttribute("username");
						//SQLMethods sql = new SQLMethods();
						//sql.addPage(user, "(" + lat + ", " + lon + ")");
					//}
					request.setAttribute("errorMessage", "none");
					request.getSession(false).setAttribute("cityList", cities);
				}
				String user = (String)request.getSession(false).getAttribute("username");
				SQLMethods sql = new SQLMethods();
				sql.addPage(user, "(" + lat + ", " + lon + ")");
			}
		}
		
		request.setAttribute("cityname", name);
		RequestDispatcher dispatch = getServletContext().getRequestDispatcher(targetPage);
		dispatch.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

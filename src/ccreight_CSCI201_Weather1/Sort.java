package ccreight_CSCI201_Weather1;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import CityData.CityData;

/**
 * Servlet implementation class Sort
 */
@WebServlet("/Sort")
public class Sort extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String type1 = request.getParameter("sort1");
		String type2 = request.getParameter("sort2");
		String type3 = request.getParameter("sort3");
		String type4 = request.getParameter("sort4");
		String type5 = request.getParameter("sort5");
		String type6 = request.getParameter("sort6");
		
		System.out.println(type1 + type2 + type3 + type4 + type5 + type6);
		
		@SuppressWarnings("unchecked")
		ArrayList<CityData> cities = (ArrayList<CityData>)(request.getSession(false).getAttribute("cityList"));
		List<CityData> c = cities;
		
		if(type1 != null && type1.equals("City Name A-Z")) {
			Collections.sort(c,new SortAZ());
		}
		else if(type2 != null && type2.equals("City Name Z-A")) {
			Collections.sort(c,new SortZA());
		}
		else if(type3 != null && type3.equals("Temp. Low ASC")) {
			Collections.sort(c,new TempLowAsc());
		}
		else if(type4 != null && type4.equals("Temp. Low DESC")) {
			Collections.sort(c,new TempLowDesc());
		}
		else if(type5 != null && type5.equals("Temp. High ASC")) {
			Collections.sort(c,new TempHighAsc());
		}
		else{
			Collections.sort(c,new TempHighDesc());
		}
		
		for(int x = 0; x < c.size(); x++) {
			cities.set(x, c.get(x));
		}
		
		request.getSession(false).setAttribute("cityList", cities);
		
		RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/result.jsp");
		dispatch.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

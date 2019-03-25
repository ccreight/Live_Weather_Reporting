package ccreight_CSCI201_Weather1;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;
import java.util.StringTokenizer;
import java.util.Vector;

import javafx.util.Pair;

public class WeatherReport {
	
	private static Map<String, City> data;
	private static String filen = "", error = "";
	
	public Map<String, City> getData(){
		return data;
	}
	
	public String getError() {
		return error;
	}
	
	public WeatherReport(String file) {
		
		URL classURL = getClass().getProtectionDomain().getCodeSource().getLocation();
		System.out.println(classURL);
		
		filen = file;
		error = "none";
	}
	
	boolean containsCity(String cityname) {
		return data.containsKey(cityname);
	}
	
	public City getCity(String cityname){
		return data.get(cityname);
	}
	
	public City getCityLatLong(double lat, double lon){
		for (City c : data.values()) {
			if(c.getLatitude() == lat && c.getLongitude() == lon) {
				return c;
			}
		}
		return null;
	}
	
	public boolean readFile() {
		
		Pair<Map<String, City>, String> p = parseFile();
		data = p.getKey();
		error = p.getValue();
	
		if(error != "none") {
			return false;
		}
		return true;
		
	}
	
	public void printAllCities() {
		
		System.out.println(data.size());
		System.out.println(error);
		
		for(City val : data.values()) {
			System.out.println(val.getCurrentTemp());
			System.out.println(val.getCountry());
			System.out.println(val.getLongitude());
			System.out.println(val.getSetTime());
			System.out.println(val.getWindSpeed());
		}
		
	}
	
	private Pair<Map<String, City>, String> parseFile(){
		
		String filename = filen;
		String errorType = "none";
		Pair<Map<String, City>, String> result;
		
		Map<String, City> data = new HashMap<String, City>();
		
		try {
			
			URL url = getClass().getResource("/../../weather.txt");
			BufferedReader br = new BufferedReader(new InputStreamReader(url.openStream()));
			
			String line = br.readLine();

			if(line == null || line.isEmpty()) {
				result = new Pair<>(data, "This file " + filename + " is empty.");
				return result;
			}
			
			while(line != null) {
				
				StringTokenizer st = new StringTokenizer(line, "|");
		
				Object obj = null;
				String actualname = "", name = "", state = "", country = "", rise = "", set = "";
				double longitude = 0, latitude = 0;
				int t = 0, dl = 0, dh = 0, h = 0, wd = 0;
				float p = 0, v = 0, ws = 0;
				Vector<String> conditions = new Vector<String>();
				
				if(st.countTokens() < 16) {
					result = new Pair<>(data, "This file " + filename + " is not formatted properly.\nThere are not enough parameters on line '" + line + "'.");
					return result;
				}
				try { //name of city
					obj = (String)st.nextElement();
					actualname = obj.toString();
					actualname = actualname.trim();
					name = actualname.toLowerCase();
				} catch(Exception e) {
					result = new Pair<>(data, "This file " + filename + " is not formatted properly.\n Unable to convert '" + obj + "' to a string.");
					return result;
				}
				try { //state name
					obj = (String)st.nextElement();
					state = obj.toString();
					state = state.trim();
				} catch(Exception e) {
					result = new Pair<>(data, "This file " + filename + " is not formatted properly.\n Unable to convert '" + obj + "' to a string.");
					return result;
				}
				try { //country name
					obj = (String)st.nextElement();
					country = obj.toString();
					country = country.trim();
				} catch(Exception e) {
					result = new Pair<>(data, "This file " + filename + " is not formatted properly.\n Unable to convert '" + obj + "' to a string.");
					return result;
				}
				try { //latitude
					obj = (String)st.nextElement();
					String str = obj.toString();
					str = str.trim();
					latitude = Double.parseDouble(str);
				} catch(Exception e) {
					result = new Pair<>(data, "This file " + filename + " is not formatted properly.\n Unable to convert '" + obj + "' to a double.");
					return result;
				}
				try { //longitude
					obj = (String)st.nextElement();
					String str = obj.toString();
					str = str.trim();
					longitude = Double.parseDouble(str);
				} catch(Exception e) {
					result = new Pair<>(data, "This file " + filename + " is not formatted properly.\n Unable to convert '" + obj + "' to a double.");
					return result;
				}
				try { //sunrise time
					obj = (String)st.nextElement();
					rise = obj.toString();
					rise = rise.trim();
				} catch(Exception e) {
					result = new Pair<>(data, "This file " + filename + " is not formatted properly.\n Unable to convert '" + obj + "' to a string.");
					return result;
				}
				try { //sunset time
					obj = (String)st.nextElement();
					set = obj.toString();
					set = set.trim();
				} catch(Exception e) {
					result = new Pair<>(data, "This file " + filename + " is not formatted properly.\n Unable to convert '" + obj + "' to a string.");
					return result;
				}
				try { //current temperature
					obj = (String)st.nextElement();
					String str = (String)obj;
					str = str.trim();
					t = Integer.parseInt(str);
				} catch(Exception e) {
					result = new Pair<>(data, "This file " + filename + " is not formatted properly.\n Unable to convert '" + obj + "' to an int.");
					return result;
				}
				try { //day's low
					obj = (String)st.nextElement();
					String str = (String)obj;
					str = str.trim();
					dl = Integer.parseInt(str);
				} catch(Exception e) {
					result = new Pair<>(data, "This file " + filename + " is not formatted properly.\n Unable to convert '" + obj + "' to an int.");
					return result;
				}
				try { //day's high
					obj = (String)st.nextElement();
					String str = (String)obj;
					str = str.trim();
					dh = Integer.parseInt(str);
				} catch(Exception e) {
					result = new Pair<>(data, "This file " + filename + " is not formatted properly.\n Unable to convert '" + obj + "' to an int.");
					return result;
				}
				try { //humidity
					obj = (String)st.nextElement();
					String str = (String)obj;
					str = str.trim();
					h = Integer.parseInt(str);
				} catch(Exception e) {
					result = new Pair<>(data, "This file " + filename + " is not formatted properly.\n Unable to convert '" + obj + "' to an int.");
					return result;
				}
				try { //pressure
					obj = (String)st.nextElement();
					String str = (String)obj;
					str = str.trim();
					p = Float.parseFloat(str);
				} catch(Exception e) {
					result = new Pair<>(data, "This file " + filename + " is not formatted properly.\n Unable to convert '" + obj + "' to a float.");
					return result;
				}
				try { //visibility
					obj = (String)st.nextElement();
					String str = (String)obj;
					str = str.trim();
					v = Float.parseFloat(str);
				} catch(Exception e) {
					result = new Pair<>(data, "This file " + filename + " is not formatted properly.\n Unable to convert '" + obj + "' to a float.");
					return result;
				}
				try { //windspeed
					obj = (String)st.nextElement();
					String str = (String)obj;
					str = str.trim();
					ws = Float.parseFloat(str);
				} catch(Exception e) {
					result = new Pair<>(data, "This file " + filename + " is not formatted properly.\n Unable to convert '" + obj + "' to a float.");
					return result;
				}
				try { //wind direction
					obj = (String)st.nextElement();
					String str = (String)obj;
					str = str.trim();
					wd = Integer.parseInt(str);
					
				} catch(Exception e) {
					result = new Pair<>(data, "This file " + filename + " is not formatted properly.\n Unable to convert '" + obj + "' to an int.");
					return result;
				}
				try { //weather conditions
					while(st.hasMoreElements()) {
						obj = (String)st.nextElement();
						String s = obj.toString();
						s = s.trim();
						conditions.add(s);
					}
				} catch(Exception e) {
					result = new Pair<>(data, "This file " + filename + " is not formatted properly.\n Unable to convert '" + obj + "' to a string.");
					return result;
				}
				
				City c = new City(actualname, name, state, country, longitude, latitude, set, rise, t, dl , dh, h, p, v, ws, wd, conditions);
				data.put(name,c);
				
				line = br.readLine();
				
			}
			
		} catch(FileNotFoundException fnfe) {
			result = new Pair<>(data, "The file " + filename + " could not be found.");
			return result;
		} catch (IOException e) {
			result = new Pair<>(data, "IOException Thrown.");
			return result;
		}
		
		result = new Pair<>(data, errorType);
		return result;
		
	}
	
}



package ccreight_CSCI201_Weather1;

import java.util.Vector;

public class City {

	private String actualname, name, state, country;
	private double lon, lat;
	private int currentTemperature;
	private int dayLow;
	private int dayHigh;
	private int humidity;
	private String riset, sett;
	private float pressure;
	private float visibility;
	private float windspeed;
	private int windDirection;
	private Vector<String> conditions;
	
	public City(String an, String n, String st, String cou,
			double longitude, double latitude, String rise, String set, 
			int t, int dl, int dh, int h, float p, float v,
			float w, int wd, Vector<String> c) {
			
		actualname = an;
		name = n;
		state = st;
		country = cou;
		lon = longitude;
		lat = latitude;
		riset = rise;
		sett = set;
		currentTemperature = t;
		dayLow = dl;
		dayHigh = dh;
		humidity = h;
		pressure = p;
		visibility = v;
		windspeed = w;
		windDirection = wd;
		conditions = c;
		
	}
	
	public String getActualName() {
		return actualname;
	}
	public String getName() {
		return name;
	}
	public String getState() {
		return state;
	}
	public String getCountry() {
		return country;
	}
	public double getLongitude() {
		return lon;
	}
	public double getLatitude() {
		return lat;
	}
	public String getRiseTime() {
		return riset;
	}
	public String getSetTime() {
		return sett;
	}
	public int getCurrentTemp() {
		return currentTemperature;
	}
	public int getDayLow() {
		return dayLow;
	}
	public int getDayHigh() {
		return dayHigh;
	}
	public int getHumidity() {
		return humidity;
	}
	public float getPressure() {
		return pressure;
	}
	public float getVisibility() {
		return visibility;
	}
	public float getWindSpeed() {
		return windspeed;
	}
	public int getWindDirection() {
		return windDirection;
	}
	public Vector<String> getConditions() {
		return conditions;
	}
	
}

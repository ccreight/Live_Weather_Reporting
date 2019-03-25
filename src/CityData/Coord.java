package CityData;

import java.util.HashMap;
import java.util.Map;
import java.lang.Math;

public class Coord {

private Double lon;
private Double lat;
private Map<String, Object> additionalProperties = new HashMap<String, Object>();

public Double getLon() {
return (Math.round(lon*100))/100.0;
}

public void setLon(Double lon) {
this.lon = lon;
}

public Double getLat() {
	return (Math.round(lat*100))/100.0;
}

public void setLat(Double lat) {
this.lat = lat;
}

public Map<String, Object> getAdditionalProperties() {
return this.additionalProperties;
}

public void setAdditionalProperty(String name, Object value) {
this.additionalProperties.put(name, value);
}

}

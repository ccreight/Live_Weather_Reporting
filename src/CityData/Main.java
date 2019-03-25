package CityData;

import java.util.HashMap;
import java.util.Map;

import com.google.gson.annotations.SerializedName;

public class Main {

private Double temp;
private Double pressure;
private Integer humidity;
@SerializedName("temp_min")
private Double tempMin;
@SerializedName("temp_max")
private Double tempMax;
private Map<String, Object> additionalProperties = new HashMap<String, Object>();

public Double getTemp() {
return temp;
}

public void setTemp(Double temp) {
this.temp = temp;
}

public Double getPressure() {
return pressure;
}

public void setPressure(Double pressure) {
this.pressure = pressure;
}

public Integer getHumidity() {
return humidity;
}

public void setHumidity(Integer humidity) {
this.humidity = humidity;
}

public Double getTempMin() {
return tempMin;
}

public void setTempMin(Double tempMin) {
this.tempMin = tempMin;
}

public Double getTempMax() {
return tempMax;
}

public void setTempMax(Double tempMax) {
this.tempMax = tempMax;
}

public Map<String, Object> getAdditionalProperties() {
return this.additionalProperties;
}

public void setAdditionalProperty(String name, Object value) {
this.additionalProperties.put(name, value);
}

}

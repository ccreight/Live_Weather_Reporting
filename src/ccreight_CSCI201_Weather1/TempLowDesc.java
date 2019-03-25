package ccreight_CSCI201_Weather1;

import java.util.Comparator;

import CityData.CityData;

public class TempLowDesc implements Comparator<CityData> 
{ 
    public int compare(CityData a, CityData b) 
    { 
    	return (int)(b.getMain().getTempMin() - a.getMain().getTempMin());  
    } 
}

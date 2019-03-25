package ccreight_CSCI201_Weather1;

import java.util.Comparator;

import CityData.CityData;

public class TempLowAsc implements Comparator<CityData> 
{ 
    public int compare(CityData a, CityData b) 
    { 
    	return (int)(a.getMain().getTempMin() - b.getMain().getTempMin()); 
    } 
} 

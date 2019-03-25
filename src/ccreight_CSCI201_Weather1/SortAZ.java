package ccreight_CSCI201_Weather1;

import java.util.Comparator;

import CityData.CityData;

public class SortAZ implements Comparator<CityData> 
{ 
	public int compare(CityData a, CityData b) 
    { 
        return a.getSys().getCountry().compareTo(b.getSys().getCountry()); 
    } 
} 
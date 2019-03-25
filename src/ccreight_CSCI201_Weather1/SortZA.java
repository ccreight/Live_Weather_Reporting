package ccreight_CSCI201_Weather1;

import java.util.Comparator;

import CityData.CityData;

public class SortZA implements Comparator<CityData> 
{ 
    public int compare(CityData a, CityData b) 
    { 
        return b.getSys().getCountry().compareTo(a.getSys().getCountry()); 
    } 
}

package ccreight_CSCI201_Weather1;

import java.util.Comparator;

import CityData.CityData;

public class TempHighAsc implements Comparator<CityData> 
{ 
    public int compare(CityData a, CityData b) 
    { 
        return (int)(a.getMain().getTempMax() - b.getMain().getTempMax()); 
    } 
}
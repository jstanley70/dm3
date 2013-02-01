package com.lacunalabs.dm.data.physics.experiment;

import java.util.ArrayList;
import java.util.Collection;

public class DiffractionPattern {
	
	static public DiffractionPattern getSimplePattern()
	{
		DiffractionPattern pattern = new DiffractionPattern();
		Collection<DiffractionSpot> spots = pattern.getSpots();
		spots.add(new DiffractionSpot(0,0,0,0,0,0,1));
		spots.add(new DiffractionSpot(1,1,0,1,1,0,1));
		spots.add(new DiffractionSpot(0,1,0,0,1,0,1));
		spots.add(new DiffractionSpot(0,-1,0,0,-1,0,1));
		spots.add(new DiffractionSpot(1,0,0,1,0,0,1));
		spots.add(new DiffractionSpot(-1,0,0,-1,0,0,1));
		spots.add(new DiffractionSpot(-1,1,0,-1,1,0,1));
		spots.add(new DiffractionSpot(-1,-1,0,-1,-1,0,1));
		spots.add(new DiffractionSpot(1,-1,0,1,-1,0,1));
		return pattern;
	}
	
	Collection<DiffractionSpot> spots;
	
	public DiffractionPattern()
	{
		spots = new ArrayList<DiffractionSpot>();
	}
	

	public Collection<DiffractionSpot> getSpots() {
		return spots;
	}	
}

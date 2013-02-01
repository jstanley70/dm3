package com.lacunalabs.dm.processing;

import java.util.Comparator;

public class DspaceComparator implements Comparator<Dspace> {
	@Override
    public int compare(Dspace d1, Dspace d2) {
        return d1.getDspace().compareTo(d2.getDspace());
    }

}

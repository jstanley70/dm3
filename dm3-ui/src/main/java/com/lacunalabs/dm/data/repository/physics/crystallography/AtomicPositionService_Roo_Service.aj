// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.data.repository.physics.crystallography;

import com.lacunalabs.dm.data.physics.crystallography.AtomicPosition;
import com.lacunalabs.dm.data.repository.physics.crystallography.AtomicPositionService;
import java.math.BigInteger;
import java.util.List;

privileged aspect AtomicPositionService_Roo_Service {
    
    public abstract long AtomicPositionService.countAllAtomicPositions();    
    public abstract void AtomicPositionService.deleteAtomicPosition(AtomicPosition atomicPosition);    
    public abstract AtomicPosition AtomicPositionService.findAtomicPosition(BigInteger id);    
    public abstract List<AtomicPosition> AtomicPositionService.findAllAtomicPositions();    
    public abstract List<AtomicPosition> AtomicPositionService.findAtomicPositionEntries(int firstResult, int maxResults);    
    public abstract void AtomicPositionService.saveAtomicPosition(AtomicPosition atomicPosition);    
    public abstract AtomicPosition AtomicPositionService.updateAtomicPosition(AtomicPosition atomicPosition);    
}
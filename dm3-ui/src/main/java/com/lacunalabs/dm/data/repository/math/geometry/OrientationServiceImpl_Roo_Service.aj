// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.data.repository.math.geometry;

import com.lacunalabs.dm.data.math.geometry.Orientation;
import com.lacunalabs.dm.data.repository.math.geometry.OrientationRepository;
import com.lacunalabs.dm.data.repository.math.geometry.OrientationServiceImpl;
import java.math.BigInteger;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

privileged aspect OrientationServiceImpl_Roo_Service {
    
    declare @type: OrientationServiceImpl: @Service;
    
    declare @type: OrientationServiceImpl: @Transactional;
    
    @Autowired
    OrientationRepository OrientationServiceImpl.orientationRepository;
    
    public long OrientationServiceImpl.countAllOrientations() {
        return orientationRepository.count();
    }
    
    public void OrientationServiceImpl.deleteOrientation(Orientation orientation) {
        orientationRepository.delete(orientation);
    }
    
    public Orientation OrientationServiceImpl.findOrientation(BigInteger id) {
        return orientationRepository.findOne(id);
    }
    
    public List<Orientation> OrientationServiceImpl.findAllOrientations() {
        return orientationRepository.findAll();
    }
    
    public List<Orientation> OrientationServiceImpl.findOrientationEntries(int firstResult, int maxResults) {
        return orientationRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }
    
    public void OrientationServiceImpl.saveOrientation(Orientation orientation) {
        orientationRepository.save(orientation);
    }
    
    public Orientation OrientationServiceImpl.updateOrientation(Orientation orientation) {
        return orientationRepository.save(orientation);
    }
    
}

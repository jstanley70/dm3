// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.data.repository.physics.crystallography;

import com.lacunalabs.dm.data.physics.crystallography.Centering;
import com.lacunalabs.dm.data.repository.physics.crystallography.CenteringRepository;
import com.lacunalabs.dm.data.repository.physics.crystallography.CenteringServiceImpl;
import java.math.BigInteger;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

privileged aspect CenteringServiceImpl_Roo_Service {
    
    declare @type: CenteringServiceImpl: @Service;
    
    declare @type: CenteringServiceImpl: @Transactional;
    
    @Autowired
    CenteringRepository CenteringServiceImpl.centeringRepository;
    
    public long CenteringServiceImpl.countAllCenterings() {
        return centeringRepository.count();
    }
    
    public void CenteringServiceImpl.deleteCentering(Centering centering) {
        centeringRepository.delete(centering);
    }
    
    public Centering CenteringServiceImpl.findCentering(BigInteger id) {
        return centeringRepository.findOne(id);
    }
    
    public List<Centering> CenteringServiceImpl.findAllCenterings() {
        return centeringRepository.findAll();
    }
    
    public List<Centering> CenteringServiceImpl.findCenteringEntries(int firstResult, int maxResults) {
        return centeringRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }
    
    public void CenteringServiceImpl.saveCentering(Centering centering) {
        centeringRepository.save(centering);
    }
    
    public Centering CenteringServiceImpl.updateCentering(Centering centering) {
        return centeringRepository.save(centering);
    }
    
}

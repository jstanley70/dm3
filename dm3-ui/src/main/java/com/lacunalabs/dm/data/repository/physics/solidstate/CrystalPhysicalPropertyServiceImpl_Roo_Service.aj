// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.data.repository.physics.solidstate;

import com.lacunalabs.dm.data.physics.solidstate.CrystalPhysicalProperty;
import com.lacunalabs.dm.data.repository.physics.solidstate.CrystalPhysicalPropertyRepository;
import com.lacunalabs.dm.data.repository.physics.solidstate.CrystalPhysicalPropertyServiceImpl;
import java.math.BigInteger;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

privileged aspect CrystalPhysicalPropertyServiceImpl_Roo_Service {
    
    declare @type: CrystalPhysicalPropertyServiceImpl: @Service;
    
    declare @type: CrystalPhysicalPropertyServiceImpl: @Transactional;
    
    @Autowired
    CrystalPhysicalPropertyRepository CrystalPhysicalPropertyServiceImpl.crystalPhysicalPropertyRepository;
    
    public long CrystalPhysicalPropertyServiceImpl.countAllCrystalPhysicalPropertys() {
        return crystalPhysicalPropertyRepository.count();
    }
    
    public void CrystalPhysicalPropertyServiceImpl.deleteCrystalPhysicalProperty(CrystalPhysicalProperty crystalPhysicalProperty) {
        crystalPhysicalPropertyRepository.delete(crystalPhysicalProperty);
    }
    
    public CrystalPhysicalProperty CrystalPhysicalPropertyServiceImpl.findCrystalPhysicalProperty(BigInteger id) {
        return crystalPhysicalPropertyRepository.findOne(id);
    }
    
    public List<CrystalPhysicalProperty> CrystalPhysicalPropertyServiceImpl.findAllCrystalPhysicalPropertys() {
        return crystalPhysicalPropertyRepository.findAll();
    }
    
    public List<CrystalPhysicalProperty> CrystalPhysicalPropertyServiceImpl.findCrystalPhysicalPropertyEntries(int firstResult, int maxResults) {
        return crystalPhysicalPropertyRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }
    
    public void CrystalPhysicalPropertyServiceImpl.saveCrystalPhysicalProperty(CrystalPhysicalProperty crystalPhysicalProperty) {
        crystalPhysicalPropertyRepository.save(crystalPhysicalProperty);
    }
    
    public CrystalPhysicalProperty CrystalPhysicalPropertyServiceImpl.updateCrystalPhysicalProperty(CrystalPhysicalProperty crystalPhysicalProperty) {
        return crystalPhysicalPropertyRepository.save(crystalPhysicalProperty);
    }
    
}

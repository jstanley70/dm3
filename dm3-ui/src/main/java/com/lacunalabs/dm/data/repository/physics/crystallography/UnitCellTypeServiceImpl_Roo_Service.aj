// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.data.repository.physics.crystallography;

import com.lacunalabs.dm.data.physics.crystallography.UnitCellType;
import com.lacunalabs.dm.data.repository.physics.crystallography.UnitCellTypeRepository;
import com.lacunalabs.dm.data.repository.physics.crystallography.UnitCellTypeServiceImpl;
import java.math.BigInteger;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

privileged aspect UnitCellTypeServiceImpl_Roo_Service {
    
    declare @type: UnitCellTypeServiceImpl: @Service;
    
    declare @type: UnitCellTypeServiceImpl: @Transactional;
    
    @Autowired
    UnitCellTypeRepository UnitCellTypeServiceImpl.unitCellTypeRepository;
    
    public long UnitCellTypeServiceImpl.countAllUnitCellTypes() {
        return unitCellTypeRepository.count();
    }
    
    public void UnitCellTypeServiceImpl.deleteUnitCellType(UnitCellType unitCellType) {
        unitCellTypeRepository.delete(unitCellType);
    }
    
    public UnitCellType UnitCellTypeServiceImpl.findUnitCellType(BigInteger id) {
        return unitCellTypeRepository.findOne(id);
    }
    
    public List<UnitCellType> UnitCellTypeServiceImpl.findAllUnitCellTypes() {
        return unitCellTypeRepository.findAll();
    }
    
    public List<UnitCellType> UnitCellTypeServiceImpl.findUnitCellTypeEntries(int firstResult, int maxResults) {
        return unitCellTypeRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }
    
    public void UnitCellTypeServiceImpl.saveUnitCellType(UnitCellType unitCellType) {
        unitCellTypeRepository.save(unitCellType);
    }
    
    public UnitCellType UnitCellTypeServiceImpl.updateUnitCellType(UnitCellType unitCellType) {
        return unitCellTypeRepository.save(unitCellType);
    }
    
}

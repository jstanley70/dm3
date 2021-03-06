// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.data.repository.physics.crystallography;

import com.lacunalabs.dm.data.physics.crystallography.UnitCell;
import com.lacunalabs.dm.data.repository.physics.crystallography.UnitCellRepository;
import com.lacunalabs.dm.data.repository.physics.crystallography.UnitCellServiceImpl;
import java.math.BigInteger;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

privileged aspect UnitCellServiceImpl_Roo_Service {
    
    declare @type: UnitCellServiceImpl: @Service;
    
    declare @type: UnitCellServiceImpl: @Transactional;
    
    @Autowired
    UnitCellRepository UnitCellServiceImpl.unitCellRepository;
    
    public long UnitCellServiceImpl.countAllUnitCells() {
        return unitCellRepository.count();
    }
    
    public void UnitCellServiceImpl.deleteUnitCell(UnitCell unitCell) {
        unitCellRepository.delete(unitCell);
    }
    
    public UnitCell UnitCellServiceImpl.findUnitCell(BigInteger id) {
        return unitCellRepository.findOne(id);
    }
    
    public List<UnitCell> UnitCellServiceImpl.findAllUnitCells() {
        return unitCellRepository.findAll();
    }
    
    public List<UnitCell> UnitCellServiceImpl.findUnitCellEntries(int firstResult, int maxResults) {
        return unitCellRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }
    
    public void UnitCellServiceImpl.saveUnitCell(UnitCell unitCell) {
        unitCellRepository.save(unitCell);
    }
    
    public UnitCell UnitCellServiceImpl.updateUnitCell(UnitCell unitCell) {
        return unitCellRepository.save(unitCell);
    }
    
}

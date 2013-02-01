// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.data.repository.physics.crystallography;

import com.lacunalabs.dm.data.physics.crystallography.UnitCellType;
import com.lacunalabs.dm.data.repository.physics.crystallography.UnitCellTypeService;
import java.math.BigInteger;
import java.util.List;

privileged aspect UnitCellTypeService_Roo_Service {
    
    public abstract long UnitCellTypeService.countAllUnitCellTypes();    
    public abstract void UnitCellTypeService.deleteUnitCellType(UnitCellType unitCellType);    
    public abstract UnitCellType UnitCellTypeService.findUnitCellType(BigInteger id);    
    public abstract List<UnitCellType> UnitCellTypeService.findAllUnitCellTypes();    
    public abstract List<UnitCellType> UnitCellTypeService.findUnitCellTypeEntries(int firstResult, int maxResults);    
    public abstract void UnitCellTypeService.saveUnitCellType(UnitCellType unitCellType);    
    public abstract UnitCellType UnitCellTypeService.updateUnitCellType(UnitCellType unitCellType);    
}
// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.data.repository.physics.solidstate;

import com.lacunalabs.dm.data.physics.solidstate.MaterialComponent;
import com.lacunalabs.dm.data.repository.physics.solidstate.MaterialComponentService;
import java.math.BigInteger;
import java.util.List;

privileged aspect MaterialComponentService_Roo_Service {
    
    public abstract long MaterialComponentService.countAllMaterialComponents();    
    public abstract void MaterialComponentService.deleteMaterialComponent(MaterialComponent materialComponent);    
    public abstract MaterialComponent MaterialComponentService.findMaterialComponent(BigInteger id);    
    public abstract List<MaterialComponent> MaterialComponentService.findAllMaterialComponents();    
    public abstract List<MaterialComponent> MaterialComponentService.findMaterialComponentEntries(int firstResult, int maxResults);    
    public abstract void MaterialComponentService.saveMaterialComponent(MaterialComponent materialComponent);    
    public abstract MaterialComponent MaterialComponentService.updateMaterialComponent(MaterialComponent materialComponent);    
}

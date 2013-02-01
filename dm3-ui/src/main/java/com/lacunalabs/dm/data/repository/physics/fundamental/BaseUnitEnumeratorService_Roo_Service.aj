// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.data.repository.physics.fundamental;

import com.lacunalabs.dm.data.physics.fundamental.BaseUnitEnumerator;
import com.lacunalabs.dm.data.repository.physics.fundamental.BaseUnitEnumeratorService;
import java.math.BigInteger;
import java.util.List;

privileged aspect BaseUnitEnumeratorService_Roo_Service {
    
    public abstract long BaseUnitEnumeratorService.countAllBaseUnitEnumerators();    
    public abstract void BaseUnitEnumeratorService.deleteBaseUnitEnumerator(BaseUnitEnumerator baseUnitEnumerator);    
    public abstract BaseUnitEnumerator BaseUnitEnumeratorService.findBaseUnitEnumerator(BigInteger id);    
    public abstract List<BaseUnitEnumerator> BaseUnitEnumeratorService.findAllBaseUnitEnumerators();    
    public abstract List<BaseUnitEnumerator> BaseUnitEnumeratorService.findBaseUnitEnumeratorEntries(int firstResult, int maxResults);    
    public abstract void BaseUnitEnumeratorService.saveBaseUnitEnumerator(BaseUnitEnumerator baseUnitEnumerator);    
    public abstract BaseUnitEnumerator BaseUnitEnumeratorService.updateBaseUnitEnumerator(BaseUnitEnumerator baseUnitEnumerator);    
}

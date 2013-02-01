// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.data.repository.physics.fundamental;

import com.lacunalabs.dm.data.physics.fundamental.PeriodicTableEntry;
import com.lacunalabs.dm.data.repository.physics.fundamental.PeriodicTableEntryRepository;
import com.lacunalabs.dm.data.repository.physics.fundamental.PeriodicTableEntryServiceImpl;
import java.math.BigInteger;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

privileged aspect PeriodicTableEntryServiceImpl_Roo_Service {
    
    declare @type: PeriodicTableEntryServiceImpl: @Service;
    
    declare @type: PeriodicTableEntryServiceImpl: @Transactional;
    
    @Autowired
    PeriodicTableEntryRepository PeriodicTableEntryServiceImpl.periodicTableEntryRepository;
    
    public long PeriodicTableEntryServiceImpl.countAllPeriodicTableEntrys() {
        return periodicTableEntryRepository.count();
    }
    
    public void PeriodicTableEntryServiceImpl.deletePeriodicTableEntry(PeriodicTableEntry periodicTableEntry) {
        periodicTableEntryRepository.delete(periodicTableEntry);
    }
    
    public PeriodicTableEntry PeriodicTableEntryServiceImpl.findPeriodicTableEntry(BigInteger id) {
        return periodicTableEntryRepository.findOne(id);
    }
    
    public List<PeriodicTableEntry> PeriodicTableEntryServiceImpl.findAllPeriodicTableEntrys() {
        return periodicTableEntryRepository.findAll();
    }
    
    public List<PeriodicTableEntry> PeriodicTableEntryServiceImpl.findPeriodicTableEntryEntries(int firstResult, int maxResults) {
        return periodicTableEntryRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }
    
    public void PeriodicTableEntryServiceImpl.savePeriodicTableEntry(PeriodicTableEntry periodicTableEntry) {
        periodicTableEntryRepository.save(periodicTableEntry);
    }
    
    public PeriodicTableEntry PeriodicTableEntryServiceImpl.updatePeriodicTableEntry(PeriodicTableEntry periodicTableEntry) {
        return periodicTableEntryRepository.save(periodicTableEntry);
    }
    
}
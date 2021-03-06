// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.data.physics.fundamental;

import com.lacunalabs.dm.data.physics.fundamental.CompositeParticleDataOnDemand;
import com.lacunalabs.dm.data.physics.fundamental.PeriodicTableEntry;
import com.lacunalabs.dm.data.physics.fundamental.PeriodicTableEntryDataOnDemand;
import com.lacunalabs.dm.data.repository.physics.fundamental.PeriodicTableEntryService;
import com.lacunalabs.dm.shared.physics.fundamental.ElementClassification;
import com.lacunalabs.dm.shared.physics.fundamental.PeriodicTableBlock;
import java.math.BigInteger;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect PeriodicTableEntryDataOnDemand_Roo_DataOnDemand {
    
    declare @type: PeriodicTableEntryDataOnDemand: @Component;
    
    private Random PeriodicTableEntryDataOnDemand.rnd = new SecureRandom();
    
    private List<PeriodicTableEntry> PeriodicTableEntryDataOnDemand.data;
    
    @Autowired
    private CompositeParticleDataOnDemand PeriodicTableEntryDataOnDemand.compositeParticleDataOnDemand;
    
    @Autowired
    PeriodicTableEntryService PeriodicTableEntryDataOnDemand.periodicTableEntryService;
    
    public PeriodicTableEntry PeriodicTableEntryDataOnDemand.getNewTransientPeriodicTableEntry(int index) {
        PeriodicTableEntry obj = new PeriodicTableEntry();
        setBlock(obj, index);
        setClassification(obj, index);
        setPeriod(obj, index);
        setSymbol(obj, index);
        setTableGroup(obj, index);
        return obj;
    }
    
    public void PeriodicTableEntryDataOnDemand.setBlock(PeriodicTableEntry obj, int index) {
        PeriodicTableBlock block = PeriodicTableBlock.class.getEnumConstants()[0];
        obj.setBlock(block);
    }
    
    public void PeriodicTableEntryDataOnDemand.setClassification(PeriodicTableEntry obj, int index) {
        ElementClassification classification = ElementClassification.class.getEnumConstants()[0];
        obj.setClassification(classification);
    }
    
    public void PeriodicTableEntryDataOnDemand.setPeriod(PeriodicTableEntry obj, int index) {
        Integer period = new Integer(index);
        obj.setPeriod(period);
    }
    
    public void PeriodicTableEntryDataOnDemand.setSymbol(PeriodicTableEntry obj, int index) {
        String symbol = "symbol_" + index;
        obj.setSymbol(symbol);
    }
    
    public void PeriodicTableEntryDataOnDemand.setTableGroup(PeriodicTableEntry obj, int index) {
        Integer tableGroup = new Integer(index);
        obj.setTableGroup(tableGroup);
    }
    
    public PeriodicTableEntry PeriodicTableEntryDataOnDemand.getSpecificPeriodicTableEntry(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        PeriodicTableEntry obj = data.get(index);
        BigInteger id = obj.getId();
        return periodicTableEntryService.findPeriodicTableEntry(id);
    }
    
    public PeriodicTableEntry PeriodicTableEntryDataOnDemand.getRandomPeriodicTableEntry() {
        init();
        PeriodicTableEntry obj = data.get(rnd.nextInt(data.size()));
        BigInteger id = obj.getId();
        return periodicTableEntryService.findPeriodicTableEntry(id);
    }
    
    public boolean PeriodicTableEntryDataOnDemand.modifyPeriodicTableEntry(PeriodicTableEntry obj) {
        return false;
    }
    
    public void PeriodicTableEntryDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = periodicTableEntryService.findPeriodicTableEntryEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'PeriodicTableEntry' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<PeriodicTableEntry>();
        for (int i = 0; i < 10; i++) {
            PeriodicTableEntry obj = getNewTransientPeriodicTableEntry(i);
            try {
                periodicTableEntryService.savePeriodicTableEntry(obj);
            } catch (ConstraintViolationException e) {
                StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getConstraintDescriptor()).append(":").append(cv.getMessage()).append("=").append(cv.getInvalidValue()).append("]");
                }
                throw new RuntimeException(msg.toString(), e);
            }
            data.add(obj);
        }
    }
    
}

// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.data.physics.fundamental;

import com.lacunalabs.dm.data.physics.fundamental.PhysicalConstant;
import com.lacunalabs.dm.data.physics.fundamental.PhysicalConstantDataOnDemand;
import com.lacunalabs.dm.data.physics.fundamental.UnitDataOnDemand;
import com.lacunalabs.dm.data.repository.physics.fundamental.PhysicalConstantService;
import com.lacunalabs.dm.shared.physics.fundamental.MetaDataType;
import com.lacunalabs.dm.shared.physics.fundamental.UncertaintyType;
import java.math.BigDecimal;
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

privileged aspect PhysicalConstantDataOnDemand_Roo_DataOnDemand {
    
    declare @type: PhysicalConstantDataOnDemand: @Component;
    
    private Random PhysicalConstantDataOnDemand.rnd = new SecureRandom();
    
    private List<PhysicalConstant> PhysicalConstantDataOnDemand.data;
    
    @Autowired
    private UnitDataOnDemand PhysicalConstantDataOnDemand.unitDataOnDemand;
    
    @Autowired
    PhysicalConstantService PhysicalConstantDataOnDemand.physicalConstantService;
    
    public PhysicalConstant PhysicalConstantDataOnDemand.getNewTransientPhysicalConstant(int index) {
        PhysicalConstant obj = new PhysicalConstant();
        setMetadata(obj, index);
        setMetadataType(obj, index);
        setName(obj, index);
        setQuantity(obj, index);
        setSymbol(obj, index);
        setUncertainty(obj, index);
        setUncertaintyType(obj, index);
        return obj;
    }
    
    public void PhysicalConstantDataOnDemand.setMetadata(PhysicalConstant obj, int index) {
        String metadata = "metadata_" + index;
        obj.setMetadata(metadata);
    }
    
    public void PhysicalConstantDataOnDemand.setMetadataType(PhysicalConstant obj, int index) {
        MetaDataType metadataType = MetaDataType.class.getEnumConstants()[0];
        obj.setMetadataType(metadataType);
    }
    
    public void PhysicalConstantDataOnDemand.setName(PhysicalConstant obj, int index) {
        String name = "name_" + index;
        obj.setName(name);
    }
    
    public void PhysicalConstantDataOnDemand.setQuantity(PhysicalConstant obj, int index) {
        BigDecimal quantity = BigDecimal.valueOf(index);
        obj.setQuantity(quantity);
    }
    
    public void PhysicalConstantDataOnDemand.setSymbol(PhysicalConstant obj, int index) {
        String symbol = "symbol_" + index;
        obj.setSymbol(symbol);
    }
    
    public void PhysicalConstantDataOnDemand.setUncertainty(PhysicalConstant obj, int index) {
        BigDecimal uncertainty = BigDecimal.valueOf(index);
        obj.setUncertainty(uncertainty);
    }
    
    public void PhysicalConstantDataOnDemand.setUncertaintyType(PhysicalConstant obj, int index) {
        UncertaintyType uncertaintyType = UncertaintyType.class.getEnumConstants()[0];
        obj.setUncertaintyType(uncertaintyType);
    }
    
    public PhysicalConstant PhysicalConstantDataOnDemand.getSpecificPhysicalConstant(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        PhysicalConstant obj = data.get(index);
        BigInteger id = obj.getId();
        return physicalConstantService.findPhysicalConstant(id);
    }
    
    public PhysicalConstant PhysicalConstantDataOnDemand.getRandomPhysicalConstant() {
        init();
        PhysicalConstant obj = data.get(rnd.nextInt(data.size()));
        BigInteger id = obj.getId();
        return physicalConstantService.findPhysicalConstant(id);
    }
    
    public boolean PhysicalConstantDataOnDemand.modifyPhysicalConstant(PhysicalConstant obj) {
        return false;
    }
    
    public void PhysicalConstantDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = physicalConstantService.findPhysicalConstantEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'PhysicalConstant' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<PhysicalConstant>();
        for (int i = 0; i < 10; i++) {
            PhysicalConstant obj = getNewTransientPhysicalConstant(i);
            try {
                physicalConstantService.savePhysicalConstant(obj);
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
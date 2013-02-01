// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.data.physics.fundamental;

import com.lacunalabs.dm.data.physics.fundamental.CompositeParticleDataOnDemand;
import com.lacunalabs.dm.data.physics.fundamental.ParticlePhysicalProperty;
import com.lacunalabs.dm.data.physics.fundamental.ParticlePhysicalPropertyDataOnDemand;
import com.lacunalabs.dm.data.physics.fundamental.PhysicalPropertyTypeDataOnDemand;
import com.lacunalabs.dm.data.repository.physics.fundamental.ParticlePhysicalPropertyService;
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

privileged aspect ParticlePhysicalPropertyDataOnDemand_Roo_DataOnDemand {
    
    declare @type: ParticlePhysicalPropertyDataOnDemand: @Component;
    
    private Random ParticlePhysicalPropertyDataOnDemand.rnd = new SecureRandom();
    
    private List<ParticlePhysicalProperty> ParticlePhysicalPropertyDataOnDemand.data;
    
    @Autowired
    private CompositeParticleDataOnDemand ParticlePhysicalPropertyDataOnDemand.compositeParticleDataOnDemand;
    
    @Autowired
    private PhysicalPropertyTypeDataOnDemand ParticlePhysicalPropertyDataOnDemand.physicalPropertyTypeDataOnDemand;
    
    @Autowired
    ParticlePhysicalPropertyService ParticlePhysicalPropertyDataOnDemand.particlePhysicalPropertyService;
    
    public ParticlePhysicalProperty ParticlePhysicalPropertyDataOnDemand.getNewTransientParticlePhysicalProperty(int index) {
        ParticlePhysicalProperty obj = new ParticlePhysicalProperty();
        setFunctionParameters(obj, index);
        setName(obj, index);
        setQuantity(obj, index);
        setUncertainty(obj, index);
        setUncertaintyType(obj, index);
        return obj;
    }
    
    public void ParticlePhysicalPropertyDataOnDemand.setFunctionParameters(ParticlePhysicalProperty obj, int index) {
        String functionParameters = "functionParameters_" + index;
        obj.setFunctionParameters(functionParameters);
    }
    
    public void ParticlePhysicalPropertyDataOnDemand.setName(ParticlePhysicalProperty obj, int index) {
        String name = "name_" + index;
        obj.setName(name);
    }
    
    public void ParticlePhysicalPropertyDataOnDemand.setQuantity(ParticlePhysicalProperty obj, int index) {
        BigDecimal quantity = BigDecimal.valueOf(index);
        obj.setQuantity(quantity);
    }
    
    public void ParticlePhysicalPropertyDataOnDemand.setUncertainty(ParticlePhysicalProperty obj, int index) {
        BigDecimal uncertainty = BigDecimal.valueOf(index);
        obj.setUncertainty(uncertainty);
    }
    
    public void ParticlePhysicalPropertyDataOnDemand.setUncertaintyType(ParticlePhysicalProperty obj, int index) {
        UncertaintyType uncertaintyType = UncertaintyType.class.getEnumConstants()[0];
        obj.setUncertaintyType(uncertaintyType);
    }
    
    public ParticlePhysicalProperty ParticlePhysicalPropertyDataOnDemand.getSpecificParticlePhysicalProperty(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        ParticlePhysicalProperty obj = data.get(index);
        BigInteger id = obj.getId();
        return particlePhysicalPropertyService.findParticlePhysicalProperty(id);
    }
    
    public ParticlePhysicalProperty ParticlePhysicalPropertyDataOnDemand.getRandomParticlePhysicalProperty() {
        init();
        ParticlePhysicalProperty obj = data.get(rnd.nextInt(data.size()));
        BigInteger id = obj.getId();
        return particlePhysicalPropertyService.findParticlePhysicalProperty(id);
    }
    
    public boolean ParticlePhysicalPropertyDataOnDemand.modifyParticlePhysicalProperty(ParticlePhysicalProperty obj) {
        return false;
    }
    
    public void ParticlePhysicalPropertyDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = particlePhysicalPropertyService.findParticlePhysicalPropertyEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'ParticlePhysicalProperty' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<ParticlePhysicalProperty>();
        for (int i = 0; i < 10; i++) {
            ParticlePhysicalProperty obj = getNewTransientParticlePhysicalProperty(i);
            try {
                particlePhysicalPropertyService.saveParticlePhysicalProperty(obj);
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

// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.data.physics.fundamental;

import com.lacunalabs.dm.data.physics.fundamental.PhysicalPropertyTypeDataOnDemand;
import com.lacunalabs.dm.data.physics.fundamental.PhysicalPropertyTypeField;
import com.lacunalabs.dm.data.physics.fundamental.PhysicalPropertyTypeFieldDataOnDemand;
import com.lacunalabs.dm.data.repository.physics.fundamental.PhysicalPropertyTypeFieldService;
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

privileged aspect PhysicalPropertyTypeFieldDataOnDemand_Roo_DataOnDemand {
    
    declare @type: PhysicalPropertyTypeFieldDataOnDemand: @Component;
    
    private Random PhysicalPropertyTypeFieldDataOnDemand.rnd = new SecureRandom();
    
    private List<PhysicalPropertyTypeField> PhysicalPropertyTypeFieldDataOnDemand.data;
    
    @Autowired
    private PhysicalPropertyTypeDataOnDemand PhysicalPropertyTypeFieldDataOnDemand.physicalPropertyTypeDataOnDemand;
    
    @Autowired
    PhysicalPropertyTypeFieldService PhysicalPropertyTypeFieldDataOnDemand.physicalPropertyTypeFieldService;
    
    public PhysicalPropertyTypeField PhysicalPropertyTypeFieldDataOnDemand.getNewTransientPhysicalPropertyTypeField(int index) {
        PhysicalPropertyTypeField obj = new PhysicalPropertyTypeField();
        setFullFieldName(obj, index);
        return obj;
    }
    
    public void PhysicalPropertyTypeFieldDataOnDemand.setFullFieldName(PhysicalPropertyTypeField obj, int index) {
        String fullFieldName = "fullFieldName_" + index;
        obj.setFullFieldName(fullFieldName);
    }
    
    public PhysicalPropertyTypeField PhysicalPropertyTypeFieldDataOnDemand.getSpecificPhysicalPropertyTypeField(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        PhysicalPropertyTypeField obj = data.get(index);
        BigInteger id = obj.getId();
        return physicalPropertyTypeFieldService.findPhysicalPropertyTypeField(id);
    }
    
    public PhysicalPropertyTypeField PhysicalPropertyTypeFieldDataOnDemand.getRandomPhysicalPropertyTypeField() {
        init();
        PhysicalPropertyTypeField obj = data.get(rnd.nextInt(data.size()));
        BigInteger id = obj.getId();
        return physicalPropertyTypeFieldService.findPhysicalPropertyTypeField(id);
    }
    
    public boolean PhysicalPropertyTypeFieldDataOnDemand.modifyPhysicalPropertyTypeField(PhysicalPropertyTypeField obj) {
        return false;
    }
    
    public void PhysicalPropertyTypeFieldDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = physicalPropertyTypeFieldService.findPhysicalPropertyTypeFieldEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'PhysicalPropertyTypeField' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<PhysicalPropertyTypeField>();
        for (int i = 0; i < 10; i++) {
            PhysicalPropertyTypeField obj = getNewTransientPhysicalPropertyTypeField(i);
            try {
                physicalPropertyTypeFieldService.savePhysicalPropertyTypeField(obj);
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

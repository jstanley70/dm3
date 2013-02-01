// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.data.physics.crystallography;

import com.lacunalabs.dm.data.physics.crystallography.ReflectionCondition;
import com.lacunalabs.dm.data.physics.crystallography.ReflectionConditionDataOnDemand;
import com.lacunalabs.dm.data.repository.physics.crystallography.ReflectionConditionService;
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

privileged aspect ReflectionConditionDataOnDemand_Roo_DataOnDemand {
    
    declare @type: ReflectionConditionDataOnDemand: @Component;
    
    private Random ReflectionConditionDataOnDemand.rnd = new SecureRandom();
    
    private List<ReflectionCondition> ReflectionConditionDataOnDemand.data;
    
    @Autowired
    ReflectionConditionService ReflectionConditionDataOnDemand.reflectionConditionService;
    
    public ReflectionCondition ReflectionConditionDataOnDemand.getNewTransientReflectionCondition(int index) {
        ReflectionCondition obj = new ReflectionCondition();
        return obj;
    }
    
    public ReflectionCondition ReflectionConditionDataOnDemand.getSpecificReflectionCondition(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        ReflectionCondition obj = data.get(index);
        BigInteger id = obj.getId();
        return reflectionConditionService.findReflectionCondition(id);
    }
    
    public ReflectionCondition ReflectionConditionDataOnDemand.getRandomReflectionCondition() {
        init();
        ReflectionCondition obj = data.get(rnd.nextInt(data.size()));
        BigInteger id = obj.getId();
        return reflectionConditionService.findReflectionCondition(id);
    }
    
    public boolean ReflectionConditionDataOnDemand.modifyReflectionCondition(ReflectionCondition obj) {
        return false;
    }
    
    public void ReflectionConditionDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = reflectionConditionService.findReflectionConditionEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'ReflectionCondition' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<ReflectionCondition>();
        for (int i = 0; i < 10; i++) {
            ReflectionCondition obj = getNewTransientReflectionCondition(i);
            try {
                reflectionConditionService.saveReflectionCondition(obj);
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

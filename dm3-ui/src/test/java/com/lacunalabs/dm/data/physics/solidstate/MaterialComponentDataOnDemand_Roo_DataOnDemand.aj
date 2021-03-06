// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.data.physics.solidstate;

import com.lacunalabs.dm.data.physics.solidstate.CrystalDataOnDemand;
import com.lacunalabs.dm.data.physics.solidstate.MaterialComponent;
import com.lacunalabs.dm.data.physics.solidstate.MaterialComponentDataOnDemand;
import com.lacunalabs.dm.data.repository.physics.solidstate.MaterialComponentService;
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

privileged aspect MaterialComponentDataOnDemand_Roo_DataOnDemand {
    
    declare @type: MaterialComponentDataOnDemand: @Component;
    
    private Random MaterialComponentDataOnDemand.rnd = new SecureRandom();
    
    private List<MaterialComponent> MaterialComponentDataOnDemand.data;
    
    @Autowired
    private CrystalDataOnDemand MaterialComponentDataOnDemand.crystalDataOnDemand;
    
    @Autowired
    MaterialComponentService MaterialComponentDataOnDemand.materialComponentService;
    
    public MaterialComponent MaterialComponentDataOnDemand.getNewTransientMaterialComponent(int index) {
        MaterialComponent obj = new MaterialComponent();
        setActive(obj, index);
        setMatrix(obj, index);
        setName(obj, index);
        setTotalVolume(obj, index);
        return obj;
    }
    
    public void MaterialComponentDataOnDemand.setActive(MaterialComponent obj, int index) {
        Boolean active = Boolean.TRUE;
        obj.setActive(active);
    }
    
    public void MaterialComponentDataOnDemand.setMatrix(MaterialComponent obj, int index) {
        Boolean matrix = Boolean.TRUE;
        obj.setMatrix(matrix);
    }
    
    public void MaterialComponentDataOnDemand.setName(MaterialComponent obj, int index) {
        String name = "name_" + index;
        obj.setName(name);
    }
    
    public void MaterialComponentDataOnDemand.setTotalVolume(MaterialComponent obj, int index) {
        BigDecimal totalVolume = BigDecimal.valueOf(index);
        obj.setTotalVolume(totalVolume);
    }
    
    public MaterialComponent MaterialComponentDataOnDemand.getSpecificMaterialComponent(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        MaterialComponent obj = data.get(index);
        BigInteger id = obj.getId();
        return materialComponentService.findMaterialComponent(id);
    }
    
    public MaterialComponent MaterialComponentDataOnDemand.getRandomMaterialComponent() {
        init();
        MaterialComponent obj = data.get(rnd.nextInt(data.size()));
        BigInteger id = obj.getId();
        return materialComponentService.findMaterialComponent(id);
    }
    
    public boolean MaterialComponentDataOnDemand.modifyMaterialComponent(MaterialComponent obj) {
        return false;
    }
    
    public void MaterialComponentDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = materialComponentService.findMaterialComponentEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'MaterialComponent' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<MaterialComponent>();
        for (int i = 0; i < 10; i++) {
            MaterialComponent obj = getNewTransientMaterialComponent(i);
            try {
                materialComponentService.saveMaterialComponent(obj);
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

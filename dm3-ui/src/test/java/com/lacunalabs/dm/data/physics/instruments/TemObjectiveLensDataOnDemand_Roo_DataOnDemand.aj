// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.data.physics.instruments;

import com.lacunalabs.dm.data.physics.instruments.TemObjectiveLens;
import com.lacunalabs.dm.data.physics.instruments.TemObjectiveLensDataOnDemand;
import com.lacunalabs.dm.data.repository.physics.instruments.TemObjectiveLensService;
import com.lacunalabs.dm.shared.physics.fundamental.MetaDataType;
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

privileged aspect TemObjectiveLensDataOnDemand_Roo_DataOnDemand {
    
    declare @type: TemObjectiveLensDataOnDemand: @Component;
    
    private Random TemObjectiveLensDataOnDemand.rnd = new SecureRandom();
    
    private List<TemObjectiveLens> TemObjectiveLensDataOnDemand.data;
    
    @Autowired
    TemObjectiveLensService TemObjectiveLensDataOnDemand.temObjectiveLensService;
    
    public TemObjectiveLens TemObjectiveLensDataOnDemand.getNewTransientTemObjectiveLens(int index) {
        TemObjectiveLens obj = new TemObjectiveLens();
        setAstigmatism(obj, index);
        setChromaticAberration(obj, index);
        setChromaticSpread(obj, index);
        setConvergenceAngle(obj, index);
        setDefocus(obj, index);
        setDefocusSpread(obj, index);
        setDelCurrent(obj, index);
        setDelVoltage(obj, index);
        setLensCurrent(obj, index);
        setMetadata(obj, index);
        setMetadataType(obj, index);
        setName(obj, index);
        setSphericalAberration(obj, index);
        setStigmaticAngle(obj, index);
        return obj;
    }
    
    public void TemObjectiveLensDataOnDemand.setAstigmatism(TemObjectiveLens obj, int index) {
        BigDecimal astigmatism = BigDecimal.valueOf(index);
        obj.setAstigmatism(astigmatism);
    }
    
    public void TemObjectiveLensDataOnDemand.setChromaticAberration(TemObjectiveLens obj, int index) {
        BigDecimal chromaticAberration = BigDecimal.valueOf(index);
        obj.setChromaticAberration(chromaticAberration);
    }
    
    public void TemObjectiveLensDataOnDemand.setChromaticSpread(TemObjectiveLens obj, int index) {
        BigDecimal chromaticSpread = BigDecimal.valueOf(index);
        obj.setChromaticSpread(chromaticSpread);
    }
    
    public void TemObjectiveLensDataOnDemand.setConvergenceAngle(TemObjectiveLens obj, int index) {
        BigDecimal convergenceAngle = BigDecimal.valueOf(index);
        obj.setConvergenceAngle(convergenceAngle);
    }
    
    public void TemObjectiveLensDataOnDemand.setDefocus(TemObjectiveLens obj, int index) {
        BigDecimal defocus = BigDecimal.valueOf(index);
        obj.setDefocus(defocus);
    }
    
    public void TemObjectiveLensDataOnDemand.setDefocusSpread(TemObjectiveLens obj, int index) {
        BigDecimal defocusSpread = BigDecimal.valueOf(index);
        obj.setDefocusSpread(defocusSpread);
    }
    
    public void TemObjectiveLensDataOnDemand.setDelCurrent(TemObjectiveLens obj, int index) {
        BigDecimal delCurrent = BigDecimal.valueOf(index);
        obj.setDelCurrent(delCurrent);
    }
    
    public void TemObjectiveLensDataOnDemand.setDelVoltage(TemObjectiveLens obj, int index) {
        BigDecimal delVoltage = BigDecimal.valueOf(index);
        obj.setDelVoltage(delVoltage);
    }
    
    public void TemObjectiveLensDataOnDemand.setLensCurrent(TemObjectiveLens obj, int index) {
        BigDecimal lensCurrent = BigDecimal.valueOf(index);
        obj.setLensCurrent(lensCurrent);
    }
    
    public void TemObjectiveLensDataOnDemand.setMetadata(TemObjectiveLens obj, int index) {
        String metadata = "metadata_" + index;
        obj.setMetadata(metadata);
    }
    
    public void TemObjectiveLensDataOnDemand.setMetadataType(TemObjectiveLens obj, int index) {
        MetaDataType metadataType = MetaDataType.class.getEnumConstants()[0];
        obj.setMetadataType(metadataType);
    }
    
    public void TemObjectiveLensDataOnDemand.setName(TemObjectiveLens obj, int index) {
        String name = "name_" + index;
        obj.setName(name);
    }
    
    public void TemObjectiveLensDataOnDemand.setSphericalAberration(TemObjectiveLens obj, int index) {
        BigDecimal sphericalAberration = BigDecimal.valueOf(index);
        obj.setSphericalAberration(sphericalAberration);
    }
    
    public void TemObjectiveLensDataOnDemand.setStigmaticAngle(TemObjectiveLens obj, int index) {
        BigDecimal stigmaticAngle = BigDecimal.valueOf(index);
        obj.setStigmaticAngle(stigmaticAngle);
    }
    
    public TemObjectiveLens TemObjectiveLensDataOnDemand.getSpecificTemObjectiveLens(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        TemObjectiveLens obj = data.get(index);
        BigInteger id = obj.getId();
        return temObjectiveLensService.findTemObjectiveLens(id);
    }
    
    public TemObjectiveLens TemObjectiveLensDataOnDemand.getRandomTemObjectiveLens() {
        init();
        TemObjectiveLens obj = data.get(rnd.nextInt(data.size()));
        BigInteger id = obj.getId();
        return temObjectiveLensService.findTemObjectiveLens(id);
    }
    
    public boolean TemObjectiveLensDataOnDemand.modifyTemObjectiveLens(TemObjectiveLens obj) {
        return false;
    }
    
    public void TemObjectiveLensDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = temObjectiveLensService.findTemObjectiveLensEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'TemObjectiveLens' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<TemObjectiveLens>();
        for (int i = 0; i < 10; i++) {
            TemObjectiveLens obj = getNewTransientTemObjectiveLens(i);
            try {
                temObjectiveLensService.saveTemObjectiveLens(obj);
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

// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.data.math.geometry;

import com.lacunalabs.dm.data.math.geometry.Shape2D;
import com.lacunalabs.dm.data.math.geometry.Shape2DDataOnDemand;
import com.lacunalabs.dm.data.repository.math.geometry.Shape2DService;
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

privileged aspect Shape2DDataOnDemand_Roo_DataOnDemand {
    
    declare @type: Shape2DDataOnDemand: @Component;
    
    private Random Shape2DDataOnDemand.rnd = new SecureRandom();
    
    private List<Shape2D> Shape2DDataOnDemand.data;
    
    @Autowired
    Shape2DService Shape2DDataOnDemand.shape2DService;
    
    public Shape2D Shape2DDataOnDemand.getNewTransientShape2D(int index) {
        Shape2D obj = new Shape2D();
        setName(obj, index);
        return obj;
    }
    
    public void Shape2DDataOnDemand.setName(Shape2D obj, int index) {
        String name = "name_" + index;
        obj.setName(name);
    }
    
    public Shape2D Shape2DDataOnDemand.getSpecificShape2D(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Shape2D obj = data.get(index);
        BigInteger id = obj.getId();
        return shape2DService.findShape2D(id);
    }
    
    public Shape2D Shape2DDataOnDemand.getRandomShape2D() {
        init();
        Shape2D obj = data.get(rnd.nextInt(data.size()));
        BigInteger id = obj.getId();
        return shape2DService.findShape2D(id);
    }
    
    public boolean Shape2DDataOnDemand.modifyShape2D(Shape2D obj) {
        return false;
    }
    
    public void Shape2DDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = shape2DService.findShape2DEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Shape2D' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Shape2D>();
        for (int i = 0; i < 10; i++) {
            Shape2D obj = getNewTransientShape2D(i);
            try {
                shape2DService.saveShape2D(obj);
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
// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.data.physics.experiment;

import com.lacunalabs.dm.data.physics.experiment.Processor;
import com.lacunalabs.dm.data.physics.experiment.ProcessorDataOnDemand;
import com.lacunalabs.dm.data.repository.physics.experiment.ProcessorService;
import com.lacunalabs.dm.shared.physics.fundamental.MetaDataType;
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

privileged aspect ProcessorDataOnDemand_Roo_DataOnDemand {
    
    declare @type: ProcessorDataOnDemand: @Component;
    
    private Random ProcessorDataOnDemand.rnd = new SecureRandom();
    
    private List<Processor> ProcessorDataOnDemand.data;
    
    @Autowired
    ProcessorService ProcessorDataOnDemand.processorService;
    
    public Processor ProcessorDataOnDemand.getNewTransientProcessor(int index) {
        Processor obj = new Processor();
        setMetadata(obj, index);
        setMetadataType(obj, index);
        setName(obj, index);
        setProcessClass(obj, index);
        setProcessInputTranslatorClass(obj, index);
        setResultsClass(obj, index);
        setResultsViewer(obj, index);
        return obj;
    }
    
    public void ProcessorDataOnDemand.setMetadata(Processor obj, int index) {
        String metadata = "metadata_" + index;
        obj.setMetadata(metadata);
    }
    
    public void ProcessorDataOnDemand.setMetadataType(Processor obj, int index) {
        MetaDataType metadataType = MetaDataType.class.getEnumConstants()[0];
        obj.setMetadataType(metadataType);
    }
    
    public void ProcessorDataOnDemand.setName(Processor obj, int index) {
        String name = "name_" + index;
        obj.setName(name);
    }
    
    public void ProcessorDataOnDemand.setProcessClass(Processor obj, int index) {
        String processClass = "processClass_" + index;
        obj.setProcessClass(processClass);
    }
    
    public void ProcessorDataOnDemand.setProcessInputTranslatorClass(Processor obj, int index) {
        String processInputTranslatorClass = "processInputTranslatorClass_" + index;
        obj.setProcessInputTranslatorClass(processInputTranslatorClass);
    }
    
    public void ProcessorDataOnDemand.setResultsClass(Processor obj, int index) {
        String resultsClass = "resultsClass_" + index;
        obj.setResultsClass(resultsClass);
    }
    
    public void ProcessorDataOnDemand.setResultsViewer(Processor obj, int index) {
        String resultsViewer = "resultsViewer_" + index;
        obj.setResultsViewer(resultsViewer);
    }
    
    public Processor ProcessorDataOnDemand.getSpecificProcessor(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Processor obj = data.get(index);
        BigInteger id = obj.getId();
        return processorService.findProcessor(id);
    }
    
    public Processor ProcessorDataOnDemand.getRandomProcessor() {
        init();
        Processor obj = data.get(rnd.nextInt(data.size()));
        BigInteger id = obj.getId();
        return processorService.findProcessor(id);
    }
    
    public boolean ProcessorDataOnDemand.modifyProcessor(Processor obj) {
        return false;
    }
    
    public void ProcessorDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = processorService.findProcessorEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Processor' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Processor>();
        for (int i = 0; i < 10; i++) {
            Processor obj = getNewTransientProcessor(i);
            try {
                processorService.saveProcessor(obj);
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

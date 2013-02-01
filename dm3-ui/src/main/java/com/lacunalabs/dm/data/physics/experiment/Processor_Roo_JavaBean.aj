// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.data.physics.experiment;

import com.lacunalabs.dm.data.physics.experiment.Processor;
import com.lacunalabs.dm.shared.physics.fundamental.MetaDataType;

privileged aspect Processor_Roo_JavaBean {
    
    public String Processor.getName() {
        return this.name;
    }
    
    public void Processor.setName(String name) {
        this.name = name;
    }
    
    public String Processor.getProcessClass() {
        return this.processClass;
    }
    
    public void Processor.setProcessClass(String processClass) {
        this.processClass = processClass;
    }
    
    public String Processor.getResultsClass() {
        return this.resultsClass;
    }
    
    public void Processor.setResultsClass(String resultsClass) {
        this.resultsClass = resultsClass;
    }
    
    public String Processor.getProcessInputTranslatorClass() {
        return this.processInputTranslatorClass;
    }
    
    public void Processor.setProcessInputTranslatorClass(String processInputTranslatorClass) {
        this.processInputTranslatorClass = processInputTranslatorClass;
    }
    
    public String Processor.getResultsViewer() {
        return this.resultsViewer;
    }
    
    public void Processor.setResultsViewer(String resultsViewer) {
        this.resultsViewer = resultsViewer;
    }
    
    public MetaDataType Processor.getMetadataType() {
        return this.metadataType;
    }
    
    public void Processor.setMetadataType(MetaDataType metadataType) {
        this.metadataType = metadataType;
    }
    
    public String Processor.getMetadata() {
        return this.metadata;
    }
    
    public void Processor.setMetadata(String metadata) {
        this.metadata = metadata;
    }
    
}
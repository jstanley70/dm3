package com.lacunalabs.dm.data.physics.experiment;

import com.lacunalabs.dm.shared.physics.fundamental.MetaDataType;
import javax.persistence.Enumerated;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoEntity;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooMongoEntity
public class Processor {

    private String name;

    private String processClass;

    private String resultsClass;

    private String processInputTranslatorClass;

    private String resultsViewer;

    @Enumerated
    private MetaDataType metadataType;

    private String metadata;
}

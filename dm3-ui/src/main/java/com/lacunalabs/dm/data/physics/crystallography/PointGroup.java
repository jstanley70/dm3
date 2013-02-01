package com.lacunalabs.dm.data.physics.crystallography;

import com.lacunalabs.dm.shared.physics.fundamental.MetaDataType;
import javax.persistence.Enumerated;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoEntity;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooMongoEntity
public class PointGroup {

    private String name;

    @NotNull
    @Size(min = 1, max = 10)
    private String symbol;

    @ManyToOne
    private Centering centering;

    private String reflectionConditions;

    private String centerings;

    private String coordinatePoints;

    @Enumerated
    private MetaDataType metadataType;

    private String metadata;
}

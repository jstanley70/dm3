package com.lacunalabs.dm.data.physics.crystallography;

import com.lacunalabs.dm.shared.physics.crystallography.CenteringType;
import javax.persistence.Enumerated;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoEntity;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooMongoEntity
public class Centering {

    private String name;

    @Enumerated
    private CenteringType centeringType;

    private String centerings;

    private String reflectionConditions;
}

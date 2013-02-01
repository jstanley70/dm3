package com.lacunalabs.dm.data.physics.crystallography;

import com.lacunalabs.dm.shared.physics.crystallography.CrystalSystemType;
import java.math.BigDecimal;
import javax.persistence.Enumerated;
import javax.persistence.ManyToOne;
import javax.validation.constraints.DecimalMax;
import javax.validation.constraints.DecimalMin;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoEntity;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooMongoEntity
public class BravaisLattice {

	@DecimalMax("1.0E-6")
	@DecimalMin("1.0E-16")
    private BigDecimal a;

	@DecimalMax("1.0E-6")
	@DecimalMin("1.0E-16")
    private BigDecimal b;

	@DecimalMax("1.0E-6")
	@DecimalMin("1.0E-16")
    private BigDecimal c;

	@DecimalMax("120")
	@DecimalMin("-120")
    private BigDecimal alpha;

	@DecimalMax("120")
	@DecimalMin("-120")
    private BigDecimal gamma;

	@DecimalMax("120")
	@DecimalMin("-120")
    private BigDecimal beta;

    @Enumerated
    private CrystalSystemType crystalSystem;

    @ManyToOne
    private Centering centering;
}

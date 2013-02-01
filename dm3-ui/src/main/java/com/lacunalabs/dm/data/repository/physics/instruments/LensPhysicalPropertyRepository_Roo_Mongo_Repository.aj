// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.data.repository.physics.instruments;

import com.lacunalabs.dm.data.physics.instruments.LensPhysicalProperty;
import com.lacunalabs.dm.data.repository.physics.instruments.LensPhysicalPropertyRepository;
import java.math.BigInteger;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

privileged aspect LensPhysicalPropertyRepository_Roo_Mongo_Repository {
    
    declare parents: LensPhysicalPropertyRepository extends PagingAndSortingRepository<LensPhysicalProperty, BigInteger>;
    
    declare @type: LensPhysicalPropertyRepository: @Repository;
    
}

// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.data.repository.physics.solidstate;

import com.lacunalabs.dm.data.physics.solidstate.CrystalPhysicalProperty;
import com.lacunalabs.dm.data.repository.physics.solidstate.CrystalPhysicalPropertyRepository;
import java.math.BigInteger;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

privileged aspect CrystalPhysicalPropertyRepository_Roo_Mongo_Repository {
    
    declare parents: CrystalPhysicalPropertyRepository extends PagingAndSortingRepository<CrystalPhysicalProperty, BigInteger>;
    
    declare @type: CrystalPhysicalPropertyRepository: @Repository;
    
}
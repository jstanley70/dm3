// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.data.repository.physics.solidstate;

import com.lacunalabs.dm.data.physics.solidstate.Crystal;
import com.lacunalabs.dm.data.repository.physics.solidstate.CrystalRepository;
import java.math.BigInteger;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

privileged aspect CrystalRepository_Roo_Mongo_Repository {
    
    declare parents: CrystalRepository extends PagingAndSortingRepository<Crystal, BigInteger>;
    
    declare @type: CrystalRepository: @Repository;
    
}

// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.data.repository.physics.fundamental;

import com.lacunalabs.dm.data.physics.fundamental.ParticleEnumerator;
import com.lacunalabs.dm.data.repository.physics.fundamental.ParticleEnumeratorRepository;
import java.math.BigInteger;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

privileged aspect ParticleEnumeratorRepository_Roo_Mongo_Repository {
    
    declare parents: ParticleEnumeratorRepository extends PagingAndSortingRepository<ParticleEnumerator, BigInteger>;
    
    declare @type: ParticleEnumeratorRepository: @Repository;
    
}

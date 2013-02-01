// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.data.repository.physics.fundamental;

import com.lacunalabs.dm.data.physics.fundamental.ParticleBeam;
import com.lacunalabs.dm.data.repository.physics.fundamental.ParticleBeamService;
import java.math.BigInteger;
import java.util.List;

privileged aspect ParticleBeamService_Roo_Service {
    
    public abstract long ParticleBeamService.countAllParticleBeams();    
    public abstract void ParticleBeamService.deleteParticleBeam(ParticleBeam particleBeam);    
    public abstract ParticleBeam ParticleBeamService.findParticleBeam(BigInteger id);    
    public abstract List<ParticleBeam> ParticleBeamService.findAllParticleBeams();    
    public abstract List<ParticleBeam> ParticleBeamService.findParticleBeamEntries(int firstResult, int maxResults);    
    public abstract void ParticleBeamService.saveParticleBeam(ParticleBeam particleBeam);    
    public abstract ParticleBeam ParticleBeamService.updateParticleBeam(ParticleBeam particleBeam);    
}

package com.lacunalabs.dm.web;

import com.lacunalabs.dm.data.physics.fundamental.ParticleBeam;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/particlebeams")
@Controller
@RooWebScaffold(path = "particlebeams", formBackingObject = ParticleBeam.class)
public class ParticleBeamController {
}

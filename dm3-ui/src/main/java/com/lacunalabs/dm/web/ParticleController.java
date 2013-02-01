package com.lacunalabs.dm.web;

import com.lacunalabs.dm.data.physics.fundamental.Particle;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/particles")
@Controller
@RooWebScaffold(path = "particles", formBackingObject = Particle.class)
public class ParticleController {
}

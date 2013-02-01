package com.lacunalabs.dm.web;

import com.lacunalabs.dm.data.physics.fundamental.CompositeParticle;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/compositeparticles")
@Controller
@RooWebScaffold(path = "compositeparticles", formBackingObject = CompositeParticle.class)
public class CompositeParticleController {
}

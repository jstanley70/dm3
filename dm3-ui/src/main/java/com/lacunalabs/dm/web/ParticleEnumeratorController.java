package com.lacunalabs.dm.web;

import com.lacunalabs.dm.data.physics.fundamental.ParticleEnumerator;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/particleenumerators")
@Controller
@RooWebScaffold(path = "particleenumerators", formBackingObject = ParticleEnumerator.class)
public class ParticleEnumeratorController {
}

package com.lacunalabs.dm.web;

import com.lacunalabs.dm.data.physics.fundamental.ParticlePhysicalProperty;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/particlephysicalpropertys")
@Controller
@RooWebScaffold(path = "particlephysicalpropertys", formBackingObject = ParticlePhysicalProperty.class)
public class ParticlePhysicalPropertyController {
}

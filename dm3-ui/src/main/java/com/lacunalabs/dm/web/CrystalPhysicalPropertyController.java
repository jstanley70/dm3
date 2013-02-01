package com.lacunalabs.dm.web;

import com.lacunalabs.dm.data.physics.solidstate.CrystalPhysicalProperty;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/crystalphysicalpropertys")
@Controller
@RooWebScaffold(path = "crystalphysicalpropertys", formBackingObject = CrystalPhysicalProperty.class)
public class CrystalPhysicalPropertyController {
}

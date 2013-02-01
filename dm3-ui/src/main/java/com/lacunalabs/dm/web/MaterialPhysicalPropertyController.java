package com.lacunalabs.dm.web;

import com.lacunalabs.dm.data.physics.solidstate.MaterialPhysicalProperty;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/materialphysicalpropertys")
@Controller
@RooWebScaffold(path = "materialphysicalpropertys", formBackingObject = MaterialPhysicalProperty.class)
public class MaterialPhysicalPropertyController {
}

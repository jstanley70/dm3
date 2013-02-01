package com.lacunalabs.dm.web;

import com.lacunalabs.dm.data.physics.solidstate.MaterialComponentPhysicalProperty;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/materialcomponentphysicalpropertys")
@Controller
@RooWebScaffold(path = "materialcomponentphysicalpropertys", formBackingObject = MaterialComponentPhysicalProperty.class)
public class MaterialComponentPhysicalPropertyController {
}

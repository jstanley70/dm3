package com.lacunalabs.dm.web;

import com.lacunalabs.dm.data.physics.fundamental.PhysicalPropertyType;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/physicalpropertytypes")
@Controller
@RooWebScaffold(path = "physicalpropertytypes", formBackingObject = PhysicalPropertyType.class)
public class PhysicalPropertyTypeController {
}

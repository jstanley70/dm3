package com.lacunalabs.dm.web;

import com.lacunalabs.dm.data.physics.instruments.LensPhysicalProperty;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/lensphysicalpropertys")
@Controller
@RooWebScaffold(path = "lensphysicalpropertys", formBackingObject = LensPhysicalProperty.class)
public class LensPhysicalPropertyController {
}

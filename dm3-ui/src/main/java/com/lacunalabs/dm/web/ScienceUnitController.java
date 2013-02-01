package com.lacunalabs.dm.web;

import com.lacunalabs.dm.data.physics.fundamental.ScienceUnit;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/scienceunits")
@Controller
@RooWebScaffold(path = "scienceunits", formBackingObject = ScienceUnit.class)
public class ScienceUnitController {
}

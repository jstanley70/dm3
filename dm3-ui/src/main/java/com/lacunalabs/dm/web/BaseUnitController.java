package com.lacunalabs.dm.web;

import com.lacunalabs.dm.data.physics.fundamental.BaseUnit;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/baseunits")
@Controller
@RooWebScaffold(path = "baseunits", formBackingObject = BaseUnit.class)
public class BaseUnitController {
}

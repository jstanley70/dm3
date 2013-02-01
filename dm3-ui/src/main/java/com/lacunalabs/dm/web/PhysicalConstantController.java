package com.lacunalabs.dm.web;

import com.lacunalabs.dm.data.physics.fundamental.PhysicalConstant;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/physicalconstants")
@Controller
@RooWebScaffold(path = "physicalconstants", formBackingObject = PhysicalConstant.class)
public class PhysicalConstantController {
}

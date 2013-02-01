package com.lacunalabs.dm.web;

import com.lacunalabs.dm.data.physics.solidstate.MaterialComponentOrientations;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/materialcomponentorientationses")
@Controller
@RooWebScaffold(path = "materialcomponentorientationses", formBackingObject = MaterialComponentOrientations.class)
public class MaterialComponentOrientationsController {
}

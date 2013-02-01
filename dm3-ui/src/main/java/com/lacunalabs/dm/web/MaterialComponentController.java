package com.lacunalabs.dm.web;

import com.lacunalabs.dm.data.physics.solidstate.MaterialComponent;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/materialcomponents")
@Controller
@RooWebScaffold(path = "materialcomponents", formBackingObject = MaterialComponent.class)
public class MaterialComponentController {
}

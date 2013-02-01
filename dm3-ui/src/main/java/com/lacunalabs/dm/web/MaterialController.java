package com.lacunalabs.dm.web;

import com.lacunalabs.dm.data.physics.solidstate.Material;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/materials")
@Controller
@RooWebScaffold(path = "materials", formBackingObject = Material.class)
public class MaterialController {
}

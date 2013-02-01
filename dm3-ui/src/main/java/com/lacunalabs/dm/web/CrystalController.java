package com.lacunalabs.dm.web;

import com.lacunalabs.dm.data.physics.solidstate.Crystal;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/crystals")
@Controller
@RooWebScaffold(path = "crystals", formBackingObject = Crystal.class)
public class CrystalController {
}

package com.lacunalabs.dm.web;

import com.lacunalabs.dm.data.physics.fundamental.DecimalMultiplier;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/decimalmultipliers")
@Controller
@RooWebScaffold(path = "decimalmultipliers", formBackingObject = DecimalMultiplier.class)
public class DecimalMultiplierController {
}

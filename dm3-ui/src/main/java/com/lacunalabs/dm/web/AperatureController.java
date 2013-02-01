package com.lacunalabs.dm.web;

import com.lacunalabs.dm.data.physics.instruments.Aperature;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/aperatures")
@Controller
@RooWebScaffold(path = "aperatures", formBackingObject = Aperature.class)
public class AperatureController {
}

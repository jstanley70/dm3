package com.lacunalabs.dm.web;

import com.lacunalabs.dm.data.physics.crystallography.Centering;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/centerings")
@Controller
@RooWebScaffold(path = "centerings", formBackingObject = Centering.class)
public class CenteringController {
}

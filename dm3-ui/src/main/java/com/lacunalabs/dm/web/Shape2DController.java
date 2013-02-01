package com.lacunalabs.dm.web;

import com.lacunalabs.dm.data.math.geometry.Shape2D;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/shape2ds")
@Controller
@RooWebScaffold(path = "shape2ds", formBackingObject = Shape2D.class)
public class Shape2DController {
}

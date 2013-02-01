package com.lacunalabs.dm.web;

import com.lacunalabs.dm.data.math.geometry.Shape3D;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/shape3ds")
@Controller
@RooWebScaffold(path = "shape3ds", formBackingObject = Shape3D.class)
public class Shape3DController {
}

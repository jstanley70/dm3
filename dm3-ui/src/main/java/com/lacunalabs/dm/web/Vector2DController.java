package com.lacunalabs.dm.web;

import com.lacunalabs.dm.data.math.geometry.Vector2D;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/vector2ds")
@Controller
@RooWebScaffold(path = "vector2ds", formBackingObject = Vector2D.class)
public class Vector2DController {
}

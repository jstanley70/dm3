package com.lacunalabs.dm.web;

import com.lacunalabs.dm.data.math.geometry.Orientation;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/orientations")
@Controller
@RooWebScaffold(path = "orientations", formBackingObject = Orientation.class)
public class OrientationController {
}

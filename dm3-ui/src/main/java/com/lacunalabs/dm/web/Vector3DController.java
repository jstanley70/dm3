package com.lacunalabs.dm.web;

import com.lacunalabs.dm.data.math.geometry.Vector3D;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/vector3ds")
@Controller
@RooWebScaffold(path = "vector3ds", formBackingObject = Vector3D.class)
public class Vector3DController {
}

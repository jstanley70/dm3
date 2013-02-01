package com.lacunalabs.dm.web;

import com.lacunalabs.dm.data.physics.crystallography.LatticeVector3D;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/latticevector3ds")
@Controller
@RooWebScaffold(path = "latticevector3ds", formBackingObject = LatticeVector3D.class)
public class LatticeVector3DController {
}

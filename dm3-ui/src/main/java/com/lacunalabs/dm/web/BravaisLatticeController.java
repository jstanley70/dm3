package com.lacunalabs.dm.web;

import com.lacunalabs.dm.data.physics.crystallography.BravaisLattice;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/bravaislattices")
@Controller
@RooWebScaffold(path = "bravaislattices", formBackingObject = BravaisLattice.class)
public class BravaisLatticeController {
}

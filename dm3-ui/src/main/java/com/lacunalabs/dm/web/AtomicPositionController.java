package com.lacunalabs.dm.web;

import com.lacunalabs.dm.data.physics.crystallography.AtomicPosition;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/atomicpositions")
@Controller
@RooWebScaffold(path = "atomicpositions", formBackingObject = AtomicPosition.class)
public class AtomicPositionController {
}

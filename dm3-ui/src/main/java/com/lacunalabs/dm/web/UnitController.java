package com.lacunalabs.dm.web;

import com.lacunalabs.dm.data.physics.fundamental.Unit;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/units")
@Controller
@RooWebScaffold(path = "units", formBackingObject = Unit.class)
public class UnitController {
}

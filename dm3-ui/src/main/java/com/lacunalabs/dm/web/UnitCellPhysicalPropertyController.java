package com.lacunalabs.dm.web;

import com.lacunalabs.dm.data.physics.crystallography.UnitCellPhysicalProperty;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/unitcellphysicalpropertys")
@Controller
@RooWebScaffold(path = "unitcellphysicalpropertys", formBackingObject = UnitCellPhysicalProperty.class)
public class UnitCellPhysicalPropertyController {
}

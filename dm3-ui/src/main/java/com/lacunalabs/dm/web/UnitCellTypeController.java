package com.lacunalabs.dm.web;

import com.lacunalabs.dm.data.physics.crystallography.UnitCellType;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/unitcelltypes")
@Controller
@RooWebScaffold(path = "unitcelltypes", formBackingObject = UnitCellType.class)
public class UnitCellTypeController {
}

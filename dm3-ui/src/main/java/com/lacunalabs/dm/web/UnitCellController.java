package com.lacunalabs.dm.web;

import com.lacunalabs.dm.data.physics.crystallography.UnitCell;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/unitcells")
@Controller
@RooWebScaffold(path = "unitcells", formBackingObject = UnitCell.class)
public class UnitCellController {
}

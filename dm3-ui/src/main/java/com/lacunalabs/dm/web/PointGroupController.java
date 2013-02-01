package com.lacunalabs.dm.web;

import com.lacunalabs.dm.data.physics.crystallography.PointGroup;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/pointgroups")
@Controller
@RooWebScaffold(path = "pointgroups", formBackingObject = PointGroup.class)
public class PointGroupController {
}

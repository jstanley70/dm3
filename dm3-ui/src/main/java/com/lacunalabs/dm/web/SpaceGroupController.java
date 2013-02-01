package com.lacunalabs.dm.web;

import com.lacunalabs.dm.data.physics.crystallography.SpaceGroup;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/spacegroups")
@Controller
@RooWebScaffold(path = "spacegroups", formBackingObject = SpaceGroup.class)
public class SpaceGroupController {
}

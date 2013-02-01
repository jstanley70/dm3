package com.lacunalabs.dm.web;

import com.lacunalabs.dm.data.physics.fundamental.PhysicalPropertyTypeField;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/physicalpropertytypefields")
@Controller
@RooWebScaffold(path = "physicalpropertytypefields", formBackingObject = PhysicalPropertyTypeField.class)
public class PhysicalPropertyTypeFieldController {
}

package com.lacunalabs.dm.web;

import com.lacunalabs.dm.data.math.geometry.OrientationRelationship;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/orientationrelationships")
@Controller
@RooWebScaffold(path = "orientationrelationships", formBackingObject = OrientationRelationship.class)
public class OrientationRelationshipController {
}
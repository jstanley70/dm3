package com.lacunalabs.dm.web;

import com.lacunalabs.dm.data.physics.crystallography.ReflectionCondition;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/reflectionconditions")
@Controller
@RooWebScaffold(path = "reflectionconditions", formBackingObject = ReflectionCondition.class)
public class ReflectionConditionController {
}

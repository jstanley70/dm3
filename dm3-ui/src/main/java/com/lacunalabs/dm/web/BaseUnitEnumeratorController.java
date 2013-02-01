package com.lacunalabs.dm.web;

import com.lacunalabs.dm.data.physics.fundamental.BaseUnitEnumerator;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/baseunitenumerators")
@Controller
@RooWebScaffold(path = "baseunitenumerators", formBackingObject = BaseUnitEnumerator.class)
public class BaseUnitEnumeratorController {
}

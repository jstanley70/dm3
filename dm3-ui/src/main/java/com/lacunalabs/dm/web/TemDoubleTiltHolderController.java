package com.lacunalabs.dm.web;

import com.lacunalabs.dm.data.physics.instruments.TemDoubleTiltHolder;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/temdoubletiltholders")
@Controller
@RooWebScaffold(path = "temdoubletiltholders", formBackingObject = TemDoubleTiltHolder.class)
public class TemDoubleTiltHolderController {
}

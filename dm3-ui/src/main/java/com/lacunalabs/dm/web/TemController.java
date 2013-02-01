package com.lacunalabs.dm.web;

import com.lacunalabs.dm.data.physics.instruments.Tem;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/tems")
@Controller
@RooWebScaffold(path = "tems", formBackingObject = Tem.class)
public class TemController {
}

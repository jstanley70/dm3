package com.lacunalabs.dm.web;

import com.lacunalabs.dm.data.physics.experiment.Processor;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/processors")
@Controller
@RooWebScaffold(path = "processors", formBackingObject = Processor.class)
public class ProcessorController {
}

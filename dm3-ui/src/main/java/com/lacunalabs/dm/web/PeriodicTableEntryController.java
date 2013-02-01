package com.lacunalabs.dm.web;

import com.lacunalabs.dm.data.physics.fundamental.PeriodicTableEntry;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/periodictableentrys")
@Controller
@RooWebScaffold(path = "periodictableentrys", formBackingObject = PeriodicTableEntry.class)
public class PeriodicTableEntryController {
}

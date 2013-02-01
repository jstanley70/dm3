package com.lacunalabs.dm.web;

import com.lacunalabs.dm.data.physics.instruments.CcdCamera;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/ccdcameras")
@Controller
@RooWebScaffold(path = "ccdcameras", formBackingObject = CcdCamera.class)
public class CcdCameraController {
}

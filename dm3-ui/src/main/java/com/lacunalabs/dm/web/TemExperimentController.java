package com.lacunalabs.dm.web;

import java.math.BigInteger;

import com.lacunalabs.dm.data.physics.experiment.Processor;
import com.lacunalabs.dm.data.physics.experiment.TemExperiment;
import com.lacunalabs.dm.processing.ProcessorFactory;

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping("/temexperiments")
@Controller
@RooWebScaffold(path = "temexperiments", formBackingObject = TemExperiment.class)
public class TemExperimentController {
	
	@RequestMapping(value="/process", method = RequestMethod.GET)
	ModelAndView process(@RequestParam String objectId, @RequestParam String processorId)
	{
		 ModelAndView mav = new ModelAndView();
		 mav.setViewName("results/sad");
	     mav.addObject("message", "Hello World From Jim!");
	     return mav;
	}
	
	 @RequestMapping(value = "process/{id}/{processId}", produces = "text/html", method = RequestMethod.GET)
	 public String process(@PathVariable("id") BigInteger id, @PathVariable("processId") BigInteger processId, Model uiModel) {
		 TemExperiment experiment =  temExperimentService.findTemExperiment(id);
		 Processor processor = processorService.findProcessor(processId);
		 Object results = ProcessorFactory.process(processor.getProcessClass(), processor.getProcessInputTranslatorClass(), experiment);
		 
	     uiModel.addAttribute("results", results);
	     uiModel.addAttribute("modelId", id);
	     uiModel.addAttribute("processorId", id);
	     return "results/" + processor.getName().toLowerCase();
	 }
}

// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.web;

import com.lacunalabs.dm.data.physics.fundamental.ParticleEnumerator;
import com.lacunalabs.dm.data.repository.physics.fundamental.ParticleEnumeratorService;
import com.lacunalabs.dm.data.repository.physics.fundamental.ParticleService;
import com.lacunalabs.dm.web.ParticleEnumeratorController;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect ParticleEnumeratorController_Roo_Controller {
    
    @Autowired
    ParticleEnumeratorService ParticleEnumeratorController.particleEnumeratorService;
    
    @Autowired
    ParticleService ParticleEnumeratorController.particleService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String ParticleEnumeratorController.create(@Valid ParticleEnumerator particleEnumerator, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, particleEnumerator);
            return "particleenumerators/create";
        }
        uiModel.asMap().clear();
        particleEnumeratorService.saveParticleEnumerator(particleEnumerator);
        return "redirect:/particleenumerators/" + encodeUrlPathSegment(particleEnumerator.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String ParticleEnumeratorController.createForm(Model uiModel) {
        populateEditForm(uiModel, new ParticleEnumerator());
        return "particleenumerators/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String ParticleEnumeratorController.show(@PathVariable("id") BigInteger id, Model uiModel) {
        uiModel.addAttribute("particleenumerator", particleEnumeratorService.findParticleEnumerator(id));
        uiModel.addAttribute("itemId", id);
        return "particleenumerators/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String ParticleEnumeratorController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("particleenumerators", particleEnumeratorService.findParticleEnumeratorEntries(firstResult, sizeNo));
            float nrOfPages = (float) particleEnumeratorService.countAllParticleEnumerators() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("particleenumerators", particleEnumeratorService.findAllParticleEnumerators());
        }
        return "particleenumerators/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String ParticleEnumeratorController.update(@Valid ParticleEnumerator particleEnumerator, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, particleEnumerator);
            return "particleenumerators/update";
        }
        uiModel.asMap().clear();
        particleEnumeratorService.updateParticleEnumerator(particleEnumerator);
        return "redirect:/particleenumerators/" + encodeUrlPathSegment(particleEnumerator.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String ParticleEnumeratorController.updateForm(@PathVariable("id") BigInteger id, Model uiModel) {
        populateEditForm(uiModel, particleEnumeratorService.findParticleEnumerator(id));
        return "particleenumerators/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String ParticleEnumeratorController.delete(@PathVariable("id") BigInteger id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        ParticleEnumerator particleEnumerator = particleEnumeratorService.findParticleEnumerator(id);
        particleEnumeratorService.deleteParticleEnumerator(particleEnumerator);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/particleenumerators";
    }
    
    void ParticleEnumeratorController.populateEditForm(Model uiModel, ParticleEnumerator particleEnumerator) {
        uiModel.addAttribute("particleEnumerator", particleEnumerator);
        uiModel.addAttribute("particles", particleService.findAllParticles());
    }
    
    String ParticleEnumeratorController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}

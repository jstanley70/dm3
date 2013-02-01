// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.web;

import com.lacunalabs.dm.data.physics.fundamental.Particle;
import com.lacunalabs.dm.data.repository.physics.fundamental.ParticleService;
import com.lacunalabs.dm.shared.physics.fundamental.MetaDataType;
import com.lacunalabs.dm.shared.physics.fundamental.ParticleType;
import com.lacunalabs.dm.web.ParticleController;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.util.Arrays;
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

privileged aspect ParticleController_Roo_Controller {
    
    @Autowired
    ParticleService ParticleController.particleService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String ParticleController.create(@Valid Particle particle, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, particle);
            return "particles/create";
        }
        uiModel.asMap().clear();
        particleService.saveParticle(particle);
        return "redirect:/particles/" + encodeUrlPathSegment(particle.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String ParticleController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Particle());
        return "particles/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String ParticleController.show(@PathVariable("id") BigInteger id, Model uiModel) {
        uiModel.addAttribute("particle", particleService.findParticle(id));
        uiModel.addAttribute("itemId", id);
        return "particles/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String ParticleController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("particles", particleService.findParticleEntries(firstResult, sizeNo));
            float nrOfPages = (float) particleService.countAllParticles() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("particles", particleService.findAllParticles());
        }
        return "particles/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String ParticleController.update(@Valid Particle particle, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, particle);
            return "particles/update";
        }
        uiModel.asMap().clear();
        particleService.updateParticle(particle);
        return "redirect:/particles/" + encodeUrlPathSegment(particle.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String ParticleController.updateForm(@PathVariable("id") BigInteger id, Model uiModel) {
        populateEditForm(uiModel, particleService.findParticle(id));
        return "particles/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String ParticleController.delete(@PathVariable("id") BigInteger id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Particle particle = particleService.findParticle(id);
        particleService.deleteParticle(particle);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/particles";
    }
    
    void ParticleController.populateEditForm(Model uiModel, Particle particle) {
        uiModel.addAttribute("particle", particle);
        uiModel.addAttribute("metadatatypes", Arrays.asList(MetaDataType.values()));
        uiModel.addAttribute("particletypes", Arrays.asList(ParticleType.values()));
    }
    
    String ParticleController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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

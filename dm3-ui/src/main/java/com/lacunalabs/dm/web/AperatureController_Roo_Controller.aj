// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.web;

import com.lacunalabs.dm.data.physics.instruments.Aperature;
import com.lacunalabs.dm.data.repository.physics.instruments.AperatureService;
import com.lacunalabs.dm.shared.physics.fundamental.MetaDataType;
import com.lacunalabs.dm.web.AperatureController;
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

privileged aspect AperatureController_Roo_Controller {
    
    @Autowired
    AperatureService AperatureController.aperatureService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String AperatureController.create(@Valid Aperature aperature, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, aperature);
            return "aperatures/create";
        }
        uiModel.asMap().clear();
        aperatureService.saveAperature(aperature);
        return "redirect:/aperatures/" + encodeUrlPathSegment(aperature.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String AperatureController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Aperature());
        return "aperatures/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String AperatureController.show(@PathVariable("id") BigInteger id, Model uiModel) {
        uiModel.addAttribute("aperature", aperatureService.findAperature(id));
        uiModel.addAttribute("itemId", id);
        return "aperatures/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String AperatureController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("aperatures", aperatureService.findAperatureEntries(firstResult, sizeNo));
            float nrOfPages = (float) aperatureService.countAllAperatures() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("aperatures", aperatureService.findAllAperatures());
        }
        return "aperatures/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String AperatureController.update(@Valid Aperature aperature, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, aperature);
            return "aperatures/update";
        }
        uiModel.asMap().clear();
        aperatureService.updateAperature(aperature);
        return "redirect:/aperatures/" + encodeUrlPathSegment(aperature.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String AperatureController.updateForm(@PathVariable("id") BigInteger id, Model uiModel) {
        populateEditForm(uiModel, aperatureService.findAperature(id));
        return "aperatures/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String AperatureController.delete(@PathVariable("id") BigInteger id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Aperature aperature = aperatureService.findAperature(id);
        aperatureService.deleteAperature(aperature);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/aperatures";
    }
    
    void AperatureController.populateEditForm(Model uiModel, Aperature aperature) {
        uiModel.addAttribute("aperature", aperature);
        uiModel.addAttribute("metadatatypes", Arrays.asList(MetaDataType.values()));
    }
    
    String AperatureController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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

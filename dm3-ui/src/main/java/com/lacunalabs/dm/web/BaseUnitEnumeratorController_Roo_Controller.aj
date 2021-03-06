// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.web;

import com.lacunalabs.dm.data.physics.fundamental.BaseUnitEnumerator;
import com.lacunalabs.dm.data.repository.physics.fundamental.BaseUnitEnumeratorService;
import com.lacunalabs.dm.data.repository.physics.fundamental.BaseUnitService;
import com.lacunalabs.dm.web.BaseUnitEnumeratorController;
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

privileged aspect BaseUnitEnumeratorController_Roo_Controller {
    
    @Autowired
    BaseUnitEnumeratorService BaseUnitEnumeratorController.baseUnitEnumeratorService;
    
    @Autowired
    BaseUnitService BaseUnitEnumeratorController.baseUnitService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String BaseUnitEnumeratorController.create(@Valid BaseUnitEnumerator baseUnitEnumerator, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, baseUnitEnumerator);
            return "baseunitenumerators/create";
        }
        uiModel.asMap().clear();
        baseUnitEnumeratorService.saveBaseUnitEnumerator(baseUnitEnumerator);
        return "redirect:/baseunitenumerators/" + encodeUrlPathSegment(baseUnitEnumerator.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String BaseUnitEnumeratorController.createForm(Model uiModel) {
        populateEditForm(uiModel, new BaseUnitEnumerator());
        return "baseunitenumerators/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String BaseUnitEnumeratorController.show(@PathVariable("id") BigInteger id, Model uiModel) {
        uiModel.addAttribute("baseunitenumerator", baseUnitEnumeratorService.findBaseUnitEnumerator(id));
        uiModel.addAttribute("itemId", id);
        return "baseunitenumerators/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String BaseUnitEnumeratorController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("baseunitenumerators", baseUnitEnumeratorService.findBaseUnitEnumeratorEntries(firstResult, sizeNo));
            float nrOfPages = (float) baseUnitEnumeratorService.countAllBaseUnitEnumerators() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("baseunitenumerators", baseUnitEnumeratorService.findAllBaseUnitEnumerators());
        }
        return "baseunitenumerators/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String BaseUnitEnumeratorController.update(@Valid BaseUnitEnumerator baseUnitEnumerator, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, baseUnitEnumerator);
            return "baseunitenumerators/update";
        }
        uiModel.asMap().clear();
        baseUnitEnumeratorService.updateBaseUnitEnumerator(baseUnitEnumerator);
        return "redirect:/baseunitenumerators/" + encodeUrlPathSegment(baseUnitEnumerator.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String BaseUnitEnumeratorController.updateForm(@PathVariable("id") BigInteger id, Model uiModel) {
        populateEditForm(uiModel, baseUnitEnumeratorService.findBaseUnitEnumerator(id));
        return "baseunitenumerators/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String BaseUnitEnumeratorController.delete(@PathVariable("id") BigInteger id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        BaseUnitEnumerator baseUnitEnumerator = baseUnitEnumeratorService.findBaseUnitEnumerator(id);
        baseUnitEnumeratorService.deleteBaseUnitEnumerator(baseUnitEnumerator);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/baseunitenumerators";
    }
    
    void BaseUnitEnumeratorController.populateEditForm(Model uiModel, BaseUnitEnumerator baseUnitEnumerator) {
        uiModel.addAttribute("baseUnitEnumerator", baseUnitEnumerator);
        uiModel.addAttribute("baseunits", baseUnitService.findAllBaseUnits());
    }
    
    String BaseUnitEnumeratorController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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

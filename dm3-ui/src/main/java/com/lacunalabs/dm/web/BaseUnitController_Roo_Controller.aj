// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.web;

import com.lacunalabs.dm.data.physics.fundamental.BaseUnit;
import com.lacunalabs.dm.data.repository.physics.fundamental.BaseUnitService;
import com.lacunalabs.dm.data.repository.physics.fundamental.DecimalMultiplierService;
import com.lacunalabs.dm.shared.physics.fundamental.UnitType;
import com.lacunalabs.dm.web.BaseUnitController;
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

privileged aspect BaseUnitController_Roo_Controller {
    
    @Autowired
    BaseUnitService BaseUnitController.baseUnitService;
    
    @Autowired
    DecimalMultiplierService BaseUnitController.decimalMultiplierService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String BaseUnitController.create(@Valid BaseUnit baseUnit, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, baseUnit);
            return "baseunits/create";
        }
        uiModel.asMap().clear();
        baseUnitService.saveBaseUnit(baseUnit);
        return "redirect:/baseunits/" + encodeUrlPathSegment(baseUnit.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String BaseUnitController.createForm(Model uiModel) {
        populateEditForm(uiModel, new BaseUnit());
        return "baseunits/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String BaseUnitController.show(@PathVariable("id") BigInteger id, Model uiModel) {
        uiModel.addAttribute("baseunit", baseUnitService.findBaseUnit(id));
        uiModel.addAttribute("itemId", id);
        return "baseunits/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String BaseUnitController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("baseunits", baseUnitService.findBaseUnitEntries(firstResult, sizeNo));
            float nrOfPages = (float) baseUnitService.countAllBaseUnits() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("baseunits", baseUnitService.findAllBaseUnits());
        }
        return "baseunits/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String BaseUnitController.update(@Valid BaseUnit baseUnit, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, baseUnit);
            return "baseunits/update";
        }
        uiModel.asMap().clear();
        baseUnitService.updateBaseUnit(baseUnit);
        return "redirect:/baseunits/" + encodeUrlPathSegment(baseUnit.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String BaseUnitController.updateForm(@PathVariable("id") BigInteger id, Model uiModel) {
        populateEditForm(uiModel, baseUnitService.findBaseUnit(id));
        return "baseunits/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String BaseUnitController.delete(@PathVariable("id") BigInteger id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        BaseUnit baseUnit = baseUnitService.findBaseUnit(id);
        baseUnitService.deleteBaseUnit(baseUnit);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/baseunits";
    }
    
    void BaseUnitController.populateEditForm(Model uiModel, BaseUnit baseUnit) {
        uiModel.addAttribute("baseUnit", baseUnit);
        uiModel.addAttribute("decimalmultipliers", decimalMultiplierService.findAllDecimalMultipliers());
        uiModel.addAttribute("unittypes", Arrays.asList(UnitType.values()));
    }
    
    String BaseUnitController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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

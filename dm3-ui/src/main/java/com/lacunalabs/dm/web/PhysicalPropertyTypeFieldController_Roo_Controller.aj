// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.web;

import com.lacunalabs.dm.data.physics.fundamental.PhysicalPropertyTypeField;
import com.lacunalabs.dm.data.repository.physics.fundamental.PhysicalPropertyTypeFieldService;
import com.lacunalabs.dm.data.repository.physics.fundamental.PhysicalPropertyTypeService;
import com.lacunalabs.dm.web.PhysicalPropertyTypeFieldController;
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

privileged aspect PhysicalPropertyTypeFieldController_Roo_Controller {
    
    @Autowired
    PhysicalPropertyTypeFieldService PhysicalPropertyTypeFieldController.physicalPropertyTypeFieldService;
    
    @Autowired
    PhysicalPropertyTypeService PhysicalPropertyTypeFieldController.physicalPropertyTypeService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String PhysicalPropertyTypeFieldController.create(@Valid PhysicalPropertyTypeField physicalPropertyTypeField, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, physicalPropertyTypeField);
            return "physicalpropertytypefields/create";
        }
        uiModel.asMap().clear();
        physicalPropertyTypeFieldService.savePhysicalPropertyTypeField(physicalPropertyTypeField);
        return "redirect:/physicalpropertytypefields/" + encodeUrlPathSegment(physicalPropertyTypeField.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String PhysicalPropertyTypeFieldController.createForm(Model uiModel) {
        populateEditForm(uiModel, new PhysicalPropertyTypeField());
        return "physicalpropertytypefields/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String PhysicalPropertyTypeFieldController.show(@PathVariable("id") BigInteger id, Model uiModel) {
        uiModel.addAttribute("physicalpropertytypefield", physicalPropertyTypeFieldService.findPhysicalPropertyTypeField(id));
        uiModel.addAttribute("itemId", id);
        return "physicalpropertytypefields/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String PhysicalPropertyTypeFieldController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("physicalpropertytypefields", physicalPropertyTypeFieldService.findPhysicalPropertyTypeFieldEntries(firstResult, sizeNo));
            float nrOfPages = (float) physicalPropertyTypeFieldService.countAllPhysicalPropertyTypeFields() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("physicalpropertytypefields", physicalPropertyTypeFieldService.findAllPhysicalPropertyTypeFields());
        }
        return "physicalpropertytypefields/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String PhysicalPropertyTypeFieldController.update(@Valid PhysicalPropertyTypeField physicalPropertyTypeField, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, physicalPropertyTypeField);
            return "physicalpropertytypefields/update";
        }
        uiModel.asMap().clear();
        physicalPropertyTypeFieldService.updatePhysicalPropertyTypeField(physicalPropertyTypeField);
        return "redirect:/physicalpropertytypefields/" + encodeUrlPathSegment(physicalPropertyTypeField.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String PhysicalPropertyTypeFieldController.updateForm(@PathVariable("id") BigInteger id, Model uiModel) {
        populateEditForm(uiModel, physicalPropertyTypeFieldService.findPhysicalPropertyTypeField(id));
        return "physicalpropertytypefields/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String PhysicalPropertyTypeFieldController.delete(@PathVariable("id") BigInteger id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        PhysicalPropertyTypeField physicalPropertyTypeField = physicalPropertyTypeFieldService.findPhysicalPropertyTypeField(id);
        physicalPropertyTypeFieldService.deletePhysicalPropertyTypeField(physicalPropertyTypeField);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/physicalpropertytypefields";
    }
    
    void PhysicalPropertyTypeFieldController.populateEditForm(Model uiModel, PhysicalPropertyTypeField physicalPropertyTypeField) {
        uiModel.addAttribute("physicalPropertyTypeField", physicalPropertyTypeField);
        uiModel.addAttribute("physicalpropertytypes", physicalPropertyTypeService.findAllPhysicalPropertyTypes());
    }
    
    String PhysicalPropertyTypeFieldController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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

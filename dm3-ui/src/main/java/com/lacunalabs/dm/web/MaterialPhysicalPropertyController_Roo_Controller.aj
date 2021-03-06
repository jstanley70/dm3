// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.web;

import com.lacunalabs.dm.data.physics.solidstate.MaterialPhysicalProperty;
import com.lacunalabs.dm.data.repository.physics.fundamental.PhysicalPropertyTypeService;
import com.lacunalabs.dm.data.repository.physics.solidstate.MaterialPhysicalPropertyService;
import com.lacunalabs.dm.data.repository.physics.solidstate.MaterialService;
import com.lacunalabs.dm.shared.physics.fundamental.UncertaintyType;
import com.lacunalabs.dm.web.MaterialPhysicalPropertyController;
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

privileged aspect MaterialPhysicalPropertyController_Roo_Controller {
    
    @Autowired
    MaterialPhysicalPropertyService MaterialPhysicalPropertyController.materialPhysicalPropertyService;
    
    @Autowired
    PhysicalPropertyTypeService MaterialPhysicalPropertyController.physicalPropertyTypeService;
    
    @Autowired
    MaterialService MaterialPhysicalPropertyController.materialService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String MaterialPhysicalPropertyController.create(@Valid MaterialPhysicalProperty materialPhysicalProperty, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, materialPhysicalProperty);
            return "materialphysicalpropertys/create";
        }
        uiModel.asMap().clear();
        materialPhysicalPropertyService.saveMaterialPhysicalProperty(materialPhysicalProperty);
        return "redirect:/materialphysicalpropertys/" + encodeUrlPathSegment(materialPhysicalProperty.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String MaterialPhysicalPropertyController.createForm(Model uiModel) {
        populateEditForm(uiModel, new MaterialPhysicalProperty());
        return "materialphysicalpropertys/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String MaterialPhysicalPropertyController.show(@PathVariable("id") BigInteger id, Model uiModel) {
        uiModel.addAttribute("materialphysicalproperty", materialPhysicalPropertyService.findMaterialPhysicalProperty(id));
        uiModel.addAttribute("itemId", id);
        return "materialphysicalpropertys/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String MaterialPhysicalPropertyController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("materialphysicalpropertys", materialPhysicalPropertyService.findMaterialPhysicalPropertyEntries(firstResult, sizeNo));
            float nrOfPages = (float) materialPhysicalPropertyService.countAllMaterialPhysicalPropertys() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("materialphysicalpropertys", materialPhysicalPropertyService.findAllMaterialPhysicalPropertys());
        }
        return "materialphysicalpropertys/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String MaterialPhysicalPropertyController.update(@Valid MaterialPhysicalProperty materialPhysicalProperty, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, materialPhysicalProperty);
            return "materialphysicalpropertys/update";
        }
        uiModel.asMap().clear();
        materialPhysicalPropertyService.updateMaterialPhysicalProperty(materialPhysicalProperty);
        return "redirect:/materialphysicalpropertys/" + encodeUrlPathSegment(materialPhysicalProperty.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String MaterialPhysicalPropertyController.updateForm(@PathVariable("id") BigInteger id, Model uiModel) {
        populateEditForm(uiModel, materialPhysicalPropertyService.findMaterialPhysicalProperty(id));
        return "materialphysicalpropertys/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String MaterialPhysicalPropertyController.delete(@PathVariable("id") BigInteger id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        MaterialPhysicalProperty materialPhysicalProperty = materialPhysicalPropertyService.findMaterialPhysicalProperty(id);
        materialPhysicalPropertyService.deleteMaterialPhysicalProperty(materialPhysicalProperty);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/materialphysicalpropertys";
    }
    
    void MaterialPhysicalPropertyController.populateEditForm(Model uiModel, MaterialPhysicalProperty materialPhysicalProperty) {
        uiModel.addAttribute("materialPhysicalProperty", materialPhysicalProperty);
        uiModel.addAttribute("physicalpropertytypes", physicalPropertyTypeService.findAllPhysicalPropertyTypes());
        uiModel.addAttribute("materials", materialService.findAllMaterials());
        uiModel.addAttribute("uncertaintytypes", Arrays.asList(UncertaintyType.values()));
    }
    
    String MaterialPhysicalPropertyController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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

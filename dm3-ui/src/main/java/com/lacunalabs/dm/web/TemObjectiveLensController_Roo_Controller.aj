// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.web;

import com.lacunalabs.dm.data.physics.instruments.TemObjectiveLens;
import com.lacunalabs.dm.data.repository.physics.instruments.LensPhysicalPropertyService;
import com.lacunalabs.dm.data.repository.physics.instruments.TemObjectiveLensService;
import com.lacunalabs.dm.shared.physics.fundamental.MetaDataType;
import com.lacunalabs.dm.web.TemObjectiveLensController;
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

privileged aspect TemObjectiveLensController_Roo_Controller {
    
    @Autowired
    TemObjectiveLensService TemObjectiveLensController.temObjectiveLensService;
    
    @Autowired
    LensPhysicalPropertyService TemObjectiveLensController.lensPhysicalPropertyService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String TemObjectiveLensController.create(@Valid TemObjectiveLens temObjectiveLens, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, temObjectiveLens);
            return "temobjectivelenses/create";
        }
        uiModel.asMap().clear();
        temObjectiveLensService.saveTemObjectiveLens(temObjectiveLens);
        return "redirect:/temobjectivelenses/" + encodeUrlPathSegment(temObjectiveLens.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String TemObjectiveLensController.createForm(Model uiModel) {
        populateEditForm(uiModel, new TemObjectiveLens());
        return "temobjectivelenses/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String TemObjectiveLensController.show(@PathVariable("id") BigInteger id, Model uiModel) {
        uiModel.addAttribute("temobjectivelens", temObjectiveLensService.findTemObjectiveLens(id));
        uiModel.addAttribute("itemId", id);
        return "temobjectivelenses/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String TemObjectiveLensController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("temobjectivelenses", temObjectiveLensService.findTemObjectiveLensEntries(firstResult, sizeNo));
            float nrOfPages = (float) temObjectiveLensService.countAllTemObjectiveLenses() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("temobjectivelenses", temObjectiveLensService.findAllTemObjectiveLenses());
        }
        return "temobjectivelenses/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String TemObjectiveLensController.update(@Valid TemObjectiveLens temObjectiveLens, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, temObjectiveLens);
            return "temobjectivelenses/update";
        }
        uiModel.asMap().clear();
        temObjectiveLensService.updateTemObjectiveLens(temObjectiveLens);
        return "redirect:/temobjectivelenses/" + encodeUrlPathSegment(temObjectiveLens.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String TemObjectiveLensController.updateForm(@PathVariable("id") BigInteger id, Model uiModel) {
        populateEditForm(uiModel, temObjectiveLensService.findTemObjectiveLens(id));
        return "temobjectivelenses/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String TemObjectiveLensController.delete(@PathVariable("id") BigInteger id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        TemObjectiveLens temObjectiveLens = temObjectiveLensService.findTemObjectiveLens(id);
        temObjectiveLensService.deleteTemObjectiveLens(temObjectiveLens);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/temobjectivelenses";
    }
    
    void TemObjectiveLensController.populateEditForm(Model uiModel, TemObjectiveLens temObjectiveLens) {
        uiModel.addAttribute("temObjectiveLens", temObjectiveLens);
        uiModel.addAttribute("lensphysicalpropertys", lensPhysicalPropertyService.findAllLensPhysicalPropertys());
        uiModel.addAttribute("metadatatypes", Arrays.asList(MetaDataType.values()));
    }
    
    String TemObjectiveLensController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
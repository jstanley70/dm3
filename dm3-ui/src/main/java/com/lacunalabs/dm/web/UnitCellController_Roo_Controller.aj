// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.web;

import com.lacunalabs.dm.data.physics.crystallography.UnitCell;
import com.lacunalabs.dm.data.repository.physics.crystallography.AtomicPositionService;
import com.lacunalabs.dm.data.repository.physics.crystallography.BravaisLatticeService;
import com.lacunalabs.dm.data.repository.physics.crystallography.SpaceGroupService;
import com.lacunalabs.dm.data.repository.physics.crystallography.UnitCellPhysicalPropertyService;
import com.lacunalabs.dm.data.repository.physics.crystallography.UnitCellService;
import com.lacunalabs.dm.data.repository.physics.crystallography.UnitCellTypeService;
import com.lacunalabs.dm.shared.physics.fundamental.MetaDataType;
import com.lacunalabs.dm.web.UnitCellController;
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

privileged aspect UnitCellController_Roo_Controller {
    
    @Autowired
    UnitCellService UnitCellController.unitCellService;
    
    @Autowired
    AtomicPositionService UnitCellController.atomicPositionService;
    
    @Autowired
    BravaisLatticeService UnitCellController.bravaisLatticeService;
    
    @Autowired
    SpaceGroupService UnitCellController.spaceGroupService;
    
    @Autowired
    UnitCellPhysicalPropertyService UnitCellController.unitCellPhysicalPropertyService;
    
    @Autowired
    UnitCellTypeService UnitCellController.unitCellTypeService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String UnitCellController.create(@Valid UnitCell unitCell, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, unitCell);
            return "unitcells/create";
        }
        uiModel.asMap().clear();
        unitCellService.saveUnitCell(unitCell);
        return "redirect:/unitcells/" + encodeUrlPathSegment(unitCell.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String UnitCellController.createForm(Model uiModel) {
        populateEditForm(uiModel, new UnitCell());
        return "unitcells/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String UnitCellController.show(@PathVariable("id") BigInteger id, Model uiModel) {
        uiModel.addAttribute("unitcell", unitCellService.findUnitCell(id));
        uiModel.addAttribute("itemId", id);
        return "unitcells/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String UnitCellController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("unitcells", unitCellService.findUnitCellEntries(firstResult, sizeNo));
            float nrOfPages = (float) unitCellService.countAllUnitCells() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("unitcells", unitCellService.findAllUnitCells());
        }
        return "unitcells/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String UnitCellController.update(@Valid UnitCell unitCell, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, unitCell);
            return "unitcells/update";
        }
        uiModel.asMap().clear();
        unitCellService.updateUnitCell(unitCell);
        return "redirect:/unitcells/" + encodeUrlPathSegment(unitCell.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String UnitCellController.updateForm(@PathVariable("id") BigInteger id, Model uiModel) {
        populateEditForm(uiModel, unitCellService.findUnitCell(id));
        return "unitcells/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String UnitCellController.delete(@PathVariable("id") BigInteger id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        UnitCell unitCell = unitCellService.findUnitCell(id);
        unitCellService.deleteUnitCell(unitCell);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/unitcells";
    }
    
    void UnitCellController.populateEditForm(Model uiModel, UnitCell unitCell) {
        uiModel.addAttribute("unitCell", unitCell);
        uiModel.addAttribute("atomicpositions", atomicPositionService.findAllAtomicPositions());
        uiModel.addAttribute("bravaislattices", bravaisLatticeService.findAllBravaisLattices());
        uiModel.addAttribute("spacegroups", spaceGroupService.findAllSpaceGroups());
        uiModel.addAttribute("unitcellphysicalpropertys", unitCellPhysicalPropertyService.findAllUnitCellPhysicalPropertys());
        uiModel.addAttribute("unitcelltypes", unitCellTypeService.findAllUnitCellTypes());
        uiModel.addAttribute("metadatatypes", Arrays.asList(MetaDataType.values()));
    }
    
    String UnitCellController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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

// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.rooinaction.cmsapp.web;

import com.rooinaction.cmsapp.domain.CourseCatalog;
import java.io.UnsupportedEncodingException;
import java.lang.Integer;
import java.lang.Long;
import java.lang.String;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect CourseCatalogController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String CourseCatalogController.create(@Valid CourseCatalog courseCatalog, BindingResult result, Model model, HttpServletRequest request) {
        if (result.hasErrors()) {
            model.addAttribute("courseCatalog", courseCatalog);
            return "coursecatalogs/create";
        }
        courseCatalog.persist();
        return "redirect:/coursecatalogs/" + encodeUrlPathSegment(courseCatalog.getId().toString(), request);
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String CourseCatalogController.createForm(Model model) {
        model.addAttribute("courseCatalog", new CourseCatalog());
        return "coursecatalogs/create";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String CourseCatalogController.show(@PathVariable("id") Long id, Model model) {
        model.addAttribute("coursecatalog", CourseCatalog.findCourseCatalog(id));
        model.addAttribute("itemId", id);
        return "coursecatalogs/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String CourseCatalogController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model model) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            model.addAttribute("coursecatalogs", CourseCatalog.findCourseCatalogEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) CourseCatalog.countCourseCatalogs() / sizeNo;
            model.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            model.addAttribute("coursecatalogs", CourseCatalog.findAllCourseCatalogs());
        }
        return "coursecatalogs/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String CourseCatalogController.update(@Valid CourseCatalog courseCatalog, BindingResult result, Model model, HttpServletRequest request) {
        if (result.hasErrors()) {
            model.addAttribute("courseCatalog", courseCatalog);
            return "coursecatalogs/update";
        }
        courseCatalog.merge();
        return "redirect:/coursecatalogs/" + encodeUrlPathSegment(courseCatalog.getId().toString(), request);
    }
    
    @RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String CourseCatalogController.updateForm(@PathVariable("id") Long id, Model model) {
        model.addAttribute("courseCatalog", CourseCatalog.findCourseCatalog(id));
        return "coursecatalogs/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String CourseCatalogController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model model) {
        CourseCatalog.findCourseCatalog(id).remove();
        model.addAttribute("page", (page == null) ? "1" : page.toString());
        model.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/coursecatalogs?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }
    
    String CourseCatalogController.encodeUrlPathSegment(String pathSegment, HttpServletRequest request) {
        String enc = request.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        }
        catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}

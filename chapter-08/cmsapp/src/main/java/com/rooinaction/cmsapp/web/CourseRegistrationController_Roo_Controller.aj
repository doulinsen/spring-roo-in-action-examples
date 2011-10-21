// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.rooinaction.cmsapp.web;

import com.rooinaction.cmsapp.domain.CourseRegistration;
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

privileged aspect CourseRegistrationController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String CourseRegistrationController.create(@Valid CourseRegistration courseRegistration, BindingResult result, Model model, HttpServletRequest request) {
        if (result.hasErrors()) {
            model.addAttribute("courseRegistration", courseRegistration);
            return "courseregistrations/create";
        }
        courseRegistration.persist();
        return "redirect:/courseregistrations/" + encodeUrlPathSegment(courseRegistration.get_id().toString(), request);
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String CourseRegistrationController.createForm(Model model) {
        model.addAttribute("courseRegistration", new CourseRegistration());
        return "courseregistrations/create";
    }
    
    @RequestMapping(value = "/{_id}", method = RequestMethod.GET)
    public String CourseRegistrationController.show(@PathVariable("_id") Long _id, Model model) {
        model.addAttribute("courseregistration", CourseRegistration.findCourseRegistration(_id));
        model.addAttribute("itemId", _id);
        return "courseregistrations/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String CourseRegistrationController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model model) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            model.addAttribute("courseregistrations", CourseRegistration.findCourseRegistrationEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) CourseRegistration.countCourseRegistrations() / sizeNo;
            model.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            model.addAttribute("courseregistrations", CourseRegistration.findAllCourseRegistrations());
        }
        return "courseregistrations/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String CourseRegistrationController.update(@Valid CourseRegistration courseRegistration, BindingResult result, Model model, HttpServletRequest request) {
        if (result.hasErrors()) {
            model.addAttribute("courseRegistration", courseRegistration);
            return "courseregistrations/update";
        }
        courseRegistration.merge();
        return "redirect:/courseregistrations/" + encodeUrlPathSegment(courseRegistration.get_id().toString(), request);
    }
    
    @RequestMapping(value = "/{_id}", params = "form", method = RequestMethod.GET)
    public String CourseRegistrationController.updateForm(@PathVariable("_id") Long _id, Model model) {
        model.addAttribute("courseRegistration", CourseRegistration.findCourseRegistration(_id));
        return "courseregistrations/update";
    }
    
    @RequestMapping(value = "/{_id}", method = RequestMethod.DELETE)
    public String CourseRegistrationController.delete(@PathVariable("_id") Long _id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model model) {
        CourseRegistration.findCourseRegistration(_id).remove();
        model.addAttribute("page", (page == null) ? "1" : page.toString());
        model.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/courseregistrations?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }
    
    String CourseRegistrationController.encodeUrlPathSegment(String pathSegment, HttpServletRequest request) {
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

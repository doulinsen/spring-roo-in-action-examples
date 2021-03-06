package org.rooinaction.coursemanager.domain;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class CourseRegistration {

    private Integer id;

    @NotNull
    @Size(min = 2)
    private String name;

    private Long studentId;

    private Long courseId;
}

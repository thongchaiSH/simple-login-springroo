package com.roo.project;
import com.roo.project.domain.AppRole;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;

@RooWebJson(jsonObject = AppRole.class)
@Controller
@RequestMapping("/approles")
@RooWebScaffold(path = "approles", formBackingObject = AppRole.class)
public class AppRoleController {
}

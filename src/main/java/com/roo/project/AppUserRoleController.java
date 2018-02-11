package com.roo.project;
import com.roo.project.domain.AppUserRole;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;

@RooWebJson(jsonObject = AppUserRole.class)
@Controller
@RequestMapping("/appuserroles")
@RooWebScaffold(path = "appuserroles", formBackingObject = AppUserRole.class)
public class AppUserRoleController {
}

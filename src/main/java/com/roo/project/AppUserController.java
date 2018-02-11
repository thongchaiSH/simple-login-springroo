package com.roo.project;
import com.roo.project.domain.AppUser;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;

@RooWebJson(jsonObject = AppUser.class)
@Controller
@RequestMapping("/appusers")
@RooWebScaffold(path = "appusers", formBackingObject = AppUser.class)
public class AppUserController {
}

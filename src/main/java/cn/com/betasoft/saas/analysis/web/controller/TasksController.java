package cn.com.betasoft.saas.analysis.web.controller;

import cn.com.betasoft.saas.analysis.model.*;
import cn.com.betasoft.saas.analysis.service.MySqlBaseService;
import cn.com.betasoft.saas.analysis.service.PGSQLBaseService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/tasks")
public class TasksController {
    private static final Logger log = LoggerFactory.getLogger(TasksController.class);

    @Autowired
    private PGSQLBaseService pgsqlBaseService;

    @Autowired
    private MySqlBaseService mySqlBaseService;

    @RequestMapping("/taskImplementation")
    public ModelAndView taskImplementation(@RequestParam("pageNo") int pageNo, @RequestParam("pageSize") int pageSize) {
        ModelAndView view = new ModelAndView("taskImplementation");
        try {
            String time = mySqlBaseService.getCollectionTime();
            view.addObject("collectionTime", time);
            PageInfo<TasksModel> tasks = mySqlBaseService.getTasks(pageNo, pageSize);
            view.addObject("tasks", tasks);
        } catch (Exception e) {
            log.info("taskImplementation error:" + e);
        }
        return view;
    }

    @RequestMapping("/getTasks")
    public ModelAndView getTasks(@RequestParam("pageNo") int pageNo, @RequestParam("pageSize") int pageSize) {
        ModelAndView view = new ModelAndView("tasksTable");
        try {
            PageInfo<TasksModel> tasks = mySqlBaseService.getTasks(pageNo, pageSize);
            view.addObject("tasks", tasks);
        } catch (Exception e) {
            log.info("getTasks error:" + e);
        }
        return view;
    }
}

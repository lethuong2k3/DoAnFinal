package com.example.demo.controller.user;

import com.example.demo.service.BanToChucService;
import com.example.demo.service.SKTTService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Date;

@Controller
public class HomeController {
    @Autowired
    private BanToChucService btcService;

    @Autowired
    private SKTTService skttService;

    @GetMapping("/")
    public String view (Model model,
                        @RequestParam(value = "name", required = false) String name,
                        @RequestParam(value = "location", required = false) String location,
                        @RequestParam(value = "startDate", required = false) @DateTimeFormat(pattern = "MM/dd/yyyy") Date startDate,
                        @RequestParam(value = "endDate", required = false) @DateTimeFormat(pattern = "MM/dd/yyyy") Date endDate
                        ) {
        model.addAttribute("listBTC", btcService.findAll());
        model.addAttribute("listSKTT", skttService.getAllSearchAndFilter(name, location, startDate, endDate));
        return "user/index";
    }
}

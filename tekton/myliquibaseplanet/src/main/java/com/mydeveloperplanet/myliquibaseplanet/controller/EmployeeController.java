package com.mydeveloperplanet.myliquibaseplanet.controller;

import com.mydeveloperplanet.myliquibaseplanet.dao.EmployeeDao;
import com.mydeveloperplanet.myliquibaseplanet.domain.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class EmployeeController {

    @Autowired
    public EmployeeDao employeeDao;

    @PostMapping(path = "/addEmployee")
    public @ResponseBody
    String addEmployee(@RequestParam String firstName, @RequestParam String lastName, @RequestParam String country) {
        employeeDao.addEmployee(firstName, lastName, country);
        return "Saved Employee";
    }

    @GetMapping(path = "/getAllEmployees")
    public @ResponseBody
    Iterable<Employee> getAllEmployees() {
        return employeeDao.getAllEmployees();
    }

}

package com.endava.liviu.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RemindersController {

	@RequestMapping("/reminders")
	public String getReminders() {
		return "reminders";
	}
}
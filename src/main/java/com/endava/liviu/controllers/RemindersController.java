package com.endava.liviu.controllers;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.endava.liviu.model.Reminder;
import com.endava.liviu.model.ReminderDao;
import com.endava.liviu.model.Schedule;
import com.endava.liviu.model.ScheduleDao;
import com.endava.liviu.model.view.ReminderVM;

@Controller
public class RemindersController {

	@Autowired
	private ReminderDao reminderDao;

	@Autowired
	private ScheduleDao scheduleDao;

	@RequestMapping(value = "/reminders", method = RequestMethod.GET)
	public String getReminders(Map<String, Object> model) {
		model.put("reminders", reminderDao.findAll());
		return "reminders-list";
	}

	@RequestMapping(value = "/reminders/new-reminder", method = RequestMethod.GET)
	public String newReminderGet(Map<String, Object> model) {
		model.put("reminder", new ReminderVM());
		return "reminders-add";
	}

	@RequestMapping(value = "/reminders/new-reminder", method = RequestMethod.POST)
	public String newReminderPost(@ModelAttribute ReminderVM reminderVm) {
		Reminder reminderToSave = new Reminder();
		reminderToSave.setName(reminderVm.getName());
		reminderToSave.setDescription(reminderVm.getDescription());
		reminderToSave.setEnabled(reminderVm.isEnabled());
		reminderToSave
				.setDatetime(LocalDateTime.parse(reminderVm.getDatetime(), DateTimeFormatter.ISO_LOCAL_DATE_TIME));
		Schedule schedule = scheduleDao.findOne(1L);
		reminderToSave.setSchedule(schedule);
		reminderDao.save(reminderToSave);
		return "redirect:/reminders";
	}

	@RequestMapping(value = "/reminders/reminder", method = RequestMethod.GET)
	public String reminderGet() {
		return "redirect:/reminders";
	}

	@RequestMapping(value = "/reminders/reminder", method = RequestMethod.POST)
	public String reminderPost(Map<String, Object> model, Long reminderId) throws Exception {
		model.put("reminder", reminderDao.findOne(reminderId));
		return "reminders-update";
	}

	@RequestMapping(value = "/reminders/update-reminder", method = RequestMethod.GET)
	public String updateReminderGet() {
		return "redirect:/reminders";
	}

	@RequestMapping(value = "/reminders/update-reminder", method = RequestMethod.POST)
	public String updateReminderPost(@ModelAttribute ReminderVM reminderVm, Long reminderId) {
		Reminder reminderToSave = reminderDao.findOne(reminderId);
		reminderToSave.setName(reminderVm.getName());
		reminderToSave.setDescription(reminderVm.getDescription());
		reminderToSave.setEnabled(reminderVm.isEnabled());
		reminderToSave
				.setDatetime(LocalDateTime.parse(reminderVm.getDatetime(), DateTimeFormatter.ISO_LOCAL_DATE_TIME));
		Schedule schedule = scheduleDao.findOne(1L);
		reminderToSave.setSchedule(schedule);
		reminderDao.save(reminderToSave);
		return "redirect:/reminders";
	}

	@RequestMapping(value = "/reminders/remove-reminders", method = RequestMethod.GET)
	public String removeRemindersGet() {
		return "redirect:/reminders";
	}

	@RequestMapping(value = "/reminders/remove-reminders", method = RequestMethod.POST)
	public String removeRemindersPost(@RequestParam("listIds[]") List<Long> listIds) {
		if (listIds != null && listIds.size() > 0) {
			listIds.forEach(el -> reminderDao.delete(el));
		}
		return "reminders-list";
	}

}

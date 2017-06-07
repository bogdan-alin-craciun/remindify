package com.endava.liviu.controllers;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.endava.liviu.model.List;
import com.endava.liviu.model.ListDao;
import com.endava.liviu.model.ListItem;
import com.endava.liviu.model.ListItemDao;
import com.endava.liviu.model.view.ListVM;

@Controller
public class ToDoController {

	@Autowired
	private ListDao listDao;

	@Autowired
	private ListItemDao listItemDao;

	@RequestMapping("/todo")
	public String getLists(Map<String, Object> model) {

		model.put("lists", listDao.findAll());

		return "todo";
	}

	@RequestMapping(value = "/todo/new-list", method = RequestMethod.GET)
	public String newListGet(Map<String, Object> model) {
		model.put("list", new ListVM());
		return "new-list";
	}

	@RequestMapping(value = "/todo/new-list", method = RequestMethod.POST)
	public String newListPost(@ModelAttribute ListVM listVm) {
		List listToSave = new List(listVm.getName());
		listDao.save(listToSave);
		System.out.println(listToSave);
		for (String listItemName : listVm.getListItemNames().split(",")) {
			ListItem listItemToSave = new ListItem(listItemName, false, listToSave);
			listItemDao.save(listItemToSave);
			System.out.println(listItemToSave);
		}
		return "redirect:/todo";
	}

	@RequestMapping(value = "/todo/remove-lists", method = RequestMethod.POST)
	public String removeListsPost(@RequestParam("listIds") String listIds) {
		System.out.println("in post:" + listIds);
		return "redirect:/todo";
	}
}

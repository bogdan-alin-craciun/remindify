package com.endava.liviu.model;

import javax.transaction.Transactional;

import org.springframework.data.repository.CrudRepository;

@Transactional
public interface ListItemDao extends CrudRepository<ListItem, Long> {

	// public ToDoListItem findByName(String name);
}

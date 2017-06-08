package com.endava.liviu.model;

import javax.transaction.Transactional;

import org.springframework.data.repository.CrudRepository;

@Transactional
public interface ReminderDao extends CrudRepository<Reminder, Long> {

	public List findByName(String name);
}

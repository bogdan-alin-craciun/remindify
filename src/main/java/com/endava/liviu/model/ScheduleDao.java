package com.endava.liviu.model;

import org.springframework.data.repository.CrudRepository;

public interface ScheduleDao extends CrudRepository<Schedule, Long> {

	// public List findByName(String name);
}

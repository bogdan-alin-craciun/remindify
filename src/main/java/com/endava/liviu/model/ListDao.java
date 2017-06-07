package com.endava.liviu.model;

import javax.transaction.Transactional;

import org.springframework.data.repository.CrudRepository;

@Transactional
public interface ListDao extends CrudRepository<List, Long> {

	public List findByName(String name);
}

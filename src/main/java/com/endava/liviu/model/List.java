package com.endava.liviu.model;

import java.util.ArrayList;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "list")
public class List {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;

	@NotNull
	private String name;

	@OneToMany(mappedBy = "list", cascade = CascadeType.ALL)
	private java.util.List<ListItem> listItems;

	public List() {
		super();
		this.listItems = new ArrayList<ListItem>();
	}

	public List(String name) {
		super();
		this.name = name;
		this.listItems = new ArrayList<ListItem>();
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public java.util.List<ListItem> getListItems() {
		return listItems;
	}

	public void setListItems(java.util.List<ListItem> listItems) {
		this.listItems = listItems;
	}

	@Override
	public String toString() {
		return "List [id=" + id + ", name=" + name + ", listItems=" + listItems + "]";
	}

}

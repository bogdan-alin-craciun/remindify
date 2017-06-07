package com.endava.liviu.model.view;

public class ListVM {
	private String name;
	private String listItemNames;

	public ListVM() {
		super();
	}

	public ListVM(String name, String listItemNames) {
		super();
		this.name = name;
		this.listItemNames = listItemNames;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getListItemNames() {
		return listItemNames;
	}

	public void setListItemNames(String listItemNames) {
		this.listItemNames = listItemNames;
	}

	@Override
	public String toString() {
		return "ListVM [name=" + name + ", listItemNames=" + listItemNames + "]";
	}

}

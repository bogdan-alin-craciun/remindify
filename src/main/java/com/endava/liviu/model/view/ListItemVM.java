package com.endava.liviu.model.view;

import com.endava.liviu.model.List;

public class ListItemVM {

	private String name;
	private boolean checked = false;
	private List list;

	public ListItemVM() {
		super();
	}

	public ListItemVM(String name, boolean checked, List list) {
		super();
		this.name = name;
		this.checked = checked;
		this.list = list;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public boolean isChecked() {
		return checked;
	}

	public void setChecked(boolean checked) {
		this.checked = checked;
	}

	public List getList() {
		return list;
	}

	public void setList(List list) {
		this.list = list;
	}

	@Override
	public String toString() {
		return "ListItemVM [name=" + name + ", checked=" + checked + ", list=" + list + "]";
	}

}

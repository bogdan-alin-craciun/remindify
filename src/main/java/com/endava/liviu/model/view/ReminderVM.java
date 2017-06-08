package com.endava.liviu.model.view;

public class ReminderVM {

	private String name;
	private String description;
	private String datetime;
	private boolean enabled;
	private String scheduleId;

	public ReminderVM() {
		super();
	}

	public ReminderVM(String name, String description, String date, boolean enabled, String scheduleId) {
		super();
		this.name = name;
		this.description = description;
		this.datetime = date;
		this.enabled = enabled;
		this.scheduleId = scheduleId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getDatetime() {
		return datetime;
	}

	public void setDatetime(String date) {
		this.datetime = date;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public String getScheduleId() {
		return scheduleId;
	}

	public void setScheduleId(String scheduleId) {
		this.scheduleId = scheduleId;
	}

	@Override
	public String toString() {
		return "ReminderVM [name=" + name + ", description=" + description + ", date=" + datetime + ", enabled="
				+ enabled + ", scheduleId=" + scheduleId + "]";
	}

}

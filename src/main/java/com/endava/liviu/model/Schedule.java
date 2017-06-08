package com.endava.liviu.model;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "schedule")
public class Schedule {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@NotNull
	private long id;

	@NotNull
	private String name;

	@NotNull
	private String description;

	@OneToMany(mappedBy = "schedule", cascade = CascadeType.ALL)
	private java.util.List<Reminder> reminders;

	public Schedule() {
		super();
	}

	public Schedule(long id, String name, String description) {
		super();
		this.id = id;
		this.name = name;
		this.description = description;
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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public java.util.List<Reminder> getReminders() {
		return reminders;
	}

	public void setReminders(java.util.List<Reminder> reminders) {
		this.reminders = reminders;
	}

	@Override
	public String toString() {
		return "Schedule [id=" + id + ", name=" + name + ", description=" + description + ", reminders=" + reminders
				+ "]";
	}

}

package com.endava.liviu.model;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Convert;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.Type;

/**
 * @author bocraciun
 *
 */
@Entity
@Table(name = "reminder")
public class Reminder {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;

	@NotNull
	private String name;

	@NotNull
	private String description;

	@Column(columnDefinition = "TINYINT")
	@Type(type = "org.hibernate.type.NumericBooleanType")
	@NotNull
	private boolean enabled;

	@Column(name = "datetime")
	@Convert(converter = LocalDateAttributeConverter.class)
	private LocalDateTime datetime;

	@ManyToOne
	@JoinColumn(name = "schedule_id")
	private Schedule schedule;

	public Reminder() {
		super();
	}

	public Reminder(long id, String name, String description, boolean enabled, LocalDateTime datetime,
			Schedule schedule) {
		super();
		this.id = id;
		this.name = name;
		this.description = description;
		this.enabled = enabled;
		this.datetime = datetime;
		this.schedule = schedule;
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

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public LocalDateTime getDatetime() {
		return datetime;
	}

	public void setDatetime(LocalDateTime datetime) {
		this.datetime = datetime;
	}

	public Schedule getSchedule() {
		return schedule;
	}

	public void setSchedule(Schedule schedule) {
		this.schedule = schedule;
	}

	@Override
	public String toString() {
		return "Reminder [id=" + id + ", name=" + name + ", description=" + description + ", enabled=" + enabled
				+ ", datetime=" + datetime + ", schedule=" + schedule + "]";
	}

}

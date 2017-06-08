package com.endava.liviu.model;

import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.util.Date;

import javax.persistence.AttributeConverter;
import javax.persistence.Converter;

@Converter(autoApply = true)
public class LocalDateAttributeConverter implements AttributeConverter<LocalDateTime, Date> {

	@Override
	public Date convertToDatabaseColumn(LocalDateTime locDateTime) {
		return (locDateTime == null ? null : Date.from(locDateTime.toInstant(ZoneOffset.UTC)));
	}

	@Override
	public LocalDateTime convertToEntityAttribute(Date sqlDate) {
		return (sqlDate == null ? null
				: LocalDateTime.ofInstant(Instant.ofEpochMilli(sqlDate.getTime()), ZoneOffset.UTC));
	}
}

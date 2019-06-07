package com.iurc.util;

import java.sql.Timestamp;

import org.springframework.beans.propertyeditors.PropertiesEditor;

public class TimestampEditor extends PropertiesEditor{
	@Override

	public void setAsText(String text) throws IllegalArgumentException {
		setValue(Timestamp.valueOf(text));

		}

	@Override
	public String getAsText() {
		return getValue().toString();
	}
}

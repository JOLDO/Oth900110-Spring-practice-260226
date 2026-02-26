package com.busanit501.oth900110.controller.formatter;

import org.springframework.format.Formatter;

import java.text.ParseException;
import java.util.Locale;

public class CheckboxFormatter implements Formatter<Boolean> {
    @Override
    public Boolean parse(String text, Locale locale) throws ParseException {
        if(text == null) {
            return false;
        }
        boolean result = text.equals("on");
        return result;
    }

    @Override
    public String print(Boolean object, Locale locale) {
        return object.toString();
    }
}

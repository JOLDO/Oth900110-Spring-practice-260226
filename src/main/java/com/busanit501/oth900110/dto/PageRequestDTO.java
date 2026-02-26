package com.busanit501.oth900110.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.Positive;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.time.LocalDate;
import java.util.Arrays;

@Builder
@Data
@AllArgsConstructor
@NoArgsConstructor
public class PageRequestDTO {
    @Builder.Default
    @Min(value = 1)
    @Positive
    private int page = 1;

    @Builder.Default
    @Min(value = 1)
    @Max(value = 100)
    @Positive
    private int size = 10;

    @Builder.Default
    @Min(value = 5)
    @Max(value = 10)
    private int pageSize = 10;

    private String link;
    public String getLink() {
        if(link == null) {
            StringBuilder builder = new StringBuilder();
            builder.append("page=" + this.page);
            builder.append("&size=" + this.size);
            builder.append("&pageSize=" + this.pageSize);

            if(finished) {
                builder.append("&finished=on");
            }

            if(types != null && types.length > 0) {
                for(int i = 0; i < types.length; i++) {
                    builder.append("&types=" + types[i]);
                }
            }

            if(keyword != null) {
                try {
                    builder.append("&keyword=" + URLEncoder.encode(keyword, "UTF-8"));
                } catch (UnsupportedEncodingException e) {
                    e.printStackTrace();
                }
            }

            if(from != null) {
                builder.append("&from=" + from.toString());
            }

            if(to != null) {
                builder.append("&to=" + to.toString());
            }

            link = builder.toString();
        }
        return link;
    }

    public int getSkip() {
        return (page - 1) * size;
    }

    private String[] types;

    private String keyword;

    private boolean finished;

    private LocalDate from;
    private LocalDate to;

    public boolean checkType(String type) {
        if(types == null || types.length == 0)  return false;
        boolean result = Arrays.stream(types).anyMatch(type::equals);
        return result;
    }
}

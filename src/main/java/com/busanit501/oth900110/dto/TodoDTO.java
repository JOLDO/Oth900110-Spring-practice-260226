package com.busanit501.oth900110.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.Future;
import javax.validation.constraints.NotBlank;
import java.time.LocalDate;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class TodoDTO {
    private Long tno;
    @NotBlank
    private String title;
    @Future
    private LocalDate dueDate;
    private boolean finished;
    @NotBlank
    private String writer;
}

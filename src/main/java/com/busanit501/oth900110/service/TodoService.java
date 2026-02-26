package com.busanit501.oth900110.service;

import com.busanit501.oth900110.dto.PageRequestDTO;
import com.busanit501.oth900110.dto.PageResponseDTO;
import com.busanit501.oth900110.dto.TodoDTO;

import java.util.List;

public interface TodoService {

    void register(TodoDTO todoDTO);

    List<TodoDTO> getAll();

    TodoDTO getOne(Long tno);

    void remove(Long tno);

    void modify(TodoDTO todoDTO);

    PageResponseDTO<TodoDTO> getList(PageRequestDTO pageRequestDTO);

}

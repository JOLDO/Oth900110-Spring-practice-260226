package com.busanit501.oth900110.mapper;

import com.busanit501.oth900110.domain.TodoVO;
import com.busanit501.oth900110.dto.PageRequestDTO;

import java.util.List;

public interface TodoMapper {
    void insert(TodoVO todoVO);

    List<TodoVO> selectAll();

    TodoVO selectOne(Long tno);

    void delete(Long tno);

    void update(TodoVO todoVO);

    List<TodoVO> selectList(PageRequestDTO pageRequestDTO);

    int getCount(PageRequestDTO pageRequestDTO);
}

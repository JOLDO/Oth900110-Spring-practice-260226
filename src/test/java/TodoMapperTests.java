import com.busanit501.oth900110.domain.TodoVO;
import com.busanit501.oth900110.dto.PageRequestDTO;
import com.busanit501.oth900110.mapper.TodoMapper;
import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import java.time.LocalDate;
import java.util.List;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/root-context.xml")
public class TodoMapperTests {
    @Autowired(required = false)
    private TodoMapper todoMapper;

    @Test
    public void testInsert() {
        TodoVO todoVO = TodoVO.builder()
            .title("뭐!!")
            .dueDate(LocalDate.now())
            .finished(false)
            .writer("오태흔")
            .build();
        todoMapper.insert(todoVO);
    }

    @Test
    public void testSelectAll() {
        List<TodoVO> voList = todoMapper.selectAll();
        voList.forEach(vo -> log.info(vo));
    }

    @Test
    public void testSelectOne() {
        TodoVO todoVO = todoMapper.selectOne(32L);
        log.info(todoVO);
    }

    @Test
    public void testDelete() {
        todoMapper.delete(8L);
    }

    @Test
    public void testUpdate() {
        TodoVO todoVO = TodoVO.builder()
            .tno(4L).title("ㅋㅋㄹㅃㅃ")
            .dueDate(LocalDate.now().plusDays(2L))
            .writer("졸졸")
            .finished(false)
            .build();
        todoMapper.update(todoVO);
    }

    //페이징 처리가 된 목록 조회
    @Test
    public void testSelectList() {
        PageRequestDTO pageRequestDTO = PageRequestDTO.builder()
            .page(1)
            .size(10)
            .build();
        List<TodoVO> voList = todoMapper.selectList(pageRequestDTO);
        voList.forEach(vo -> log.info(vo));
    }

    @Test
    public void testSelectListCount() {
        PageRequestDTO pageRequestDTO = PageRequestDTO.builder()
                .page(1)
                .size(10)
                .build();
        int resultCount = todoMapper.getCount(pageRequestDTO);
        log.info("전체 갯수 : " + resultCount);
    }

    @Test
    public void testSelectSearch() {
        PageRequestDTO pageRequestDTO = PageRequestDTO.builder()
            .page(1)
            .size(10)
            .pageSize(10)
            .types(new String[]{"t", "w"})
            .keyword("A")
            .finished(true)
            .from(LocalDate.of(2026, 02, 01))
            .to(LocalDate.of(2026, 02, 28))
            .build();

        List<TodoVO> voList = todoMapper.selectList(pageRequestDTO);
        voList.forEach(vo -> log.info(vo));

        log.info(todoMapper.getCount(pageRequestDTO));
    }
}

import com.busanit501.oth900110.dto.PageRequestDTO;
import com.busanit501.oth900110.dto.PageResponseDTO;
import com.busanit501.oth900110.dto.TodoDTO;
import com.busanit501.oth900110.service.TodoService;
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
public class TodoServiceTests {
    @Autowired
    TodoService todoService;

    @Test
    public void testRegister() {
        TodoDTO todoDTO = TodoDTO.builder()
            .title("뭐!!2")
            .dueDate(LocalDate.now())
            .writer("오태흔")
            .build();
        todoService.register(todoDTO);
    }

    @Test
    public void testGetAll() {
        List<TodoDTO> dtoList = todoService.getAll();
        dtoList.forEach(dto -> log.info(dto));
    }

    @Test
    public void testGetOne() {
        TodoDTO todoDTO = todoService.getOne(2L);
        log.info(todoDTO);
    }

    @Test
    public void testDelete() {
        todoService.remove(2L);
        log.info("출력 삭제완료");
    }

    @Test
    public void testModify() {
        TodoDTO todoDTO = TodoDTO.builder()
            .tno(3L)
            .title("ㅋㅋㄹㅃㅃ2")
            .dueDate(LocalDate.now().plusDays(2L))
            .writer("졸졸")
            .finished(false)
            .build();
        todoService.modify(todoDTO);
    }

    @Test
    public void testPaging() {
        PageRequestDTO pageRequestDTO = PageRequestDTO.builder()
            .page(11)
            .size(10)
            .build();
        PageResponseDTO<TodoDTO> pageResponseDTO = todoService.getList(pageRequestDTO);
        pageResponseDTO.getDtoList().forEach(todoDTO -> log.info("페이징된 데이터 출력 : " + todoDTO));
        log.info("total : " + pageResponseDTO.getTotal());
        log.info("start : " + pageResponseDTO.getStart());
        log.info("end : " + pageResponseDTO.getEnd());
    }
}

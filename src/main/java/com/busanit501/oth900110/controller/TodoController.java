package com.busanit501.oth900110.controller;


import com.busanit501.oth900110.dto.PageRequestDTO;
import com.busanit501.oth900110.dto.PageResponseDTO;
import com.busanit501.oth900110.dto.TodoDTO;
import com.busanit501.oth900110.service.TodoService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;

@Controller
@RequestMapping("/todo")
@Log4j2
@RequiredArgsConstructor
public class TodoController {

    private final TodoService todoService;
    
    @RequestMapping("/list")
    public void list(@Valid PageRequestDTO pageRequestDTO, BindingResult bindingResult, Model model) {
        log.info("pageRequestDTO : " + pageRequestDTO);
        log.info("todo list....페이징 처리가 된 리스트 조회");
        
        if(bindingResult.hasErrors()) {
            pageRequestDTO = PageRequestDTO.builder().build();
        }

        PageResponseDTO<TodoDTO> responseDTO = todoService.getList(pageRequestDTO);
        model.addAttribute("responseDTO",responseDTO);
    }

    @GetMapping({"/read", "/modify"})
    public void read(Long tno, PageRequestDTO pageRequestDTO, Model model) {
        log.info("todo read...");
        TodoDTO todoDTO = todoService.getOne(tno);

        model.addAttribute("dto", todoDTO);
        log.info("출력");
    }

    @PostMapping("/modify")
    public String postModify(@Valid TodoDTO dto,
                         BindingResult bindingResult,
                         PageRequestDTO pageRequestDTO,
                         RedirectAttributes redirectAttributes) {
        log.info("출력 todo modify..." + dto);

        if(bindingResult.hasErrors()) {
            log.info("유효성 오류가 있습니다.");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            redirectAttributes.addAttribute("tno", dto.getTno());
            redirectAttributes.addAttribute("page", pageRequestDTO.getPage());
            redirectAttributes.addAttribute("size", pageRequestDTO.getSize());
            return "redirect:/todo/modify";
        }

        todoService.modify(dto);
        redirectAttributes.addAttribute("tno", dto.getTno());
        redirectAttributes.addAttribute("page",pageRequestDTO.getPage());
        redirectAttributes.addAttribute("size", pageRequestDTO.getSize());
        return "redirect:/todo/read";
    }

    @PostMapping("/delete")
    public String delete(Long tno, PageRequestDTO pageRequestDTO, RedirectAttributes redirectAttributes) {
        log.info("삭제 포스트 처리 작업");
        log.info("출력 삭제할 tno번호 확인 : " + tno);

        todoService.remove(tno);

        redirectAttributes.addAttribute("page", pageRequestDTO.getPage());
        redirectAttributes.addAttribute("size", pageRequestDTO.getSize());

        return "redirect:/todo/list?" + pageRequestDTO.getLink();
    }

    @GetMapping("/register")
    public void getRegister() {
        log.info("출력 todo register..get!");
    }

    @PostMapping("/register")
    public String postRegister(@Valid TodoDTO todoDTO,
                               BindingResult bindingResult,
                               RedirectAttributes redirectAttributes) {
        log.info("todo register..post!");
        log.info("todoDTO : " + todoDTO);

        //유효성 체크
        if(bindingResult.hasErrors()) {
            log.info("유효성 오류가 있습니다.");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            return "redirect:/todo/register";
        }

        todoService.register(todoDTO);
        log.info("유효성 통과한 데이터.");
        return "redirect:/todo/list";
    }
}

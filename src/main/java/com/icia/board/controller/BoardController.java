package com.icia.board.controller;

import com.icia.board.dto.BoardDTO;
import com.icia.board.service.BoardService;
import lombok.Getter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;

@Controller
public class BoardController {

    @Autowired
    private BoardService boardService;

    @GetMapping("/board/save")
    public String saveForm() {
        return "boardPages/boardSave";
    }

    @PostMapping("/boardSave")
    public String save(@ModelAttribute BoardDTO boardDTO) {
        int saveResult = boardService.save(boardDTO);
        if(saveResult > 0) {
            return "boardList";
        } else {
            return "index";
        }
    }

    @GetMapping("/boardList")
    public String listForm(Model model) {
        List<BoardDTO> boardDTOList = boardService.findAll();
        model.addAttribute("List",boardDTOList);
        return "boardList";
    }
}

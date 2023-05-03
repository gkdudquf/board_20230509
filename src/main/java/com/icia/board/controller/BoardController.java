package com.icia.board.controller;

import com.icia.board.dto.BoardDTO;
import com.icia.board.service.BoardService;
import lombok.Getter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/board")
public class BoardController {

    @Autowired
    private BoardService boardService;

//    @GetMapping("/board/save")
    @GetMapping("/save") //@RequestMapping 때문에 "/board" 생략가능
    public String saveForm() {
        return "boardPages/boardSave";
    }

    @PostMapping("/board/save")
    public String save(@ModelAttribute BoardDTO boardDTO) {
        int saveResult = boardService.save(boardDTO);
        if(saveResult > 0) {
            return "redirect:/board/";
        } else {
            return "index";
        }
    }

    @GetMapping("/")
    public String findAll(Model model) {
        List<BoardDTO> boardDTOList = boardService.findAll();
        model.addAttribute("boardList",boardDTOList);
        return "boardPages/boardList";
    }

    @GetMapping("")
    public String detailForm(@RequestParam("id") Long id, Model model) {
        BoardDTO boardDTO = boardService.findById(id);
        boardService.updateHits(id);
        model.addAttribute("boardDTO", boardDTO);
        return "boardPages/boardDetail";
    }

    @GetMapping("/update")
    public String updateForm(@RequestParam("id") Long id, Model model) {
        BoardDTO boardDTO = boardService.findById(id);
        model.addAttribute("boardDTO", boardDTO);
        return "boardPages/boardUpdate";
    }

    @PostMapping("/update")
    public String update(@ModelAttribute BoardDTO boardDTO) {
        boardService.update(boardDTO);
        return "boardPages/boardDetail";
    }

    @GetMapping("/deleteCheck")
    public String delete(@RequestParam("id") Long id) {

        return "boardPages/deleteCheck";
    }
}


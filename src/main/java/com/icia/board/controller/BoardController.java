package com.icia.board.controller;

import com.icia.board.dto.BoardDTO;
import com.icia.board.dto.BoardFileDTO;
import com.icia.board.dto.PageDTO;
import com.icia.board.service.BoardService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/board")
public class BoardController {

    @Autowired
    private BoardService boardService;

    @GetMapping("/save")
    public String saveForm() {
        return "/boardPages/boardSave";
    }

    @PostMapping("/")
    public String save(@ModelAttribute BoardDTO boardDTO) throws IOException {
        boardService.save(boardDTO);
        return "redirect:/board/" ;
    }

    @GetMapping("/")
    public String findAll(Model model) {
        List<BoardDTO> boardDTOList = boardService.findAll();
        System.out.println("boardDTOList = " + boardDTOList);
        model.addAttribute("boardList", boardDTOList);
        return "boardPages/boardList";
    }

    @GetMapping("/detail")
    public String detail(@RequestParam("id") Long id, Model model) {
        boardService.updateHits(id);
        BoardDTO boardDTO = boardService.findById(id);
        System.out.println("boardDTO = " + boardDTO);
        model.addAttribute("board", boardDTO);
        if (boardDTO.getFileAttached() == 1) {
            List<BoardFileDTO> boardDTOList = boardService.findFile(id);
            model.addAttribute("boardFileList", boardDTOList);
        }
        return "/boardPages/boardDetail";
    }

    @GetMapping("/paging")
    public String paging(@RequestParam(value = "page", required = false, defaultValue = "1") int page,
                         @RequestParam(value = "q", required = false, defaultValue = "") String q,
                         @RequestParam(value = "type", required = false, defaultValue = "boardTitle") String type,
                         Model model) {
        List<BoardDTO> boardDTOList = null;
        PageDTO pageDTO = null;
        if (q.equals("")) {
            boardDTOList = boardService.pagingList(page);
            pageDTO = boardService.pagingParam(page);
        } else {
            boardDTOList = boardService.searchList(page, type, q);
            pageDTO = boardService.pagingSearchParam(page, type, q);
        }
        model.addAttribute("boardList", boardDTOList);
        model.addAttribute("paging", pageDTO);
        model.addAttribute("q", q);
        model.addAttribute("type", type);
        return "boardPages/boardPaging";
    }

    @GetMapping
    public String findById(@RequestParam("id") Long id,
                               @RequestParam(value = "page", required = false, defaultValue = "1") int page,
                               @RequestParam(value = "q", required = false, defaultValue = "") String q,
                               @RequestParam(value = "type", required = false, defaultValue = "boardTitle") String type,
                               Model model) {
        boardService.updateHits(id);
        BoardDTO boardDTO = boardService.findById(id);
        model.addAttribute("board", boardDTO);
        model.addAttribute("page", page);
        model.addAttribute("q", q);
        model.addAttribute("type", type);
        if (boardDTO.getFileAttached() == 1) {
            List<BoardFileDTO> boardFileDTO = boardService.findFile(id);
            model.addAttribute("boardFileList", boardFileDTO);
        }
        return "boardPages/boardDetail";
    }

}

package com.icia.board.controller;

import com.icia.board.dto.CommentDTO;
import com.icia.board.dto.MemberDTO;
import com.icia.board.service.CommentService;
import com.icia.board.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/comment")
public class CommentController {
    @Autowired
    private CommentService commentService;
    @Autowired
    private MemberService memberService;


    @PostMapping("/save")
    public ResponseEntity save (@ModelAttribute CommentDTO commentDTO, HttpSession session) {
        System.out.println(commentDTO);
        String loginEmail = (String) session.getAttribute("loginEmail");
        System.out.println("loginEmail = " + loginEmail);
        MemberDTO memberDTO = memberService.findById(loginEmail);
        commentDTO.setMemberId(memberDTO.getId());
        commentService.save(commentDTO);
        List<CommentDTO> commentDTOList = commentService.findAll(commentDTO.getBoardId());
        System.out.println(commentDTOList);
        return new ResponseEntity<>(commentDTOList, HttpStatus.OK);
    }

}

















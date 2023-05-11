package com.icia.board.controller;

import com.icia.board.dto.MemberDTO;
import com.icia.board.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
@RequestMapping("/member")
public class MemberController {

    @Autowired
    private MemberService memberService;

    @GetMapping("/save")
    public String saveForm() {
        return "/memberPages/memberSave";
    }

    @PostMapping("/emailCheck")
    public ResponseEntity emailCheck(@RequestParam("memberEmail") String memberEmail) {
        MemberDTO memberDTO = memberService.emailCheck(memberEmail);
        if (memberDTO == null) {
            return new ResponseEntity<>(HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.CONFLICT);
        }

    }

    @PostMapping("/save")
    public String save(@ModelAttribute MemberDTO memberDTO) throws IOException {
        memberService.save(memberDTO);
        return "/memberPages/memberLogin";
    }

    @GetMapping("/login")
    public String loginForm() {
        return "/memberPages/memberLogin";
    }

    @PostMapping("/login")
    public String loginCheck (@ModelAttribute MemberDTO memberDTO, HttpSession session) {
        boolean loginResult = memberService.loginCheck(memberDTO);
        if (loginResult) {
            session.setAttribute("loginEmail", memberDTO.getMemberEmail());
            return "/boardPages/boardList";
        } else {
            return "/memberPages/memberLogin";
        }
    }
}

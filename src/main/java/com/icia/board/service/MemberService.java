package com.icia.board.service;

import com.icia.board.dto.BoardFileDTO;
import com.icia.board.dto.MemberDTO;
import com.icia.board.dto.ProfileDTO;
import com.icia.board.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;

@Service
public class MemberService {
    @Autowired
    private MemberRepository memberRepository;

    public void save(MemberDTO memberDTO) throws IOException {
        if (memberDTO.getProfileFile().get(0).isEmpty()) {
            memberRepository.save(memberDTO);
        } else {
            MemberDTO dto = memberRepository.save(memberDTO);
            for (MultipartFile profile: memberDTO.getProfileFile()) {
                String originalFileName = profile.getOriginalFilename();
                String storedFileName = System.currentTimeMillis() + "-" + originalFileName;
                ProfileDTO profileDTO = new ProfileDTO();
                profileDTO.setOriginalFileName(originalFileName);
                profileDTO.setStoredFileName(storedFileName);
                profileDTO.setMemberId(dto.getId());
                String savePath = "D:\\2023.05.09_board\\profile_img\\" + storedFileName;
                profile.transferTo(new File(savePath));
                memberRepository.saveFile(profileDTO);
                System.out.println("memberDTO = " + memberDTO);
            }
        }

    }

    public MemberDTO emailCheck(String memberEmail) {
        return memberRepository.emailCheck(memberEmail);
    }

    public MemberDTO loginCheck(MemberDTO memberDTO) {
        return memberRepository.loginCheck(memberDTO);
    }

    public MemberDTO findById(String loginEmail) {
        return memberRepository.findById(loginEmail);
    }

    public void update(MemberDTO memberDTO) {
        memberRepository.update(memberDTO);
    }

    public List<MemberDTO> findAll() {
        return memberRepository.findAll();
    }

    public void delete(Long id) {
        memberRepository.delete(id);
    }
}

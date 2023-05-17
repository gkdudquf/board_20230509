package com.icia.board.repository;

import com.icia.board.dto.MemberDTO;
import com.icia.board.dto.ProfileDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberRepository {
    @Autowired
     private SqlSessionTemplate sql;
    public MemberDTO save(MemberDTO memberDTO) {
        sql.insert("Member.save", memberDTO);
        return memberDTO;
    }

    public MemberDTO emailCheck(String memberEmail) {
        return sql.selectOne("Member.emailCheck", memberEmail);
    }

    public void saveFile(ProfileDTO profileDTO) {
        sql.insert("Member.saveFile", profileDTO);
    }

    public MemberDTO loginCheck(MemberDTO memberDTO) {
        return sql.selectOne("Member.loginCheck", memberDTO);
    }


    public MemberDTO findById(String boardWriter) {
        return sql.selectOne("Member.findById", boardWriter);
    }

    public void update(MemberDTO memberDTO) {
        sql.update("Member.update", memberDTO);
    }
}

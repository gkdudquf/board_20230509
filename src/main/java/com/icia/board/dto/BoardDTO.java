package com.icia.board.dto;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Timestamp;
import java.util.List;

@Data
public class BoardDTO {
    private Long id;
    private String boardTitle;
    private String boardWriter;
    private String boardContents;
    private int boardHits;
    private Timestamp boardCreateDate;
    private int fileAttached;
    private List<MultipartFile> boardFile;
    private Long memberId;
}

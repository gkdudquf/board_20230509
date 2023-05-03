package com.icia.board.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.stereotype.Service;

@Getter
@Setter
@ToString
public class BoardDTO {
    Long id;
    String boardWriter;
    String boardPass;
    String boardTitle;
    String boardContents;
    java.sql.Timestamp boardCreatedDate;
    int boardHit;
    int fileAttached;
}

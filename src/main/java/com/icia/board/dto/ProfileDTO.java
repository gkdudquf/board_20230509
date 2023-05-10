package com.icia.board.dto;

import lombok.Data;
import lombok.Setter;

@Data

public class ProfileDTO {
    private String originalFileName;
    private String storedFileName;
    private Long memberId;
}

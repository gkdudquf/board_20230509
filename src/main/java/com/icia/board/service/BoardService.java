package com.icia.board.service;

import com.icia.board.dto.BoardDTO;
import com.icia.board.dto.BoardFileDTO;
import com.icia.board.repository.BoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;


@Service
public class BoardService {
    @Autowired
    private BoardRepository boardRepository;

    public void save(BoardDTO boardDTO) throws IOException {
        if (boardDTO.getBoardFile().get(0).isEmpty()) {
            System.out.println("파일없음");
            boardDTO.setFileAttached(0);
            boardRepository.save(boardDTO);
        } else {
            System.out.println("파일있음");
            boardDTO.setFileAttached(1);
            BoardDTO dto = boardRepository.save(boardDTO);
            for (MultipartFile boardFile: boardDTO.getBoardFile()) {
                String originalFilename = boardFile.getOriginalFilename();
                System.out.println("originalFilename = " + originalFilename);
                String storedFileName = System.currentTimeMillis() + "-" + originalFilename;
                System.out.println("storedFileName = " + storedFileName);
                BoardFileDTO boardFileDTO = new BoardFileDTO();
                boardFileDTO.setOriginalFileName(originalFilename);
                boardFileDTO.setStoredFileName(storedFileName);
                boardFileDTO.setBoardId(dto.getId());
                String savePath = "D:\\springframework_img\\" + storedFileName;
                boardFile.transferTo(new File(savePath));
                boardRepository.saveFile(boardFileDTO);
            }
        }

    }

    public List<BoardDTO> findAll() {
        return boardRepository.findAll();
    }

    public BoardDTO findById(Long id) {
        return boardRepository.findById(id);
    }

    public void updateHits(Long id) {
        boardRepository.updateHits(id);
    }

    public List<BoardFileDTO> findFile(Long id) {
        return boardRepository.findFile(id);
    }


    public void update(BoardDTO boardDTO) {
        boardRepository.update(boardDTO);
    }

    public void delete(Long id) {
        boardRepository.delete(id);
    }


}

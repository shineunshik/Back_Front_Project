package com.back.board.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.back.board.springboot.model.Board;
import com.back.board.springboot.repository.BoardRepository;

@Service
public class BoardService {

    @Autowired
    private BoardRepository boardRepository;

    // get boards data
    public List<Board> getAllBoard() {
        return boardRepository.findAll();
    }

}
package com.back.board.springboot.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.back.board.springboot.model.Board;
import com.back.board.springboot.service.BoardService;

//@CrossOrigin(origins = "http://localhost:3000") //로컬 환경에서 테스트（api 보낼 ip）
@CrossOrigin(origins = "http://3.37.138.101:3000") //ec2 환경에서 테스트（api 보낼 ip）
@RestController
@RequestMapping("/api")
public class BoardController {

    @Autowired
    private BoardService boardService;
     ////
    // get all board
    @GetMapping("/board")
    public List<Board> getAllBoards() {
        return boardService.getAllBoard();
    }

}

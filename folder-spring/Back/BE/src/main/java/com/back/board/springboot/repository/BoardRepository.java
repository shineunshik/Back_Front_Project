package com.back.board.springboot.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.back.board.springboot.model.Board;

public interface BoardRepository extends JpaRepository<Board, Integer> {

}
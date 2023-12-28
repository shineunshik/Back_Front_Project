package com.back.board.springboot.domain.posts;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

//JPA 어노테이션
@Getter  //(클래스 내의 모든 필드에 getter  메소드 자동 생성)

//롬복 어노테이션  (롬복은 코드를 단순화시켜준다)
@NoArgsConstructor   //(기본 생성자 자동추가)
@Entity

public class Posts { //실제 DB 클래스와 매칭될 클래스임  ENTITY 클래스라고도 함

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(length = 500, nullable = false)
    private String title;

    @Column(columnDefinition = "TEXT", nullable = false)
    private String content;

    private String author;

    @Builder //(해당 클래스에 빌더 패턴 클래스를 생성 --생성자 상단에 선언 시 생성자에 포함된 필드만 빌더에 포함)
    public Posts(String title, String content, String author) {
        this.title = title;
        this.content = content;
        this.author = author;
    }

}
package com.lec.spring.domain;

import lombok.*;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

// Model 객체
/**
 * DTO 객체
 *  : Data Transfer Object 라고도 함.
 *
 *  객체 -> DB
 *  DB -> 객체
 *  reg param -> 객체
 *  ..
 *
 */

// 웹개발시...
// 가능한, 다음 3가지는 이름을 일치시켜주는게 좋습니다.
// 클래스 필드명 = DB 필드명 = form의 name명

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Post {
    private Long id;  // 글 id (PK)
    private String subject;
    private String content;
    private LocalDateTime regDate;
    private Long viewCnt;

    private User user;  // 글 작성자 (FK)

    // 첨부파일
    @ToString.Exclude
    @Builder.Default
    private List<Attachment> fileList = new ArrayList<>();
}









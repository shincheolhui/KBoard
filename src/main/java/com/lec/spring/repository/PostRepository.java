package com.lec.spring.repository;

import com.lec.spring.domain.Post;

import java.util.List;

// repository layer (aka. Data layer)
// Datasource 에 직접 접근
public interface PostRepository {

    // 새 글 작성 (INSERT) <- Post
    int save(Post post);

    // 특정 id 글 내용 읽기 (SELECT)
    // 만약 해당 id 의 글 없으면 null 리턴함
    Post findById(Long id);

    // 특정 id 글 조회수 +1 증가 (UPDATE)
    int incViewCnt(Long id);

    // 전체 글 목록 : 최신순 (SELECT)
    List<Post> findAll();

    // 특정 id 글 수정 (제목, 내용) (UPDATE)
    int update(Post post);

    // 특정 id 글 삭제하기 (DELETE)
    int delete(Post post);

    // 페이징
    // from 부터 rows 개 만큼 SELECT
    List<Post> selectFromRow(int from, int rows);

    // 전체 글의 개수
    int countAll();

}









package com.lec.spring.controller;


import com.lec.spring.domain.QryCommentList;
import com.lec.spring.domain.QryResult;
import com.lec.spring.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController   // data 를 response 한다 ('View' 를 리턴하는게 아니다!)
// @Controller + @ResponseBody 와 같다.
@RequestMapping("/comment")
public class CommentController {

    @Autowired
    private CommentService commentService;

    @GetMapping("/list")
    public QryCommentList list(Long id) {
        return commentService.list(id);
    }

    @PostMapping("/write")
    public QryResult write(
            @RequestParam("post_id") Long postId,
            @RequestParam("user_id") Long userId,
            String content
    ) {
        System.out.println("CommentController의 write()의 postId = " + postId);
        System.out.println("CommentController의 write()의 userId = " + userId);
        System.out.println("CommentController의 write()의 content = " + content);

        return commentService.write(postId, userId, content);
    }


    @PostMapping("/delete")
    public QryResult delete(Long id) {
        return commentService.delete(id);
    }

}
















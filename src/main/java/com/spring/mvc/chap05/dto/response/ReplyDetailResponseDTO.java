package com.spring.mvc.chap05.dto.response;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.spring.mvc.chap05.entity.Reply;
import lombok.*;

import java.time.LocalDateTime;

@Getter @Setter @ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ReplyDetailResponseDTO {

    private int rno;
    private String text;
    private String writer;

    // 나중에 DTO가 JSON으로 변환될 때 원하는 Format 형식으로 자동 변환
    @JsonFormat(pattern = "yyyy년 MM월 dd일 HH:mm")
    private LocalDateTime regDate;

    @JsonFormat(pattern = "yyyy년 MM월 dd일 HH:mm (수정됨)")
    private LocalDateTime updateDate;

    private String account;
    private String profile; // 프로필 경로

    private String loginMethod;
    
    // 엔터티를 DTO로 바꿔주는 생성자
    public ReplyDetailResponseDTO(Reply reply) {
        this.rno = reply.getReplyNo();
        this.text = reply.getReplyText();
        this.writer = reply.getReplyWriter();
        this.regDate = reply.getReplyDate();
        this.updateDate = reply.getUpdateDate();
        this.account = reply.getAccount();
        this.profile = reply.getProfileImage();
        this.loginMethod = reply.getLoginMethod();
    }

}















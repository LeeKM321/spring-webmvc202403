package com.spring.mvc.chap05.controller;

import com.spring.mvc.chap05.service.SnsLoginService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.HashMap;
import java.util.Map;

@Controller
@Slf4j
@RequiredArgsConstructor
public class SnsLoginController {

    private final SnsLoginService snsLoginService;

    @Value("${sns.kakao.app-key}")
    private String kakaoAppKey;

    @Value("${sns.kakao.redirect-uri}")
    private String kakaoRedirectUri;

    @GetMapping("/kakao/login")
    public String kakaoLogin() {
        String uri = "https://kauth.kakao.com/oauth/authorize";
        uri += "?client_id=" + kakaoAppKey;
        uri += "&redirect_uri=" + kakaoRedirectUri;
        uri += "&response_type=code";

        return "redirect:" + uri;
    }

    // 인가 코드 받기
    @GetMapping("/auth/kakao")
    public String snsKakao(String code) {
        log.info("카카오 로그인 인가 코드: {}", code);

        // 인가 코드를 가지고 카카오 인증 서버에 토큰 발급 요청을 보내자 (server to server 통신)
        // 서비스에게 시킬 것임.
        Map<String, String> params = new HashMap<>();
        params.put("appKey", kakaoAppKey);
        params.put("redirect", kakaoRedirectUri);
        params.put("code", code);

        snsLoginService.kakaoLogin(params);

        return "";
    }



}













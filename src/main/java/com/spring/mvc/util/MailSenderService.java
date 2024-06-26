package com.spring.mvc.util;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

import java.util.Random;

@Component // 빈 등록 아노테이션
@RequiredArgsConstructor
@Slf4j
public class MailSenderService {

    // EmailConfig에 등록한 빈 주입
    private final JavaMailSender mailSender;

    // 난수 발생
    private int makeRandomNumber() {
        // 난수의 범위: 111111 ~ 999999
        Random r = new Random();
        int checkNum = r.nextInt(888888) + 111111;
        log.info("인증번호: {}", checkNum);
        return checkNum;
    }

    // 가입할 회원에게 전송할 이메일 양식 준비
    public String joinEmail(String email) { // 컨트롤러로부터 이메일을 전달받음.

        int authNum = makeRandomNumber(); // 인증번호 생성
        String setFrom = "stephen4951@naver.com"; // EmailConfig에 설정한 발신용 이메일과 똑같이!
        String toMail = email; // 수신받을 이메일 (가입하고자 하는 사람의 이메일)
        String title = "Spring MVC 회원 가입 인증 이메일 입니다."; // 이메일 제목
        String content = "홈페이지 가입을 신청해 주셔서 감사합니다." +
                "<br><br>" +
                "인증 번호는 <strong>" + authNum + "</strong> 입니다. <br>" +
                "해당 인증 번호를 인증번호 확인란에 기입해 주세요."; // 이메일에 삽입할 내용 (더 꾸며보세요)

        mailSend(setFrom, toMail, title, content);

        return Integer.toString(authNum);
    }

    // 이메일을 실제로 전송하는 메서드
    private void mailSend(String setFrom, String toMail, String title, String content) {

        try {
            MimeMessage message = mailSender.createMimeMessage();
            /*
            기타 설정들을 담당할 MimeMessageHelper 객체를 생성
            생성자의 매개값으로 MimeMessage 객체, bool, 문자 인코딩 설정
            true 매개값을 전달하면 MultiPart 형식의 메세지 전달이 가능 (첨부 파일)
             */
            MimeMessageHelper helper = new MimeMessageHelper(message, false, "utf-8");

            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            // true -> html 형식으로 전송, 값을 안주면 단순 텍스트로만 전달.
            helper.setText(content, true);

            // 메일 전송
            mailSender.send(message);

        } catch (MessagingException e) {
            e.printStackTrace();
        }


    }


}















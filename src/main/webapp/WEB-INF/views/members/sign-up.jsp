<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <title>Insert Your Title</title>

  <%@ include file="../include/static-head.jsp" %>

  <style>
    .container.wrap {
      margin-top: 200px;
      margin-bottom: 200px;
    }

    .profile {
      margin-bottom: 70px;
      text-align: center;
    }
    .profile label {
      font-weight: 700;
      font-size: 1.2em;
      cursor: pointer;
      color: rgb(140, 217, 248);
    }
    .profile .thumbnail-box {
      width: 200px;
      height: 200px;
      border-radius: 50%;
      overflow: hidden;
      margin: 30px auto 10px;
      cursor: pointer;
    }
    .profile .thumbnail-box img {
      width: 200px;
      height: 200px;
    }

  </style>

</head>

<body>

  <%@ include file="../include/header.jsp" %>

  <div class="container wrap">
    <div class="row">
      <div class="offset-md-2 col-md-4">
        <div class="card" style="width:200%;">
          <div class="card-header text-white" style="background: #343A40;">
            <h2><span style="color: gray;">MVC</span> 회원 가입</h2>
          </div>
          <div class="card-body">


            <form action="/members/sign-up" name="signup" id="signUpForm" method="post" style="margin-bottom: 0;" 
                  enctype="multipart/form-data">

              <div class="profile">
                <div class="thumbnail-box">
                  <img src="/assets/img/image-add.png" alt="프로필 썸네일">
                </div>
  
                <label>프로필 이미지 추가</label>
  
                <input
                        type="file"
                        id="profile-img"
                        accept="image/*"
                        style="display: none;"
                        name="profileImage"
                >
              </div>

              <table style="cellpadding: 0; cellspacing: 0; margin: 0 auto; width: 100%">
                <tr>
                  <td style="text-align: left">
                    <p><strong>아이디를 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;
                      <span id="idChk"></span></p>
                  </td>
                </tr>
                <tr>
                  <td><input type="text" name="account" id="user_id" class="form-control tooltipstered" maxlength="14"
                      required="required" aria-required="true"
                      style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
                      placeholder="숫자와 영어로 4-14자">
                  </td>

                </tr>

                <tr>
                  <td style="text-align: left">
                    <p><strong>비밀번호를 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;<span id="pwChk"></span></p>
                  </td>
                </tr>
                <tr>
                  <td><input type="password" size="17" maxlength="20" id="password" name="password"
                      class="form-control tooltipstered" maxlength="20" required="required" aria-required="true"
                      style="ime-mode: inactive; margin-bottom: 25px; height: 40px; border: 1px solid #d9d9de"
                      placeholder="영문과 특수문자를 포함한 최소 8자"></td>
                </tr>
                <tr>
                  <td style="text-align: left">
                    <p><strong>비밀번호를 재확인해주세요.</strong>&nbsp;&nbsp;&nbsp;<span id="pwChk2"></span>
                    </p>
                  </td>
                </tr>
                <tr>
                  <td><input type="password" size="17" maxlength="20" id="password_check" name="pw_check"
                      class="form-control tooltipstered" maxlength="20" required="required" aria-required="true"
                      style="ime-mode: inactive; margin-bottom: 25px; height: 40px; border: 1px solid #d9d9de"
                      placeholder="비밀번호가 일치해야합니다."></td>
                </tr>

                <tr>
                  <td style="text-align: left">
                    <p><strong>이름을 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;<span id="nameChk"></span></p>
                  </td>
                </tr>
                <tr>
                  <td><input type="text" name="name" id="user_name" class="form-control tooltipstered" maxlength="6"
                      required="required" aria-required="true"
                      style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
                      placeholder="한글로 최대 6자"></td>
                </tr>


                <tr>
                  <td style="text-align: left">
                    <p><strong>이메일을 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;<span id="emailChk"></span>
                    </p>
                  </td>
                </tr>
                <tr>
                  <td><input type="email" name="email" id="user_email" class="form-control tooltipstered"
                      required="required" aria-required="true"
                      style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
                      placeholder="ex) abc@mvc.com"></td>
                  <td>
                    <button type="button">이메일 인증</button>
                  </td>
                </tr>


                <tr>
                  <td style="padding-top: 10px; text-align: center">
                    <p><strong>회원가입하셔서 더 많은 서비스를 사용하세요~~!</strong></p>
                  </td>
                </tr>
                <tr>
                  <td style="width: 100%; text-align: center; colspan: 2;">
                    <input type="button" value="회원가입" class="btn form-control tooltipstered" id="signup-btn"
                      style="background: gray; margin-top: 0; height: 40px; color: white; border: 0px solid #388E3C; opacity: 0.8">
                  </td>
                </tr>

              </table>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>


  <input type="file" multiple>
  

  <script>
    // 회원가입 입력값 검증 처리

    // 입력값 검증 통과 여부 배열
    const checkResultList = [false, false, false, false, false];

    // 아이디 검사 정규표현식
    const accountPattern = /^[a-zA-Z0-9]{4,14}$/;

    // 아이디 입력값 검증
    const $idInput = document.getElementById('user_id');

    // 키를 눌렀다 떼는 순간 이벤트 발생
    $idInput.onkeyup = e => {

      const idValue = $idInput.value;
      // console.log(idValue);

      if (idValue.trim() === '') {
        $idInput.style.borderColor = 'red';
        document.getElementById('idChk').innerHTML = '<b style="color: red;">[아이디는 필수값입니다!]</b>';
        checkResultList[0] = false;

      } else if (!accountPattern.test(idValue)) {
        // 정규표현식의 함수 test를 통해서 입력값이 패턴에 유효한지를 검증.
        // 패턴과 일치하는 입력값이면 true, 하나라도 어긋난다면 false.
        $idInput.style.borderColor = 'red';
        document.getElementById('idChk').innerHTML = '<b style="color: red;">[아이디는 4~14글자의 영문,숫자로 입력하세요!]</b>';
        checkResultList[0] = false;

      } else {
        // 비동기 요청으로 아이디 중복 확인 진행
        fetch('/members/check/account/' + idValue)
          .then(res => res.json())
          .then(flag => {
            if (flag) { // 중복
              $idInput.style.borderColor = 'red';
              document.getElementById('idChk').innerHTML = '<b style="color: red;">[아이디가 중복되었습니다.]</b>';
              checkResultList[0] = false;
            
            } else {
              $idInput.style.borderColor = 'skyblue';
              document.getElementById('idChk').innerHTML = '<b style="color: skyblue;">[사용 가능한 아이디입니다.]</b>';
              checkResultList[0] = true;
            }
          });
      }
    }

    // 패스워드 검사 정규표현식
    const passwordPattern = /([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/;

    // 패스워드 입력값 검증
    const $pwInput = document.getElementById('password');
    $pwInput.onkeyup = e => {
      const pwValue = $pwInput.value;
      if (pwValue.trim() === '') {
        $pwInput.style.borderColor = 'red';
        document.getElementById('pwChk').innerHTML = '<b style="color: red;">[비밀번호는 필수값입니다!]</b>';
        checkResultList[1] = false;

      } else if (!passwordPattern.test(pwValue)) {
        $pwInput.style.borderColor = 'red';
        document.getElementById('pwChk').innerHTML = '<b style="color: red;">[특수문자 포함 8자 이상!]</b>';
        checkResultList[1] = false;

      } else {
        $pwInput.style.borderColor = 'skyblue';
        document.getElementById('pwChk').innerHTML = '<b style="color: skyblue;">[사용가능한 비밀번호입니다.]</b>';
        checkResultList[1] = true;
      }
    };


    // 패스워드 확인란 입력값 검증
    const $pwCheckInput = document.getElementById('password_check');
    $pwCheckInput.onkeyup = e => {
      const pwCheckValue = $pwCheckInput.value;
      if (pwCheckValue.trim() === '') {
        $pwCheckInput.style.borderColor = 'red';
        document.getElementById('pwChk2').innerHTML = '<b style="color: red;">[비밀번호 확인란은 필수값입니다!]</b>';
        checkResultList[2] = false;

      } else if ($pwCheckInput.value !== $pwInput.value) {
        $pwCheckInput.style.borderColor = 'red';
        document.getElementById('pwChk2').innerHTML = '<b style="color: red;">[위에랑 똑같이 쓰세요!]</b>';
        checkResultList[2] = false;

      } else {
        $pwCheckInput.style.borderColor = 'skyblue';
        document.getElementById('pwChk2').innerHTML = '<b style="color: skyblue;">[참 잘했어요~]</b>';
        checkResultList[2] = true;
      }
    };


    // 이름 검사 정규표현식
    const namePattern = /^[가-힣]+$/;

    // 이름 입력값 검증
    const $nameInput = document.getElementById('user_name');
    $nameInput.onkeyup = e => {
      const nameValue = $nameInput.value;
      if (nameValue.trim() === '') {
        $nameInput.style.borderColor = 'red';
        document.getElementById('nameChk').innerHTML = '<b style="color: red;">[이름은 필수정보!]</b>';
        checkResultList[3] = false;

      } else if (!namePattern.test(nameValue)) {
        $nameInput.style.borderColor = 'red';
        document.getElementById('nameChk').innerHTML = '<b style="color: red;">[이름은 한글로 ~]</b>';
        checkResultList[3] = false;

      } else {
        $nameInput.style.borderColor = 'skyblue';
        document.getElementById('nameChk').innerHTML = '<b style="color: skyblue;">[사용가능한 이름입니다.]</b>';
        checkResultList[3] = true;
      }
    };


    // 이메일 검사 정규표현식
    const emailPattern = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;

    const $emailInput = document.getElementById('user_email');
    $emailInput.onkeyup = e => {
      const emailValue = $emailInput.value;
      if (emailValue.trim() === '') {
        $emailInput.style.borderColor = 'red';
        document.getElementById('emailChk').innerHTML = '<b style="color: red;">[이메일은 필수값입니다!]</b>';
        checkResultList[4] = false;

      } else if (!emailPattern.test(emailValue)) {
        $emailInput.style.borderColor = 'red';
        document.getElementById('emailChk').innerHTML = '<b style="color: red;">[이메일 형식을 지켜주세요~]</b>';
        checkResultList[4] = false;

      } else {
        fetch('/members/check/email/' + emailValue)
          .then(res => res.json())
          .then(flag => {
            if (flag) { // 중복
              $emailInput.style.borderColor = 'red';
              document.getElementById('emailChk').innerHTML = '<b style="color: red;">[이메일이 중복되었습니다.]</b>';
              checkResultList[4] = false;

            } else {
              $emailInput.style.borderColor = 'skyblue';
              document.getElementById('emailChk').innerHTML = '<b style="color: skyblue;">[사용가능한 이메일입니다.]</b>';
              checkResultList[4] = true;
            }
          });
      }
    };

    // 회원가입 버튼 클릭 이벤트
    document.getElementById('signup-btn').onclick = e => {

      // 5개의 입력칸이 모두 통과되었을 경우 폼을 서브밋.
      const $form = document.getElementById('signUpForm');

      if (checkResultList.includes(false)) {
        alert('입력란을 다시 확인하세요!');
      } else {
        $form.submit();
      }

    }

    // 프로필 업로드 관련 스크립트
    const $profile = document.querySelector('.profile');
    const $fileInput = document.getElementById('profile-img');

    // 이미지 영역을 클릭하면 input type=file을 클릭한 것과 동일한 효과를 내자.
    $profile.onclick = e => {
      $fileInput.click();
    }

    // 프로필 사진 첨부 시 썸네일 보여주기
    $fileInput.onchange = e => {
      // 사용자가 첨부한 파일 데이터 읽기
      const fileData = $fileInput.files[0];
      console.log(fileData);

      // 첨부파일의 바이트데이터를 읽어들이는 객체 생성
      const reader = new FileReader();

      // 파일의 바이트데이터를 읽어서 img태그의 src속성에 넣으려면
      // url형태로 전달해야 하는데, 이걸 처리하는 함수를 사용.
      reader.readAsDataURL(fileData);

      // 파일 리더 객체가 로딩이 끝났다면 이벤트를 발생시켜서
      // img 태그에 이미지를 세팅
      reader.onloadend = e => {
        const $img = document.querySelector('.thumbnail-box img');
        $img.setAttribute('src', reader.result);
      }

    }










  </script>

</body>

</html>
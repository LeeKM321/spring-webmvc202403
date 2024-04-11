<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Insert Your Title</title>

    <%@ include file="include/static-head.jsp" %>

</head>
<body>

    <%@ include file="include/header.jsp" %>

    <%--
        String userName = "방문자";

        // 클라이언트에게 쿠키를 검사
        Cookie[] cookies = request.getCookies();
        for(Cookie c : cookies) {
            if (c.getName().equals("login")) {
                userName = c.getValue();
            }
        }
    --%>

    <c:if test="${login == null}">
        <h1> 방문자님 안녕하세요!</h1>
    </c:if>

    <c:if test="${login != null}">
        <h1> ${login.name}(${login.account})님 안녕하세요!</h1>
    </c:if>

</body>
</html>














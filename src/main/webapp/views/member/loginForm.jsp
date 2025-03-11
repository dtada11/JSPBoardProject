<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/member.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        .success-message {
            color: #28a745;
            background-color: #d4edda;
            border: 1px solid #c3e6cb;
            padding: 10px;
            margin: 10px 0;
            border-radius: 4px;
            text-align: center;
        }
        .error-message {
            color: #dc3545;
            background-color: #f8d7da;
            border: 1px solid #f5c6cb;
            padding: 10px;
            margin: 10px 0;
            border-radius: 4px;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2 class="form-title">로그인</h2>
        
        <% if(request.getParameter("registered") != null) { %>
            <div class="success-message">
                회원가입이 완료되었습니다. 로그인해주세요.
            </div>
        <% } %>
        
        <% if(request.getAttribute("errorMessage") != null) { %>
            <div class="error-message">
                <%= request.getAttribute("errorMessage") %>
            </div>
        <% } %>
        
        <form action="${pageContext.request.contextPath}/member/login" method="post" id="loginForm">
            <div class="form-group">
                <label for="memberId">아이디</label>
                <input type="text" id="memberId" name="memberId" required>
            </div>
            
            <div class="form-group">
                <label for="memberPw">비밀번호</label>
                <input type="password" id="memberPw" name="memberPw" required>
            </div>
            
            <div class="button-container">
                <button type="submit" class="btn btn-primary">로그인</button>
                <button type="button" class="btn btn-secondary" onclick="location.href='${pageContext.request.contextPath}/member/joinForm'">회원가입</button>
            </div>
        </form>
    </div>
</body>
</html> 
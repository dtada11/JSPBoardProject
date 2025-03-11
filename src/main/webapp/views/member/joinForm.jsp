<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/member.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary-color: #000000;
            --secondary-color: #333333;
            --success-color: #00c853;
            --error-color: #ff1744;
            --background-color: #ffffff;
            --surface-color: #f8f9fa;
            --border-color: #e0e0e0;
            --text-primary: #212121;
            --text-secondary: #757575;
        }

        body {
            font-family: 'Noto Sans KR', sans-serif;
            background-color: var(--surface-color);
            color: var(--text-primary);
            line-height: 1.5;
        }

        .form-container {
            max-width: 500px;
            margin: 40px auto;
            padding: 40px;
            background: var(--background-color);
            border-radius: 20px;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.08);
        }

        .form-title {
            font-size: 32px;
            font-weight: 700;
            text-align: center;
            margin-bottom: 40px;
            color: var(--primary-color);
            letter-spacing: -0.5px;
        }

        .form-group {
            margin-bottom: 28px;
        }

        .form-group label {
            display: block;
            font-size: 14px;
            font-weight: 500;
            margin-bottom: 8px;
            color: var(--text-secondary);
            letter-spacing: 0.2px;
        }

        .input-wrapper {
            position: relative;
            display: flex;
            gap: 12px;
        }

        .form-group input {
            width: 100%;
            padding: 14px 16px;
            font-size: 16px;
            border: 2px solid var(--border-color);
            border-radius: 12px;
            transition: all 0.3s ease;
            background: var(--surface-color);
            color: var(--text-primary);
        }

        .form-group input:focus {
            border-color: var(--primary-color);
            background: var(--background-color);
            outline: none;
            box-shadow: 0 0 0 4px rgba(0, 0, 0, 0.1);
        }

        .form-group input::placeholder {
            color: var(--text-secondary);
            opacity: 0.7;
        }

        .btn {
            padding: 14px 28px;
            font-size: 16px;
            font-weight: 600;
            border: none;
            border-radius: 12px;
            cursor: pointer;
            transition: all 0.3s ease;
            letter-spacing: 0.3px;
        }

        .btn-check-id {
            background: var(--primary-color);
            color: white;
            white-space: nowrap;
            min-width: 100px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .btn-check-id:hover {
            background: var(--secondary-color);
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
        }

        .btn-primary {
            background: var(--primary-color);
            color: white;
            width: 100%;
        }

        .btn-primary:hover {
            background: var(--secondary-color);
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
        }

        .btn-secondary {
            background: var(--surface-color);
            color: var(--text-primary);
            width: 100%;
            margin-top: 12px;
            border: 2px solid var(--border-color);
        }

        .btn-secondary:hover {
            background: var(--border-color);
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        .valid-message {
            color: var(--success-color);
            font-size: 14px;
            margin-top: 8px;
            display: flex;
            align-items: center;
            gap: 6px;
        }

        .error-message {
            color: var(--error-color);
            font-size: 14px;
            margin-top: 8px;
            display: flex;
            align-items: center;
            gap: 6px;
        }

        .message-icon {
            display: inline-block;
            width: 18px;
            height: 18px;
            background-repeat: no-repeat;
            background-position: center;
            background-size: contain;
        }

        .valid-icon {
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='%2300c853'%3E%3Cpath d='M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41L9 16.17z'/%3E%3C/svg%3E");
        }

        .error-icon {
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='%23ff1744'%3E%3Cpath d='M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm1 15h-2v-2h2v2zm0-4h-2V7h2v6z'/%3E%3C/svg%3E");
        }

        .button-container {
            margin-top: 40px;
            display: flex;
            gap: 16px;
            justify-content: center;
        }

        .btn-primary, .btn-secondary {
            width: 200px;
        }

        /* 반응형 디자인 */
        @media (max-width: 576px) {
            .form-container {
                margin: 20px;
                padding: 24px;
            }

            .form-title {
                font-size: 24px;
                margin-bottom: 32px;
            }

            .btn {
                padding: 12px 20px;
                font-size: 14px;
            }

            .form-group {
                margin-bottom: 20px;
            }

            .btn-primary, .btn-secondary {
                width: 150px;
            }
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2 class="form-title">회원가입</h2>
        
        <form action="${pageContext.request.contextPath}/member/join" method="post" id="joinForm">
            <div class="form-group">
                <label for="memberId">아이디</label>
                <div style="display: flex; gap: 10px;">
                    <input type="text" id="memberId" name="memberId" required onchange="resetIdCheck()">
                    <button type="button" class="btn btn-check-id" onclick="checkDuplicateId()">중복확인</button>
                </div>
                <span id="idMessage" class="error-message"></span>
            </div>
            
            <div class="form-group">
                <label for="memberPw">비밀번호</label>
                <input type="password" id="memberPw" name="memberPw" required>
                <span id="pwMessage" class="error-message"></span>
            </div>
            
            <div class="form-group">
                <label for="memberPwCheck">비밀번호 확인</label>
                <input type="password" id="memberPwCheck" required>
                <span id="pwCheckMessage"></span>
            </div>
            
            <div class="form-group">
                <label for="name">이름</label>
                <input type="text" id="name" name="name" required>
            </div>
            
            <div class="form-group">
                <label for="email">이메일</label>
                <input type="email" id="email" name="email" required>
                <span id="emailMessage" class="error-message"></span>
            </div>
            
            <div class="form-group">
                <label for="phone">전화번호</label>
                <input type="tel" id="phone" name="phone" placeholder="숫자만 입력해주세요">
                <span id="phoneMessage" class="error-message"></span>
            </div>
            
            <div class="form-group">
                <label for="address">주소</label>
                <input type="text" id="address" name="address">
            </div>
            
            <div class="button-container">
                <button type="submit" class="btn btn-primary">가입하기</button>
                <button type="button" class="btn btn-secondary" onclick="location.href='${pageContext.request.contextPath}/'">취소</button>
            </div>
        </form>
    </div>

    <script>
        let isIdChecked = false;
        
        function resetIdCheck() {
            isIdChecked = false;
            $('#idMessage').html('').removeClass('valid-message error-message');
        }
        
        function checkDuplicateId() {
            const memberId = $('#memberId').val();
            if (!memberId) {
                $('#idMessage').html('<span class="message-icon error-icon"></span>아이디를 입력해주세요.').addClass('error-message').removeClass('valid-message');
                return;
            }
            
            // 아이디 형식 검사 (영문자로 시작하는 6~20자의 영문자 또는 숫자)
            const idRegex = /^[a-zA-Z][a-zA-Z0-9]{5,19}$/;
            if (!idRegex.test(memberId)) {
                $('#idMessage').html('<span class="message-icon error-icon"></span>아이디는 영문자로 시작하는 6~20자의 영문자 또는 숫자여야 합니다.').addClass('error-message').removeClass('valid-message');
                isIdChecked = false;
                return;
            }
            
            $.ajax({
                url: '${pageContext.request.contextPath}/member/checkId',
                type: 'GET',
                data: { memberId: memberId },
                success: function(result) {
                    if (result === 'true') {
                        $('#idMessage').html('<span class="message-icon error-icon"></span>이미 사용중인 아이디입니다.').addClass('error-message').removeClass('valid-message');
                        isIdChecked = false;
                    } else {
                        $('#idMessage').html('<span class="message-icon valid-icon"></span>사용 가능한 아이디입니다.').addClass('valid-message').removeClass('error-message');
                        isIdChecked = true;
                    }
                },
                error: function(xhr, status, error) {
                    $('#idMessage').html('<span class="message-icon error-icon"></span>중복 확인 중 오류가 발생했습니다.').addClass('error-message').removeClass('valid-message');
                    isIdChecked = false;
                }
            });
        }

        // 아이디 입력 필드 변경 시 중복 확인 상태 초기화
        $('#memberId').on('input', function() {
            resetIdCheck();
        });

        // 비밀번호 유효성 검사 함수
        function validatePassword(password) {
            if (!password) {
                $('#pwMessage').html('').removeClass('valid-message error-message');
                return false;
            }

            const rules = {
                length: password.length >= 8 && password.length <= 20,
                letter: /[A-Za-z]/.test(password),
                number: /[0-9]/.test(password),
                special: /[@$!%*#?&]/.test(password)
            };
            
            const isValid = Object.values(rules).every(Boolean);
            
            if (!isValid) {
                let errorMessage = '<span class="message-icon error-icon"></span>';
                if (!rules.length) {
                    errorMessage += '8~20자 길이로 입력해주세요.';
                } else if (!rules.letter) {
                    errorMessage += '영문을 포함해주세요.';
                } else if (!rules.number) {
                    errorMessage += '숫자를 포함해주세요.';
                } else if (!rules.special) {
                    errorMessage += '특수문자를 포함해주세요.';
                }
                $('#pwMessage').html(errorMessage).addClass('error-message').removeClass('valid-message');
            } else {
                $('#pwMessage').html('<span class="message-icon valid-icon"></span>사용 가능한 비밀번호입니다.').addClass('valid-message').removeClass('error-message');
            }
            
            return isValid;
        }

        // 비밀번호 입력 필드 이벤트
        $('#memberPw').on('input', function() {
            const password = $(this).val();
            validatePassword(password);
            
            const confirmPassword = $('#memberPwCheck').val();
            if (confirmPassword) {
                checkPasswordMatch();
            }
        });

        // 비밀번호 확인 필드 이벤트
        function checkPasswordMatch() {
            const password = $('#memberPw').val();
            const confirmPassword = $('#memberPwCheck').val();
            
            if (confirmPassword === '') {
                $('#pwCheckMessage').html('').removeClass('valid-message error-message');
            } else if (password === confirmPassword) {
                $('#pwCheckMessage').html('<span class="message-icon valid-icon"></span>비밀번호가 일치합니다.').addClass('valid-message').removeClass('error-message');
            } else {
                $('#pwCheckMessage').html('<span class="message-icon error-icon"></span>비밀번호가 일치하지 않습니다.').addClass('error-message').removeClass('valid-message');
            }
        }

        $('#memberPwCheck').on('input', checkPasswordMatch);

        // 폼 제출 전 유효성 검사
        $('#joinForm').submit(function(e) {
            if (!isIdChecked) {
                e.preventDefault();
                $('#memberId').focus();
                return;
            }
            
            const password = $('#memberPw').val();
            if (!validatePassword(password)) {
                e.preventDefault();
                $('#memberPw').focus();
                return;
            }
            
            const confirmPassword = $('#memberPwCheck').val();
            if (password !== confirmPassword) {
                e.preventDefault();
                $('#memberPwCheck').focus();
                return;
            }
            
            const phone = $('#phone').val();
            if (phone && !/^[0-9]+$/.test(phone)) {
                e.preventDefault();
                $('#phone').focus();
                return;
            }
        });
        
        // 전화번호 입력 시 숫자만 입력되도록
        $('#phone').on('input', function() {
            $(this).val($(this).val().replace(/[^0-9]/g, ''));
        });
    </script>
</body>
</html> 
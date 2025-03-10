# JSP 게시판 프로젝트

이 프로젝트는 JSP와 Oracle DB를 사용한 기본적인 게시판 시스템입니다.

## 기능
- 게시글 목록 보기
- 게시글 작성
- 게시글 조회
- 게시글 수정
- 게시글 삭제
- 파일 업로드/다운로드

## 개발 환경
- Java 8 이상
- JSP/Servlet
- Oracle Database
- Apache Tomcat 9.0
- Eclipse IDE

## 프로젝트 구조
```
JSPBoardProject/
├── src/
│   └── main/
│       ├── java/
│       │   └── com/
│       │       └── board/
│       │           ├── controller/  # 서블릿 컨트롤러
│       │           ├── dao/         # 데이터 액세스 객체
│       │           ├── dto/         # 데이터 전송 객체
│       │           └── util/        # 유틸리티 클래스
│       └── webapp/
│           ├── WEB-INF/
│           │   └── lib/            # 외부 라이브러리
│           ├── css/               # 스타일시트
│           ├── js/                # 자바스크립트
│           └── views/             # JSP 페이지
```

## 설치 및 실행 방법
1. 프로젝트 클론
```bash
git clone [repository URL]
```

2. 데이터베이스 설정
- Oracle DB 설치
- 제공된 SQL 스크립트 실행

3. 서버 설정
- Apache Tomcat 설치
- 프로젝트를 서버에 배포

4. 실행
- 웹 브라우저에서 `http://localhost:8080/JSPBoardProject` 접속

## 라이선스
이 프로젝트는 MIT 라이선스 하에 있습니다. 
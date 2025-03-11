package com.board.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBConnection {
    // Oracle 데이터베이스 연결 정보
    private static final String DRIVER = "oracle.jdbc.driver.OracleDriver";
    private static final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
    private static final String USER = "test";  // 오라클 사용자 이름
    private static final String PASS = "1234";  // 오라클 비밀번호

    // 데이터베이스 연결 메소드
    public static Connection getConnection() {
        Connection conn = null;
        try {
            System.out.println("JDBC 드라이버 로딩 시도...");
            Class.forName(DRIVER);
            System.out.println("JDBC 드라이버 로딩 성공!");
            
            System.out.println("데이터베이스 연결 시도...");
            System.out.println("URL: " + URL);
            System.out.println("USER: " + USER);
            conn = DriverManager.getConnection(URL, USER, PASS);
            System.out.println("데이터베이스 연결 성공!");
            
            return conn;
        } catch (ClassNotFoundException e) {
            System.out.println("=== JDBC 드라이버 로드 실패 ===");
            System.out.println("원인: " + e.getMessage());
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("=== 데이터베이스 연결 실패 ===");
            System.out.println("ErrorCode: " + e.getErrorCode());
            System.out.println("SQLState: " + e.getSQLState());
            System.out.println("원인: " + e.getMessage());
            e.printStackTrace();
        } catch (Exception e) {
            System.out.println("=== 알 수 없는 오류 발생 ===");
            System.out.println("원인: " + e.getMessage());
            e.printStackTrace();
        }
        return null;
    }

    // 자원 해제 메소드
    public static void close(Connection conn, PreparedStatement pstmt, ResultSet rs) {
        try {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            System.out.println("데이터베이스 연결 해제 실패: " + e.getMessage());
        }
    }

    // PreparedStatement, Connection 해제
    public static void close(Connection conn, PreparedStatement pstmt) {
        close(conn, pstmt, null);
    }
} 
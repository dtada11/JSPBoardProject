package com.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.board.dto.MemberDTO;
import com.board.util.DBConnection;

public class MemberDAO {
    // 회원가입 메소드
    public boolean insertMember(MemberDTO member) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = "INSERT INTO MEMBER (MEMBER_ID, MEMBER_PW, NAME, EMAIL, PHONE, ADDRESS, REG_DATE, STATUS) "
                  + "VALUES (?, ?, ?, ?, ?, ?, SYSDATE, 'Y')";
        
        try {
            conn = DBConnection.getConnection();
            pstmt = conn.prepareStatement(sql);
            
            pstmt.setString(1, member.getMemberId());
            pstmt.setString(2, member.getMemberPw());
            pstmt.setString(3, member.getName());
            pstmt.setString(4, member.getEmail());
            pstmt.setString(5, member.getPhone());
            pstmt.setString(6, member.getAddress());
            
            int result = pstmt.executeUpdate();
            return result == 1;
            
        } catch (SQLException e) {
            System.out.println("회원 등록 중 오류 발생: " + e.getMessage());
            return false;
        } finally {
            DBConnection.close(conn, pstmt);
        }
    }
    
    // 아이디 중복 체크 메소드
    public boolean checkDuplicateId(String memberId) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "SELECT COUNT(*) FROM MEMBER WHERE MEMBER_ID = ?";
        
        try {
            conn = DBConnection.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, memberId);
            
            rs = pstmt.executeQuery();
            if(rs.next()) {
                return rs.getInt(1) > 0; // 이미 존재하면 true 반환
            }
            
        } catch (SQLException e) {
            System.out.println("ID 중복 체크 중 오류 발생: " + e.getMessage());
        } finally {
            DBConnection.close(conn, pstmt, rs);
        }
        return false;
    }
    
    // 로그인 체크 메소드
    public MemberDTO login(String memberId, String memberPw) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        MemberDTO member = null;
        String sql = "SELECT * FROM MEMBER WHERE MEMBER_ID = ? AND MEMBER_PW = ? AND STATUS = 'Y'";
        
        try {
            conn = DBConnection.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, memberId);
            pstmt.setString(2, memberPw);
            
            rs = pstmt.executeQuery();
            if(rs.next()) {
                member = new MemberDTO();
                member.setMemberId(rs.getString("MEMBER_ID"));
                member.setName(rs.getString("NAME"));
                member.setEmail(rs.getString("EMAIL"));
                member.setPhone(rs.getString("PHONE"));
                member.setAddress(rs.getString("ADDRESS"));
                member.setRegDate(rs.getDate("REG_DATE"));
                member.setStatus(rs.getString("STATUS"));
            }
            
        } catch (SQLException e) {
            System.out.println("로그인 처리 중 오류 발생: " + e.getMessage());
        } finally {
            DBConnection.close(conn, pstmt, rs);
        }
        return member;
    }
} 
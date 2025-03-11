package com.board.dto;

import java.sql.Date;

public class MemberDTO {
    private String memberId;      // 회원 ID
    private String memberPw;      // 비밀번호
    private String name;          // 이름
    private String email;         // 이메일
    private String phone;         // 전화번호
    private String address;       // 주소
    private Date regDate;         // 가입일
    private String status;        // 회원상태

    // 기본 생성자
    public MemberDTO() {}

    // Getter/Setter 메소드
    public String getMemberId() {
        return memberId;
    }

    public void setMemberId(String memberId) {
        this.memberId = memberId;
    }

    public String getMemberPw() {
        return memberPw;
    }

    public void setMemberPw(String memberPw) {
        this.memberPw = memberPw;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getRegDate() {
        return regDate;
    }

    public void setRegDate(Date regDate) {
        this.regDate = regDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    // toString() 메소드 오버라이드
    @Override
    public String toString() {
        return "MemberDTO [memberId=" + memberId + 
               ", name=" + name + 
               ", email=" + email + 
               ", phone=" + phone + 
               ", address=" + address + 
               ", regDate=" + regDate + 
               ", status=" + status + "]";
    }
} 
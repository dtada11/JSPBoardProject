package com.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.dao.MemberDAO;
import com.board.dto.MemberDTO;

@WebServlet("/member/*")
public class MemberServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private MemberDAO memberDAO;
    
    public void init() throws ServletException {
        memberDAO = new MemberDAO();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String uri = request.getRequestURI();
        String contextPath = request.getContextPath();
        String command = uri.substring(contextPath.length());
        
        switch (command) {
            case "/member/joinForm":
                // 회원가입 폼 표시
                request.getRequestDispatcher("/views/member/joinForm.jsp").forward(request, response);
                break;
                
            case "/member/loginForm":
                // 로그인 폼 표시
                request.getRequestDispatcher("/views/member/loginForm.jsp").forward(request, response);
                break;
                
            case "/member/checkId":
                // ID 중복 체크
                String memberId = request.getParameter("memberId");
                boolean isDuplicate = memberDAO.checkDuplicateId(memberId);
                response.getWriter().write(String.valueOf(isDuplicate));
                break;
                
            default:
                response.sendRedirect(request.getContextPath() + "/member/loginForm");
                break;
        }
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String uri = request.getRequestURI();
        String contextPath = request.getContextPath();
        String command = uri.substring(contextPath.length());
        
        switch (command) {
            case "/member/join":
                // 회원가입 처리
                MemberDTO member = new MemberDTO();
                member.setMemberId(request.getParameter("memberId"));
                member.setMemberPw(request.getParameter("memberPw"));
                member.setName(request.getParameter("name"));
                member.setEmail(request.getParameter("email"));
                member.setPhone(request.getParameter("phone"));
                member.setAddress(request.getParameter("address"));
                
                boolean result = memberDAO.insertMember(member);
                
                if (result) {
                    // 회원가입 성공 - 로그인 페이지로 리다이렉트
                    response.sendRedirect(request.getContextPath() + "/member/loginForm?registered=true");
                } else {
                    // 회원가입 실패
                    request.setAttribute("errorMessage", "회원가입에 실패했습니다.");
                    request.getRequestDispatcher("/views/member/joinForm.jsp").forward(request, response);
                }
                break;
                
            case "/member/login":
                // 로그인 처리
                String loginId = request.getParameter("memberId");
                String loginPw = request.getParameter("memberPw");
                
                MemberDTO loginMember = memberDAO.login(loginId, loginPw);
                
                if (loginMember != null) {
                    // 로그인 성공
                    request.getSession().setAttribute("loginMember", loginMember);
                    response.sendRedirect(request.getContextPath() + "/");
                } else {
                    // 로그인 실패
                    request.setAttribute("errorMessage", "아이디 또는 비밀번호가 일치하지 않습니다.");
                    request.getRequestDispatcher("/views/member/loginForm.jsp").forward(request, response);
                }
                break;
                
            default:
                response.sendRedirect(request.getContextPath() + "/member/loginForm");
                break;
        }
    }
} 
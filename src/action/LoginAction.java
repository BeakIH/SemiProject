package action;

import java.util.List; 

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import emp.EmpDBBean;
import emp.EmpDataBean;
import login.LoginDBBean;

public class LoginAction implements CommandAction{
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
	request.setCharacterEncoding("UTF-8");
	
	LoginDBBean loginDao = LoginDBBean.getInstance();
	
	String userid = request.getParameter("userid");
	String userpw = request.getParameter("userpw");
	
	int check = loginDao.userLogin(userid, userpw);
	
	System.out.println(check);
	
	request.getSession().setAttribute("id", userid);  // session 에 값넣기 
	
	//  0 : ID 존재  비밀번호 불일치 / 1 : 일반회원 로그인 성공 / 2 : 관리자 로그인 성공 / 3 : 비회원
	
	return "/jsp/login/loginPro.jsp";
	}
}

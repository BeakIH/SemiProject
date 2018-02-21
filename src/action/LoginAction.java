package action;

import java.util.List; 

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import emp.EmpDBBean;
import emp.EmpDataBean;
import login.LoginDBBean;

public class LoginAction implements CommandAction{
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
	System.out.println("3");
	request.setCharacterEncoding("UTF-8");
	
	LoginDBBean loginDao = LoginDBBean.getInstance();
	
	String userid = request.getParameter("userid");
	String userpw = request.getParameter("userpw");
	
	int check = loginDao.userCheck(userid, userpw);
	
	System.out.println(check);
	//request.getSession().setAttribute("noList", noList);
	request.getSession().setAttribute("id", userid);  // session 에 값넣기 
	//0 = 아이디 없음 , 1 = 관리자 , 2=회원 , -1 = 비밀번호틀림
	
	return "/jsp/login/loginPro.jsp";
	}
}

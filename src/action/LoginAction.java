package action;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import login.LoginDBBean;

public class LoginAction implements CommandAction {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		request.setCharacterEncoding("UTF-8");

		LoginDBBean loginDao = LoginDBBean.getInstance();

		String userid = request.getParameter("userid");
		String userpw = request.getParameter("userpw");
		
		
		Map<String, Object> result = loginDao.userLogin(userid, userpw);

		request.setAttribute("check", result.get("result"));
		if (result.get("name") != null) {
			request.getSession().setAttribute("name", result.get("name"));
			System.out.println(request.getSession().getAttribute("name"));
		}

		// 0 : ID 존재 비밀번호 불일치 / 1 : 일반회원 로그인 성공 / 2 : 관리자 로그인 성공 / 3 : 비회원

		return "/jsp/login/loginPro.jsp";
	}
}

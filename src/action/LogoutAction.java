package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LogoutAction implements CommandAction {// 글내용 처리

	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		return "/jsp/login/logout.jsp";
	}
}

package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Error404Action implements CommandAction {
public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		return "/jsp/sessionMenu/404.jsp";
	}
}

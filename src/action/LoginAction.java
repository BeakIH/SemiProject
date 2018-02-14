package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import login.LoginDBBean;

public class LoginAction {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
	
	String userid = request.getParameter(userid);
	String userpw = request.getParameter(userpw);
	
	LoginDBBean logPro = new LoginDBBean();
			
	int i =0;
	i = logPro.userCheck(id, pw);
			
	if(i==0) {
		return '';
	} else if(i==1) {
		return '';
	}else if(i==2) {
		return '';
	}else {
		return '';
	}
	
			
	}
}

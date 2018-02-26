package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import emp.EmpDBBean;
import emp.EmpDataBean;

public class Management_pwdAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		try {
			EmpDataBean dto = new EmpDataBean();
			EmpDBBean dao = new EmpDBBean();
			
			request.setCharacterEncoding("UTF-8"); 
			String id = (String)request.getSession().getAttribute("id");
			String pwd = request.getParameter("pwd");
			boolean result = dao.checkPwd(id, pwd);
		    if(result) {
		    	System.out.println("내가 바보");
		    }else {
		    	System.out.println("ㅎ힝");
		    }

		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return null;
	}
}

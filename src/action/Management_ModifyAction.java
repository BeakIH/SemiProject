package action;

import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse;

public class Management_ModifyAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		try {
			request.setCharacterEncoding("UTF-8");
			
			

		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return "/jsp/admin/management_list.do?store_no=1";
	}
}

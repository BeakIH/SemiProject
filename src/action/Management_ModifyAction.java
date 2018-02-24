package action;

import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse;

import emp.EmpDBBean;
import emp.EmpDataBean;

public class Management_ModifyAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		try {
			request.setCharacterEncoding("UTF-8");
			
			EmpDataBean dto = new EmpDataBean();
			EmpDBBean dao = new EmpDBBean();
			
			String adm_Id = (String)request.getSession().getAttribute("id");
			
			dto.setAdmId(adm_Id);
			
			boolean b = dao.modifyEmp(dto);
			
			request.setAttribute("result", b);
			request.setAttribute("errorpage", "0");

		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return "/jsp/admin/management_result.jsp";
	}
}

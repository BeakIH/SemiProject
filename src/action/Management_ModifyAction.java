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
			
			String admId = request.getParameter("id");
			
			dto.setEmpNm(admId);
			
			boolean b = dao.modifyEmp(dto);
			
			request.setAttribute("result", b);

		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return "/jsp/admin/management_result.jsp";
	}
}

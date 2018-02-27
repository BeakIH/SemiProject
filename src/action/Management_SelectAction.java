package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import emp.EmpDBBean;
import emp.EmpDataBean;

public class Management_SelectAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		try {
			request.setCharacterEncoding("UTF-8");
			
			EmpDataBean dto = new EmpDataBean();
			EmpDBBean dao = new EmpDBBean();
			
			int emp_no = Integer.parseInt((String)request.getParameter("empNo"));
			
			dto.setEmpNo(emp_no);
			
			dto = dao.selectEmp(emp_no);
			
			request.setAttribute("res", dto);
			request.setAttribute("errorpage", "0");

		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return "/jsp/admin/management_modifyForm.jsp";
	}
}

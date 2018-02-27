package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import emp.EmpDBBean;
import emp.EmpDataBean;

public class Management_SelectAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String check = null;
		try {
			request.setCharacterEncoding("UTF-8");

			EmpDataBean dto = new EmpDataBean();
			EmpDBBean dao = new EmpDBBean();

			int emp_no = Integer.parseInt((String) request.getParameter("empNo"));
			check = request.getParameter("check");
			dto.setEmpNo(emp_no);

			dto = dao.selectEmp(emp_no);

			request.setAttribute("res", dto);
			request.setAttribute("errorpage", "0");

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		if (check != null) {
			return "/jsp/admin/management_modifyForm.jsp?check=1";
		} else {
			return "/jsp/admin/management_modifyForm.jsp";
		}
	}
}

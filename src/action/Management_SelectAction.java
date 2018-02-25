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
			
			String adm_id = (String)request.getSession().getAttribute("id");
			
			dto.setAdmId(adm_id);
			
			dto = dao.selectEmp(adm_id);
			
			request.setAttribute("result", dto);
			request.setAttribute("errorpage", "0");

		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return "/jsp/admin/management_result.jsp";
	}
}

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
			
			EmpDataBean dto;
			EmpDBBean dao = new EmpDBBean();
			
			String adm_id = (String)request.getSession().getAttribute("id");
			dto = dao.selectEmp(adm_id);
			
			dto.setEmpNm(request.getParameter("name"));
			dto.setStoreNo(Integer.parseInt(request.getParameter("sNo")));
			dto.setPosition(request.getParameter("position"));
			
			boolean b = dao.modifyEmp(dto);
			
			request.setAttribute("result", b);
			request.getSession().setAttribute("name", dto.getEmpNm());
			request.setAttribute("errorpage", "0");

		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return "/jsp/admin/management_result.jsp";
	}
}

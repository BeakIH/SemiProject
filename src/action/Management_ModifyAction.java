package action;

import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse;

import emp.EmpDBBean;
import emp.EmpDataBean;

public class Management_ModifyAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("UTF-8");
		EmpDBBean dao = new EmpDBBean();	
		EmpDataBean dto;			
		try {	
			String adm_id = (String)request.getSession().getAttribute("id");
			String pwd = request.getParameter("pwd");
			boolean checkPwd = dao.checkPwd(adm_id, pwd);
			if(checkPwd) { 
				dto = new EmpDataBean();
				dto.setAdmId(adm_id);
				dto.setEmpNm(request.getParameter("name"));
				dto.setPosition(request.getParameter("position"));
				dao.modifyEmp(dto);
				request.getSession().setAttribute("name", dto.getEmpNm());			
			}else {
				request.setAttribute("errorpage", "0");
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return null;
	}
}

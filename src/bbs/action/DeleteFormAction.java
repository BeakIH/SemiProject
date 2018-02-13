package bbs.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteFormAction implements CommandAction {//글삭제 폼

    public String requestPro(HttpServletRequest request,
        HttpServletResponse response) throws Throwable {

        int num = Integer.parseInt(request.getParameter("bNo"));
        String pageNum = request.getParameter("pageNum");

	//해당 뷰에서 사용할 속성
	request.setAttribute("bNo", new Integer(num));
        request.setAttribute("pageNum", new Integer(pageNum));

        return "/listo/notice/DeleteForm.jsp";//해당뷰
    }
}

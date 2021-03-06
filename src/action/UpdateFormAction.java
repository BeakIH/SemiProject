package action;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse;

import bbs.BoardDataBean;
import bbs.BoardDBBean;

public class UpdateFormAction implements CommandAction {//글수정 폼

    public String requestPro(HttpServletRequest request,
        HttpServletResponse response) throws Throwable {

        int bno = Integer.parseInt(request.getParameter("b_no"));
        String pageNum = request.getParameter("pageNum");

        BoardDBBean dbPro = BoardDBBean.getInstance();
        BoardDataBean article =  dbPro.updateGetArticle(bno);

	//해당 뷰에서 사용할 속성
        request.setAttribute("pageNum", new Integer(pageNum));
        request.setAttribute("article", article);
        
        return "/notice/updateForm.jsp";//해당뷰
    }
}
package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bbs.BoardDBBean;

public class DeleteProAction implements CommandAction {//글삭제

    public String requestPro( HttpServletRequest request,
        HttpServletResponse response) throws Throwable {

        request.setCharacterEncoding("UTF-8");

        int num = Integer.parseInt(request.getParameter("bNo"));
        String pageNum = request.getParameter("pageNum");
        String passwd = request.getParameter("password");
   
        BoardDBBean dbPro = BoardDBBean.getInstance();
        int check = dbPro.deleteArticle(num, passwd);

        //해당 뷰에서 사용할 속성
        request.setAttribute("pageNum", new Integer(pageNum));
        request.setAttribute("check", new Integer(check));

        return "/notice/DeletePro.jsp";//해당뷰
    }
}

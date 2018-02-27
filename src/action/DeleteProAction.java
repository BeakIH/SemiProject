package action;


import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bbs.BoardDBBean;

public class DeleteProAction implements CommandAction {//글삭제

    public String requestPro( HttpServletRequest request,
        HttpServletResponse response) throws Throwable {
/*
        request.setCharacterEncoding("UTF-8");
        Enumeration params = request.getParameterNames();
        System.out.println("----------------------------");
        while (params.hasMoreElements()){
            String name = (String)params.nextElement();
            System.out.println(name + " : " +request.getParameter(name));
        }
        System.out.println("----------------------------");
*/
        int num = Integer.parseInt(request.getParameter("b_no"));
        String pageNum = request.getParameter("pageNum");
        String passwd = request.getParameter("board_pw");
        

   
        BoardDBBean dbPro = BoardDBBean.getInstance();
        int check = dbPro.deleteArticle(num, passwd);

        //해당 뷰에서 사용할 속성
        request.setAttribute("pageNum", new Integer(pageNum));
        request.setAttribute("check", new Integer(check));
		

        
        System.out.println(check);

        return "/notice/deletePro.jsp";//해당뷰
    }
}

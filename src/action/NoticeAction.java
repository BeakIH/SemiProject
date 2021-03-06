package action;


import java.util.Collections;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bbs.BoardDBBean;

public class NoticeAction implements CommandAction {//글목록 처리

    public String requestPro(HttpServletRequest request,
        HttpServletResponse response)throws Throwable {
       
    	request.setCharacterEncoding("UTF-8");
    	
        String pageNum = request.getParameter("pageNum");//페이지 번호
        
        if (pageNum == null) {
            pageNum = "1";
        }
        
        int pageSize = 10;//한 페이지의 글의 개수
        int currentPage = Integer.parseInt(pageNum);
        int startRow = (currentPage - 1) * pageSize + 1;//한 페이지의 시작글 번호
        int endRow = currentPage * pageSize;//한 페이지의 마지막 글번호
        int count = 0;
        int number=0;
        String opt = request.getParameter("opt");
        String condition = request.getParameter("condition");
        
        @SuppressWarnings("rawtypes")
		List articleList = null;
        BoardDBBean dbPro = BoardDBBean.getInstance();//DB연동

        count = dbPro.getArticleCount(opt, condition);//전체 글의 수
        /*System.out.println("메서드 돌기 전 후 count::"+count);
        System.out.println("메서드 돈 후 count::"+count);*/
        
        /*Enumeration params = request.getParameterNames();
        System.out.println("----------------------------");
        while (params.hasMoreElements()){
            String name = (String)params.nextElement();
            System.out.println(name + " : " +request.getParameter(name));
        }
        System.out.println("----------------------------");*/
       
        if (count > 0) {
        	System.out.println("메서드전 opt::"+opt);
        	System.out.println("메서드전 condition::"+condition);
			articleList = dbPro.getArticles(startRow, endRow, opt, condition);//현재 페이지에 해당하는 글 목록
        } else {
            articleList = Collections.EMPTY_LIST;
        }

        number=count-(currentPage-1)*pageSize;//글목록에 표시할 글번호
        //해당 뷰에서 사용할 속성
        request.setAttribute("currentPage", new Integer(currentPage));
        request.setAttribute("startRow", new Integer(startRow));
        request.setAttribute("endRow", new Integer(endRow));
        request.setAttribute("count", new Integer(count));
        request.setAttribute("pageSize", new Integer(pageSize));
	    request.setAttribute("number", new Integer(number));
        request.setAttribute("articleList", articleList);
       
        return "/notice/notice.jsp";//해당 뷰
    }
}

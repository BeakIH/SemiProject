package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class WriteFormAction implements CommandAction {//글 입력 폼 처리

    public String requestPro(HttpServletRequest request,
        HttpServletResponse response)throws Throwable {

        int bNo = 0;
        try{ 
        	
          if(request.getParameter("bNo")!=null){
        	  bNo=Integer.parseInt(request.getParameter("bNo"));

	   }
	}catch(Exception e){e.printStackTrace();}
		//해당 뷰에서 사용할 속성
		request.setAttribute("bNo", new Integer(bNo));


		return "/notice/writeForm.jsp";//해당 뷰
	}
}

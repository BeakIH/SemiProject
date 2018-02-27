package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class WriteFormAction implements CommandAction {//글 입력 폼 처리

    public String requestPro(HttpServletRequest request,
        HttpServletResponse response)throws Throwable {
       //제목글과 답변글의 구분
        int b_no=0;
        try{ 
          if(request.getParameter("b_no")!=null){
		 b_no=Integer.parseInt(request.getParameter("b_no"));

	   }
	}catch(Exception e){e.printStackTrace();}
		//해당 뷰에서 사용할 속성
		request.setAttribute("b_no", new Integer(b_no));


		return "/notice/writeForm.jsp";//해당 뷰
	}
}

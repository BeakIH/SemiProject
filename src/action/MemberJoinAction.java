package action;
 
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
import jsp.member.model.MemberBean;
import jsp.member.model.MemberDAO;
 

public class MemberJoinAction implements CommandAction{

	   @Override
	   public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
        
        request.setCharacterEncoding("utf-8"); // 인코딩
        
        String totalfoodcheckbox="";
        
        for(int i=0;i<8;i++) {
        	String foodbox1="food"+i;
        	String foodbox2=request.getParameter(foodbox1);
        	if(!(foodbox2==null || foodbox2=="")) {
        		totalfoodcheckbox += foodbox2;
        	}
        }
        		
        String checkbox = request.getParameter("food");
        System.out.println("확인");
        System.out.println("checkbox::"+checkbox);
        System.out.println("종료");
        ActionForward forward = new ActionForward();

        MemberDAO dao = MemberDAO.getInstance();

 	   
  
             
             
        // 입력된 정보를 자바빈에 세팅한다.
        MemberBean member = new MemberBean();
        member.setMem_nm(request.getParameter("mem_nm"));
        member.setMem_id(request.getParameter("mem_id"));
        member.setMem_pw(request.getParameter("mem_pw"));;
        member.setMem_tel(request.getParameter("mem_tel"));
        member.setAddress(request.getParameter("address"));
        member.setEmail(request.getParameter("email"));
        member.setEmail_yn(request.getParameter("email_yn"));
        member.setFvrt_str_1(request.getParameter("fvrt_str_1"));
        member.setFvrt_str_2(totalfoodcheckbox);
        
        
        // 회원가입 실행
        dao.insertMember(member);
        
        // 가입성공
        forward.setRedirect(true);
           forward.setNextPath("Result.do");
        
           // 가입성공 메시지를 세션에 담는다.
           request.getSession().setAttribute("msg", "1");
           
        return "/jsp/member/Success.jsp";
    }
}



 


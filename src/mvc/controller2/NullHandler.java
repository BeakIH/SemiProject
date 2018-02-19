package mvc.controller2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class NullHandler implements CommandHandler {

   @Override
   public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
      return "/jsp/admin/management_create.do";
   }
}
package mvc.controller2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface CommandHandler {
   public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable;
}
package mvc.controller2;

import java.io.FileInputStream;
import java.io.IOException;
import java.net.URL;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.CommandAction;

public class ControllerUsingURI extends HttpServlet {

	private Map commandMap = new HashMap(); // 명령어와 명령어 처리 클래스를 쌍으로 저장

	// 명령어와 처리클래스가 매핑되어 있는 properties 파일을 읽어서 Map객체인 commandMap에 저장
	// 명령어와 처리클래스가 매핑되어 있는 properties 파일은 Command.properties파일
	public void init(ServletConfig config) throws ServletException {
		String props = config.getInitParameter("propertyConfig"); // web.xml에서 propertyConfig에 해당하는 init-param 의 값을 읽어옴
		Properties pr = new Properties(); // 명령어와 처리클래스의 매핑정보를 저장할 Properties 객체 생성
		FileInputStream f = null;

		try {
			String configFilePath = config.getServletContext().getRealPath(props);
			f = new FileInputStream(configFilePath); // Command.properties 파일의 내용을 읽어옴
			pr.load(f); // Command.properties파일의 정보를 Properties객체에 저장
		} catch (IOException e) {
			throw new ServletException(e);
		} finally {
			if (f != null)
				try {
					f.close();
				} catch (IOException ex) {
				}
		}

		Iterator keyIter = pr.keySet().iterator();
		while (keyIter.hasNext()) {
			String command = (String) keyIter.next();
			String handlerClassName = pr.getProperty(command);
			try {
				Class handlerClass = Class.forName(handlerClassName);
				Object handlerInstance = handlerClass.newInstance();
				commandMap.put(command, handlerInstance);
			} catch (ClassNotFoundException e) {
				throw new ServletException(e);
			} catch (InstantiationException e) {
				throw new ServletException(e);
			} catch (IllegalAccessException e) {
				throw new ServletException(e);
			}
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		requestPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		requestPro(request, response);
	}

	private void requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
	      String view = null;
	      CommandAction com = null;
	      try {
	         String command = request.getRequestURI();
	         if(command.indexOf(request.getContextPath()) == 0) {
	            command = command.substring(request.getContextPath().length());
	         }
	         com = (CommandAction)commandMap.get(command);
	         view = com.requestPro(request, response);
	      }catch(Throwable e) {
	         throw new ServletException(e);
	      }
	      RequestDispatcher dispatcher = request.getRequestDispatcher(view);
	      dispatcher.forward(request, response);
	   }
}

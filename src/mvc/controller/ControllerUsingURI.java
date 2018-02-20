package mvc.controller;

import java.io.FileInputStream;
import java.io.IOException;
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

	private Map commandMap = new HashMap();// ��ɾ�� ��ɾ� ó�� Ŭ������ ������ ����

	// ��ɾ�� ó��Ŭ������ ���εǾ� �ִ� properties ������ �о Map��ü�� commandMap�� ����
	// ��ɾ�� ó��Ŭ������ ���εǾ� �ִ� properties ������ Command.properties����
	public void init(ServletConfig config) throws ServletException {
		String props = config.getInitParameter("propertyConfig");// web.xml���� propertyConfig�� �ش��ϴ� init-param �� ���� �о��
		Properties pr = new Properties();// ��ɾ�� ó��Ŭ������ ���������� ������ Properties��ü ����
		FileInputStream f = null;
		try {
			f = new FileInputStream(props); // Command.properties������ ������ �о��
			pr.load(f);// Command.properties������ ������ Properties��ü�� ����
		} catch (IOException e) {
			throw new ServletException(e);
		} finally {
			if (f != null)
				try {
					f.close();
				} catch (IOException ex) {
				}
		}
		
		Iterator keyIter = pr.keySet().iterator();// Iterator��ü�� Enumeration��ü�� Ȯ���Ų ������ ��ü
		while (keyIter.hasNext()) {// ��ü�� �ϳ��� ������ �� ��ü������ Properties��ü�� ����� ��ü�� ����
			String command = (String) keyIter.next();/*key*/
			String className = pr.getProperty(command); /*value*/
			try {
				Class commandClass = Class.forName(className);// �ش� ���ڿ��� Ŭ������ �����. new ListAction() class action.ListAction
				Object commandInstance = commandClass.newInstance();// �ش�Ŭ������ ��ü�� ����   class action.ListAction.newInstance(); 
				commandMap.put(command, commandInstance);// Map��ü�� commandMap�� ��ü ����
			} catch (ClassNotFoundException e) {
				throw new ServletException(e);
			} catch (InstantiationException e) {
				throw new ServletException(e);
			} catch (IllegalAccessException e) {
				throw new ServletException(e);
			}
		}
	} // ��ɾ� - ������ ��ü

	public void doGet(// get����� ���� �޼ҵ�
			HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request, response);
	}

	protected void doPost(// post����� ���� �޼ҵ�
			HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request, response);
	}

	// �ÿ����� ��û�� �м��ؼ� �ش� �۾��� ó��
	private void requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String view = null; // view ����
		CommandAction com = null; // model ��ü
		try {
			String command = request.getRequestURI();
			if (command.indexOf(request.getContextPath()) == 0) {
				command = command.substring(request.getContextPath().length());
			}
			com = (CommandAction) commandMap.get(command);
			view = com.requestPro(request, response);
		} catch (Throwable e) {
			throw new ServletException(e);
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);
	}
}
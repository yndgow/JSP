package kr.co.FarmStory2.controller.introduction;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/introduction/hello.do")
public class HelloController extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("group", req.getParameter("group"));
		req.setAttribute("cate", req.getParameter("cate"));
		req.setAttribute("cateResult", 1);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/introduction/hello.jsp");
		dispatcher.forward(req, resp);
	}
}

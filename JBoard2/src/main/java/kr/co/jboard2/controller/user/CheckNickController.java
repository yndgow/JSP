package kr.co.jboard2.controller.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;

import kr.co.jboard2.dao.UserDAO;


@WebServlet("/user/checkNick.do")
public class CheckNickController extends HttpServlet  {
	private static final long serialVersionUID = 1L;
	
	@Override
	public void init() throws ServletException {
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int result = UserDAO.getInstance().selectCountNick(req.getParameter("nick"));
		JsonObject json = new JsonObject();
		json.addProperty("result", result);
		PrintWriter writer= resp.getWriter();
		writer.print(json.toString());
	}
}

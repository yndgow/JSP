package controller.book;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BookDAO;

@WebServlet("/book/delete.do")
public class DeleteController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		BookDAO.getInstance().deleteBook(req.getParameter("bookId"));
		resp.sendRedirect("/Bookstore2/book/list.do");
	}

}

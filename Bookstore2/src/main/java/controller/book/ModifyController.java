package controller.book;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BookDAO;
import vo.BookVO;

@WebServlet("/book/modify.do")
public class ModifyController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("book", BookDAO.getInstance().selectBook(req.getParameter("bookId")));
		RequestDispatcher dispatcher = req.getRequestDispatcher("/book/modify.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		BookVO book = new BookVO();
		book.setBookId(req.getParameter("bookId"));
		book.setBookName(req.getParameter("bookName"));
		book.setPublisher(req.getParameter("publisher"));
		book.setPrice(req.getParameter("price"));
		BookDAO.getInstance().updateBook(book);
		resp.sendRedirect("/Bookstore2/book/list.do");
	}
}

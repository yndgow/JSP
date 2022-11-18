package controller.customer;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CustomerDAO;
import vo.CustomerVO;

@WebServlet("/customer/modify.do")
public class ModifyController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("customer", CustomerDAO.getInstance().selectCustomer(req.getParameter("custId")));
		RequestDispatcher dispatcher = req.getRequestDispatcher("/customer/modify.jsp");
		dispatcher.forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		CustomerVO customer = new CustomerVO();
		customer.setCustId(req.getParameter("custId"));
		customer.setName(req.getParameter("name"));
		customer.setAddress(req.getParameter("address"));
		customer.setPhone(req.getParameter("phone"));
		CustomerDAO.getInstance().updateCustomer(customer);
		resp.sendRedirect("/Bookstore2/customer/list.do");
	}
}

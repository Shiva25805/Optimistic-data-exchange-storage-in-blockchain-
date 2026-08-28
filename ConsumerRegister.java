package com.consumer;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.db.Database;

/**
 * Servlet implementation class ConsumerRegister
 */
@WebServlet("/ConsumerRegister")
public class ConsumerRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConsumerRegister() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		
		
		String name = request.getParameter("name");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");
        String pass = request.getParameter("password");
        double wallet = Double.parseDouble(request.getParameter("wallet_balance"));

        try (Connection con = Database.getconnection()) {

            String sql = "INSERT INTO consumers (name, email, mobile, password, wallet_balance) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, mobile);
            ps.setString(4, pass);
            ps.setDouble(5, wallet);

            int x = ps.executeUpdate();

            if (x > 0) {
                response.sendRedirect("consumer_login.jsp?msg=Registered");
            } else {
                response.sendRedirect("consumer_register.jsp?msg=Failed");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("consumer_register.jsp?msg=Error");
        }
	}

}

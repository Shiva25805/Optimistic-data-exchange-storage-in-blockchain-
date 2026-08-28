package com.consumer;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.db.Database;

/**
 * Servlet implementation class ConsumerLogin
 */
@WebServlet("/ConsumerLogin")
public class ConsumerLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConsumerLogin() {
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
		
		
		String email = request.getParameter("email");
        String pass = request.getParameter("password");

        try (Connection con = Database.getconnection()) {

            String sql = "SELECT consumer_id, name, wallet_balance FROM consumers WHERE email=? AND password=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, pass);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("consumer_id", rs.getInt("consumer_id"));
                session.setAttribute("consumer_name", rs.getString("name"));
                session.setAttribute("wallet_balance", rs.getDouble("wallet_balance"));

                response.sendRedirect("consumer_dashboard.jsp");
            } else {
                response.sendRedirect("consumer_login.jsp?msg=Invalid Credentials");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("consumer_login.jsp?msg=Error");
        }
	}

}

package com.consumer;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.db.Database;

/**
 * Servlet implementation class RechargeWallet
 */
@WebServlet("/RechargeWallet")
public class RechargeWallet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RechargeWallet() {
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
		
		
		 HttpSession session = request.getSession();
	        Integer consumerId = (Integer) session.getAttribute("consumer_id");

	        if (consumerId == null) {
	            response.sendRedirect("consumer_login.jsp");
	            return;
	        }

	        double amount = Double.parseDouble(request.getParameter("amount"));
	        if (amount <= 0) {
	            response.getWriter().println("Invalid amount!");
	            return;
	        }

	        try {
	            Connection con = Database.getconnection();

	            // 1. Update wallet
	            PreparedStatement ps = con.prepareStatement(
	                    "UPDATE consumers SET wallet_balance = wallet_balance + ? WHERE consumer_id=?");
	            ps.setDouble(1, amount);
	            ps.setInt(2, consumerId);
	            ps.executeUpdate();

	            // 2. Insert transaction history
	            PreparedStatement ps2 = con.prepareStatement(
	                    "INSERT INTO wallet_transactions (consumer_id, amount, type, timestamp) VALUES (?, ?, 'credit', ?)");
	            ps2.setInt(1, consumerId);
	            ps2.setDouble(2, amount);
	            ps2.setTimestamp(3, new Timestamp(System.currentTimeMillis()));
	            ps2.executeUpdate();

	            response.sendRedirect("recharge_wallet.jsp?success=1");

	        } catch (Exception e) {
	            e.printStackTrace();
	            response.getWriter().println("Error recharging wallet: " + e.getMessage());
	        }
	}

}

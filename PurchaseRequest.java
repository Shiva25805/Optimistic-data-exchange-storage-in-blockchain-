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

import com.db.Database;

/**
 * Servlet implementation class PurchaseRequest
 */
@WebServlet("/PurchaseRequest")
public class PurchaseRequest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PurchaseRequest() {
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
		
		
		int fileId = Integer.parseInt(request.getParameter("dataId"));
        int consumerId = (int) request.getSession().getAttribute("consumer_id");

        try {
            Connection con = Database.getconnection();

            // get price from relay_storage
            PreparedStatement ps1 = con.prepareStatement(
                "SELECT price FROM data_items WHERE data_id=?"
            );
            ps1.setInt(1, fileId);
            ResultSet rs = ps1.executeQuery();

            int price = 0;
            if (rs.next()) price = rs.getInt("price");

            // insert into purchases table
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO purchases(file_id, consumer_id, price, status) VALUES (?,?,?,?)"
            );
            ps.setInt(1, fileId);
            ps.setInt(2, consumerId);
            ps.setInt(3, price);
            ps.setString(4, "pending_producer");
            ps.executeUpdate();

            response.getWriter().println("Purchase request sent to Producer!");

        } catch (Exception e) {
            e.printStackTrace();
        }
	}

}

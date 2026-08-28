package com.consumer;

import java.io.IOException;
import java.io.OutputStream;
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
 * Servlet implementation class DownloadFile
 */
@WebServlet("/DownloadFile")
public class DownloadFile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DownloadFile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		
		
		 HttpSession session = request.getSession();
	        Integer consumerId = (Integer) session.getAttribute("consumer_id");

	        if (consumerId == null) {
	            response.sendRedirect("consumer_login.jsp");
	            return;
	        }

	        try {
	            Connection con = Database.getconnection();

	            // 1) Get latest approved purchase
	            PreparedStatement ps = con.prepareStatement(
	                "SELECT id, file_id FROM purchases " +
	                "WHERE consumer_id=? AND status='ready_for_download' " +
	                "ORDER BY id DESC LIMIT 1"
	            );
	            ps.setInt(1, consumerId);

	            ResultSet rs = ps.executeQuery();
	            if (!rs.next()) {
	                response.getWriter().println("No approved purchases found!");
	                return;
	            }

	            int fileId = rs.getInt("file_id");

	            // 2) Fetch stored_path from relay_storage (where status='accepted')
	            PreparedStatement ps2 = con.prepareStatement(
	                "SELECT stored_path FROM relay_storage " +
	                "WHERE data_id=? AND status='accepted' " +
	                "ORDER BY id DESC LIMIT 1"
	            );
	            ps2.setInt(1, fileId);
	            ResultSet rs2 = ps2.executeQuery();

	            if (!rs2.next()) {
	                response.getWriter().println("File not found in relay storage!");
	                return;
	            }

	            String storedPath = rs2.getString("stored_path");

	            // 3) Fetch filename from data_items
	            PreparedStatement ps3 = con.prepareStatement(
	                "SELECT file_name FROM data_items WHERE data_id=?"
	            );
	            ps3.setInt(1, fileId);
	            ResultSet rs3 = ps3.executeQuery();

	            if (!rs3.next()) {
	                response.getWriter().println("File metadata not found!");
	                return;
	            }

	            String filename = rs3.getString("file_name");

	            // 4) Read file bytes from disk
	            java.nio.file.Path fileLocation = java.nio.file.Paths.get(storedPath);
	            byte[] fileBytes = java.nio.file.Files.readAllBytes(fileLocation);

	            // 5) Send file to browser
	            response.setContentType("application/octet-stream");
	            response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");

	            OutputStream os = response.getOutputStream();
	            os.write(fileBytes);
	            os.flush();
	            os.close();

	        } catch (Exception e) {
	            e.printStackTrace();
	            response.getWriter().println("Error downloading file: " + e.getMessage());
	        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

package com.controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import com.dao.DBConnection;

public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String email = req.getParameter("email");
        String pass = req.getParameter("password");

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                    "SELECT * FROM users WHERE email=? AND password=?");

            ps.setString(1, email);
            ps.setString(2, pass);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                int id = rs.getInt("id");
                String name = rs.getString("name");
                String role = rs.getString("role");

                HttpSession session = req.getSession();

                // STORE IN SESSION
                session.setAttribute("user_id", id);
                session.setAttribute("username", name);
                session.setAttribute("role", role);

                if (role.equals("admin")) {
                    res.sendRedirect("admin.jsp");
                } else {
                    res.sendRedirect("student.jsp");
                }

            } else {

                res.sendRedirect("login.jsp?error=1");

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<%
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	String connUrl = "jdbc:sqlserver://localhost:1433;databaseName=PDB";
	Connection conn = DriverManager.getConnection(connUrl, "sa", "sa123456");

	String qryStmt = "SELECT * FROM product WHERE pPrice>100";
	PreparedStatement stmt = conn.prepareStatement(qryStmt);
	ResultSet rs = stmt.executeQuery();

	while (rs.next()) {
		out.print("<table>");
		out.print("<tr>");
		out.print("<td>");
		out.print("商品名稱");
		out.print("</td>");
		out.print("<td>");
		out.print("庫存");
		out.print("</td>");
		out.print("<td>");
		out.print("價格");
		out.print("</td>");
		out.print("<td>");
		out.print("有效日期");
		out.print("</td>");
		out.print("</tr>");
		out.print("<tr>");
		out.print("<td>");
		out.print(rs.getString("pName"));
		out.print("</td>");
		out.print("<td>");
		out.print(rs.getInt("PinStock"));
		out.print("</td>");
		out.print("<td>");
		out.print(rs.getInt("pPrice"));
		out.print("</td>");
		out.print("<td>");
		out.print(rs.getDate("pDateRange"));
		out.print("</td>");
		out.print("</tr>");
		out.print("</table>");
		out.print("<br>");
	}
	conn.close();
%>

<%-- 
    Document   : newjsp
    Created on : Jun 27, 2016, 5:18:18 PM
    Author     : SudipBhandari
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <form method="post" action="newjsp.jsp">
            
            NewPassword: <input type="password" name="password"><br>
            <input type="submit">
        </form>
        <h1>
            <%
                String name=request.getParameter("name");
               // System.out.println(name);
                String password=null;
                if (request.getParameter("isSubmit")!=null) {
                    name = request.getParameter("username");
                    password=request.getParameter("password");
                }
                // System.out.println(password);
                
                try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/aindra","root","12345");
                Statement st = con.createStatement();
                st.execute("update table list set password='"+password+"' where name='"+name+"';");
                
                }
                catch(Exception e)
                {
                    e.printStackTrace();
                }
            %>
            
        </h1>
    </body>
</html>

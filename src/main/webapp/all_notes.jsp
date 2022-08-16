<%@ page import="com.helper.FactoryProvider"%>
<%@ page import="org.hibernate.Session"%>
<%@ page import="org.hibernate.Query" %>
<%@ page import="java.util.List" %>
<%@ page import="com.entities.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <%@include file="All_css_script.jsp" %>
<title>All Note :Note Taker</title>
</head>
<body>
     <div class="container">
          <%@include file="navbar.jsp" %>
          <br/>
          <h1 class="text-uppercase">All Notes</h1>
          <div class="row">
          <div class="col-12">
          <%
          Session s=FactoryProvider.getfactory().openSession();
         Query q= s.createQuery("from Note");
         List<Note> list=q.list();
         //displaying 
         for(Note n:list)
         {%>
        	<!-- card -->
        	
        	<div class="card mt-4">
             <img style="max-width:50px;" class="card-img-top p-2" src="img/notes.png" alt="Card image cap">
             <div class="card-body">
             
             
             <h4 class="card-title"><%=n.getTittle() %></h4>
    <p class="card-text"><%=n.getContent() %></p>
     <h6 class="card-title text-right text-primary">Date:<%=n.getAddedDate() %></h6>
    <div class="container text-center">
    <a href="DeleteServlet?note_id=<%=n.getId() %>" class="btn btn-danger m-r-5">Delete</a>
      <a href="edit.jsp?note_id=<%=n.getId() %>" class="btn btn-primary m-l-5">Update</a>
  </div>
  </div>
</div>
        	
        	
         <%}
         s.close();
          %>
          </div>
          </div>
      </div>
</body>
</html>
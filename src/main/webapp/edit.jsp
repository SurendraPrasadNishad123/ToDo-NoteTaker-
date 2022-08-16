<%@ page import="com.helper.FactoryProvider"%>
<%@ page import="org.hibernate.Session"%>
<%@ page import="java.util.List" %>
<%@ page import="com.entities.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit :Note Taker</title>
 <%@include file="All_css_script.jsp" %>

</head>
<body>
<div class="container">
 <%@include file="navbar.jsp" %>
 <%
		//getting id when delete button pressed
		int noteId=Integer.parseInt(request.getParameter("note_id").trim());
		
		//opening session through session factory
		Session s1=FactoryProvider.getfactory().openSession();
		
	//getting data from table Note where id=noteId
		Note note=s1.get(Note.class,noteId);
	%>
	
	 <div class="card-body col-6 center ">
  <div style="text-align:center"><h4>Please Edit  details</h4></div>
  <!-- form -->
  <form action="UpdateServlet" method="post">
  <input value="<%=note.getId() %>" name="noteId" type="hidden"/>
  <div class="form-group">
    <label for="tittle">Note Title</label>
    <input type="text" name="title" class="form-control" id="tittle" value="<%=note.getTittle() %>" required />
   
  </div>
  <div class="form-group ">
    <label for="noteContent">Note Content</label>
     <textarea  style="height:300px;" name="content" class="form-control" id="noteContent" required><%= note.getContent() %> </textarea>
  </div>
  <div class="container text-center">
  <button type="submit" class="btn btn-primary ">Submit</button>
  </div>
</form>
</div>
</div>
	
	<% 	
	
		
		s1.close();
		
	
  %>
</div>
</body>
</html>
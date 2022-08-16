
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

 <%@include file="All_css_script.jsp" %>
 <title>Add Note</title>
</head>
<body>
 <div class="container">
 
      <%@include file="navbar.jsp" %>
    <div class="card-body col-6 center ">
  <div style="text-align:center"><h4>Please enter your note details</h4></div>
  <!-- form -->
  <form action="SaveNoteServlet" method="post">
  <div class="form-group">
    <label for="tittle">Note Title</label>
    <input type="text" name="title" class="form-control" id="tittle" required>
   
  </div>
  <div class="form-group ">
    <label for="noteContent">Note Content</label>
     <textarea  style="height:300px;" name="content" class="form-control" id="noteContent" required></textarea>
  </div>
  <div class="container text-center">
  <button type="submit" class="btn btn-primary ">Submit</button>
  </div>
</form>
</div>
</div>

</body>
</html>
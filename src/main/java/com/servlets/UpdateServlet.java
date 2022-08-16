package com.servlets;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.FactoryProvider;

/**
 * Servlet implementation class UpdateServlet
 */
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
		try {
			//getting data from form edit
			int noteId=Integer.parseInt(request.getParameter("noteId").trim());
			String title=request.getParameter("title");
			String content =request.getParameter("content");
			//opening session through session factory
			Session s1=FactoryProvider.getfactory().openSession();
			
			Transaction txt=s1.beginTransaction();
			//getting data from db
			Note note=s1.get(Note.class,noteId);
			if(noteId==note.getId()) 
			{
			note.setTittle(title);
			note.setContent(content);
			note.setAddedDate(new Date());
			txt.commit();
			}
			s1.close();
			
			//redirecting to page
			response.sendRedirect("all_notes.jsp");
			}
			catch(Exception e) 
			{
				
			}
		}

}

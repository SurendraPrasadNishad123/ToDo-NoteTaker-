package com.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.FactoryProvider;

public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public DeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
		//getting id when delete button pressed
		int noteId=Integer.parseInt(request.getParameter("note_id").trim());
		
		//opening session through session factory
		Session s1=FactoryProvider.getfactory().openSession();
		
		Transaction txt=s1.beginTransaction();
		Note note=s1.get(Note.class,noteId);
		s1.delete(note);
		txt.commit();
		
		s1.close();
		
		//redirecting to page
		response.sendRedirect("all_notes.jsp");
		}
		catch(Exception e) 
		{
			
		}
	}

}

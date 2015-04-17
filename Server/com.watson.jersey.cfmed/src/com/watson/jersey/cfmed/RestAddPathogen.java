
package com.watson.jersey.cfmed;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.Consumes;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;


@Path ("secure/addPathogen")
public class RestAddPathogen {



	// This method returns the xml of the objects created on the server. Using JAXB
	@GET
	@Produces({MediaType.TEXT_HTML})
	public File getHTML() throws IOException {
		File file = new File("templates/addpathogenform.html");
		return file;
	}



	@POST
	@Produces(MediaType.TEXT_HTML)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public void newPathogen(@FormParam("name") String name,
			
			@FormParam("fLDrug") String fLDrug,
			@FormParam("fLDrug1") String fLDrug1,
			@FormParam("fLDrug2") String fLDrug2,
			@FormParam("fLDrug3") String fLDrug3,
			@FormParam("fLDrug4") String fLDrug4,
			@FormParam("fLDrug5") String fLDrug5,
			@FormParam("fLDrug6") String fLDrug6,
			@FormParam("fLDrug7") String fLDrug7,
			@FormParam("fLDrug8") String fLDrug8,
			@FormParam("fLDrug9") String fLDrug9,
			
		
			@FormParam("description") String description,
			@Context HttpServletResponse servletResponse) throws IOException {
		
		//Create object from form strings
		ArrayList <String> fLArray = new ArrayList <String> ();
		PathogenInfo newPathogen = new PathogenInfo();
		
		if(fLDrug != null && !fLDrug.isEmpty()){
			fLArray.add(fLDrug);
		}
		if(fLDrug1 != null && !fLDrug1.isEmpty()){
			fLArray.add(fLDrug1);
		}
		if(fLDrug2 != null && !fLDrug2.isEmpty()){
			fLArray.add(fLDrug2);
		}
		if(fLDrug3 != null && !fLDrug3.isEmpty()){
			fLArray.add(fLDrug3);
		}
		if(fLDrug4 != null && !fLDrug4.isEmpty()){
			fLArray.add(fLDrug4);
		}
		if(fLDrug5 != null && !fLDrug5.isEmpty()){
			fLArray.add(fLDrug5);
		}
		if(fLDrug6 != null && !fLDrug6.isEmpty()){
			fLArray.add(fLDrug6);
		}
		if(fLDrug7 != null && !fLDrug7.isEmpty()){
			fLArray.add(fLDrug7);
		}
		if(fLDrug8 != null && !fLDrug8.isEmpty()){
			fLArray.add(fLDrug8);
		}
		if(fLDrug9 != null && !fLDrug9.isEmpty()){
			fLArray.add(fLDrug9);
		}
		
	
		
		newPathogen.setFirstline(fLArray);
		
		newPathogen.setName(name);
		newPathogen.setDescription(description);
		DBManager db = new DBManager();
		int check = 0;
		check = db.addPathogen(newPathogen);
		if(check == -1){
			servletResponse.sendRedirect("../secure/addPathogen/noDrug");
		}else{
		servletResponse.sendRedirect("../secure/pathogens");
		}
		}
	
	@GET
	@Path("noDrug")
	public File noDrug(){
		File file = new File("templates/noDrug.html");
		return file;
	}
	}


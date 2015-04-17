package com.watson.jersey.cfmed;


import javax.annotation.security.PermitAll;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.xml.bind.*;

@Path("/cfmed")
public class RestLogic {

	// This method returns the xml of the objects created on the server. Using JAXB
	@GET
	@PermitAll
	@Produces({ MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON })
	public File getXML() throws IOException {
		DBManager db = new DBManager();
		CFInfo cfInfo = new CFInfo();
		ArrayList <DrugInfo> drugsFromDatabase = new ArrayList <DrugInfo>();
		ArrayList <PathogenInfo> pathogensFromDatabase = new ArrayList <PathogenInfo>();
		drugsFromDatabase = db.databaseToDrugObject();
		pathogensFromDatabase = db.databaseToPathogenObject();
		cfInfo.setDrug(drugsFromDatabase);
		cfInfo.setPathogen(pathogensFromDatabase);
		
		File file = new File("templates/cfInfo.xml");
		try{

			JAXBContext jaxbContext = JAXBContext.newInstance(CFInfo.class);
			Marshaller jaxbMarshaller = jaxbContext.createMarshaller();
			jaxbMarshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
			jaxbMarshaller.marshal(cfInfo, file);
			jaxbMarshaller.marshal(cfInfo, System.out);


		}catch (JAXBException e) {
			e.printStackTrace();
		}
		return file;
	}
}
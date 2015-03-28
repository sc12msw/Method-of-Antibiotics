package com.watson.jersey.cfmed;


import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;

import javax.xml.bind.*;

@Path("/cfmed")
public class RestLogic {

	// This method returns the xml of the objects created on the server. Using JAXB
	@GET
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

//This method returns html instead of xml to view in web browser. Using the path rest/cfmed/html
	@GET
	@Path("/html")
	@Produces(MediaType.TEXT_HTML)
	public File getHTML()  {
		//Gets the template for the HTML.
		String htmlString = null;
		BufferedWriter out = null;
		File file = new File("templates/template2.html");
		 
		BufferedReader br;
		try {
			br = new BufferedReader(new FileReader("templates/template.html"));
			  StringBuilder sb = new StringBuilder();
		        String line = br.readLine();

		        while (line != null) {
		            sb.append(line);
		            sb.append("\n");
		            line = br.readLine();
		        }
		     htmlString = sb.toString();
		     br.close();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		//Fills the template with data.
		CFInfo cfInfo = new CFInfo();
		DBManager db = new DBManager();
		ArrayList <DrugInfo> drugArray = db.databaseToDrugObject();
		cfInfo.setDrug(drugArray);
		ArrayList <String> tempArray = new ArrayList<String>();
		String tempString = "";
		String row = "";
		String title = "Cystic Fybrosis Information";
		ArrayList <DrugInfo> array = cfInfo.getDrug();
		for (int i=0 ; i < array.size() ; i++){
		DrugInfo drugInfo = array.get(i);
		AdultInfo adultInfo = drugInfo.getAdult();
		AdminDose adultOral = adultInfo.getOral();
		PaediatricInfo pInfo = drugInfo.getPaediatric();
		AdminDose pOral = pInfo.getOral();
		tempArray = drugInfo.getBrandName();
		for (int j=0; j<tempArray.size(); j++){
			String temp2 = tempArray.get(j);
			tempString = tempString +" "+ temp2;
		}
		//Puts all drugs into a table
		row =row + "<tr> <td>"+drugInfo.getName()+"</td>"+"<td>"+tempString+"</td>"+"<td>"+drugInfo.getIndication()+"</td>"+"<td>"+adultOral.getAdministration()+"</td>"+"<td>"+adultOral.getDose()+"</td>"+"<td>"+pOral.getAdministration()+"</td>"+"<td>"+pOral.getDose()+"</td>"+"<td>"+drugInfo.getInteractions()+"</td></tr>";
		tempString = "";
		}
		htmlString = htmlString.replace("$title", title);
		htmlString = htmlString.replace("$tablerow", row);
		
		//Writes the new html back to the file
		 FileWriter fstream;
		try {
			fstream = new FileWriter(file, false);
			out = new BufferedWriter(fstream);
			out.write(htmlString);
			out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		    
		return file;
	}
	
	
	
	
	
}
package com.watson.jersey.cfmed;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;

import javax.xml.bind.*;

@Path("/cfmed")
public class RestLogic {


	public CFInfo createObj(){
		
		//This fills the objects with data. At the moment there is no database so it just fills the object array with the same strings.
		CFInfo cfInfo = new CFInfo();
		DrugInfo drugInfo = new DrugInfo();
		AdultInfo adultInfo = new AdultInfo();
		PaediatricInfo paediatricInfo = new PaediatricInfo();
		AdminDose adminDose = new AdminDose();
		adminDose.setAdministration("take tablet");
		adminDose.setDose("10mg");
		adultInfo.setOral(adminDose);
		adultInfo.setInhaled(adminDose);
		paediatricInfo.setOral(adminDose);
		paediatricInfo.setInhaled(adminDose);
		drugInfo.setAdult(adultInfo);
		drugInfo.setPaediatric(paediatricInfo);
		drugInfo.setName("Drug name");
		drugInfo.setIndication("For this disease");
		drugInfo.setInteractions("This drug interacts with : 1drug 2drug etc");
		drugInfo.setSideEffect("This is a side effect");
		String[] brands = {"brand 1","brand 2"};
		drugInfo.setBrandName(brands);
		ArrayList<DrugInfo> array = new ArrayList<DrugInfo>();
		array.add(drugInfo);
		array.add(drugInfo);
		array.add(drugInfo);
		array.add(drugInfo);
		cfInfo.setDrug(array);
		
		return cfInfo;
	}


	// This method returns the xml of the objects created on the server. Using JAXB
	@GET
	@Produces({ MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON })
	public File getXML() throws IOException {
		File file4 = new File("highscore.txt");
		System.out.println(file4.getCanonicalPath());
		File file = new File("file.xml");
		CFInfo cfInfo = createObj();
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
	@Path("html")
	@Produces(MediaType.TEXT_HTML)
	public File getHTML()  {
		//Gets the template for the HTML.
		String htmlString = null;
		BufferedWriter out = null;
		File file = new File("template2.html");
		 
		BufferedReader br;
		try {
			br = new BufferedReader(new FileReader("template.html"));
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
		CFInfo cfInfo = createObj();
		String[] tempArray = null;
		String tempString = "";
		String row = "";
		String title = "Cystic Fybrosis Information";
		ArrayList <DrugInfo> array = cfInfo.getDrug();
		for (int i=0 ; i < array.size()-1 ; i++){
		DrugInfo drugInfo = array.get(i);
		AdultInfo adultInfo = drugInfo.getAdult();
		AdminDose adultOral = adultInfo.getOral();
		PaediatricInfo pInfo = drugInfo.getPaediatric();
		AdminDose pOral = pInfo.getOral();
		tempArray = drugInfo.getBrandName();
		for (int j=0; j<tempArray.length; j++){
			tempString = tempString +" "+ tempArray[j];
		}
		//Puts all drugs into a table
		row =row + "<tr> <td>"+drugInfo.getName()+"</td>"+"<td>"+tempString+"</td>"+"<td>"+drugInfo.getIndication()+"</td>"+"<td>"+adultOral.getAdministration()+"</td>"+"<td>"+adultOral.getDose()+"</td>"+"<td>"+pOral.getAdministration()+"</td>"+"<td>"+pOral.getDose()+"</td>"+"<td>"+drugInfo.getInteractions()+"</td>";
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
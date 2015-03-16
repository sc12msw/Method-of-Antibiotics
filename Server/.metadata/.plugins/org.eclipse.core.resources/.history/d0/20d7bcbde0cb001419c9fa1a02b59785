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
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;


@Path ("/addDrug")
public class RestAddDrug {
public CFInfo createObj(){
		
		//This fills the objects with data. At the moment there is no database so it just fills the object array with the same strings.
		CFInfo cfInfo = new CFInfo();
		PathogenInfo pathoInfo = new PathogenInfo();
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
		ArrayList <String> brands = new ArrayList <String>();
		brands.add("brand 1");
		brands.add("brand 2");
		drugInfo.setBrandName(brands);
		
		pathoInfo.setName("Bacteria");
		pathoInfo.setDescription("I am a bacteria");
		String[] firstline = {"Drug 1", "Drug 2"};
		String[] secondline= {"Drug 3", "Drug 4"};
		pathoInfo.setFirstline(firstline);
		pathoInfo.setSecondline(secondline);
		
		ArrayList<PathogenInfo> pathoArray = new ArrayList<PathogenInfo>();
		pathoArray.add(pathoInfo);
		pathoArray.add(pathoInfo);
		pathoArray.add(pathoInfo);
		pathoArray.add(pathoInfo);
		ArrayList<DrugInfo> drugArray = new ArrayList<DrugInfo>();
		drugArray.add(drugInfo);
		drugArray.add(drugInfo);
		drugArray.add(drugInfo);
		drugArray.add(drugInfo);
		drugArray.add(drugInfo);
		drugArray.add(drugInfo);
		drugArray.add(drugInfo);
		drugArray.add(drugInfo);
		drugArray.add(drugInfo);
		cfInfo.setDrug(drugArray);
		cfInfo.setPathogen(pathoArray);
		return cfInfo;
	}
	
	
	// This method returns the xml of the objects created on the server. Using JAXB
		@GET
		@Produces({MediaType.TEXT_HTML})
		public File getHTML() throws IOException {
			File file = new File("adddrugform.html");
			return file;
		}
		
		
		
		 @POST
		  @Produces(MediaType.TEXT_HTML)
		  @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
		  public void newDrugs(@FormParam("name") String name,
		      @FormParam("summary") String summary,
		      @FormParam("brand") String brand,
		      @FormParam("brand1") String brand1,
		      @FormParam("brand2") String brand2,
		      @FormParam("brand3") String brand3,
		      @FormParam("brand4") String brand4,
		      @Context HttpServletResponse servletResponse) throws IOException {
			 
			 //This line is to create dummy data when complete this will be data pull from database
			 CFInfo cfInfo = createObj();
			 //
			 ArrayList <DrugInfo> drugArray = cfInfo.getDrug();
			 DrugInfo newDrug = new DrugInfo();
			 newDrug.setName(name);
			 ArrayList <String> brandNames = new ArrayList<String>();
			 if(brand != null && !brand.isEmpty()){
			 brandNames.add(brand);
			 }
			 
			 if(brand1 != null && !brand1.isEmpty()){
				brandNames.add(brand1);
			 }
			 if(brand2 != null && !brand2.isEmpty()){
				 brandNames.add(brand2);
			 }
			 if(brand3 != null && !brand3.isEmpty()){
				 brandNames.add(brand3);
			 }
			 if(brand4 != null && !brand4.isEmpty()){
				 brandNames.add(brand4);
			 }
		
			 
			 
			 newDrug.setBrandName(brandNames);
			 drugArray.add(newDrug);
			 File file = new File("cfInfo.xml");
			 
			 try{

					JAXBContext jaxbContext = JAXBContext.newInstance(CFInfo.class);
					Marshaller jaxbMarshaller = jaxbContext.createMarshaller();
					jaxbMarshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
					jaxbMarshaller.marshal(cfInfo, file);
					jaxbMarshaller.marshal(cfInfo, System.out);


				}catch (JAXBException e) {
					e.printStackTrace();
				}
			 
		    servletResponse.sendRedirect("../rest/cfmed");
		  }
}

package com.watson.jersey.cfmed;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import java.io.File;
import java.util.ArrayList;

import javax.xml.bind.*;
@Path("/cfmed")
public class RestLogic {
	
	
  // This method is called if XMLis request
  @GET
  @Produces({ MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON })
  public File getXML() {
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
	cfInfo.setDrug(array);
	File file = new File("C:\\file.xml");
	try{
  	
  	JAXBContext jaxbContext = JAXBContext.newInstance(CFInfo.class);
		Marshaller jaxbMarshaller = jaxbContext.createMarshaller();

		// output pretty printed
		jaxbMarshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);

		jaxbMarshaller.marshal(cfInfo, file);
		jaxbMarshaller.marshal(cfInfo, System.out);
	  
   
  }catch (JAXBException e) {
		e.printStackTrace();
  }
	 return file;
  }
  
  // This can be used to test the integration with the browser
  @GET
  @Produces({ MediaType.TEXT_XML })
  public CFInfo getHTML() {
    CFInfo xml = new CFInfo();
    return xml;
  }
  

} 
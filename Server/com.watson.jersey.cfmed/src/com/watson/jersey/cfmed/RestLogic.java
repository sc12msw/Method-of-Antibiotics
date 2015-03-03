package com.watson.jersey.cfmed;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import java.io.File;
import javax.xml.bind.*;
@Path("/cfmed")
public class RestLogic {
  // This method is called if XMLis request
  @GET
  @Produces({ MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON })
  public File getXML() {
	  File xml = new File("cfinfo/info.xml");
    return xml;
  }
  
  // This can be used to test the integration with the browser
  @GET
  @Produces({ MediaType.TEXT_XML })
  public CFInfo getHTML() {
    CFInfo xml = new CFInfo();
    return xml;
  }

} 
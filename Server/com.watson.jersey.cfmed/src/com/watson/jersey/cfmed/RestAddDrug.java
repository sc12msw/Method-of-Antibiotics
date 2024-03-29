package com.watson.jersey.cfmed;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.Consumes;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;


@Path ("secure/addDrug")
public class RestAddDrug {



	// This method returns the xml of the objects created on the server. Using JAXB
	@GET
	@Produces({MediaType.TEXT_HTML})
	public File getHTML() throws IOException {
		File file = new File("templates/adddrugform.html");
		return file;
	}


    // This method retrieves the data from the form to load into variables then adds the data to the database.
	@POST
	@Produces(MediaType.TEXT_HTML)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public void newDrugs(@FormParam("name") String name,
			
			@FormParam("type") String type,
			//Only allow 5 brands
			@FormParam("brand") String brand,
			@FormParam("brand1") String brand1,
			@FormParam("brand2") String brand2,
			@FormParam("brand3") String brand3,
			@FormParam("brand4") String brand4,


			@FormParam("sideEffects") String sideEffects,
			@FormParam("indication") String indication,

			//Only allow 20 interactions
			@FormParam("interactionName") String interactionName,
			@FormParam("interactionDescription") String interactionDescription,
			@FormParam("interactionName1") String interactionName1,
			@FormParam("interactionDescription1") String interactionDescription1,
			@FormParam("interactionName2") String interactionName2,
			@FormParam("interactionDescription2") String interactionDescription2,
			@FormParam("interactionName3") String interactionName3,
			@FormParam("interactionDescription3") String interactionDescription3,
			@FormParam("interactionName4") String interactionName4,
			@FormParam("interactionDescription4") String interactionDescription4,
			@FormParam("interactionName5") String interactionName5,
			@FormParam("interactionDescription5") String interactionDescription5,
			@FormParam("interactionName6") String interactionName6,
			@FormParam("interactionDescription6") String interactionDescription6,
			@FormParam("interactionName7") String interactionName7,
			@FormParam("interactionDescription7") String interactionDescription7,
			@FormParam("interactionName8") String interactionName8,
			@FormParam("interactionDescription8") String interactionDescription8,
			@FormParam("interactionName9") String interactionName9,
			@FormParam("interactionDescription9") String interactionDescription9,
			@FormParam("interactionName10") String interactionName10,
			@FormParam("interactionDescription10") String interactionDescription10,
			@FormParam("interactionName11") String interactionName11,
			@FormParam("interactionDescription11") String interactionDescription11,
			@FormParam("interactionName12") String interactionName12,
			@FormParam("interactionDescription12") String interactionDescription12,
			@FormParam("interactionName13") String interactionName13,
			@FormParam("interactionDescription13") String interactionDescription13,
			@FormParam("interactionName14") String interactionName14,
			@FormParam("interactionDescription14") String interactionDescription14,
			@FormParam("interactionName15") String interactionName15,
			@FormParam("interactionDescription15") String interactionDescription15,
			@FormParam("interactionName16") String interactionName16,
			@FormParam("interactionDescription16") String interactionDescription16,
			@FormParam("interactionName17") String interactionName17,
			@FormParam("interactionDescription17") String interactionDescription17,
			@FormParam("interactionName18") String interactionName18,
			@FormParam("interactionDescription18") String interactionDescription18,
			@FormParam("interactionName19") String interactionName19,
			@FormParam("interactionDescription19") String interactionDescription19,

			@FormParam("oralAdultAdmin") String oralAdultAdmin,
			@FormParam("iVAdultAdmin") String iVAdultAdmin,
			@FormParam("inhaledAdultAdmin") String inhaledAdultAdmin,
			@FormParam("iMAdultAdmin") String iMAdultAdmin,
			@FormParam("pRAdultAdmin") String pRAdultAdmin,
			@FormParam("sCAdultAdmin") String sCAdultAdmin,

			@FormParam("oralAdultDose") String oralAdultDose,
			@FormParam("iVAdultDose") String iVAdultDose,
			@FormParam("inhaledAdultDose") String inhaledAdultDose,
			@FormParam("iMAdultDose") String iMAdultDose,
			@FormParam("pRAdultDose") String pRAdultDose,
			@FormParam("sCAdultDose") String sCAdultDose,

			@FormParam("oralPaedAdmin") String oralPaedAdmin,
			@FormParam("iVPaedAdmin") String iVPaedAdmin,
			@FormParam("inhaledPaedAdmin") String inhaledPaedAdmin,
			@FormParam("iMPaedAdmin") String iMPaedAdmin,
			@FormParam("pRPaedAdmin") String pRPaedAdmin,
			@FormParam("sCPaedAdmin") String sCPaedAdmin,

			@FormParam("oralPaedDose") String oralPaedDose,
			@FormParam("iVPaedDose") String iVPaedDose,
			@FormParam("inhaledPaedDose") String inhaledPaedDose,
			@FormParam("iMPaedDose") String iMPaedDose,
			@FormParam("pRPaedDose") String pRPaedDose,
			@FormParam("sCPaedDose") String sCPaedDose,
			@Context HttpServletResponse servletResponse) throws IOException {



		//Create object from form strings
		DrugInfo newDrug = new DrugInfo();
		AdultInfo adult = new AdultInfo();
		PaediatricInfo paed = new PaediatricInfo();
		ArrayList <String> brandNames = new ArrayList<String>();
		Map <String,String> interactions = new HashMap <String,String>();
		//This try block is to avoid errors where the user has submitted an error in the form.
		//These are optional fields in the form and described as checkers in the code.
		try {
			
			//Brand checkers
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
			//End of brands
			
			//Interaction checkers
			if ( interactionName != null && !interactionName.isEmpty()){

				if ( interactionDescription != null && !interactionDescription.isEmpty()){
					interactions.put(interactionName,interactionDescription);
				}
			}
			if ( interactionName1 != null && !interactionName1.isEmpty()){

				if ( interactionDescription1 != null && !interactionDescription1.isEmpty()){
					interactions.put(interactionName1,interactionDescription1);
				}
			}
			if ( interactionName2 != null && !interactionName2.isEmpty()){

				if ( interactionDescription2 != null && !interactionDescription2.isEmpty()){
					interactions.put(interactionName2,interactionDescription2);
				}
			}
			if ( interactionName3 != null && !interactionName3.isEmpty()){

				if ( interactionDescription3 != null && !interactionDescription3.isEmpty()){
					interactions.put(interactionName3,interactionDescription3);
				}
			}
			if ( interactionName4 != null && !interactionName4.isEmpty()){

				if ( interactionDescription4 != null && !interactionDescription4.isEmpty()){
					interactions.put(interactionName4,interactionDescription4);
				}
			}
			if ( interactionName5 != null && !interactionName5.isEmpty()){

				if ( interactionDescription5 != null && !interactionDescription5.isEmpty()){
					interactions.put(interactionName5,interactionDescription5);
				}
			}
			if ( interactionName6 != null && !interactionName6.isEmpty()){

				if ( interactionDescription6 != null && !interactionDescription6.isEmpty()){
					interactions.put(interactionName6,interactionDescription6);
				}
			}
			if ( interactionName7 != null && !interactionName7.isEmpty()){

				if ( interactionDescription7 != null && !interactionDescription7.isEmpty()){
					interactions.put(interactionName7,interactionDescription7);
				}
			}
			if ( interactionName8 != null && !interactionName8.isEmpty()){

				if ( interactionDescription8 != null && !interactionDescription8.isEmpty()){
					interactions.put(interactionName8,interactionDescription8);
				}
			}
			if ( interactionName9 != null && !interactionName9.isEmpty()){

				if ( interactionDescription9 != null && !interactionDescription9.isEmpty()){
					interactions.put(interactionName9,interactionDescription9);
				}
			}
			if ( interactionName10 != null && !interactionName10.isEmpty()){

				if ( interactionDescription10 != null && !interactionDescription10.isEmpty()){
					interactions.put(interactionName10,interactionDescription10);
				}
			}
			if ( interactionName11 != null && !interactionName11.isEmpty()){

				if ( interactionDescription11 != null && !interactionDescription11.isEmpty()){
					interactions.put(interactionName11,interactionDescription11);
				}
			}
			if ( interactionName12 != null && !interactionName12.isEmpty()){

				if ( interactionDescription12 != null && !interactionDescription12.isEmpty()){
					interactions.put(interactionName12,interactionDescription12);
				}
			}
			if ( interactionName13 != null && !interactionName13.isEmpty()){

				if ( interactionDescription13 != null && !interactionDescription13.isEmpty()){
					interactions.put(interactionName13,interactionDescription13);
				}
			}
			if ( interactionName14 != null && !interactionName14.isEmpty()){

				if ( interactionDescription14 != null && !interactionDescription14.isEmpty()){
					interactions.put(interactionName14,interactionDescription14);
				}
			}
			if ( interactionName15 != null && !interactionName15.isEmpty()){

				if ( interactionDescription15 != null && !interactionDescription15.isEmpty()){
					interactions.put(interactionName15,interactionDescription15);
				}
			}
			if ( interactionName16 != null && !interactionName16.isEmpty()){

				if ( interactionDescription16 != null && !interactionDescription16.isEmpty()){
					interactions.put(interactionName16,interactionDescription16);
				}
			}
			if ( interactionName17 != null && !interactionName17.isEmpty()){

				if ( interactionDescription17 != null && !interactionDescription17.isEmpty()){
					interactions.put(interactionName17,interactionDescription17);
				}
			}
			if ( interactionName18 != null && !interactionName18.isEmpty()){

				if ( interactionDescription18 != null && !interactionDescription18.isEmpty()){
					interactions.put(interactionName18,interactionDescription18);
				}
			}
			if ( interactionName19 != null && !interactionName19.isEmpty()){

				if ( interactionDescription19 != null && !interactionDescription19.isEmpty()){
					interactions.put(interactionName19,interactionDescription19);
				}
			}
			//End of interactions
			
			//Side effect and administration checkers
			if ( sideEffects != null && !sideEffects.isEmpty()){
				newDrug.setSideEffect(sideEffects);
			}
			if ( oralAdultAdmin != null && !oralAdultAdmin.isEmpty()){
				AdminDose adminDose = new AdminDose();
				adminDose.setAdministration(oralAdultAdmin);
				adminDose.setDose(oralAdultDose);
				adult.setOral(adminDose);
			}
			if ( iVAdultAdmin != null && !iVAdultAdmin.isEmpty()){
				AdminDose adminDose = new AdminDose();
				adminDose.setAdministration(iVAdultAdmin);
				adminDose.setDose(iVAdultDose);
				adult.setIV(adminDose);
			}
			if ( inhaledAdultAdmin != null && !inhaledAdultAdmin.isEmpty()){
				AdminDose adminDose = new AdminDose();
				adminDose.setAdministration(inhaledAdultAdmin);
				adminDose.setDose(inhaledAdultDose);
				adult.setInhaled(adminDose);
			}
			if ( iMAdultAdmin != null && !iMAdultAdmin.isEmpty()){
				AdminDose adminDose = new AdminDose();
				adminDose.setAdministration(iMAdultAdmin);
				adminDose.setDose(iMAdultDose);
				adult.setIM(adminDose);
			}
			if ( pRAdultAdmin != null && !pRAdultAdmin.isEmpty()){
				AdminDose adminDose = new AdminDose();
				adminDose.setAdministration(pRAdultAdmin);
				adminDose.setDose(pRAdultDose);
				adult.setPR(adminDose);
			}
			if ( sCAdultAdmin != null && !sCAdultAdmin.isEmpty()){
				AdminDose adminDose = new AdminDose();
				adminDose.setAdministration(sCAdultAdmin);
				adminDose.setDose(sCAdultDose);
				adult.setSC(adminDose);
			}

			if ( oralPaedAdmin != null && !oralPaedAdmin.isEmpty()){
				AdminDose adminDose = new AdminDose();
				adminDose.setAdministration(oralPaedAdmin);
				adminDose.setDose(oralPaedDose);
				paed.setOral(adminDose);
			}
			if ( iVPaedAdmin != null && !iVPaedAdmin.isEmpty()){
				AdminDose adminDose = new AdminDose();
				adminDose.setAdministration(iVPaedAdmin);
				adminDose.setDose(iVPaedDose);
				paed.setIV(adminDose);
			}
			if ( inhaledPaedAdmin != null && !inhaledPaedAdmin.isEmpty()){
				AdminDose adminDose = new AdminDose();
				adminDose.setAdministration(inhaledPaedAdmin);
				adminDose.setDose(inhaledPaedDose);
				paed.setInhaled(adminDose);
			}
			if ( iMPaedAdmin != null && !iMPaedAdmin.isEmpty()){
				AdminDose adminDose = new AdminDose();
				adminDose.setAdministration(iMPaedAdmin);
				adminDose.setDose(iMPaedDose);
				paed.setIM(adminDose);
			}
			if ( pRPaedAdmin != null && !pRPaedAdmin.isEmpty()){
				AdminDose adminDose = new AdminDose();
				adminDose.setAdministration(pRPaedAdmin);
				adminDose.setDose(pRPaedDose);
				paed.setPR(adminDose);
			}
			if ( sCPaedAdmin != null && !sCPaedAdmin.isEmpty()){
				AdminDose adminDose = new AdminDose();
				adminDose.setAdministration(sCPaedAdmin);
				adminDose.setDose(sCPaedDose);
				paed.setSC(adminDose);
			}
			//End of checkers
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		//set the object
		newDrug.setIndication(indication);
		newDrug.setName(name);
		newDrug.setType(type);
		newDrug.setAdult(adult);
		newDrug.setPaediatric(paed);
		newDrug.setInteractions(interactions);
		newDrug.setBrandName(brandNames);
		DBManager db = new DBManager();
		db.addDrug(newDrug);

		servletResponse.sendRedirect("../secure/drugs");
	}
}

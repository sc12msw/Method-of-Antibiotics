package com.watson.jersey.cfmed;

import java.util.ArrayList;
import java.util.Map;

// Xml Element classes.
public class DrugInfo {
	 private AdultInfo ad;
	 private PaediatricInfo pae;
	 private String name;
	 private int id;
	 private ArrayList <String> brandName;
	 private String indication;
	 private String sideEffect;
	 private Map <String,String> interactions;
	 
	 public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Map<String, String> getInteractions() {
		return interactions;
	}

	public void setInteractions(Map<String, String> interactions) {
		this.interactions = interactions;
	}

	public String getName(){
	    	return name;
	    }
	    
	    public void setName (String name){
	    	this.name = name;
	    }
	    
	    public AdultInfo getAdult() {
	        return ad;
	    }
	    
	    public void setAdult(AdultInfo ad) {
	        this.ad = ad;
	    }
	    
	    public PaediatricInfo getPaediatric() {
	        return pae;
	    }
	    
	    public void setPaediatric(PaediatricInfo pae) {
	        this.pae = pae;
	    }

		public ArrayList <String> getBrandName() {
			return brandName;
		}

		public void setBrandName(ArrayList <String> brandName) {
			this.brandName = brandName;
		}

		public String getIndication() {
			return indication;
		}

		public void setIndication(String indication) {
			this.indication = indication;
		}

		public String getSideEffect() {
			return sideEffect;
		}

		public void setSideEffect(String sideEffect) {
			this.sideEffect = sideEffect;
		}
	    
	  
}

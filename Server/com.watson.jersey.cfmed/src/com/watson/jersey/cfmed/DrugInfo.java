package com.watson.jersey.cfmed;
// Xml Element classes.
public class DrugInfo {
	 private AdultInfo ad;
	 private PaediatricInfo pae;
	 private String name;
	 private String[] brandName;
	 private String indication;
	 private String sideEffect;
	 private String interactions;
	 
	  public String getInteractions() {
		return interactions;
	}

	public void setInteractions(String interactions) {
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

		public String[] getBrandName() {
			return brandName;
		}

		public void setBrandName(String[] brandName) {
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

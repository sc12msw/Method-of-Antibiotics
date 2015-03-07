package com.watson.jersey.cfmed;
//XML element classes.
public class PaediatricInfo {
	private AdminDose adminDoseOral,adminDoseInhaled;

	public AdminDose getOral() {
		return adminDoseOral;
	}

	public void setOral(AdminDose adminDoseOral) {
		this.adminDoseOral = adminDoseOral;
	}

	public AdminDose getInhaled() {
		return adminDoseInhaled;
	}

	public void setInhaled(AdminDose adminDoseInhaled) {
		this.adminDoseInhaled = adminDoseInhaled;
	}

}

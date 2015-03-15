package com.watson.jersey.cfmed;
//XML element classes.
public class AdultInfo {

	private AdminDose adminDoseOral,adminDoseInhaled,adminDosePR,adminDoseSC,adminDoseIM,adminDoseIV;

	public AdminDose getPR() {
		return adminDosePR;
	}

	public void setPR(AdminDose adminDosePR) {
		this.adminDosePR = adminDosePR;
	}

	public AdminDose getSC() {
		return adminDoseSC;
	}

	public void setSC(AdminDose adminDoseSC) {
		this.adminDoseSC = adminDoseSC;
	}

	public AdminDose getIM() {
		return adminDoseIM;
	}

	public void setIM(AdminDose adminDoseIM) {
		this.adminDoseIM = adminDoseIM;
	}

	public AdminDose getIV() {
		return adminDoseIV;
	}

	public void setIV(AdminDose adminDoseIV) {
		this.adminDoseIV = adminDoseIV;
	}

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

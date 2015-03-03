package com.watson.jersey.cfmed;


import java.util.ArrayList;

import javax.xml.bind.annotation.XmlRootElement;


@XmlRootElement
public class CFInfo {

private ArrayList<Drug> drug;

public ArrayList<Drug> getDrug() {
	return drug;
}

public void setDrug(ArrayList<Drug> drug) {
	this.drug = drug;
} 



}

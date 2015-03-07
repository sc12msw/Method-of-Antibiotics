package com.watson.jersey.cfmed;


import java.util.ArrayList;

import javax.xml.bind.annotation.XmlRootElement;

//Root xml class
@XmlRootElement
public class CFInfo {

private ArrayList<DrugInfo> drug;

public ArrayList<DrugInfo> getDrug() {
	return drug;
}

public void setDrug(ArrayList<DrugInfo> drug) {
	this.drug = drug;
} 



}

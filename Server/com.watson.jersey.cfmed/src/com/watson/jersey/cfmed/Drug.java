package com.watson.jersey.cfmed;

import java.util.ArrayList;

public class Drug {
private Name name;
private ArrayList<BrandName> brandNames;
private TypeOfDrug type;
public Name getName() {
	return name;
}
public void setName(Name name) {
	this.name = name;
}
public ArrayList<BrandName> getBrandNames() {
	return brandNames;
}
public void setBrandNames(ArrayList<BrandName> brandNames) {
	this.brandNames = brandNames;
}
public TypeOfDrug getType() {
	return type;
}
public void setType(TypeOfDrug type) {
	this.type = type;
}

}

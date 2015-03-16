package com.watson.jersey.cfmed;

import java.util.ArrayList;

public class PathogenInfo {
private String name;
private String description;
private ArrayList<String> firstline;
private ArrayList<String> secondline;
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getDescription() {
	return description;
}
public void setDescription(String description) {
	this.description = description;
}
public ArrayList<String> getFirstline() {
	return firstline;
}
public void setFirstline(ArrayList<String> firstline) {
	this.firstline = firstline;
}
public ArrayList<String> getSecondline() {
	return secondline;
}
public void setSecondline(ArrayList<String> secondline) {
	this.secondline = secondline;
}


}

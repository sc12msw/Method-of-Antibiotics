package com.watson.jersey.cfmed;

import java.util.ArrayList;

public class PathogenInfo {
private String name;
private String description;
private ArrayList<String> firstline;
private int id;

public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
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


}

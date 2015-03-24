package com.watson.jersey.cfmed;

import java.sql.*;
import java.util.ArrayList;
import java.util.Map;

public class DBManager {
	// JDBC driver name and database URL
	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
	static final String DB_URL = "jdbc:mysql://localhost/CFMedDB";

	//  Database credentials
	static final String USER = "admin";
	static final String PASS = "#S3cret999";

	public void addDrug(DrugInfo drug) {
		Connection conn = null;
		Statement stmt = null;
		PreparedStatement preparedStatement = null;
		try{
			// Register JDBC driver
			Class.forName("com.mysql.jdbc.Driver");

			// Create a connection
			conn = DriverManager.getConnection(DB_URL,USER,PASS);

			//creates query to add object to database
			System.out.println("Creating statement...");
			stmt = conn.createStatement();
			String sql;

			//Drug init block, the following code sets the basic data for the drug in the database.
			preparedStatement = conn.prepareStatement("insert into  Drugs (Name,Indication,Side_Effects) values (?, ?, ?)");
			preparedStatement.setString(1, drug.getName());
			preparedStatement.setString(2, drug.getIndication());
			preparedStatement.setString(3, drug.getSideEffect());
			preparedStatement.executeUpdate();


			sql = "SELECT * FROM Drugs";
			ResultSet rs = stmt.executeQuery(sql);

			//Get the drug id to pass the foreign key to the other tables
			int lastid = 0;
			while(rs.next()){
				//Retrieve by column name
				int id  = rs.getInt("ID");
				lastid = id;
			}




			//Adult administration section, the following block is how the adult administration data is added to the database.   
			AdultInfo adult=drug.getAdult();
			AdminDose oral = adult.getOral();
			AdminDose iv = adult.getIV();
			AdminDose inhaled = adult.getInhaled();
			AdminDose im = adult.getIM();
			AdminDose pr = adult.getPR();
			AdminDose sc = adult.getSC();

			preparedStatement = conn.prepareStatement("insert into  Adult_Administration  values (default ,?, ?, ?, ?, ?, ?,"+lastid+")");
			if (oral == null){ 
				preparedStatement.setString(1,"NULL"); 
			}else{
				preparedStatement.setString(1, oral.getAdministration());
			}
			if (iv == null){ 
				preparedStatement.setString(2,"NULL"); 
			}else{
				preparedStatement.setString(2, iv.getAdministration());
			}
			if (inhaled == null){ 
				preparedStatement.setString(3,"NULL"); 
			}else{
				preparedStatement.setString(3, inhaled.getAdministration());
			}
			if (im == null){ 
				preparedStatement.setString(4,"NULL"); 
			}else{
				preparedStatement.setString(4, im.getAdministration());
			}
			if (pr == null){ 
				preparedStatement.setString(5,"NULL"); 
			}else{
				preparedStatement.setString(5, pr.getAdministration());
			}
			if (sc == null){ 
				preparedStatement.setString(6,"NULL"); 
			}else{
				preparedStatement.setString(6, sc.getAdministration());
			}
			preparedStatement.executeUpdate();   

			//Adult dose section, the following block is how the adult dose data is added to the database.   
			preparedStatement = conn.prepareStatement("insert into  Adult_Dose values (default ,?, ?, ?, ?, ?, ?,"+lastid+")");
			if (oral == null){ 
				preparedStatement.setString(1,"NULL"); 
			}else{
				preparedStatement.setString(1, oral.getDose());
			}
			if (iv == null){ 
				preparedStatement.setString(2,"NULL"); 
			}else{
				preparedStatement.setString(2, iv.getDose());
			}
			if (inhaled == null){ 
				preparedStatement.setString(3,"NULL"); 
			}else{
				preparedStatement.setString(3, inhaled.getDose());
			}
			if (im == null){ 
				preparedStatement.setString(4,"NULL"); 
			}else{
				preparedStatement.setString(4, im.getDose());
			}
			if (pr == null){ 
				preparedStatement.setString(5,"NULL"); 
			}else{
				preparedStatement.setString(5, pr.getDose());
			}
			if (sc == null){ 
				preparedStatement.setString(6,"NULL"); 
			}else{
				preparedStatement.setString(6, sc.getDose());
			}
			preparedStatement.executeUpdate();   


			// Paediatric administration section, the following block is how the adult administration data is added to the database.   
			PaediatricInfo paed=drug.getPaediatric();
			oral = paed.getOral();
			iv = paed.getIV();
			inhaled = paed.getInhaled();
			im = paed.getIM();
			pr = paed.getPR();
			sc = paed.getSC();
			preparedStatement = conn.prepareStatement("insert into  Paediatric_Administration values (default ,?, ?, ?, ?, ?, ?,"+lastid+")");
			if (oral == null){ 
				preparedStatement.setString(1,"NULL"); 
			}else{
				preparedStatement.setString(1, oral.getAdministration());
			}
			if (iv == null){ 
				preparedStatement.setString(2,"NULL"); 
			}else{
				preparedStatement.setString(2, iv.getAdministration());
			}
			if (inhaled == null){ 
				preparedStatement.setString(3,"NULL"); 
			}else{
				preparedStatement.setString(3, inhaled.getAdministration());
			}
			if (im == null){ 
				preparedStatement.setString(4,"NULL"); 
			}else{
				preparedStatement.setString(4, im.getAdministration());
			}
			if (pr == null){ 
				preparedStatement.setString(5,"NULL"); 
			}else{
				preparedStatement.setString(5, pr.getAdministration());
			}
			if (sc == null){ 
				preparedStatement.setString(6,"NULL"); 
			}else{
				preparedStatement.setString(6, sc.getAdministration());
			}
			preparedStatement.executeUpdate();   

			//Paediatric dose section, the following block is how the paediatric dose data is added to the database.   
			preparedStatement = conn.prepareStatement("insert into  Paediatric_Dose values (default ,?, ?, ?, ?, ?, ?,"+lastid+")");
			if (oral == null){ 
				preparedStatement.setString(1,"NULL"); 
			}else{
				preparedStatement.setString(1, oral.getDose());
			}
			if (iv == null){ 
				preparedStatement.setString(2,"NULL"); 
			}else{
				preparedStatement.setString(2, iv.getDose());
			}
			if (inhaled == null){ 
				preparedStatement.setString(3,"NULL"); 
			}else{
				preparedStatement.setString(3, inhaled.getDose());
			}
			if (im == null){ 
				preparedStatement.setString(4,"NULL"); 
			}else{
				preparedStatement.setString(4, im.getDose());
			}
			if (pr == null){ 
				preparedStatement.setString(5,"NULL"); 
			}else{
				preparedStatement.setString(5, pr.getDose());
			}
			if (sc == null){ 
				preparedStatement.setString(6,"NULL"); 
			}else{
				preparedStatement.setString(6, sc.getDose());
			}
			preparedStatement.executeUpdate();


			//Sets the brand name table
			ArrayList <String> brands = drug.getBrandName();
			if (brands != null){
				for (int i=0; i<brands.size();i++){
					preparedStatement = conn.prepareStatement("insert into  Brand_Names values (default , ?,"+lastid+")");
					preparedStatement.setString(1, brands.get(i));
					preparedStatement.executeUpdate();
				}
			}
			else { 
				PreparedStatement preparedStatement2 = conn.prepareStatement("insert into  Brand_Names values (default , ?,"+lastid+")");
				preparedStatement2.setString(1, "NULL");
				preparedStatement2.executeUpdate();
			}

			//Sets the Interaction table
			Map <String,String> interactions = drug.getInteractions();
			if (interactions != null){
				for (Map.Entry<String,String> entry : interactions.entrySet()){
					preparedStatement = conn.prepareStatement("insert into Interactions values (default ,?, ?,"+lastid+")");
					preparedStatement.setString(1, (String) entry.getKey());
					preparedStatement.setString(2, (String) entry.getValue());
					preparedStatement.executeUpdate();
				}
			}
			else { 
				PreparedStatement preparedStatement2 = conn.prepareStatement("insert into Interactions values (default ,?, ?,"+lastid+")");
				preparedStatement2.setString(1, "NULL");
				preparedStatement2.setString(2, "NULL");
				preparedStatement2.executeUpdate();
			}



			//Close connections
			rs.close();
			stmt.close();
			conn.close();
		}catch(SQLException se){
			se.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			//Close connections if no connection was found
			try{
				if(stmt!=null)
					stmt.close();
			}catch(SQLException se2){
			}
			try{
				if(conn!=null)
					conn.close();
			}catch(SQLException se){
				se.printStackTrace();
			}
		}
	}
	public void databaseToObject(){

		CFInfo cfInfo = new CFInfo();
		ArrayList <String> tempArray = new ArrayList<String>();
		ArrayList <DrugInfo> array = new ArrayList<DrugInfo>();
		DrugInfo drugInfo = new DrugInfo();
		AdultInfo adultInfo = new AdultInfo();
		AdminDose adminDose = new AdminDose();
		PaediatricInfo paedInfo = new PaediatricInfo();
		PathogenInfo pathInfo = new PathogenInfo();
		Connection conn = null;
		Statement stmt = null;
		try{
			// Register JDBC driver
			Class.forName("com.mysql.jdbc.Driver");

			// Create a connection
			conn = DriverManager.getConnection(DB_URL,USER,PASS);

			//Get all the drugs from drugs table
			stmt = conn.createStatement();
			String sql;
			sql = "SELECT Drugs.ID AS drugID, Drugs.Name As drugName, Drugs.Indication As drugIndi, Drugs.Side_Effects As drugSide,"
					+ " Adult_Administration.ID AS aIdAd, Adult_Administration.Oral AS aOralAd, Adult_Administration.IV AS aIvAd,"
					+ " Adult_Administration.Inhaled AS aInhaledAd, Adult_Administration.IM AS aImAd, Adult_Administration.PR AS aPrAd,"
					+ " Adult_Administration.SC AS aScAd,"
					+ " Adult_Dose.ID AS aIdDose, Adult_Dose.Oral AS aOralDose, Adult_Dose.IV AS aIvDose,"
					+ " Adult_Dose.Inhaled AS aInhaledDose, Adult_Dose.IM AS aImDose, Adult_Dose.PR AS aPrDose,"
					+ " Adult_Dose.SC AS aScDose,"
					+ " Paediatric_Administration.ID AS pIdAd, Paediatric_Administration.Oral AS pOralAd, Paediatric_Administration.IV AS pIvAd,"
					+ " Paediatric_Administration.Inhaled AS pInhaledAd, Paediatric_Administration.IM AS pImAd, Paediatric_Administration.PR AS pPrAd,"
					+ " Paediatric_Administration.SC AS pScAd,"
					+ " Paediatric_Dose.ID AS pIdDose, Paediatric_Dose.Oral AS pOralDose, Paediatric_Dose.IV AS pIvDose,"
					+ " Paediatric_Dose.Inhaled AS pInhaledDose, Paediatric_Dose.IM AS pImDose, Paediatric_Dose.PR AS pPrDose,"
					+ " Paediatric_Dose.SC AS pScDose,"
					+ " Interactions.ID AS interId, Interactions.Interacting_Drug AS interDrugName, Interactions.Effect AS interDescription,"
					+ " Brand_Names.ID AS brandId, Brand_Names.Brand_Name AS brandName"
					+ " FROM Drugs INNER JOIN Adult_Administration ON Drugs.ID = Adult_Administration.Drugs_ID"
					+ " INNER JOIN Adult_Dose ON Adult_Dose.Drugs_ID = Drugs.ID"
					+ " INNER JOIN Paediatric_Administration ON Paediatric_Administration.Drugs_ID = Drugs.ID"
					+ " INNER JOIN Paediatric_Dose ON Paediatric_Dose.Drugs_ID = Drugs.ID"
					+ " INNER JOIN Interactions ON Interactions.Drugs_ID = Drugs.ID"
					+ " INNER JOIN Brand_Names ON Brand_Names.Drugs_ID = Drugs.ID";
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
				
				//Retrieve by column name
				String name = rs.getString("drugName");
				String adultOral = rs.getString("aOralAd");
				System.out.println(name);
				System.out.println(adultOral);

			}
			//Close connections
			rs.close();
			stmt.close();
			conn.close();
		}catch(SQLException se){
			se.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			//Close connections if no connection was found
			try{
				if(stmt!=null)
					stmt.close();
			}catch(SQLException se2){
			}
			try{
				if(conn!=null)
					conn.close();
			}catch(SQLException se){
				se.printStackTrace();
			}
		}
	}
}


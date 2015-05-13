# Project

##Antibiotic Mobile App
Needed to run : A Mac running OS X Yosemite or better.
                XCode 6 or better.

To test and run the mobile application you need to have at least XCode 6 installed. Once this repository is downloaded unzip
the folder and open the CFMedApp1.xcodeproj folder. Some Macs already know this is a project file automatically so this folder will 
be shown. There should be a file called "project.pbxproj" double click this file and the XCode project will run. Once running press
play and have fun testing the mobile application. 

THE MOBILE APP DOES NOT HAVE TO BE CONNECTED TO THE SERVER TO TEST IT IS ALREADY LOADED WITH DATA.

##Server and Database
Needed to run : Tomcat 8.0 available from http://tomcat.apache.org/
                MySQL Workbench http://www.mysql.com/products/workbench/
                
                
Once MySQL Workbench is installed run the application. Click the + sign in the top left and create a new instance. Create any name for your connection for the 
purpose of this manual I will use the name "Project". Leave the hostname as 127.0.0.1 and the port as 3306. The important bit is to change the Username to "admin". 
Also click the button to add a password on the version I am using it is called "Store in Vault..." add the Password "#S3cret999" the admin and password have to be
the same as typed in here to connect to the database. Press Ok.
Double click the new connection and it should run. You should now be on a new tab called "Project" or what ever you called the connection at the top.

Now you need to add the database schema. Click File->Open Model... and go to the "Database" directory in the project-master folder. Open the file "Database for project.mwb".
Once opened click Database (on the same bar as File and Edit etc). Select Forward Engineer..... Select the newly created connection "Project" from the drop down at the top 
labeled "Stored Connetion". Then once the connection is selected just keep pressing next until the wizard is fininshed.

Now you have created a schema for the new connection go to the icon at the top left under File with a SQL page and a folder on it. Hovering over this icon will show
"Open a SQL script file in a new query tab". Click this icon and go to the current export directory in the project-master folder. Open file "DatabaseExport.sql". You now see
a whole bunch of SQL in a tab new query tab. On the left of the screen there is a navigator ( if this not seen sure you are in the "Project" main tab at the top of the window)
next to the word SCHEMAS click the button with two arrows in a rotating symbol like a refresh button. The Schema list should now include "cfmeddb". MAKE SURE TO DOUBLE CLICK THIS SCHEMA
it will go bold if you have double clicked it and show the tables. Now "cfmeddb" is bold click the Lightning bolt on the query window where all the SQL is displayed. It should be the 
single lightning bold WITHOUT the cursor. This will load the data into the newly created database.

Now to run the web server follow the installation instructions of the Tomcat readme. Once configured go to the current export folder in the 
repository. You will need to copy the "tomcat-users.xml" file from the current export folder in the project-master directory, into the conf folder (inside the directory where
you installed Tomcat). Overwrite the existing file in the conf folder. Once "tomcat-users.xml" file is in the conf folder open the file in a suitable 
text editor and change the passwords to anything you want. They will be all set the the default "tomcat" and need to be changed to be secure. 

The next step is to copy the folder "templates" from the current export folder in the repository to the bin folder in the tomcat directory (where
you installed tomcat). These templates are the HTML pages for the adminstration interface. Once this is completed locate the bin directory from the terminal
and run the startup file "startup.bat" for Windows "startup.sh" for Mac.

Now go to your broswer of choice and type "localhost:8080". In the section "Managing Tomcat" click the "manager webapp" hyperlink. This requires the user name 
"CFAdmin" and the password you set for it in the "tomcat-users.xml" (the default is "tomcat"). Once you have logged in find the section "WAR file to deploy" press the button
"Choose File" and got to the project-master->current export folder. Select "cfprescriber.war". Press the button "Deploy". Now it is deployed go to the URL "localhost:8080/cfprescriber/rest/secure/drugs".
Another login will pop up just use the same "CFAdmin" and the password you set as was done earlier to access the tomcat manager. If you can see a list of drugs you have set everything up correctly.

## Getting the mobile app to connect to the server. 

To get the mobile app to connect to the server all you have to do is open the project the same as before in XCode.
If you are running the server on the MAC itself nothing has to be done it will connect to the server automatically. However if you are running the server on a different computer on the same network.
Go to the file AppDelegate.m find the line that sets the NSString "*url" it is commented to help you find. Change the name localhost to the ip address of the computer that is running the server. Click save and run
it will now be connected to the server and will retrieve the data on the database.





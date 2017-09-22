# Installing Office 365 ProPlus in Windows Server 2016

## Instruction

1. [Download the Office 2016 Deployment Tool](https://support.office.com/en-us/article/Overview-of-the-Office-2016-Deployment-Tool-bb5b62d9-1168-47e9-9d54-15a958acfcca?ui=en-US&rs=en-US&ad=US)

2. Unzip/install the downloaded file, it should create two files which are setup.exe and configuration.xml.

3. Edit the configuration.xml. [options] (https://support.office.com/en-us/article/Configuration-options-for-the-Office-2016-Deployment-Tool-d3879f0d-766c-469c-9440-0a9a2a905ca8)

	```
	<!-- Office 365 client configuration file sample. To be used for Office 365 ProPlus 2016 apps, 
	     Office 365 Business 2016 apps, Project Pro for Office 365 and Visio Pro for Office 365. 
	
	     For detailed information regarding configuration options visit: http://aka.ms/ODT. 
	     To use the configuration file be sure to remove the comments
	
	     For Office 365 client apps (verion 2013) you will need to use the 2013 version of the 
	     Office Deployment Tool which can be downloaded from http://aka.ms/ODT2013
	
	     The following sample allows you to download and install Office 365 ProPlus 2016 apps 
	     and Visio Pro for Office 365 directly from the Office CDN using the Current Channel
	     settings  -->
	
	
	
	<Configuration>
	  <Add OfficeClientEdition="32" Channel="Current">
	    <Product ID="O365ProPlusRetail">
	      <Language ID="en-us" />
	    </Product>
	    <Product ID="VisioProRetail">
	      <Language ID="en-us" />
	    </Product>
	  </Add>
	
	  <!--  <Updates Enabled="TRUE" Channel="Current" /> -->
	
	  <!--  <Display Level="None" AcceptEULA="TRUE" />  -->
	
	  <!--  <Property Name="AUTOACTIVATE" Value="1" />  -->
	
	  <Property Name="SharedComputerLicensing" Value="1" />
	
	</Configuration>
	```

4. Open command promt
5. Execute following commands
	- `setup.exe /download configuration.xml`
	- `setup.exe /configure configuration.xml`
	- `setup.exe /packer configuration.xml` (optional)

6. Restart the windows server.

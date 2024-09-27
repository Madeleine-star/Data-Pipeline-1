<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method='text' indent='yes'/>
	<!--Specify the type of file for the output, we set it has text because the json isn't allowing here and the default is xml-->
	<!--
This XSLT document aim to transformed the xml data into a JSON file. 
In the JSON file we will only have the data about the customer of the compagny.
-->
	<xsl:template match="/">
		<!--We declared in first match="/" because we want the template is apply to all the xml hierarchie because the / symbolize the root element-->
{<!--the JSON file need { } to declared the object which is the main structure of the JSON-->
"Customer": [<!--This allow us to create an array inside the main JSON object-->
		<xsl:apply-templates select="Root/Customers/Customer"/>
]
}
	</xsl:template>
	<xsl:template match="Root/Customers/Customer">
		<!--Here we declare a second object which will contains the value of the array, for each customer a new object is created-->
{"Customer_Name":"<xsl:value-of select="CustomerName"/>",
"Customer_Address":"<xsl:value-of select="CustomerAddress[1]"/>",
"Customer_City":"<xsl:value-of select="CustomerAddress[2]"/>",
"Customer_PostalCode":"<xsl:value-of select="CustomerAddress[3]"/>",
"Customer_PhoneNumber":"<xsl:value-of select="Phone_number"/>",
"Customer_email":"<xsl:value-of select="Cust_email"/>"}
		<xsl:if test="position() != last()">,</xsl:if>
		<!--Because in a JSON file the last element must don't have a comma after the curlybracket we used the if condition to test the iteration position and 
if it is the last the parser don't put the comma, if not it will put a comma-->
	</xsl:template>
</xsl:stylesheet>

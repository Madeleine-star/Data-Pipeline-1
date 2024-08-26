<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method='text' indent='yes'/>
	<!--
This XSLT document aim to transformed the xml data into a JSON file. 
In the JSON file we will only have the data about the customer of the compagny.
-->
	<xsl:template match="/">
{
"Customer": [
<xsl:apply-templates select="Root/Customers/Customer"/>
]
}
	</xsl:template>
	<xsl:template match="Root/Customers/Customer">
{"Customer_Name":"<xsl:value-of select="CustomerName"/>",
"Customer_Address":"<xsl:value-of select="CustomerAddress[1]"/>",
"Customer_City":"<xsl:value-of select="CustomerAddress[2]"/>",
"Customer_PostalCode":"<xsl:value-of select="CustomerAddress[3]"/>",
"Customer_PhoneNumber":"<xsl:value-of select="Phone_number"/>",
"Customer_email":"<xsl:value-of select="Cust_email"/>"}
<xsl:if test="position() != last()">,</xsl:if>
	</xsl:template>
	
</xsl:stylesheet>

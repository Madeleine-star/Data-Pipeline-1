<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method='html' indent='yes'/>
	<xsl:template match="/">
		<!--definition of the compagny section
	-->
	<Div Align="RIGHT">
		<h3>
			<strong><xsl:value-of select="Root/Compagny_infos/name"/></strong>
		</h3>
		<h4>
			<xsl:text>Address: </xsl:text><xsl:value-of select="Root/Compagny_infos/Compagny_address"/>
		</h4>
		<h4>
			<xsl:text>Phone: </xsl:text><xsl:value-of select="Root/Compagny_infos/compagny_phone"/>
		</h4>
		<!--To display the eamil address as a hyperlink
	the xsl:variable allow to display the designed text inside the curly bracket 
	and after the dollard sign
	these lines of code will allow to have the email address of the compagny by clicking 
	on the contact text-->
		<xsl:variable name="hyperlink" select="Root/Compagny_infos/compagny_email"/>
		<a href="mailto:{$hyperlink}">
			<xsl:text>Compagny contact</xsl:text>
		</a>
				</Div>
		<!--definition of the customer section
	-->
	
		<h3>
			<strong><xsl:text>Customer details</xsl:text></strong> 
		</h3>
		<blockquote>
		<h4>
			<xsl:text>Name: </xsl:text><xsl:value-of select="Root/Customers/Customer[3]/CustomerName"/>
		</h4>
		<h4>
			<xsl:text>Phone: </xsl:text><xsl:value-of select="Root/Customers/Customer[3]/Phone_number"/>
		</h4>
		<!--Display the client email as an hyperlink like for the compagny name-->
		<xsl:variable name="Custemail" select="Root/Customers/Customer[3]/Cust_email"/>
		<a href="mailto:{$Custemail}">
			<xsl:text>Customer contact</xsl:text>
		</a>
		</blockquote>
		
		<h3><strong><xsl:text>Delivery informations</xsl:text></strong></h3>
		<blockquote>
		<h4>
			<xsl:text>Delivery address: </xsl:text>
		</h4>
		<blockquote>
		<h4>
			<xsl:text>Street: </xsl:text>
			<xsl:value-of select="Root/Customers/Customer[3]/CustomerAddress[1]"/>
		</h4>
		<h4>
			<xsl:text>City: </xsl:text>
			<xsl:value-of select="Root/Customers/Customer[3]/CustomerAddress[2]"/>
		</h4>
		<h4>
			<xsl:text>State and Postal code: </xsl:text>
			<xsl:value-of select="Root/Customers/Customer[3]/CustomerAddress[3]"/>
		</h4>
		</blockquote>
		<h4>
			<xsl:text>Delivery date: </xsl:text>
			<xsl:value-of select="Root/Invoices/invoice/delivery_date"/>
		</h4>
		</blockquote>
		
		
		
		<Div Align="CENTER">
		<h2>
			<strong><xsl:text>Invoice details</xsl:text></strong>
		</h2>
		<table border="1" cellpadding="3">
		<tbody>
		<tr>
		<th style="font-size:17pt">Recipes</th>
		<th style="font-size:17pt">Price</th>
		</tr>
		<xsl:for-each select="Root/Invoices/invoice[@invoiceID='AW01']/rec_list">
		<tr>
				
					<td style="font-size:15pt">
						<xsl:value-of select="recipe"/>
					</td>
					<td style="font-size:15pt">
						<xsl:value-of select="recipe_price"/> <xsl:text> Eur</xsl:text>
					</td>

			</tr>
							</xsl:for-each>
			<tr>
			<tr/>
				<td style="font-size:15pt">
					<strong> <xsl:text>Total invoice price: </xsl:text> </strong> 
				</td>
				<td style="font-size:15pt">
					<xsl:value-of select="sum(Root/Invoices/invoice[@invoiceID='AW01']/rec_list/recipe_price)"/><xsl:text> Eur</xsl:text>
				</td>
			</tr>
		
		
		</tbody>
			
		</table>
		</Div>
	</xsl:template>
</xsl:stylesheet>
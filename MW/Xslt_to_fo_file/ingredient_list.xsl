<?xml version="1.0"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<!--This XSLT file aim to extract all the ingredient with their name, season of growth and 
their price from the database recipe_box_database. In the new xml document the ingredient
will be sorted by alphabetic order
-->
	<xsl:output method="xml" indent="yes"/>	<!--the output will be an xml document for use it again in other transformation-->
	<xsl:template match="/">
	<Ingredient>
	<!--To extract all the element from ingredients we use a for-each-->
	<xsl:for-each select="Root/ingredients/ingredient">
			<xsl:sort select="name" order="ascending"/><!--to sort the data by ascending order meaning alphabetic here-->
			<ingredient>
			<xsl:element name="name">
				<xsl:value-of select="name"/>
			</xsl:element>
			<xsl:element name="season">
				<xsl:value-of select="season"/>
			</xsl:element>
						<xsl:element name="Budget">
				<xsl:value-of select="Budget"/>
			</xsl:element>
			</ingredient>
		</xsl:for-each>
	</Ingredient>
	</xsl:template>
</xsl:stylesheet>

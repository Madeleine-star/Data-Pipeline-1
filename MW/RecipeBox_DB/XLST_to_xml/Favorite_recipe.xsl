<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method='xml' indent='yes'/>
	<!-- 
This scenario aim to create an xml file with all the recipe in the database with a rating equal or 
greater than 4. for the recipe we will return the name, the category, the level, the total time (
meaning the sum of the cooking and preparation time) as well as the budget for it. 
-->
	<xsl:template match="/">
		<xsl:text>
</xsl:text>
		<xsl:text>Favorite Recipes</xsl:text>
		<xsl:text>
</xsl:text>
		<xsl:for-each select="/Root/recipes/recipe">
			<xsl:if test="rating &gt; 3">
				<!--Return all the recipe with a rating superior to 3-->
				<xsl:element name="Recipe">
					<xsl:value-of select="name"/>
				</xsl:element>
				<xsl:element name="Note">
					<xsl:value-of select="rating[1]"/>
					<xsl:text> </xsl:text>
					<xsl:value-of select="rating[2]"/>
				</xsl:element>
				<xsl:element name="Category">
					<xsl:value-of select="RefCategorie"/>
				</xsl:element>
				<xsl:element name="Level">
					<xsl:value-of select="level"/>
				</xsl:element>
				<xsl:element name="Total_time">
				<!--In first the value of cooking_time and preparation time are 
				store has a variable to do computation then-->
					<xsl:variable name='cook_time'>
						<xsl:value-of select="cooking_time"/>
					</xsl:variable>
					<xsl:variable name="prep_time">
						<xsl:value-of select="preparation_time"/>
					</xsl:variable>
					<!--by converting the variable in number that allow us to compute
					the sum of them and return the total time for the recipe-->
					<xsl:value-of select="number($cook_time)+number($prep_time)"/>
					<xsl:text> </xsl:text>
					<xsl:value-of select="cooking_time/@unit"/>
				</xsl:element>
				<xsl:element name="Budget">
					<xsl:value-of select='Budget'/><xsl:text> </xsl:text>
					<xsl:value-of select="Budget/@devise"/>
				</xsl:element>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
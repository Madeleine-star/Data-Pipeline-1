<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
<!--xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"-->
	<xsl:output method='xml' indent='yes'/>
	<!--Specify the type of file for the XSLT output, the indent="yes" allow to put indentation in the xml result file-->
	<!-- 
This scenario aim to create an xml file with all the recipe in the database with a rating equal or 
greater than 4. for the recipe we will return the name, the category, the level, the total time (
meaning the sum of the cooking and preparation time) as well as the budget for it. A xsd file to validate it is create: Favorite_recipe.xsd
-->
	<xsl:template match="/">
		<Root xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="scenario_6schema.xsd"><!--This declared an element which gave to the xml file a schema file which validate it-->
			<xsl:for-each select="/Root/recipes/recipe">
				<!--This declared a loop to get the elements recipe from the recipes part of the database-->
			    <xsl:element name='Favorite'><!--This wrap each recipe which match the condition inside an element named Favorite-->
				<xsl:if test="rating &gt; 3">
					<!--This put a condition for select the recipe in the database for returning only the recipe with a rating higher than 3-->
					<xsl:element name="Recipe">
						<xsl:value-of select="name"/>
					</xsl:element>
					<xsl:element name="Note">
						<xsl:value-of select="rating[1]"/>
						<!--Allow to select the first rating node in the recipe of the loop iteration, this is specified by the number inside [ ] after the node name-->
						<xsl:text> </xsl:text>
						<!--Ensure to keep a white space between the two elements-->
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
						<xsl:value-of select='Budget'/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="Budget/@devise"/>
						<!--The /@ specified we want to return the value of the attribute attached at the node-->
					</xsl:element>
				</xsl:if>
				</xsl:element>
			</xsl:for-each>
	    </Root>
	</xsl:template>
</xsl:stylesheet>
<?xml version="1.0"?>
<!--This XSLT file aim to create a pdf file through XSL-fo transformation which contain a table 
with all the ingredients present in a recipes with the ingredient name and the quantity needed
Here the first step for converting the recipe_box_database.xml into a recipe_box_database.fo.

NEED TO BE DEBUG!!!
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" version="1.0">
	<xsl:template match="/">
		<!--Here the block to declare an xsl-fo document
	we declare the "fo" namespace prefix to correspond to the xsl-fo namespace
	All the attributes here allow to customize how the table and block of text inside it will look like-->
		<!--the fo:root delacre the document node of an xsl-formatted document-->
		<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
			<!--the fo:layout-master-set specifies a wrapper for all the masters used in the document-->
			<fo:layout-master-set>
				<!--this block specifies the geometry of a page, which may divided into up to five region
				the margins attribute sets margin size in the document
				master-name sets or selects a master-->
				<fo:simple-page-master master-name="page" page-height="400mm" page-width="300mm" magin-top="10mm" margin-bottom="10mm" margin-left="20mm" margin-right="20mm">
					<fo:region-body margin-top="0mm" margin-bottom="10mm" margin-left="0mm" margin-right="0mm"/>
					<fo:region-after extent='10mm'/>
				</fo:simple-page-master>
			</fo:layout-master-set>
			<!--fo:flow object allow to handles the text flow that is displayed in a document-->
			<fo:flow flow-name="xsl-region-body">
				<!--set the flow's name-->
				<!--this block allow to create a table and encloses elements such as fo:table-column and fo:table-body-->
				<fo:table>
					<fo:table-column column-width="30mm"/>
					<!--the column-width attribute specifies the width of an object such as an external graphic-->
					<!--Specifies characteristics for table cells that have the same column-->
					<fo:table-column column-width="30mm"/>
					<fo:table-column column-width="30mm"/>
					<fo:table-column column-width="30mm"/>
					<fo:table-column column-width="30mm"/>
					<fo:table-column column-width="30mm"/>
					<fo:table-body>
						<fo:table-row>
							<!--connect table cells into rows and contain the fo:table-cell-->
							<!--those blocks will places data in table cell-->
							<fo:table-cell border-width="0.5mm">
								<!--border-width is a shorthand property for setting all border size-->
								<!--the font-size and -weight sets respectively the font size and weight of a text block-->
								<fo:block font-size="18pt" font-weight="bold">Name</fo:block>
							</fo:table-cell>
							<fo:table-cell border-width="0.5mm">
								<fo:block font-size="18pt" font-weight="bold">Season</fo:block>
							</fo:table-cell>
							<fo:table-cell border-width="0.5mm">
								<fo:block font-size="18pt" font-weight="bold">Price (Eur)</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<xsl:apply-templates/>
						<!--to apply the templates we want inside the table-->
					</fo:table-body>
				</fo:table>
			</fo:flow>
		</fo:root>
	</xsl:template>
	<xsl:template match="/Ingredient/ingredient">
		<fo:table-row>
			<!--connects table cells into rows. Contain the fo:table-cell element-->
			<xsl:for-each select='/Ingredient/ingredient'>
						<xsl:apply-templates/>
			</xsl:for-each>
		</fo:table-row>
	</xsl:template>
	<xsl:template match="/Ingredient/ingredient/name">
		<!--place data in table cell-->
		<!--<xsl:for-each select="/Ingredient/ingredient">-->
			<fo:table-cell border-width="0.5mm">
				<fo:block font-size="18pt">
					<xsl:value-of select="name"/>
				</fo:block>
			</fo:table-cell>
		<!--</xsl:for-each>-->
	</xsl:template>
	<xsl:template match="/Ingredient/ingredient/season">
		<!--<xsl:for-each select="/Ingredient/ingredient">-->
			<fo:table-cell border-width="0.5mm">
				<fo:block font-size="18pt">
					<xsl:value-of select="season"/>
				</fo:block>
			</fo:table-cell>
		<!--</xsl:for-each>-->
	</xsl:template>
	<xsl:template match="/Ingredient/ingredient/Budget">
		<!--<xsl:for-each select="/Ingredient/ingredient">-->
			<fo:table-cell border-width="0.5mm">
				<fo:block font-size="18pt">
					<xsl:value-of select="Budget"/>
				</fo:block>
			</fo:table-cell>
		<!--</xsl:for-each>-->
	</xsl:template>
</xsl:stylesheet>
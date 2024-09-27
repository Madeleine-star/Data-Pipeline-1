<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" version="1.0">
	<!--This xslt style sheet use the ingredient_list.xml file create by the ingredient_list.xslt
to create an XML-FO document allowing to transform an xml document in a pdf file. 
Here the pdf file will display the list of all the ingredients with their season of growth and 
their price in euro during that season. 
-->
	<xsl:template match="/">
		<!--Here the block to declare an xsl-fo document
	we declare the "fo" namespace prefix to correspond to the xsl-fo namespace
	All the attributes here allow to customize how the table and block of text inside it will look like
		the fo:root delacre the document node of an xsl-formatted document-->
		<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
			<!--the fo:layout-master-set specifies a wrapper for all the masters used in the document-->
			<fo:layout-master-set>
				<!--this block specifies the geometry of a page, which may divided into up to five region
				the margins attribute sets margin size in the document
				master-name sets or selects a master-->
				<fo:simple-page-master master-name="page" page-height="400mm" page-width="300mm" margin-top="10mm" margin-bottom="10mm" margin-left="20mm" margin-right="20mm">
					<fo:region-body margin-top="0mm" margin-bottom="10mm" margin-left="0mm" margin-right="0mm"/>
					<fo:region-after extent='10mm'/>
				</fo:simple-page-master>
			</fo:layout-master-set>
			<fo:page-sequence master-reference="page">
				<fo:flow flow-name="xsl-region-body">
					<!--set the flow's name-->
					<fo:block text-align="center" font-weight="bold" font-size="36pt" line-height="48pt" font-family="Times" color="blue">
				RecBox's ingredients list
				</fo:block>
					<xsl:apply-templates/>
				</fo:flow>
			</fo:page-sequence>
			<!--fo:flow object allow to handles the text flow that is displayed in a document-->
		</fo:root>
	</xsl:template>
	<xsl:template match="/Ingredient">
		<fo:block font-weight="bold" font-size="28pt" line-height="48pt" font-family="Times" font-style="italic">
		Ingredient List:
		<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	<xsl:template match="/Ingredient/ingredient/name">

			<fo:block font-size="24pt" line-height="32pt" font-family="Times">
				<fo:inline text-decoration="underline">
				Ingredient name</fo:inline>: <xsl:apply-templates/>

		</fo:block>
	</xsl:template>
	<xsl:template match="/Ingredient/ingredient/season">
			<fo:block start-indent="40pt">
		<fo:block font-size="20pt" line-height="32pt" font-family="Times">
			<fo:inline text-decoration="underline">
				Growing season</fo:inline>: <xsl:apply-templates/>
		</fo:block>
					</fo:block>
	</xsl:template>
	<xsl:template match="/Ingredient/ingredient/Budget">
	<fo:block start-indent="40pt">
			<fo:block font-size="20pt" line-height="32pt" font-family="Times">
			<fo:inline text-decoration="underline">
				Price in season</fo:inline>: <xsl:apply-templates/> Eur
				</fo:block>
	</fo:block>

	</xsl:template>
</xsl:stylesheet>
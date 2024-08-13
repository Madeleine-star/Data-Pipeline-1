<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version='2.0' xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
	<xsl:output method='html' encoding='UTF-8'/>
	<xsl:output method='html' encoding='UTF-8' name='html'/>
	<xsl:template match='/'>
		<html>
			<body>
				<h3>Menus</h3>
				<ul>
					<xsl:for-each select='Root/menus/menu'>
						<li>
							<a href='{name}.htm'>
								<xsl:value-of select='/name'/>
							</a>
						</li>
					</xsl:for-each>
				</ul>
				<xsl:apply-templates select='Root/menus/menu'/>
			</body>
		</html>
	</xsl:template>
	<xsl:template match='menu'>
		<xsl:result-document format='html' encoding='UTF-8' href='{name}.htm'>
			<html>
				<body>
				<h4>
						<xsl:value-of select='/name'/>
					</h4>
					<h4>
						<xsl:text>Recipe list:</xsl:text>
						<xsl:value-of select='./recipelist'/>
					</h4>
					<h4>
						<xsl:text>Menu price:</xsl:text>
						<xsl:value-of select='./Budget'/>
						<xsl:text> </xsl:text>
						<xsl:value-of select='./Budget/@devise'/>
					</h4>
					<h4>
						<xsl:text>Rating:</xsl:text>
						<xsl:value-of select='./rating[1]'/>
						<xsl:text> </xsl:text>
						<xsl:value-of select='./rating[2]'/>
					</h4>
				</body>
			</html>
		</xsl:result-document>
	</xsl:template>
</xsl:stylesheet>

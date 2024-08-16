<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  
    <xsl:output method="html" indent="yes" />

    <!-- Template for the root element -->
    <xsl:template match="/Root">
        <html>
            <body>
                <!-- Display Company Information -->
                <h1>Company Information</h1>
                <p><strong>Name:</strong> <xsl:value-of select="Compagny_infos/name" /></p>
                <p><strong>Address:</strong> <xsl:value-of select="Compagny_infos/Compagny_address" /></p>
                <p><strong>Phone:</strong> <xsl:value-of select="Compagny_infos/compagny_phone" /></p>
                <p><strong>Email:</strong> <xsl:value-of select="Compagny_infos/compagny_email" /></p>

                <!-- Display Menus -->
                <h1>Available Menus</h1>
                <xsl:for-each select="menus/menu">
                    <h2><xsl:value-of select="name" /></h2>
                    <p><strong>Number of Recipes:</strong> <xsl:value-of select="number_recipe" /></p>
                    <p><strong>Recipes:</strong> <xsl:value-of select="recipelist" /></p>
                    <p><strong>Budget:</strong> <xsl:value-of select="concat(Budget, ' ', Budget/@devise)" /></p>
                    <p><strong>Rating:</strong> <xsl:value-of select="concat(rating[1], ' ', rating[2])" /></p>
                    <p><strong>Description:</strong> <xsl:value-of select="Description" /></p>
                    <hr/>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
  
</xsl:stylesheet>

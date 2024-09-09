<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>Menu Plans</title>
            </head>
            <body>
                <h1>Menu Plans</h1>
                <xsl:for-each select="menuPlans/menuPlan">
                    <h2>Menu Plan</h2>
                    <p><strong>Total Budget:</strong> <xsl:value-of select="totalBudget"/> <xsl:value-of select="totalBudget/@devise"/></p>
                    <table border="1">
                        <tr>
                            <th>Recipe Name</th>
                            <th>Type</th>
                            <th>Budget</th>
                        </tr>
                        <xsl:for-each select="recipes/recipe">
                            <tr>
                                <td><xsl:value-of select="name"/></td>
                                <td><xsl:value-of select="type"/></td>
                                <td><xsl:value-of select="budget"/> <xsl:value-of select="budget/@devise"/></td>
                            </tr>
                        </xsl:for-each>
                    </table>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>

<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="1.0">

    <xsl:template match="/">
        <html>
            <body>
                <h1>Recipes</h1>
                <table border="1">
                    <tr>
                        <th>Name</th>
                        <th>Category</th>
                        <th>Budget</th>
                        <th>Cooking Time</th>
                        <th>Preparation Time</th>
                        <th>Level</th>
                        <th>Number of Servings</th>
                    </tr>
                    <xsl:for-each select="recipes/recipe">
                        <tr>
                            <td><xsl:value-of select="name"/></td>
                            <td><xsl:value-of select="category"/></td>
                            <td><xsl:value-of select="budget"/></td>
                            <td><xsl:value-of select="cooking_time"/></td>
                            <td><xsl:value-of select="preparation_time"/></td>
                            <td><xsl:value-of select="level"/></td>
                            <td><xsl:value-of select="number_serving"/></td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>

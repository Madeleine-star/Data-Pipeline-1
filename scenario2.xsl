<?xml version="1.0" encoding="UTF-8"?>
<!-- XSLT stylesheet declaration with namespace and version -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <!-- Define the output method as HTML, with UTF-8 encoding and indented formatting -->
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>

    <!-- Root template that matches the root node of the XML document -->
    <xsl:template match="/">
        <html>
        <head>
            <!-- Title of the generated HTML page -->
            <title>Menu Plans</title>
        </head>
        <body>
            <!-- Main heading for the HTML page -->
            <h1>Menu Plans</h1>
             
            <!-- Section for recipes that cost less than 10 euros -->
            <h2>Less than 10 euro</h2>
            <table border="1">
                <tr>
                    <!-- Table headers: Recipe Name, Type, and Budget -->
                    <th>Recipe Name</th>
                    <th>Type</th>
                    <th>Budget</th>
                </tr>
                <!-- Iterate over recipes with a budget less than 10 euros -->
                <xsl:for-each select="Root/recipes/recipe[Budget &lt; 10]">
                    <tr>
                        <!-- Output the name of the recipe -->
                        <td><xsl:value-of select="name"/></td>
                        <!-- Output the type of the recipe (e.g., starter, main course) -->
                        <td><xsl:value-of select="type"/></td>
                        <!-- Output the budget of the recipe, followed by the text "euro" -->
                        <td><xsl:value-of select="Budget"/> euro</td>
                    </tr>
                </xsl:for-each>
            </table>
             
            <!-- Section for recipes that cost between 10 and 40 euros -->
            <h2>Between 10 euro and 40 euro</h2>
            <table border="1">
                <tr>
                    <!-- Table headers for this section -->
                    <th>Recipe Name</th>
                    <th>Type</th>
                    <th>Budget</th>
                </tr>
                <!-- Iterate over recipes with a budget between 10 and 40 euros -->
                <xsl:for-each select="Root/recipes/recipe[Budget &gt;= 10 and Budget &lt;= 40]">
                    <tr>
                        <!-- Output the name of the recipe -->
                        <td><xsl:value-of select="name"/></td>
                        <!-- Output the type of the recipe -->
                        <td><xsl:value-of select="type"/></td>
                        <!-- Output the budget of the recipe, followed by "euro" -->
                        <td><xsl:value-of select="Budget"/> euro</td>
                    </tr>
                </xsl:for-each>
            </table>
             
            <!-- Section for recipes that cost more than 50 euros -->
            <h2>More than 50 euro</h2>
            <table border="1">
                <tr>
                    <!-- Table headers for this section -->
                    <th>Recipe Name</th>
                    <th>Type</th>
                    <th>Budget</th>
                </tr>
                <!-- Iterate over recipes with a budget greater than 50 euros -->
                <xsl:for-each select="Root/recipes/recipe[Budget &gt; 50]">
                    <tr>
                        <!-- Output the name of the recipe -->
                        <td><xsl:value-of select="name"/></td>
                        <!-- Output the type of the recipe -->
                        <td><xsl:value-of select="type"/></td>
                        <!-- Output the budget of the recipe, followed by "euro" -->
                        <td><xsl:value-of select="Budget"/> euro</td>
                    </tr>
                </xsl:for-each>
            </table>
             
        </body>
        </html>
    </xsl:template>
</xsl:stylesheet>

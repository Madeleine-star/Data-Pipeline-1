<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">  <!-- Define the XSL stylesheet and specify the XSLT version -->

    <xsl:output method="html" encoding="UTF-8" indent="yes"/>  <!-- Output settings: HTML format with UTF-8 encoding and indentation for readability -->

    <xsl:template match="/">   <!-- Template rule matching the root element of the XML document -->
        <html>
            <head>
                <title>Menu Plans</title>   <!-- Title of the generated HTML document -->
            </head>
            <body>
                <h1>Menu Plans</h1>   <!-- Main header of the HTML page -->

                <xsl:for-each select="menuPlans/menuPlan">   <!-- Loop through each menuPlan element inside the menuPlans root -->

                    <h2>Menu Plan</h2>   <!-- Subheader for each menu plan -->

                    <p><strong>Total Budget:</strong>   <!-- Display the label "Total Budget" -->
<xsl:value-of select="totalBudget"/> <!-- Output the value of the totalBudget element -->
<xsl:value-of select="totalBudget/@devise"/>   <!-- Output the currency attribute (devise) from totalBudget -->
                    </p>
                    <table border="1">   <!-- Create a table with borders to display recipe details -->
                        <tr>   <!-- Header row with columns for recipe name, type, and budget -->
                            <th>Recipe Name</th>
                            <th>Type</th>
                            <th>Budget</th>
                        </tr>
                        <xsl:for-each select="recipes/recipe">   <!-- Loop through each recipe element inside the current menuPlan -->
                            <tr>
                                <td><xsl:value-of select="name"/></td>   <!-- Output the name of the recipe -->
                                <td><xsl:value-of select="type"/></td>  <!-- Output the type of the recipe (Starter, Main Course, etc.) -->
                                <td><xsl:value-of select="budget"/>   <!-- Output the budget for the recipe -->
                                    <xsl:value-of select="budget/@devise"/></td>   <!-- Output the currency attribute (devise) for the budget -->
                            </tr>
                        </xsl:for-each>   <!-- End of loop for each recipe -->
                    </table>   <!-- End of the table for recipes in the current menu plan -->
                </xsl:for-each>  <!-- End of loop for each menu plan -->
            </body>
        </html>  <!-- End of the HTML structure -->
    </xsl:template>   <!-- End of the XSL template -->
</xsl:stylesheet>

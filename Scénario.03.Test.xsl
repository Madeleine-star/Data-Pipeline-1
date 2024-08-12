<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

   <!-- Base template to apply to the entire document -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Menu Plans</title>
                <style>
                    body { font-family: Arial, sans-serif; }
                    table { width: 100%; border-collapse: collapse; margin: 20px 0; }
                    th, td { border: 1px solid #ddd; padding: 8px; }
                    th { background-color: #f4f4f4; }
                    h1 { color: #333; }
                </style>
            </head>
            <body>
                <h1>Menu Plans</h1>
                <xsl:apply-templates select="menuPlans/menuPlan"/>
            </body>
        </html>
    </xsl:template>

    <!-- Template for each menu plan -->
    <xsl:template match="menuPlan">
        <h2>Menu Plan <xsl:value-of select="position()"/></h2>
        <p><strong>Total Budget:</strong> <xsl:value-of select="totalBudget"/> <xsl:value-of select="totalBudget/@currency"/></p>
        <table>
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Budget</th>
                    <th>Type</th>
                </tr>
            </thead>
            <tbody>
                <xsl:apply-templates select="recipes/recipe"/>
            </tbody>
        </table>
    </xsl:template>

    <!-- Template for each recipe --
    <xsl:template match="recipe">
        <tr>
            <td><xsl:value-of select="name"/></td>
            <td><xsl:value-of select="budget"/> <xsl:value-of select="budget/@currency"/></td>
            <td><xsl:value-of select="type"/></td>
        </tr>
    </xsl:template>

</xsl:stylesheet>

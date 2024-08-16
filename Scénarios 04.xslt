<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <!-- Formatted output in HTML -->
  <xsl:output method="html" indent="yes"/>

  <!-- Template for the root -->
  <xsl:template match="/Root">
    <html>
      <body>
        <h1>Recipe List by Category</h1>

        <!-- Loop through each unique category -->
        <xsl:for-each select="recipes/recipe[not(category=preceding-sibling::recipe/category)]">
          <h2><xsl:value-of select="category"/></h2>
          <ul>
            <!-- Loop to display all recipes in the same category -->
            <xsl:for-each select="//recipe[category=current()/category]">
              <li>
                <h3><xsl:value-of select="name"/></h3>
                <p><strong>Description:</strong> <xsl:value-of select="description"/></p>
              </li>
            </xsl:for-each>
          </ul>
        </xsl:for-each>

      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>

<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <!-- Formatted output in HTML -->
  <xsl:output method="html" indent="yes"/>

  <!-- Template for the root element -->
  <xsl:template match="/Root">
    <html>
      <body>
        <!-- Main heading for the HTML document -->
        <h1>Recipe List by Category</h1>

        <!-- Loop through each unique category -->
        <xsl:for-each select="recipes/recipe[not(category=preceding-sibling::recipe/category)]">
          <!-- Display the category as a subheading -->
          <h2><xsl:value-of select="category"/></h2>
          <ul>
            <!-- Loop through all recipes that match the current category -->
            <xsl:for-each select="//recipe[category=current()/category]">
              <li>
                <!-- Display the recipe name as a subheading -->
                <h3><xsl:value-of select="name"/></h3>
                <!-- Display the recipe description -->
                <p><strong>Description:</strong> <xsl:value-of select="description"/></p>
              </li>
            </xsl:for-each>
          </ul>
        </xsl:for-each>

      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>

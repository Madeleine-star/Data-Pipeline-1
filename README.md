#Premier Scénario proposé : 
#Ce scénario vise à extraire le nom de la recette et la liste des ingrédients à partir du fichier XML

<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">

  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <html>
      <body>
        <h1><xsl:value-of select="/BoeufBourguignonRecipes/Recipe/Name"/></h1>
        <h2>Ingredients:</h2>
        <ul>
          <xsl:for-each select="/BoeufBourguignonRecipes/Recipe/Ingredients/Ingredient">
            <li><xsl:value-of select="."/></li>
          </xsl:for-each>
        </ul>
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>

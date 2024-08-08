# Scénario02 :
#Afficher les étapes de préparation
#Ce scénario vise à extraire les étapes de préparation de la recette à partir du fichier XML.

<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">

  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <html>
      <body>
        <h1>Preparation Steps:</h1>
        <ol>
          <xsl:value-of select="/BoeufBourguignonRecipes/Recipe/PreparationSteps"/>
        </ol>
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>

<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <!-- Sortie formatée en HTML -->
  <xsl:output method="html" indent="yes"/>

  <!-- Modèle de transformation pour la racine -->
  <xsl:template match="/Root">
    <html>
      <body>
        <h1>Liste des recettes par catégorie</h1>

        <!-- Boucle pour chaque catégorie unique -->
        <xsl:for-each select="recipes/recipe[not(category=preceding-sibling::recipe/category)]">
          <h2><xsl:value-of select="category"/></h2>
          <ul>
            <!-- Boucle pour afficher toutes les recettes dans la même catégorie -->
            <xsl:for-each select="//recipe[category=current()/category]">
              <li>
                <h3><xsl:value-of select="name"/></h3>
                <p><strong>Description :</strong> <xsl:value-of select="description"/></p>
              </li>
            </xsl:for-each>
          </ul>
        </xsl:for-each>

      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>

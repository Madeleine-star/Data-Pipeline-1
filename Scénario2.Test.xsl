<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>
      <body>
        <h2>Recettes</h2>
        <table border="1">
          <tr>
            <th>Recette</th>
            <th>Catégorie</th>
            <th>Prix total (EUR)</th>
          </tr>
          <xsl:for-each select="recettes/recette">
            <tr>
              <td><xsl:value-of select="nom"/></td>
              <td><xsl:value-of select="categorie"/></td>
              <td><xsl:value-of select="prix_total"/></td>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>

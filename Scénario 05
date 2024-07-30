<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">

  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <html>
      <body>
        <xsl:for-each select="//Customer">
          <h1>Fiche de commande pour <xsl:value-of select="CustomerName"/></h1>
          <p>Adresse : <xsl:value-of select="CustomerAddress"/></p>
          <p>Téléphone : <xsl:value-of select="Phone_number"/></p>
          <p>Email : <xsl:value-of select="Cust_email"/></p>
          <h2>Articles commandés :</h2>
          <ul>
            <xsl:for-each select="recipelist">
              <li><xsl:value-of select="."/></li>
            </xsl:for-each>
          </ul>
          <h3>Total de la commande : <xsl:value-of select="sum(order_price)"/> dollars</h3>
        </xsl:for-each>
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>

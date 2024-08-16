<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">

  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <html>
      <body>
        <xsl:for-each select="//Customer">
          <h1>Order details for <xsl:value-of select="CustomerName"/></h1>
          <p>Address: 
            <xsl:for-each select="CustomerAddress">
              <xsl:value-of select="concat(., ' ')"/>
            </xsl:for-each>
          </p>
          <p>Phone number: <xsl:value-of select="Phone_number"/></p>
          <p>Email: <xsl:value-of select="Cust_email"/></p>
          <h2>Ordered items:</h2>
          <ul>
            <xsl:for-each select="recipelist/item">
              <li><xsl:value-of select="."/></li>
            </xsl:for-each>
          </ul>
          <h3>Order total: <xsl:value-of select="order_price"/> dollars</h3>
          <p>Delivery date: <xsl:value-of select="delivery_date"/></p>
        </xsl:for-each>
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>

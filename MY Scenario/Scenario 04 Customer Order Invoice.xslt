<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <!--
  Stylesheet Description: Transforms XML order data into HTML invoices.
  -->

  <xsl:output method="html" indent="yes"/>
  <!-- Output the transformed XML as HTML with indentation for readability -->

  <!-- Main template that matches the root of the XML document -->
  <xsl:template match="/">
    <html>
      <body>
        <!-- Loop through each <Customer> element to generate individual invoices -->
        <xsl:for-each select="//Customer">
          <!-- Display customer invoice ID -->
          <!-- @invoiceID refers to the attribute invoiceID of the current <Customer> element -->
          <h1>Invoice ID: <xsl:value-of select="@invoiceID"/></h1>

          <!-- Display customer name as a header -->
          <h2>Order details for <xsl:value-of select="CustomerName"/></h2>

          <!-- Display customer address -->
          <p>Address: <xsl:value-of select="CustomerAddress"/></p>

          <!-- Display customer phone number -->
          <p>Phone number: <xsl:value-of select="Phone_number"/></p>

          <!-- Display customer email -->
          <p>Email: <xsl:value-of select="Cust_email"/></p>

          <!-- Section header for ordered items -->
          <h3>Ordered items:</h3>
          <ul>
            <!-- Loop through each item in the recipelist and list them -->
            <xsl:for-each select="recipelist/item">
              <li><xsl:value-of select="."/></li>
            </xsl:for-each>
          </ul>

          <!-- Display the total price of the order -->
          <h3>Order total: <xsl:value-of select="order_price"/> dollars</h3>

          <!-- Display the delivery date -->
          <p>Delivery date: <xsl:value-of select="delivery_date"/></p>
        </xsl:for-each>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>

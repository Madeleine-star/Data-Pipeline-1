<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <!--
  Stylesheet Description: Transforms XML order data into HTML invoices.

  Purpose: This XSLT stylesheet converts XML data into well-formatted HTML documents for each customer. It generates an invoice with customer details, ordered items, total price, and delivery date.

  Formatting: The stylesheet assumes customer addresses are already in a single formatted string, so it directly outputs them. Email addresses are displayed as plain text; consider adding a hyperlink format if clickable links are needed.

  Functionality: The <xsl:for-each> loop processes each <Customer> element individually. Each customer’s details are presented in HTML format, with sections clearly separated for readability.
  -->

  <xsl:output method="html" indent="yes"/>

  <!-- Main template that matches the root of the XML document -->
  <xsl:template match="/">
    <html>
      <body>
        <!-- Loop through each <Customer> element to generate individual invoices -->
        <xsl:for-each select="//Customer">
          <!-- Display customer name as a header -->
          <h1>Order details for <xsl:value-of select="CustomerName"/></h1>

          <!-- Display customer address -->
          <p>Address: <xsl:value-of select="CustomerAddress"/></p>

          <!-- Display customer phone number -->
          <p>Phone number: <xsl:value-of select="Phone_number"/></p>

          <!-- Display customer email -->
          <p>Email: <xsl:value-of select="Cust_email"/></p>

          <!-- Section header for ordered items -->
          <h2>Ordered items:</h2>
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

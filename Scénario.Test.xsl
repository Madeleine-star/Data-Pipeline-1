
      <?xml version="1.0" encoding="UTF-8"?>
               <xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
       version="1.0">
  <xsl:output method="text" />

               <xsl:template match="/recipes/recipe">
               <xsl:value-of select="name" /> (Rating: 4)
    Category: <xsl:value-of select="RefCategorie" />
    Budget: <xsl:value-of select="Budget" /> <xsl:value-of select="Budget/@devise" />
    Cooking Time: <xsl:value-of select="cooking_time" /> <xsl:value-of select="cooking_time/@unit" />
    Preparation Time: <xsl:value-of select="preparation_time" /> <xsl:value-of select="preparation_time/@unit" />
    Level: <xsl:value-of select="level" />
    Servings: <xsl:value-of select="number_serving" />
 
       </xsl:template>

      </xsl:stylesheet>

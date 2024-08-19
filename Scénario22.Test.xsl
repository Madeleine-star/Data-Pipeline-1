<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <!-- Define the HTML structure -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Recipe Book</title>
                <style>
                    body { font-family: Arial, sans-serif; margin: 20px; }
                    h1 { text-align: center; }
                    .recipe { border: 1px solid #ddd; padding: 10px; margin-bottom: 20px; }
                    .recipe img { max-width: 100px; }
                    .recipe h2 { margin-top: 0; }
                    .ingredients, .steps { margin-left: 20px; }
                    .ingredients li, .steps li { margin-bottom: 5px; }
                </style>
            </head>
            <body>
                <h1>Recipe Book</h1>
                <xsl:for-each select="recipeBook/recipe">
                    <div class="recipe">
                        <h2><xsl:value-of select="name"/></h2>
                        <img src="{image/@src}" alt="{image/@alt}"/>
                        <p><strong>Category:</strong> <xsl:value-of select="RefCategorie"/></p>
                        <p><strong>Budget:</strong> <xsl:value-of select="budget/@devise"/></p>
                        <p><strong>Cooking Time:</strong> <xsl:value-of select="times/cookingTime"/> <xsl:value-of select="times/cookingTime/@unit"/></p>
                        <p><strong>Preparation Time:</strong> <xsl:value-of select="times/preparationTime"/> <xsl:value-of select="times/preparationTime/@unit"/></p>
                        <p><strong>Level:</strong> <xsl:value-of select="level"/></p>
                        <p><strong>Number of Servings:</strong> <xsl:value-of select="number_serving"/></p>
                        <p><strong>Rating:</strong> <xsl:value-of select="rating"/></p>
                        
                        <h3>Ingredients:</h3>
                        <ul class="ingredients">
                            <xsl:for-each select="ingredients/ingredient">
                                <li><xsl:value-of select="ingredient_name"/>: <xsl:value-of select="ingredient_quantity"/></li>
                            </xsl:for-each>
                        </ul>

                        <h3>Steps:</h3>
                        <ol class="steps">
                            <xsl:for-each select="steps/step">
                                <li><xsl:value-of select="."/></li>
                            </xsl:for-each>
                        </ol>
                    </div>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>


<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- Template for the root document -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Recipe Book</title>
                <style>
                    body { font-family: Arial, sans-serif; margin: 20px; }
                    h1 { text-align: center; }
                    .recipe { border: 1px solid #ddd; padding: 10px; margin-bottom: 20px; position: relative; }
                    .recipe img { 
                        max-width: 200px; 
                        height: auto; 
                        position: absolute; 
                        top: 10px; 
                        right: 10px; 
                        border: 1px solid #ddd; 
                    }
                    .recipe h2 { margin: 0; }
                    .ingredients, .steps { margin: 10px 0; }
                    .ingredients ul, .steps ul { list-style-type: none; padding: 0; }
                    .ingredients li, .steps li { margin: 5px 0; }
                    .info { margin-bottom: 10px; }
                    .info p { margin: 5px 0; }
                    .info .label { font-weight: bold; }
                </style>
            </head>
            <body>
                <h1>Recipe Book</h1>
                <xsl:for-each select="recipeBook/recipe">
                    <div class="recipe">
                        <img src="{image/@src}" alt="{image/@alt}"/>
                        <h2><xsl:value-of select="name"/></h2>
                        <div class="info">
                            <p><span class="label">Category:</span> <xsl:value-of select="category"/></p>
                            <p><span class="label">Budget:</span> <xsl:value-of select="budget/@devis"/></p>
                            <p><span class="label">Cooking Time:</span> <xsl:value-of select="times/cookingTime"/> <xsl:value-of select="times/cookingTime/@unit"/></p>
                            <p><span class="label">Preparation Time:</span> <xsl:value-of select="times/preparationTime"/> <xsl:value-of select="times/preparationTime/@unit"/></p>
                            <p><span class="label">Level:</span> <xsl:value-of select="level"/></p>
                            <p><span class="label">Number of Servings:</span> <xsl:value-of select="number_serving"/></p>
                            <p><span class="label">Rating:</span> <xsl:value-of select="rating"/></p>
                        </div>
                        <div class="ingredients">
                            <h3>Ingredients:</h3>
                            <ul>
                                <xsl:for-each select="ingredients/ingredient">
                                    <li><xsl:value-of select="ingredient_name"/>: <xsl:value-of select="ingredient_quantity"/></li>
                                </xsl:for-each>
                            </ul>
                        </div>
                        <div class="steps">
                            <h3>Steps:</h3>
                            <ul>
                                <xsl:for-each select="steps/step">
                                    <li><xsl:value-of select="."/></li>
                                </xsl:for-each>
                            </ul>
                        </div>
                    </div>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>

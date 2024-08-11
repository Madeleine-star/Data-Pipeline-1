<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <title>Recipe Book</title>
                <style>
                    body { font-family: Arial, sans-serif; }
                    .recipe { border: 1px solid #ccc; margin: 20px; padding: 20px; }
                    .recipe img { max-width: 200px; height: auto; float: right; margin-left: 20px; }
                    .recipe h2 { margin-top: 0; }
                    .ingredients, .steps { margin-top: 20px; }
                    .ingredients ul { list-style-type: none; padding-left: 0; }
                    .ingredients ul li { margin-bottom: 5px; }
                    .category, .budget, .times, .level, .serving, .rating { margin-top: 10px; font-weight: bold; }
                </style>
            </head>
            <body>
                <h1>Recipe Book</h1>
                <xsl:for-each select="recipeBook/recipe">
                    <div class="recipe">
                        <img src="{image/@src}" alt="{image/@alt}"/>
                        <h2><xsl:value-of select="name"/></h2>
                        <div class="category">Category: <xsl:value-of select="category"/></div>
                        <div class="budget">Budget: <xsl:value-of select="budget"/></div>
                        <div class="times">
                            Cooking Time: <xsl:value-of select="times/cookingTime"/>,
                            Preparation Time: <xsl:value-of select="times/preparationTime"/>
                        </div>
                        <div class="level">Level: <xsl:value-of select="level"/></div>
                        <div class="serving">Servings: <xsl:value-of select="serving"/></div>
                        <div class="rating">Rating: <xsl:value-of select="rating"/></div>
                        <div class="ingredients">
                            <h3>Ingredients:</h3>
                            <ul>
                                <xsl:for-each select="ingredients/ingredient">
                                    <li><xsl:value-of select="."/></li>
                                </xsl:for-each>
                            </ul>
                        </div>
                        <div class="steps">
                            <h3>Steps:</h3>
                            <xsl:for-each select="steps/step">
                                <p><xsl:value-of select="."/></p>
                            </xsl:for-each>
                        </div>
                    </div>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>

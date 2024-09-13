<?xml version="1.0" encoding="UTF-8"?>    <!-- XML declaration with version and encoding -->

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">    <!-- Declaration of the XSLT stylesheet -->

    
    <xsl:template match="/">    <!-- Template that matches the root of the XML document -->

        <html>
            <head>
                <title>Recipe Book</title>   <!-- Title of the HTML page -->

                <style>
                    body { font-family: Arial, sans-serif; margin: 20px; }  <!-- Style for the body of the page -->
                    h1 { text-align: center; }  <!-- Style for the main title -->
                    .recipe { border: 1px solid #ddd; padding: 10px; margin-bottom: 20px; }  <!-- Style for each recipe -->
                    .recipe img { max-width: 100px; }  <!-- Style for the image in the recipe -->
                    .recipe h2 { margin-top: 0; }  <!-- Style for the recipe subtitle -->
                    .ingredients, .steps { margin-left: 20px; }  <!-- Style for ingredient and step lists -->
                    .ingredients li, .steps li { margin-bottom: 5px; }  <!-- Spacing between list items -->
                </style>
            </head>
            <body>
                <h1>Recipe Book</h1>   <!-- Main title of the HTML page -->

                <xsl:for-each select="recipeBook/recipe">  <!-- Loop through each recipe in the XML document -->

                    <div class="recipe">  <!-- Div containing information for a single recipe -->

                        <h2><xsl:value-of select="name"/></h2>  <!-- Displays the name of the recipe -->

                        <img src="{image/@src}" alt="{image/@alt}"/>  <!-- Displays the recipe's image with alt text -->

                        <p><strong>Category:</strong> <xsl:value-of select="RefCategorie"/></p>  <!-- Displays the recipe category -->

                        <p><strong>Type:</strong> <xsl:value-of select="type"/></p>  <!-- Displays the recipe type -->

                        <p><strong>Budget:</strong> <xsl:value-of select="budget/@devise"/></p>  <!-- Displays the budget and devise -->

                        <p><strong>Cooking Time:</strong> <xsl:value-of select="times/cookingTime"/> <xsl:value-of select="times/cookingTime/@unit"/></p>  <!-- Displays cooking time and unit -->

                        <p><strong>Preparation Time:</strong> <xsl:value-of select="times/preparationTime"/> <xsl:value-of select="times/preparationTime/@unit"/></p>  <!-- Displays preparation time and unit -->

                        <p><strong>Level:</strong> <xsl:value-of select="level"/></p>   <!-- Displays the difficulty level -->

                        <p><strong>Number of Servings:</strong> <xsl:value-of select="number_serving"/></p>  <!-- Displays the number of servings -->

                        <p><strong>Rating:</strong> <xsl:value-of select="rating"/></p>  <!-- Displays the recipe rating -->
                        
                        <h3>Ingredients:</h3>  <!-- Title for the ingredients section -->

                        <ul class="ingredients">
                            <xsl:for-each select="ingredients/ingredient">  <!-- Loop through each ingredient in the recipe -->

                                <li><xsl:value-of select="ingredient_name"/>: <xsl:value-of select="ingredient_quantity"/></li>  <!-- Displays the ingredient name and quantity -->

                            </xsl:for-each>
                        </ul>

                        <h3>Steps:</h3>  <!-- Title for the steps section -->

                        <ol class="steps">
                            <xsl:for-each select="steps/step">  <!-- Loop through each step in the recipe -->

                                <li><xsl:value-of select="."/></li>  <!-- Displays the content of each step -->
                            </xsl:for-each>
                        </ol>
                    </div>   <!-- End of the section for a recipe -->

                </xsl:for-each>  <!-- End of the loop through recipes -->

            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>

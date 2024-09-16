<?xml version="1.0" encoding="UTF-8"?>
<!-- XSLT stylesheet declaration with version and namespace -->
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <!-- Template to match the root element "/Root" -->
    <xsl:template match="/Root">
        <html>
        <head>
            <!-- Title of the HTML page -->
            <title>Recipe Book</title>
            <!-- Inline CSS for styling the output -->
            <style>
                body { font-family: Arial, sans-serif; margin: 20px; }   <!-- Sets the font family to Arial, with sans-serif as a fallback, and adds a 20px margin around the body -->
                .recipe { margin-bottom: 20px; border: 1px solid #ccc; padding: 10px; }   <!--Styles the recipe containers with a 20px bottom margin, a light gray border, and 10px padding inside the border --> 
                .recipe img { max-width: 200px; }     <!--Limits the maximum width of images inside the recipe containers to 200px -->                 
                .ingredients, .steps { margin-top: 10px; }      <!--Adds a 10px margin above the ingredients and steps sections to separate them from preceding content -->
            </style>
        </head>
        <body>
            <!-- Main heading for the recipe book -->
            <h1>Recipe Book</h1>
            <!-- Apply templates for each "recipe" under the "recipes" element -->
            <xsl:apply-templates select="recipes/recipe"/>
        </body>
        </html>
    </xsl:template>
    
    <!-- Template for individual recipe elements -->
    <xsl:template match="recipe">
        <div class="recipe">
            <!-- Display the recipe name as an H2 heading -->
            <h2><xsl:value-of select="name"/></h2>
            <!-- Display the image associated with the recipe -->
            <img src="{image/@src}"/>
            <!-- Display the category of the recipe -->
            <p><strong>Category:</strong> <xsl:value-of select="RefCategorie"/></p>
            <!-- Display the type of the recipe -->
            <p><strong>Type:</strong> <xsl:value-of select="type"/></p>
            <!-- Display the budget, followed by the devise unit -->
            <p><strong>Budget:</strong> <xsl:value-of select="Budget"/> <xsl:value-of select="Budget/@devise"/></p>
            <!-- Display cooking time with its unit -->
            <p><strong>Cooking Time:</strong> <xsl:value-of select="cooking_time"/> <xsl:value-of select="cooking_time/@unit"/></p>
            <!-- Display preparation time with its unit -->
            <p><strong>Preparation Time:</strong> <xsl:value-of select="preparation_time"/> <xsl:value-of select="preparation_time/@unit"/></p>
            <!-- Display the difficulty level of the recipe -->
            <p><strong>Level:</strong> <xsl:value-of select="level"/></p>
            <!-- Display the number of servings -->
            <p><strong>Number of Servings:</strong> <xsl:value-of select="number_serving"/></p>

            <!-- Section for the list of ingredients -->
            <div class="ingredients">
                <h3>Ingredients</h3>
                <ul>
                    <!-- Iterate over each ingredient and display its name and quantity with unit -->
                    <xsl:for-each select="ingredient_rec">
                        <li>
                            <xsl:value-of select="ingredient_name"/>:
                            <xsl:value-of select="ingredient_quantity"/> <xsl:value-of select="ingredient_quantity/@unit"/>
                        </li>
                    </xsl:for-each>
                </ul>
            </div>

            <!-- Section for the preparation steps -->
            <div class="steps">
                <h3>Preparation Steps</h3>
                <!-- Display the steps for the recipe -->
                <p><xsl:value-of select="step"/></p>
            </div>

            <!-- Section for ratings -->
            <div class="rating">
                <h3>Ratings</h3>
                <!-- Iterate over ratings and display each rating value -->
                <xsl:for-each select="rating">
                    <p><xsl:value-of select="."/></p>
                </xsl:for-each>
            </div>
        </div>
    </xsl:template>
    
</xsl:stylesheet>

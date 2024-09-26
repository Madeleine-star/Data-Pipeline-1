<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- Main template that matches the root element of the XML document -->
<xsl:template match="/Root">
<html>
<head>
    <!-- Title of the generated HTML page -->
    <title>Recipe Book</title>
    <!-- Basic CSS for styling the recipe output -->
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        .recipe { margin-bottom: 20px; border: 1px solid #ccc; padding: 10px; }
        .recipe img { max-width: 200px; } /* Ensures images do not exceed 200px */
        .ingredients, .steps { margin-top: 10px; } /* Adds space around ingredients and steps */
    </style>
</head>
<body>
    <!-- Main heading for the recipe book -->
    <h1>Recipe Book</h1>
    <!-- Apply templates to each 'recipe' element found within the 'recipes' node -->
    <xsl:apply-templates select="recipes/recipe"/>
</body>
</html>
</xsl:template>

<!-- Template for individual recipes -->
<xsl:template match="recipe">
<div class="recipe">
    <!-- Display recipe name -->
    <h2><xsl:value-of select="name"/></h2>
    <!-- Display recipe image using the 'src' attribute from the 'image' element -->
    <img src="{image/@src}"/>
    <!-- Display the recipe's category -->
    <p><strong>Category:</strong> <xsl:value-of select="RefCategorie"/></p>
    <!-- Display the type of recipe -->
    <p><strong>Type:</strong> <xsl:value-of select="type"/></p>

    <!-- Display the budget, with a space between the value and the currency -->
    <p><strong>Budget:</strong> 
        <xsl:value-of select="Budget"/> <!-- Display the budget value -->
        <xsl:text> </xsl:text> <!-- Add a space -->
        <xsl:value-of select="Budget/@devise"/> <!-- Display the currency (unit) -->
    </p>

    <!-- Display the cooking time with a space between the value and the unit -->
    <p><strong>Cooking Time:</strong> 
        <xsl:value-of select="cooking_time"/> <!-- Display cooking time value -->
        <xsl:text> </xsl:text> <!-- Add a space -->
        <xsl:value-of select="cooking_time/@unit"/> <!-- Display the unit -->
    </p>

    <!-- Display the preparation time with a space between the value and the unit -->
    <p><strong>Preparation Time:</strong> 
        <xsl:value-of select="preparation_time"/> <!-- Display preparation time value -->
        <xsl:text> </xsl:text> <!-- Add a space -->
        <xsl:value-of select="preparation_time/@unit"/> <!-- Display the unit -->
    </p>

    <!-- Display the difficulty level of the recipe -->
    <p><strong>Level:</strong> <xsl:value-of select="level"/></p>
    <!-- Display the number of servings -->
    <p><strong>Number of Servings:</strong> <xsl:value-of select="number_serving"/></p>

    <!-- Section for displaying ingredients -->
    <div class="ingredients">
        <h3>Ingredients</h3>
        <ul>
            <!-- Loop through each 'ingredient_rec' element -->
            <xsl:for-each select="ingredient_rec">
                <li>
                    <!-- Display ingredient name, quantity, and unit -->
                    <xsl:value-of select="ingredient_name"/> 
                    <xsl:text>: </xsl:text> <!-- Add space between name and quantity -->
                    <xsl:value-of select="ingredient_quantity"/> 
                    <xsl:text> </xsl:text> <!-- Add a space between quantity and unit -->
                    <xsl:value-of select="ingredient_quantity/@unit"/>
                </li>
            </xsl:for-each>
        </ul>
    </div>

    <!-- Section for displaying preparation steps -->
    <div class="steps">
        <h3>Preparation Steps</h3>
        <!-- Display the preparation steps as a single text block -->
        <p><xsl:value-of select="step"/></p>
    </div>

    <!-- Section for displaying recipe ratings -->
    <div class="rating">
        <h3>Ratings</h3>
        <!-- Display the first two ratings, separated by a space -->
        <p><xsl:value-of select="rating[1]"/><xsl:text> </xsl:text><xsl:value-of select="rating[2]"/></p>
    </div>
</div>
</xsl:template>

</xsl:stylesheet>

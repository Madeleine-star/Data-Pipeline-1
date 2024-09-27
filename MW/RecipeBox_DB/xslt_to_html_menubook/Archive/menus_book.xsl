<?xml version="1.0" encoding="utf-8"?>
<!--An xslt transformation for the romantic dinner menu with its number of serving,
specific price and rating. In this document it have the recipe total description and their nutritional fact
for each recipe in the menu-->
<xsl:stylesheet version='1.0' xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method='html' encoding='UTF-8' indent='yes'/><!--Specify the type of file for the output and the encoding type we used, UTF8 allow to used european style-->
	<xsl:template match='/'>
		<html><!--Declared html style used and allow us to used html tags inside XSLT file-->
			<body><!--The html file contain a body which is the content of the file. Because we are in a XSLT it will describe the skeleton of the file with the place of the different template we want to insert-->
				<Div Align='CENTER'> <!--Allow to centered the title of the HTML file-->
					<h1>Romantic Dinner Menu</h1> <!--The h tags give the size of the text element, less the number is bigger the text will be display-->
					<xsl:apply-templates select='Root/menus/menu[2]'/> <!--Putting a number inside [ ] in an XPATH allow us to indicate at the parser which nodes we want to select in the database-->
				</Div>
				<h2>Entrance</h2>
				<blockquote> <!--Allow to create block of element in the code-->
				<xsl:apply-templates select='Root/recipes/recipe[4]'/>
				<h4>Nutrition fact:</h4>
				<xsl:apply-templates select='Root/Nutritions/Nutrition[2]'/>
				</blockquote>
				<h2>Main</h2>
				<blockquote>
					<xsl:apply-templates select='Root/recipes/recipe[3]'/>
					<h4>Nutrition fact:</h4>
					<xsl:apply-templates select='Root/Nutritions/Nutrition[7]'/>
				</blockquote>
				<h2>Dessert</h2>
				<blockquote>
					<xsl:apply-templates select='Root/recipes/recipe[7]'/>
					<h4>Nutrition fact:</h4>
					<xsl:apply-templates select='Root/Nutritions/Nutrition[6]'/>
				</blockquote>
			</body>
		</html>
	</xsl:template>
	<!--This will fill the first part of the document with the main info on the menu-->
	<xsl:template match='menus/menu[2]'>
		<p>
			<h3>
			Number of recipe:
			<xsl:value-of select='number_recipe'/> - Price: 
			<xsl:value-of select='Budget'/>
				<xsl:text> </xsl:text>
				<xsl:value-of select='Budget/@devise'/> - Rating: <!--The XPATH with /@ specify at the parser we want the attribute of the element here Budget-->
			<xsl:value-of select='rating[1]'/>
				<xsl:text> </xsl:text>
				<xsl:value-of select='rating[2]'/>
			</h3>
		</p>
	</xsl:template>
	<!--The following block will be repeat for the 3 part of the document to define the template
	for the entrance, main and dessert
	In fisrt the Entrance-->
	<!--This part concern the infos of the recipe in the menu-->
	<xsl:template match='recipes/recipe[4]'>
		<p>
			<h4>Recipe Name: 
			<xsl:value-of select='name'/>
			</h4>
		</p>
		<p>
			<h4>Cooking time: 
			<xsl:value-of select="cooking_time"/>
				<xsl:text> </xsl:text><!--This permit to insert a white space between 2 elements and to keep it-->
				<xsl:value-of select="cooking_time/@unit"/> - 
			Preparation time: 
			<xsl:value-of select="preparation_time"/>
				<xsl:text> </xsl:text>
				<xsl:value-of select="preparation_time/@unit"/>
			</h4>
		</p>
		<p>
			
		</p>
		<h4>Ingredient: </h4>
		<table border="1" cellpadding="3"> <!--Here we declared a table and defined the border and cell type of the table-->
			<tbody><!--Like for the html file content we declare here the content of the table-->
				<tr><!--Here we declare the header of the table with the th tags, the style="font-size" defined the size of the text-->
					<th style="font-size:11pt">Ingredient</th>
					<th style="font-size:11pt">quantity</th>
				</tr>
				<xsl:for-each select="ingredient_rec"><!--We used a for-each loop because we want in the table all the ingredient cited in the recipe-->
					<tr><!--Here we declared the element inside the row's table-->
						<td style="font-size:9pt"><!--This defined the text size in the table-->
							<xsl:value-of select="ingredient_name"/>
						</td>
						<td style="font-size:9pt">
							<xsl:value-of select="ingredient_quantity"/>
							<xsl:text> </xsl:text>
							<xsl:value-of select="ingredient_quantity/@unit"/>
						</td>
					</tr>
				</xsl:for-each>
			</tbody>
		</table>
		<p>
			<h4>Recipe steps:</h4>
			<xsl:value-of select='step'/>
		</p>
	</xsl:template>
	<!--Here we defined a template for the nutritional fact of the recipe in the menu-->
	<xsl:template match='Nutritions/Nutrition[2]'>
		<table border="1" cellpadding="3">
			<tbody>
				<tr>
					<td style="font-size:10pt">
	Energy: 
			<xsl:value-of select='energy'/>
						<xsl:text> </xsl:text>
						<xsl:value-of select='energy/@unit'/>
					</td>
					<td style="font-size:10pt">
	Total Fat: 
			<xsl:value-of select='total_fat'/>
						<xsl:text> </xsl:text>
						<xsl:value-of select='total_fat/@unit'/>
					</td>
					<td style="font-size:10pt">
	Cholesterol: 
			<xsl:value-of select='cholesterol'/>
						<xsl:text> </xsl:text>
						<xsl:value-of select='cholesterol/@unit'/>
					</td>
					<td style="font-size:10pt">
	Salt: 
			<xsl:value-of select='salt'/>
						<xsl:text> </xsl:text>
						<xsl:value-of select='salt/@unit'/>
					</td>
					<td style="font-size:10pt">
	Total Carbohydrate: 
			<xsl:value-of select='total_carbohydrate'/>
						<xsl:text> </xsl:text>
						<xsl:value-of select='total_carbohydrate/@unit'/>
					</td>
					<td style="font-size:10pt">
	Protein: 
			<xsl:value-of select='protein'/>
						<xsl:text> </xsl:text>
						<xsl:value-of select='protein/@unit'/>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<!--For the main-->
<xsl:template match='recipes/recipe[7]'>
		<p>
			<h4>Recipe Name: 
			<xsl:value-of select='name'/>
			</h4>
		</p>
		<p>
			<h4>Cooking time: 
			<xsl:value-of select="cooking_time"/>
				<xsl:text> </xsl:text>
				<xsl:value-of select="cooking_time/@unit"/> - 
			Preparation time: 
			<xsl:value-of select="preparation_time"/>
				<xsl:text> </xsl:text>
				<xsl:value-of select="preparation_time/@unit"/>
			</h4>
		</p>
		<p>
			
		</p>
		<h4>Ingredient: </h4>
		<table border="1" cellpadding="3">
			<tbody>
				<tr>
					<th style="font-size:11pt">Ingredient</th>
					<th style="font-size:11pt">quantity</th>
				</tr>
				<xsl:for-each select="ingredient_rec">
					<tr>
						<td style="font-size:9pt">
							<xsl:value-of select="ingredient_name"/>
						</td>
						<td style="font-size:9pt">
							<xsl:value-of select="ingredient_quantity"/>
							<xsl:text> </xsl:text>
							<xsl:value-of select="ingredient_quantity/@unit"/>
						</td>
					</tr>
				</xsl:for-each>
			</tbody>
		</table>
		<p>
			<h4>Recipe steps:</h4>
			<xsl:value-of select='step'/>
		</p>
	</xsl:template>
	<!--Here we defined a template for the nutritional fact of the recipe in the menu-->
	<xsl:template match='Nutritions/Nutrition[6]'>
		<table border="1" cellpadding="3">
			<tbody>
				<tr>
					<td style="font-size:10pt">
	Energy: 
			<xsl:value-of select='energy'/>
						<xsl:text> </xsl:text>
						<xsl:value-of select='energy/@unit'/>
					</td>
					<td style="font-size:10pt">
	Total Fat: 
			<xsl:value-of select='total_fat'/>
						<xsl:text> </xsl:text>
						<xsl:value-of select='total_fat/@unit'/>
					</td>
					<td style="font-size:10pt">
	Cholesterol: 
			<xsl:value-of select='cholesterol'/>
						<xsl:text> </xsl:text>
						<xsl:value-of select='cholesterol/@unit'/>
					</td>
					<td style="font-size:10pt">
	Salt: 
			<xsl:value-of select='salt'/>
						<xsl:text> </xsl:text>
						<xsl:value-of select='salt/@unit'/>
					</td>
					<td style="font-size:10pt">
	Total Carbohydrate: 
			<xsl:value-of select='total_carbohydrate'/>
						<xsl:text> </xsl:text>
						<xsl:value-of select='total_carbohydrate/@unit'/>
					</td>
					<td style="font-size:10pt">
	Protein: 
			<xsl:value-of select='protein'/>
						<xsl:text> </xsl:text>
						<xsl:value-of select='protein/@unit'/>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<!--For the Dessert-->
<xsl:template match='recipes/recipe[3]'>
		<p>
			<h4>Recipe Name: 
			<xsl:value-of select='name'/>
			</h4>
		</p>
		<p>
			<h4>Cooking time: 
			<xsl:value-of select="cooking_time"/>
				<xsl:text> </xsl:text>
				<xsl:value-of select="cooking_time/@unit"/> - 
			Preparation time: 
			<xsl:value-of select="preparation_time"/>
				<xsl:text> </xsl:text>
				<xsl:value-of select="preparation_time/@unit"/>
			</h4>
		</p>
		<p>
			
		</p>
		<h4>Ingredient: </h4>
		<table border="1" cellpadding="3">
			<tbody>
				<tr>
					<th style="font-size:11pt">Ingredient</th>
					<th style="font-size:11pt">quantity</th>
				</tr>
				<xsl:for-each select="ingredient_rec">
					<tr>
						<td style="font-size:9pt">
							<xsl:value-of select="ingredient_name"/>
						</td>
						<td style="font-size:9pt">
							<xsl:value-of select="ingredient_quantity"/>
							<xsl:text> </xsl:text>
							<xsl:value-of select="ingredient_quantity/@unit"/>
						</td>
					</tr>
				</xsl:for-each>
			</tbody>
		</table>
		<p>
			<h4>Recipe steps:</h4>
			<xsl:value-of select='step'/>
		</p>
	</xsl:template>
	<!--Here we defined a template for the nutritional fact of the recipe in the menu-->
	<xsl:template match='Nutritions/Nutrition[7]'>
		<table border="1" cellpadding="3">
			<tbody>
				<tr>
					<td style="font-size:10pt">
	Energy: 
			<xsl:value-of select='energy'/>
						<xsl:text> </xsl:text>
						<xsl:value-of select='energy/@unit'/>
					</td>
					<td style="font-size:10pt">
	Total Fat: 
			<xsl:value-of select='total_fat'/>
						<xsl:text> </xsl:text>
						<xsl:value-of select='total_fat/@unit'/>
					</td>
					<td style="font-size:10pt">
	Cholesterol: 
			<xsl:value-of select='cholesterol'/>
						<xsl:text> </xsl:text>
						<xsl:value-of select='cholesterol/@unit'/>
					</td>
					<td style="font-size:10pt">
	Salt: 
			<xsl:value-of select='salt'/>
						<xsl:text> </xsl:text>
						<xsl:value-of select='salt/@unit'/>
					</td>
					<td style="font-size:10pt">
	Total Carbohydrate: 
			<xsl:value-of select='total_carbohydrate'/>
						<xsl:text> </xsl:text>
						<xsl:value-of select='total_carbohydrate/@unit'/>
					</td>
					<td style="font-size:10pt">
	Protein: 
			<xsl:value-of select='protein'/>
						<xsl:text> </xsl:text>
						<xsl:value-of select='protein/@unit'/>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
</xsl:stylesheet>



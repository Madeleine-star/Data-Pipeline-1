# recipe_box_compagny
A repository for a class project in XML and its linked technologies to create a database for recipes box compagny. 

This class project aim to:
- Create an XML schema for modeling the database
- The XML database for the recipe box compagny
- 7 ways to display a part of the XML data through XSLT with 1 in JSON and another in HTML
- The data display in JSON should correspond to a JSON schema

The database will be inspired from [goodfood] (https://www.bbcgoodfood.com/review/best-recipe-subscription-boxes) and must contain:
- recipes and menus compose with them
- the delivery mode
- the number of order for the menu
- the rating for the menu as well as for the recipe
- the comment from custommers for the recipes as well as the menu

- The recipes will be referenced (attribute) and they will contain:
  - a name/title (string)
  - ingredients (string)
  - quantity of each ingredient (integer)
  - Type (string within this list starter, main course, dessert)
  - Category (Attribute for reference; string whitin a list ex: healthy, express, world inspiration, seasonal, ...)
  - Budget which will be calculate from the sum of the mean price of each ingredient * it's quantity
  - The steps (string)
  - Cooking time (string with a specific pattern)
  - Preparation time (string with a specific pattern)
  - Difficulty (beginer, middle, expert)
  - number of person/serving (between 2 to 4)
  - rating (integer between 0 to 5) and comment (string)

- The ingredients will be referenced (attribute) and they will be described by:
  - name of the ingredient (string)
  - season (string within a list: winter, spring, summer, autumn)
  - growing site (string)
  - mean price (integer)
  - recipe id which contain it

- The menu (with an attribute to refer to it) will contain :
  - a title such as 'Busy mom', 'chilling day', ... (string)
  - number of recipes (integer between 1 to 7)
  - list of recipe name with their id
  - number of serving (integer between 2 to 4)
  - The total cooking and preparation time which will be calculate from the cooking/preparation time from each recipes in the menue
  - The rating (integer between 0 to 5), comments (string), number of order (integer)
  - Delivery mode (string within a list: once week, twice week, daily)
  - Category (string with id)

- The Category will have an attribute to refer to it and will contain:
  - The list of recipies in the category with their id 
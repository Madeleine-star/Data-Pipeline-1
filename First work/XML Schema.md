<?xml version="1.0" encoding="UTF-8"?>
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema">

    <!-- Define complex types -->

#Consider adding attributes for nutritional information (e.g., calories, allergens) within the <xs:complexType name="IngredientType">
    <!-- Ingredient type -->
    <xs:complexType name="IngredientType">
        <xs:sequence>
            <xs:element name="Name" type="xs:string"/>
            <xs:element name="Quantity" type="xs:decimal"/>
            <xs:element name="Unit" type="xs:string"/>
            <xs:element name="Calories" type="xs:integer"/>
            <xs:element name="Allergens" type="xs:string" minOccurs="0" maxOccurs="unbounded"/>
            <!-- Add other nutritional information as needed as (vitamins, minerals) -->
        </xs:sequence>
    </xs:complexType>
  
    #The basic structure for recipes, including their name, ingredients, and preparation steps
    <!-- Recipe type -->
    <xs:complexType name="RecipeType">
        <xs:sequence>
            <xs:element name="Name" type="xs:string"/>
            <xs:element name="Ingredients" type="IngredientType" minOccurs="1" maxOccurs="unbounded"/> #should be of type IngredientType, not xs:string
            <xs:element name="PreparationSteps" type="xs:string"/>
            <xs:element name="CuisineType" type="xs:string"/>
            <xs:element name="FlavorProfiles" type="xs:string" minOccurs="0" maxOccurs="unbounded"/>
            <!-- Add other recipe-related elements (e.g., cuisine type, flavor profiles Italian, Mexican, sweet, savory, spicy) -->
        </xs:sequence>
    </xs:complexType>

#Represents a menu, containing a name and a list of recipes
    <!-- Menu type -->
    <xs:complexType name="MenuType">
        <xs:sequence>
            <xs:element name="Name" type="xs:string"/>
            <xs:element name="Recipes" type="RecipeType" minOccurs="1" maxOccurs="unbounded"/> #should reference the RecipeType
        </xs:sequence>
    </xs:complexType>

#Describes customer information, including name and contact details
    <!-- Customer type -->
    <xs:complexType name="CustomerType">
        <xs:sequence>
            <xs:element name="Name" type="xs:string"/>
            <xs:element name="ContactDetails" type="xs:string"/>
            <xs:element name="DietaryRestrictions" type="xs:string" minOccurs="0" maxOccurs="unbounded"/>
            <!-- Add other customer-related elements (preferences, ..) -->
        </xs:sequence>
    </xs:complexType>

#Represents an order, including the order date and menu selections
    <!-- Order type -->
    <xs:complexType name="OrderType">
        <xs:sequence>
            <xs:element name="OrderDate" type="xs:date"/>
            <xs:element name="MenuSelections" type="MenuType" minOccurs="1" maxOccurs="unbounded"/>
            <xs:element name="DeliveryAddress" type="xs:string"/>
            <xs:element name="DeliveryDate" type="xs:date"/>
            <!-- Add delivery information and customer reviews -->
        </xs:sequence>
    </xs:complexType>

#Describes delivery personnel, including their name and contact details
    <!-- Delivery personnel type -->
    <xs:complexType name="DeliveryPersonnelType">
        <xs:sequence>
            <xs:element name="Name" type="xs:string"/>
            <xs:element name="ContactDetails" type="xs:string"/>
            <!-- Add availability information -->
        </xs:sequence>
    </xs:complexType>

#Root Element (RecipeBoxCompany):
#Contains sub-elements for ingredients, recipes, menus, customers, orders, and delivery personnel
#Ensure that each sub-element references the appropriate complex type
    <!-- Define root element -->
    <xs:element name="RecipeBoxCompany">
        <xs:complexType>
            <xs:sequence>
                <xs:element name="Ingredients" type="IngredientType" minOccurs="0" maxOccurs="unbounded"/>
                <xs:element name="Recipes" type="RecipeType" minOccurs="0" maxOccurs="unbounded"/>
                <xs:element name="Menus" type="MenuType" minOccurs="0" maxOccurs="unbounded"/>
                <xs:element name="Customers" type="CustomerType" minOccurs="0" maxOccurs="unbounded"/>
                <xs:element name="Orders" type="OrderType" minOccurs="0" maxOccurs="unbounded"/>
                <xs:element name="DeliveryPersonnel" type="DeliveryPersonnelType" minOccurs="0" maxOccurs="unbounded"/>
            </xs:sequence>
        </xs:complexType>
    </xs:element>

</xs:schema>

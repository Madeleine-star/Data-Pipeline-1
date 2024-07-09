<?xml version="1.0" encoding="UTF-8"?>
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema">

    <!-- Define complex types -->

    <!-- Ingredient type -->
    <xs:complexType name="IngredientType">
        <xs:sequence>
            <xs:element name="Name" type="xs:string"/>
            <xs:element name="Quantity" type="xs:decimal"/>
            <xs:element name="Unit" type="xs:string"/>
            <!-- Add nutritional information (calories, allergens, etc.) -->
        </xs:sequence>
    </xs:complexType>

    <!-- Recipe type -->
    <xs:complexType name="RecipeType">
        <xs:sequence>
            <xs:element name="Name" type="xs:string"/>
            <xs:element name="Ingredients" type="IngredientType" minOccurs="1" maxOccurs="unbounded"/>
            <xs:element name="PreparationSteps" type="xs:string"/>
            <!-- Add other recipe-related elements (e.g., cuisine type, flavor profiles) -->
        </xs:sequence>
    </xs:complexType>

    <!-- Menu type -->
    <xs:complexType name="MenuType">
        <xs:sequence>
            <xs:element name="Name" type="xs:string"/>
            <xs:element name="Recipes" type="RecipeType" minOccurs="1" maxOccurs="unbounded"/>
        </xs:sequence>
    </xs:complexType>

    <!-- Customer type -->
    <xs:complexType name="CustomerType">
        <xs:sequence>
            <xs:element name="Name" type="xs:string"/>
            <xs:element name="ContactDetails" type="xs:string"/>
            <!-- Add other customer-related elements (preferences, dietary restrictions) -->
        </xs:sequence>
    </xs:complexType>

    <!-- Order type -->
    <xs:complexType name="OrderType">
        <xs:sequence>
            <xs:element name="OrderDate" type="xs:date"/>
            <xs:element name="MenuSelections" type="MenuType" minOccurs="1" maxOccurs="unbounded"/>
            <!-- Add delivery information and customer reviews -->
        </xs:sequence>
    </xs:complexType>

    <!-- Delivery personnel type -->
    <xs:complexType name="DeliveryPersonnelType">
        <xs:sequence>
            <xs:element name="Name" type="xs:string"/>
            <xs:element name="ContactDetails" type="xs:string"/>
            <!-- Add availability information -->
        </xs:sequence>
    </xs:complexType>

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

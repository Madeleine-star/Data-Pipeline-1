<?xml version="1.0"?>
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<xs:element name='Root'>
		<xs:complexType>
			<xs:sequence>
				<xs:element name='Activities'>
					<xs:complexType>
						<xs:sequence>
							<xs:element name='Activity' type='ActivityType' minOccurs='0' maxOccurs='unbounded'/>
						</xs:sequence>
					</xs:complexType>
				</xs:element>
				<xs:element name='Transportations'>
					<xs:complexType>
						<xs:sequence>
							<xs:element name='Transportation' type='TranspType' minOccurs='0' maxOccurs='unbounded'/>
						</xs:sequence>
					</xs:complexType>
				</xs:element>
				<xs:element name='Compagny_infos' type="CompagnyType"/>
				<xs:element name='Employees'>
					<xs:complexType>
						<xs:sequence>
							<xs:element name='Employee' type='EmployeeType' minOccurs='0' maxOccurs='unbounded'/>
						</xs:sequence>
					</xs:complexType>
				</xs:element>
				<xs:element name='Customers'>
					<xs:complexType>
						<xs:sequence>
							<xs:element name='Customer' type='care_info' minOccurs='0' maxOccurs='unbounded'/>
						</xs:sequence>
					</xs:complexType>
				</xs:element>
				<xs:element name='Invoices' type='InvoicesType' minOccurs='0' maxOccurs='unbounded'/>
			</xs:sequence>
		</xs:complexType>
		<xs:complexType name='ActivityType'>
			<xs:sequence>
				<xs:element name='ActivityName' type='xs:string' maxOccurs='1'/>
				<xs:element name='ActivityDuration' type='xs:time' minOccurs='0' maxOccurs='1'/>
				<!--This element will look like this hh:mm:ss e.g., 01:30:00-->
				<xs:element name='DisabilityAdapt' type='dis_type' minOccurs='1' maxOccurs='unbounded'/>
				<xs:element name='ActivityField'>
					<xs:simpleType>
						<xs:restriction base='xs:string'>
							<xs:enumeration value='Sport and Art'/>
							<xs:enumeration value='Administrative'/>
							<xs:enumeration value='Home care'/>
							<xs:enumeration value='Transportation'/>
						</xs:restriction>
					</xs:simpleType>
				</xs:element>
				<xs:element name='Description' type='xs:string'/>
				<!--This element will be a short text explained the type of activity it is 
		and the objectives of it-->
				<xs:element name='Price' type='PriceType'/>
			</xs:sequence>
			<xs:attribute name='ActID' type='ActIdType'/>
		</xs:complexType>
		<xs:simpleType name='ActIdType'>
			<xs:restriction base='xs:string'>
				<xs:pattern value='[A-Z]{3}'/>
				<!--the pattern will look like this for gymnastic ActIdType='GYM' 
			where it is the 3 first letters of the activity in upper case
			-->
			</xs:restriction>
		</xs:simpleType>
		<xs:complexType name='PriceType'>
			<!--To add the currency for the budget price of the recipe
	the element should look like this 
	<Budget price = 'dollars'> 20 </Budget>-->
			<xs:simpleContent>
				<xs:extension base='xs:decimal'>
					<xs:attribute name='devise' type='xs:string'/>
				</xs:extension>
			</xs:simpleContent>
		</xs:complexType>
	</xs:element>
	<xs:complexType name='TranspType'>
		<xs:sequence>
			<xs:element name='VehiculeType'>
				<xs:simpleType>
					<xs:restriction base='xs:string'>
						<xs:enumeration value='Ambulance'/>
						<xs:enumeration value='Taxi'/>
					</xs:restriction>
				</xs:simpleType>
			</xs:element>
			<xs:element name='nbOfPlaces'>
				<xs:simpleType>
					<xs:restriction base='xs:integer'>
						<xs:pattern value='[1-4]'/>
						<!--Number of seated places in the vehicules-->
					</xs:restriction>
				</xs:simpleType>
				<xs:element ref='Price'/>
			</xs:element>
		</xs:sequence>
	</xs:complexType>
	<xs:complexType name='care_info'>
		<xs:sequence>
			<xs:element name='CustomerName' type='xs:string'/>
			<xs:element name='disability' type='dis_type'/>
			<xs:element name='MedicalNeed' type='stringlist'/>
			<!--This element described the medical specificity of the person
			due to it pathology, short text-->
			<xs:element name='CustomerAddress' type='xs:string' minOccurs='1'/>
			<xs:element name='Floor' minOccurs='0' maxOccurs='1'>
			<xs:simpleType>
			<xs:restriction base='xs:positiveInteger'>
			<xs:pattern value='[1-10]'/>
			</xs:restriction>
			
			</xs:simpleType>
			<!--This specify if the people lived in a building and at which floor-->
			</xs:element>
			<xs:element name='HomeType' minOccurs='1' maxOccurs='3'>
			<xs:simpleType>
			<xs:rectriction base='xs:string'>
			<xs:enumeration value='Stairs'/>
			<xs:enumeration value='Appartment'/>
			<xs:enumeration value='House'/>
			<xs:enumeration value='Elevators'/>
			
			</xs:rectriction>
			
			</xs:simpleType>
			<!--At least one element to described the type of home is requested
			until 3 is possible-->
			
			</xs:element>
			<xs:element name='Phone_number' type='Phone'/>
			<xs:element name='Cust_email' type='email'/>
			<xs:element name='Invoice' minOccurs='0' maxOccurs='unbounded'>
				<xs:complexType>
					<xs:attribute name='CustInvID' type='IDType'/>
				</xs:complexType>
			</xs:element>
		</xs:sequence>
	</xs:complexType>
	<xs:simpleType name='dis_type'>
		<xs:restriction base='xs:string'>
			<xs:enumeration value='eldery'/>
			<xs:enumeration value='Psychiatric disease'/>
			<xs:enumeration value='Physical disability'/>
			<xs:enumeration value='Aftercare'/>
		</xs:restriction>
	</xs:simpleType>
	<xs:complexType name="CompagnyType">
		<xs:sequence>
			<xs:element name='name'>
				<xs:simpleType>
					<xs:restriction base="xs:string">
						<xs:enumeration value='MediCare'/>
					</xs:restriction>
				</xs:simpleType>
			</xs:element>
			<xs:element name='Compagny_address'>
				<xs:simpleType>
					<xs:restriction base="xs:string">
						<xs:enumeration value='9 care road 10461 NY USA'/>
					</xs:restriction>
				</xs:simpleType>
			</xs:element>
			<xs:element name='compagny_phone'>
				<xs:simpleType>
					<xs:restriction base="xs:string">
						<xs:enumeration value='88-77-66-55-44'/>
					</xs:restriction>
				</xs:simpleType>
			</xs:element>
			<xs:element name='compagny_email'>
				<xs:simpleType>
					<xs:restriction base="xs:string">
						<xs:enumeration value='MediCare@gmail.com'/>
					</xs:restriction>
				</xs:simpleType>
			</xs:element>
		</xs:sequence>
	</xs:complexType>
	<xs:simpleType name='Phone'>
		<xs:restriction base='xs:string'>
			<xs:pattern value='[0-9]{2}-[0-9]{2}-[0-9]{2}-[0-9]{2}-[0-9]{2}'/>
			<!--this pattern for phone number
			allow 5 sequences of 2 numeric between 0 to 9 separated by - 
			it can look like this 03-27-48-17-10-->
		</xs:restriction>
	</xs:simpleType>
	<xs:simpleType name='email'>
		<xs:restriction base='xs:string'>
			<xs:pattern value="[a-zA-Z0-9._%+\-]+@[a-zA-Z0-9.\-]+\.[a-zA-Z]{2,4}"/>
			<!--the email address will look like this name@food.org or name19@rec-box.com
		the [a-zA-Z0-9._%+-] mean one or more alphanumeric character in lower or upper cases
		as well as special character such as _ and -  
		the +@ allow to add a @ between the 2 string element
		the [a-zA-Z0-9.-] mean one or more alphanumeric character in lower or upper cases 
		and only accept the - special character
		the \.[a-zA-Z]{2,4} mean after the . we can find 2 to 4 character in lower or upper case-->
		</xs:restriction>
	</xs:simpleType>
	<xs:complexType name='EmployeeType'>
		<xs:sequence>
			<xs:element name='name' type='xs:string'/>
			<xs:element name='phone_number' type='Phone'/>
			<xs:element name='email_address' type='email'/>
			<xs:element name='Training' minOccurs='2' maxOccurs="unbounded">
				<xs:simpleType>
					<xs:restriction base='xs:string'>
						<xs:enumeration value='Nutrition'/>
						<xs:enumeration value='First medical care'/>
						<xs:enumeration value='People care'/>
						<xs:enumeration value='Home care'/>
						<xs:enumeration value='Transportation'/>
					</xs:restriction>
				</xs:simpleType>
			</xs:element>
			<!--The training for the employee must appear at least 2 times-->
		</xs:sequence>
	</xs:complexType>
	<xs:complexType name='InvoicesType'>
		<xs:sequence>
			<xs:element name='invoice' type='invoiceType' minOccurs='1' maxOccurs="unbounded"/>
		</xs:sequence>
	</xs:complexType>
	<xs:complexType name='invoiceType'>
		<xs:sequence>
			<xs:element name='Act_list' minOccurs='0' maxOccurs='unbounded'>
				<xs:complexType>
					<xs:sequence>
						<xs:element name='Activity' type='stringlist' minOccurs='0' maxOccurs='unbounded'/>
						<!--The list of activities choose by the customer-->
						<xs:element name='Act_price' type='PriceType' minOccurs='0' maxOccurs='unbounded'/>
					</xs:sequence>
				</xs:complexType>
			</xs:element>
			<!--this element can be empty and complete by a XSLT with the recipe order by the custommer-->
			<xs:element name='number_visit' type='xs:positiveInteger' minOccurs='0' maxOccurs='unbounded'/>
			<xs:element name='visit_frequency' minOccurs='0' maxOccurs='unbounded'>
				<!--define a list of string usuable for the delivery frequency of the menu and/or recipe-->
				<xs:simpleType>
					<xs:restriction base='xs:string'>
						<xs:enumeration value='once week'/>
						<xs:enumeration value='twice week'/>
						<xs:enumeration value='three time per week'/>
						<xs:enumeration value='daily'/>
					</xs:restriction>
				</xs:simpleType>
			</xs:element>
			<xs:element name='From' type='xs:date'/>
			<xs:element name='To' type='xs:date'/>
			<!--the date format for each is YYYY-MM-DD 
			from is for the start of the service and to the end
			this allow to calculate time for the service-->
			<xs:element name='Number_hours'>
				<!--Number of hours the caregiver will stay at each visit-->
				<xs:complexType>
					<xs:sequence>
						<xs:element name='number' type='xs:positiveInteger'/>
					</xs:sequence>
					<xs:attribute name='unit' type='string'/>
				</xs:complexType>
			</xs:element>
		</xs:sequence>
		<xs:attribute name='invoiceID' type='IDType'/>
		<!--This attribute will follow the same pattern as the one define by CatIDType
			here it should be the initial of the customer follow by the invoice number for example
			the first order of Alexis Wimbledon will be AW01, the 10th order of Charles Dupont will be 
			CD10-->
	</xs:complexType>
	<xs:simpleType name='stringlist'>
		<!--definition of the simple type which is a string with maximum 200 
		words-->
		<xs:list itemType='xs:string'/>
	</xs:simpleType>
	<xs:simpleType name='stringlistlim'>
		<xs:restriction base='stringlist'>
			<xs:minLength value='0'/>
			<xs:maxLength value='200'/>
		</xs:restriction>
	</xs:simpleType>
	<xs:simpleType name='IDType'>
		<xs:restriction base='xs:string'>
			<xs:pattern value='[A-Z0-9]{4}'/>
			<!--the pattern will look like this CatID='AW01' where it is the initial of the customer follow by 
			the invoice number for example
			the first order of Alexis Wimbledon will be AW01, the 10th order of Charles Dupont will be 
			CD10-->
		</xs:restriction>
	</xs:simpleType>
</xs:schema>

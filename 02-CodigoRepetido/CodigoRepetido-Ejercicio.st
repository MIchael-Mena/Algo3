!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testing' stamp: 'M 4/30/2022 18:49:50'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| intervaloTiempo customerBook |
	
	customerBook := CustomerBook new.
	
	intervaloTiempo := Tiempo calcularIntervalo: [ customerBook addCustomerNamed: 'John Lennon'. ].
	
	self assert: (intervaloTiempo) < (50 * millisecond)
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'M 4/30/2022 18:50:47'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| intervaloTiempo customerBook paulMcCartney |
	
	customerBook := CustomerBook new.
	
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	
	intervaloTiempo := Tiempo calcularIntervalo: [ customerBook removeCustomerNamed: paulMcCartney.].
	
	self assert: (intervaloTiempo) < (100 * millisecond).
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'M 4/28/2022 22:59:12'!
test03CanNotAddACustomerWithEmptyName 


	| customerBook |

	customerBook := CustomerBook new.


	[ customerBook addCustomerNamed: ''.
		
	self fail ]

		on: Error 
		
		do: [ :anError | 
			
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ]! !

!CustomerBookTest methodsFor: 'testing' stamp: 'M 4/28/2022 22:59:36'!
test04CanNotRemoveAnInvalidCustomer

	| customerBook johnLennon |

	customerBook := CustomerBook new.
	
	johnLennon := 'John Lennon'.
	
	customerBook addCustomerNamed: johnLennon.
	
	
	[ customerBook removeCustomerNamed: 'Paul McCartney'.
		
	self fail ]

		on: NotFound 
		
		do: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			
			self assert: (customerBook includesCustomerNamed: johnLennon) ]
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'M 4/28/2022 23:00:02'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	
	paulMcCartney := 'Paul McCartney'.
	

	customerBook addCustomerNamed: paulMcCartney.
	
	customerBook suspendCustomerNamed: paulMcCartney.
	

	self assert: 0 equals: customerBook numberOfActiveCustomers.
	
	self assert: 1 equals: customerBook numberOfSuspendedCustomers.
	
	self assert: 1 equals: customerBook numberOfCustomers.
	
	self assert: (customerBook includesCustomerNamed: paulMcCartney).
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'M 4/28/2022 23:00:30'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	

	customerBook := CustomerBook new.
	
	paulMcCartney := 'Paul McCartney'.
	
	
	customerBook addCustomerNamed: paulMcCartney.
	
	customerBook suspendCustomerNamed: paulMcCartney.
	
	customerBook removeCustomerNamed: paulMcCartney.
	

	self assert: 0 equals: customerBook numberOfActiveCustomers.
	
	self assert: 0 equals: customerBook numberOfSuspendedCustomers.
	
	self assert: 0 equals: customerBook numberOfCustomers.
	
	self deny: (customerBook includesCustomerNamed: paulMcCartney).! !

!CustomerBookTest methodsFor: 'testing' stamp: 'M 4/28/2022 23:02:28'!
test07CanNotSuspendAnInvalidCustomer

	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	
	johnLennon := 'John Lennon'.
	
	customerBook addCustomerNamed: johnLennon.
	
	
	[ customerBook suspendCustomerNamed: 'Ringo Starr'.
		
	self fail ]

		on: CantSuspend 
		
		do: [ :anError | 
			
			self assert: customerBook numberOfCustomers = 1.
			
			self assert: (customerBook includesCustomerNamed: johnLennon) ]! !

!CustomerBookTest methodsFor: 'testing' stamp: 'M 4/28/2022 23:05:02'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |

	customerBook := CustomerBook new.
	
	johnLennon := 'John Lennon'.
	
	customerBook addCustomerNamed: johnLennon.
	
	customerBook suspendCustomerNamed: johnLennon.
	
	
	[ customerBook suspendCustomerNamed: johnLennon.
		
	self fail ]

		on: CantSuspend 
		
		do: [ :anError | 
			
			self assert: customerBook numberOfCustomers = 1.
			
			self assert: (customerBook includesCustomerNamed: johnLennon) ]! !


!classDefinition: #Activo category: 'CodigoRepetido-Ejercicio'!
Object subclass: #Activo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!Activo methodsFor: 'as yet unclassified' stamp: 'M 4/30/2022 19:16:44'!
estaActivo
	^true.! !

!Activo methodsFor: 'as yet unclassified' stamp: 'M 4/30/2022 19:21:26'!
estaSuspendido
	^ false.! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active clientes'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'M 5/1/2022 19:57:29'!
clienteEstaSuspendido: aName
	( (clientes at: aName) estaSuspendido) ifTrue: [ ^CantSuspend signal ].! !

!CustomerBook methodsFor: 'testing' stamp: 'M 5/1/2022 20:04:35'!
clienteInexistente: aName
	( clientes includesKey: aName ) ifFalse: [ ^CantSuspend signal ].! !

!CustomerBook methodsFor: 'testing' stamp: 'M 5/1/2022 19:43:14'!
existeCliente: aName

	(clientes includesKey: aName) ifTrue: [ self signalCustomerAlreadyExists ].! !

!CustomerBook methodsFor: 'testing' stamp: 'M 5/1/2022 19:43:31'!
includesCustomerNamed: aName
	
	^ clientes includesKey: aName.! !

!CustomerBook methodsFor: 'testing' stamp: 'M 5/1/2022 19:43:26'!
isEmpty
	
	^ clientes isEmpty.! !


!CustomerBook methodsFor: 'initialization' stamp: 'M 5/1/2022 20:05:50'!
initialize
	super initialize.
	
	clientes := Dictionary new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'M 5/1/2022 19:43:20'!
addCustomerNamed: aName

	self checkNameCustomer: aName.
	
	self existeCliente: aName.
	
	clientes at: aName put: (Activo new).! !

!CustomerBook methodsFor: 'customer management' stamp: 'M 4/30/2022 18:57:44'!
checkNameCustomer: aName

	^ aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ]! !

!CustomerBook methodsFor: 'customer management' stamp: 'M 5/1/2022 19:43:10'!
numberOfActiveCustomers

	^ (clientes select: [ :unEstadoDeCliente  |  unEstadoDeCliente estaActivo  ] ) size.
! !

!CustomerBook methodsFor: 'customer management' stamp: 'M 5/1/2022 19:43:06'!
numberOfCustomers

	^ clientes size.! !

!CustomerBook methodsFor: 'customer management' stamp: 'M 5/1/2022 19:43:00'!
numberOfSuspendedCustomers

	^ (clientes select: [ :unEstadoDeCliente  |  unEstadoDeCliente estaSuspendido  ] ) size.! !

!CustomerBook methodsFor: 'customer management' stamp: 'M 5/1/2022 19:42:47'!
removeCustomerNamed: aName 

	clientes removeKey: aName ifAbsent: [ ^ NotFound signal ].! !

!CustomerBook methodsFor: 'customer management' stamp: 'M 4/28/2022 23:04:31'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'M 5/1/2022 19:42:53'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'M 5/1/2022 20:04:56'!
suspendCustomerNamed: aName 

	self checkNameCustomer: aName.
	
	self clienteInexistente: aName.
	
	self clienteEstaSuspendido: aName.
	
	clientes at: aName put: (Suspendido new).
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'M 4/30/2022 18:53:00'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'
! !

!CustomerBook class methodsFor: 'error messages' stamp: 'M 4/30/2022 19:52:08'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !


!classDefinition: #Suspendido category: 'CodigoRepetido-Ejercicio'!
Object subclass: #Suspendido
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!Suspendido methodsFor: 'as yet unclassified' stamp: 'M 4/30/2022 19:17:48'!
estaActivo
	^false.! !

!Suspendido methodsFor: 'as yet unclassified' stamp: 'M 4/30/2022 19:21:41'!
estaSuspendido
	^ true .! !


!classDefinition: #Tiempo category: 'CodigoRepetido-Ejercicio'!
Object subclass: #Tiempo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Tiempo class' category: 'CodigoRepetido-Ejercicio'!
Tiempo class
	instanceVariableNames: ''!

!Tiempo class methodsFor: 'as yet unclassified' stamp: 'M 4/30/2022 18:50:59'!
calcularIntervalo: unBloque
	| millisecondsBeforeRunning millisecondsAfterRunning |
	
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	
	unBloque value.
	
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	^ (millisecondsAfterRunning - millisecondsBeforeRunning).! !

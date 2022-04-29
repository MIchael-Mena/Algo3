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

!CustomerBookTest methodsFor: 'testing' stamp: 'M 4/29/2022 20:42:37'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| intervaloTiempo customerBook |
	
	customerBook := CustomerBook new.
	
	intervaloTiempo := Tiempo ejecucion: [ customerBook addCustomerNamed: 'John Lennon'. ].
	
	self assert: (intervaloTiempo) < (50 * millisecond)
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'M 4/29/2022 20:43:03'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| intervaloTiempo customerBook paulMcCartney |
	
	customerBook := CustomerBook new.
	
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	
	intervaloTiempo := Tiempo ejecucion: [ customerBook removeCustomerNamed: paulMcCartney.].
	
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


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'M 4/28/2022 23:03:11'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'M 4/28/2022 23:03:15'!
isEmpty

	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'M 4/28/2022 23:03:21'!
initialize

	super initialize.
	
	active := OrderedCollection new.
	
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'M 4/29/2022 19:38:57'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	
	"self checkNameCustomer"
	
	((active includes: aName) or: [suspended includes: aName]) ifTrue: [ self signalCustomerAlreadyExists ].
	
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'M 4/28/2022 23:03:33'!
numberOfActiveCustomers

	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'M 4/28/2022 23:03:36'!
numberOfCustomers

	^active size + suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'M 4/28/2022 23:03:40'!
numberOfSuspendedCustomers

	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'M 4/29/2022 19:53:26'!
removeCustomerNamed: aName 

	1 to: active size do: 
	
	[ :index |	
		aName = (active at: index)
			ifTrue: [		
				active removeAt: index.
				^ aName
			] 
	].

	1 to: suspended size do: 
	[ :index |
		aName = (suspended at: index)
			ifTrue: [
				suspended removeAt: index.
				^ aName 
			] 
	].

	^ NotFound signal.

	"active remove: aName ifAbsent: [ ^NotFound signal].
	suspended remove: aName ifAbsent: [ ^NotFound signal]."! !

!CustomerBook methodsFor: 'customer management' stamp: 'M 4/28/2022 23:04:31'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'M 4/28/2022 23:04:34'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'M 4/28/2022 23:04:45'!
suspendCustomerNamed: aName 

	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:18'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:25'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !


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

!Tiempo class methodsFor: 'as yet unclassified' stamp: 'M 4/29/2022 20:42:18'!
ejecucion: unBloque
	| millisecondsBeforeRunning millisecondsAfterRunning |
	
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	
	unBloque value.
	
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	^ (millisecondsAfterRunning - millisecondsBeforeRunning).! !

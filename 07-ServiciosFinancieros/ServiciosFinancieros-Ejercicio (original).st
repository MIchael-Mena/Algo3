!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'M 6/4/2022 18:06:53'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.
	
	self assert: 0 equals: account balance
	! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'M 6/4/2022 18:07:03'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	
	Deposit register: 100 * peso on: account.
	
	self assert: 100 * peso equals: account balance! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'M 6/4/2022 18:07:19'!
test03WithdrawDecreasesBalanceOnTransactionValue

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
	
		
	self assert: 50 * peso equals: account balance! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'M 6/4/2022 18:07:29'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'M 6/4/2022 18:07:42'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'M 6/4/2022 18:07:57'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
	
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'M 6/4/2022 18:08:09'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 50 * peso on: account.
	
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'M 6/4/2022 18:08:44'!
value 

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'M 6/4/2022 18:08:37'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
	
	^ transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'M 6/4/2022 18:08:49'!
value

	^ value! !


!Deposit methodsFor: 'as yet unclassified' stamp: 'M 6/4/2022 18:23:37'!
realizarOperacionConBalance: aBalance

	^ aBalance + self value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'M 6/4/2022 18:08:27'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'M 6/4/2022 18:08:19'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'M 6/4/2022 18:08:13'!
value

	^ value! !


!Withdraw methodsFor: 'as yet unclassified' stamp: 'M 6/4/2022 18:23:31'!
realizarOperacionConBalance: aBalance

	^ aBalance - self value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'M 6/4/2022 18:08:23'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'M 6/4/2022 18:09:04'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'M 6/4/2022 18:18:10'!
balance

	^ transactions inject: 0 into: [ :aBalance :aTransaction | aTransaction realizarOperacionConBalance: aBalance ].
	
"	^transactions sum: [ :aTransaction | aTransaction value ] ifEmpty: [ 0 ]"! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'M 6/4/2022 18:06:31'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'M 6/4/2022 18:06:40'!
register: aTransaction

	transactions add: aTransaction! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'M 6/4/2022 18:06:44'!
transactions 

	^ transactions copy! !

!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'Portfolio-extra tests' stamp: 'M 6/9/2022 14:48:11'!
test20UnPortfolioNoSePuedeAgregarUnaCuentaYaExistente

	| portfolioOne portfolioTwo account otherAccount |
	
	portfolioOne := Portfolio new.
	portfolioTwo := Portfolio new.
	account := ReceptiveAccount new.
	otherAccount := ReceptiveAccount new.
	
	portfolioOne add: account.	
	portfolioOne add: otherAccount.

	self
		should: [ 	portfolioOne add: account ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText = Portfolio accountAlreadyExistError].
		
! !

!ReceptiveAccountTest methodsFor: 'Portfolio-extra tests' stamp: 'M 6/9/2022 16:31:17'!
test21UnPortfolioNoSePuedeAgregagarASiMismo

	| portfolioOne portfolioTwo |
	
	portfolioOne := Portfolio new.
	portfolioTwo := Portfolio new.
	
"	portfolioTwo add: portfolioOne."

	self
		should: [ 	portfolioOne add: portfolioOne.
			"portfolioOne add: portfolioTwo"]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText = Portfolio portfolioMustBeDiferentError].
		
		
! !

!ReceptiveAccountTest methodsFor: 'Portfolio-extra tests' stamp: 'M 6/9/2022 16:27:00'!
test22EnUnPortfolioQueContieneOtroPortofolioNoSeLePuedeAgregarUnaCuentaYaExistente

	| portfolioOne portfolioTwo account |
	
	portfolioOne := Portfolio new.
	portfolioTwo := Portfolio new.
	account := ReceptiveAccount new.

	portfolioTwo add: account.
	portfolioOne add: portfolioTwo.

	self
		should: [ 	portfolioOne add: account.	 ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText = Portfolio accountAlreadyExistError].
		
		
! !

!ReceptiveAccountTest methodsFor: 'Portfolio-extra tests' stamp: 'M 6/9/2022 16:32:24'!
test23UnPortfolioNoPuedeAgregarOtroPortfolioQueTengaUnPortfolioConUnaCuentaYaExistente

	| portfolioOne portfolioTwo account |
	
	portfolioOne := Portfolio new.
	portfolioTwo := Portfolio new.
	account := ReceptiveAccount new.

	portfolioOne add: account.	
	portfolioTwo add: account.

	self
		should: [ 	portfolioTwo add: portfolioOne ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText = Portfolio accountAlreadyExistError].
		
		
! !


!ReceptiveAccountTest methodsFor: 'Portfolio tests' stamp: 'M 6/8/2022 23:51:04'!
test15UnPortfolioPuedeContenerUnaCuentaUOtroPortfolio

	| portfolioOne portfolioTwo accountOne  |
	
	portfolioOne := Portfolio new.
	portfolioTwo := Portfolio new.
	accountOne := ReceptiveAccount new.
	
	portfolioOne add: accountOne.
	portfolioOne add: portfolioTwo.
	
	self assert: (portfolioOne size) equals: 2.
! !

!ReceptiveAccountTest methodsFor: 'Portfolio tests' stamp: 'M 6/8/2022 19:42:29'!
test16UnPortfolioConoceSiAlgunaCuentaQueContieneRegistraUnaTransaccion

	| portfolio otherPortfolio accountOne accountTwo |
	
	portfolio := Portfolio new.
	otherPortfolio := Portfolio new.
	accountOne := ReceptiveAccount new.
	accountTwo := ReceptiveAccount new.
	
	Deposit register: 50 * peso on: accountOne.
	otherPortfolio add: accountOne.
	otherPortfolio add: accountTwo.
	portfolio add: otherPortfolio.
	
	self assert: (portfolio madeSomeTransaction).
! !

!ReceptiveAccountTest methodsFor: 'Portfolio tests' stamp: 'M 6/8/2022 19:58:56'!
test17UnPortfolioConoceSiUnaTransaccionEstaContenidaDentroDeEl

	| portfolio otherPortfolio accountOne accountTwo deposit |

	portfolio := Portfolio new.
	otherPortfolio := Portfolio new.
	accountOne := ReceptiveAccount new.
	accountTwo := ReceptiveAccount new.

	deposit := Deposit register: 50 * peso on: accountOne.
	otherPortfolio add: accountOne.
	otherPortfolio add: accountTwo.
	portfolio add: otherPortfolio.

	self assert: (portfolio hasRegistered: deposit).
! !

!ReceptiveAccountTest methodsFor: 'Portfolio tests' stamp: 'M 6/8/2022 19:54:50'!
test18ElBalanceDeUnPortfolioEsElBalanceDeLosPortfoliosYCuentasQueContiene

	| portfolio otherPortfolio accountOne accountTwo |
	
	portfolio := Portfolio new.
	otherPortfolio := Portfolio new.
	accountOne := ReceptiveAccount new.
	accountTwo := ReceptiveAccount new.
	
	Deposit register: 50 * peso on: accountOne.
	Deposit register: 100 * peso on: accountTwo.
	otherPortfolio add: accountOne.
	otherPortfolio add: accountTwo.
	portfolio add: otherPortfolio.
	
	self assert: (portfolio balance) equals: 150 * peso.! !

!ReceptiveAccountTest methodsFor: 'Portfolio tests' stamp: 'M 6/8/2022 19:54:55'!
test19UnPortfolioPuedeDevolverTodasLasTransaccionesDeSuContenido

	| portfolioOne portfolioTwo accountOne accountTwo depositOne depositTwo  |
	
	portfolioOne := Portfolio new.
	portfolioTwo := Portfolio new.
	accountOne := ReceptiveAccount new.
	accountTwo := ReceptiveAccount new.
	
	depositOne := Deposit register: 100* peso on: accountOne.
	depositTwo := Deposit register: 50* peso on: accountTwo. 
	portfolioOne add: accountOne.	
	portfolioOne add: portfolioTwo.	
	portfolioTwo add: accountTwo.

	self assert: (OrderedCollection with: depositOne with: depositTwo) equals: (portfolioOne transactions) 
! !


!ReceptiveAccountTest methodsFor: 'Transference tests' stamp: 'M 6/8/2022 00:44:03'!
test08TransferenciaEntreDosCuentasReduceElBalanceDeLaCuentaExtraidaYIncrementaElBalanceDeLaCuentaDepositadaPorElValorDeLaTransaccion

	| accountToWithdraw accountToDeposit |
	
	accountToDeposit := ReceptiveAccount new.
	accountToWithdraw := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: accountToWithdraw.
	Transference register: 25 * peso toWithdrawFrom: accountToWithdraw andDepositOn: accountToDeposit.
	
	self assert: 75 * peso equals: accountToWithdraw balance.
	self assert: 25 * peso equals: accountToDeposit balance.! !

!ReceptiveAccountTest methodsFor: 'Transference tests' stamp: 'M 6/8/2022 18:41:33'!
test09EnUnaTransaccionEntreDosCuentasAmbasRegistranLaTransferencia

	| accountToWithdraw accountToDeposit transferencia |
	
	accountToDeposit := ReceptiveAccount new.
	accountToWithdraw := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: accountToWithdraw.
	transferencia := Transference register: 25 * peso toWithdrawFrom: accountToWithdraw andDepositOn: accountToDeposit.
	
	self assert: (accountToDeposit hasRegistered: transferencia).
	self assert: (accountToDeposit amountOfTransactionsDone) equals: 1.
	
	self assert: (accountToWithdraw hasRegistered: transferencia).
	self assert: (accountToWithdraw amountOfTransactionsDone) equals: 2.! !

!ReceptiveAccountTest methodsFor: 'Transference tests' stamp: 'M 6/8/2022 20:04:42'!
test10UnaCuentaConoceSuContraparteDeLaTransaccion

	| accountToWithdraw accountToDeposit transference |
	
	accountToDeposit := ReceptiveAccount new.
	accountToWithdraw := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: accountToWithdraw.
	transference := Transference register: 25 * peso toWithdrawFrom: accountToWithdraw andDepositOn: accountToDeposit.
	
	self assert: (accountToDeposit pataExtraccionDeTransferencia: transference) equals: accountToWithdraw.
	self assert: (accountToDeposit pataDepositoDeTransferencia: transference) equals: accountToDeposit.

	self assert: (accountToWithdraw pataExtraccionDeTransferencia: transference) equals: accountToWithdraw.
	self assert: (accountToWithdraw pataDepositoDeTransferencia: transference) equals: accountToDeposit.
	! !

!ReceptiveAccountTest methodsFor: 'Transference tests' stamp: 'M 6/8/2022 18:11:39'!
test11NoSePuedePedirLaPataDeUnRetiroODeposito

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 25 * peso on: account.
	
	self
		should: [ account pataDepositoDeTransferencia: deposit.
			account pataExtraccionDeTransferencia: withdraw.
			]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText = ReceptiveAccount transactiontInvalidError ].
! !

!ReceptiveAccountTest methodsFor: 'Transference tests' stamp: 'M 6/9/2022 15:34:08'!
test12NoSePuedePedirLaPataDeUnaTransferenciaNoRegistrada

	| accountToDeposit accountToWithdraw otherAccount transeference|
	
	accountToDeposit := ReceptiveAccount new.
	accountToWithdraw := ReceptiveAccount new.
	otherAccount := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: accountToWithdraw.
	transeference _ Transference register: 25 * peso toWithdrawFrom: accountToWithdraw andDepositOn: accountToDeposit.
	
	self
		should: [ otherAccount pataDepositoDeTransferencia: transeference.
			otherAccount pataExtraccionDeTransferencia: transeference. ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText = ReceptiveAccount transactionNotRegisteredError ].
! !

!ReceptiveAccountTest methodsFor: 'Transference tests' stamp: 'M 6/8/2022 00:44:11'!
test13UnaTransferenciaSeRealizaEntreDosCuentasDiferentes

	| account |
	
	account := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: account.
	
	self
		should: [ Transference register: 25 * peso toWithdrawFrom: account andDepositOn: account.]
		raise: Error
		withExceptionDo: [ :anError |
					self assert: anError messageText = Transference accountMustBeDiferentError ].! !

!ReceptiveAccountTest methodsFor: 'Transference tests' stamp: 'M 6/9/2022 15:34:29'!
test14UnaTransaccionDebeTenerValorMayorACero

	| account |
	
	account := ReceptiveAccount new.
	
	self
		should: [ Transference register: 0 * peso toWithdrawFrom: account andDepositOn: account.
			Deposit register: -1 * peso on: account.
			Withdraw register: -50 * peso on: account ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText = AccountTransaction transactionInvalidValueError ].! !

!ReceptiveAccountTest methodsFor: 'Transference tests' stamp: 'M 6/8/2022 18:15:53'!
testUnaCuentaConoceSuContraparteDeLaTransaccion

	| accountToWithdraw accountToDeposit transference |
	
	accountToDeposit := ReceptiveAccount new.
	accountToWithdraw := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: accountToWithdraw.
	transference := Transference register: 25 * peso toWithdrawFrom: accountToWithdraw andDepositOn: accountToDeposit.
	
	self assert: (accountToDeposit pataExtraccionDeTransferencia: transference) equals: accountToWithdraw.
	self assert: (accountToDeposit pataDepositoDeTransferencia: transference) equals: accountToDeposit.
	
	self assert: (accountToWithdraw pataExtraccionDeTransferencia: transference) equals: accountToWithdraw.
	self assert: (accountToWithdraw pataDepositoDeTransferencia: transference) equals: accountToDeposit.! !


!ReceptiveAccountTest methodsFor: 'Deposit and Withdraw tests' stamp: 'M 6/8/2022 00:46:17'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.
	
	self assert: 0 equals: account balance! !

!ReceptiveAccountTest methodsFor: 'Deposit and Withdraw tests' stamp: 'M 6/8/2022 00:46:27'!
test02DepositIncreasesBalanceOnTransactionValue

	| account |
	
	account := ReceptiveAccount  new.
	
	Deposit register: 100 * peso on: account.
	
	self assert: 100 * peso equals: account balance! !

!ReceptiveAccountTest methodsFor: 'Deposit and Withdraw tests' stamp: 'M 6/8/2022 00:46:37'!
test03WithdrawDecreasesBalanceOnTransactionValue

	| account |
	
	account := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
	
	self assert: 50 * peso equals: account balance! !

!ReceptiveAccountTest methodsFor: 'Deposit and Withdraw tests' stamp: 'M 6/8/2022 00:46:46'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value! !

!ReceptiveAccountTest methodsFor: 'Deposit and Withdraw tests' stamp: 'M 6/8/2022 00:46:59'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
	
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).! !

!ReceptiveAccountTest methodsFor: 'Deposit and Withdraw tests' stamp: 'M 6/8/2022 00:47:18'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
	
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).! !

!ReceptiveAccountTest methodsFor: 'Deposit and Withdraw tests' stamp: 'M 6/8/2022 18:41:39'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 50 * peso on: account.
	
	self assert: 1 equals: account amountOfTransactionsDone.
	self assert: (account hasRegistered: deposit).
	
"	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit)."! !

!ReceptiveAccountTest methodsFor: 'Deposit and Withdraw tests' stamp: 'M 6/8/2022 00:26:00'!
testUnaCuentaSolamenteConoceSusTransaccionesRegistradas

	| account accountTwo accountThree accountFour deposit  otherDeposit  transference otherTranseference |

	account := ReceptiveAccount new.
	accountTwo := ReceptiveAccount new.
	accountThree := ReceptiveAccount new.
	accountFour := ReceptiveAccount new.
	
	otherDeposit := Deposit register: 100 * peso on: accountTwo.
	deposit := Deposit register: 100 * peso on: account.

	transference := Transference register: 50 * peso toWithdrawFrom: account andDepositOn: accountTwo.
	otherTranseference :=Transference register: 50 * peso toWithdrawFrom:  accountThree andDepositOn: accountFour .
		
	self deny: (account hasRegistered: otherDeposit).
	self deny: (account hasRegistered: otherTranseference).
	
	self assert: (account hasRegistered: transference).
	self assert: (account hasRegistered: deposit).

! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'operations' stamp: 'M 6/8/2022 18:52:21'!
makeOperationWithBalance: aBalance  

	self subclassResponsibility.! !


!AccountTransaction methodsFor: 'value' stamp: 'M 6/7/2022 20:11:29'!
value 

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'M 6/5/2022 21:06:07'!
register: aValue on: account

	| transaction |
	
	(aValue < (1 * peso) ) ifTrue: [ self error: AccountTransaction transactionInvalidValueError.].
	
	transaction := self for: aValue.
	account register: transaction.
	
	^ transaction! !


!AccountTransaction class methodsFor: 'error description' stamp: 'M 6/8/2022 18:20:35'!
transactionInvalidValueError

	^ 'El valor de una transacción debe ser mayor a cero.'! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'M 6/7/2022 20:11:38'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'M 6/7/2022 20:11:47'!
value

	^ value! !


!Deposit methodsFor: 'operations' stamp: 'M 6/8/2022 18:52:21'!
makeOperationWithBalance: aBalance  

	^ aBalance + self value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'M 6/8/2022 18:18:42'!
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


!Withdraw methodsFor: 'operations' stamp: 'M 6/8/2022 18:52:21'!
makeOperationWithBalance: aBalance  

	^ aBalance - self value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'M 6/8/2022 18:18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Activos category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Activos
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Activos methodsFor: 'as yet unclassified' stamp: 'M 6/8/2022 19:52:03'!
balance

	self subclassResponsibility! !

!Activos methodsFor: 'as yet unclassified' stamp: 'M 6/8/2022 19:51:57'!
hasRegistered: aTransaction

	self subclassResponsibility ! !

!Activos methodsFor: 'as yet unclassified' stamp: 'M 6/8/2022 19:51:48'!
madeSomeTransaction

	self subclassResponsibility ! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
Activos subclass: #Portfolio
	instanceVariableNames: 'portfolio'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'main protocol' stamp: 'M 6/9/2022 15:51:04'!
add: aPortfolio
	
	self validatePortfolio: aPortfolio.
	
	self validateAccountAlreadyExist: aPortfolio.

	portfolio add: aPortfolio.! !

!Portfolio methodsFor: 'main protocol' stamp: 'M 6/9/2022 16:33:09'!
balance

	^ portfolio sum: [ :anAccount | anAccount balance] ifEmpty: [^0].! !

!Portfolio methodsFor: 'main protocol' stamp: 'M 6/8/2022 19:32:34'!
madeSomeTransaction

	^ portfolio anySatisfy: [ :aAccount | aAccount madeSomeTransaction]! !

!Portfolio methodsFor: 'main protocol' stamp: 'M 6/8/2022 23:51:04'!
size

	^ portfolio size! !


!Portfolio methodsFor: 'accessing' stamp: 'M 6/7/2022 20:12:21'!
transactions

	| transactions |
	
	transactions := OrderedCollection new.
	
	portfolio do: [ :aAccount | transactions addAll: aAccount transactions].
	
	^ transactions ! !


!Portfolio methodsFor: 'initialization' stamp: 'M 6/7/2022 20:12:30'!
initialize

	portfolio := OrderedCollection new.! !


!Portfolio methodsFor: 'testing' stamp: 'M 6/9/2022 16:20:57'!
containsTo: aPortfolio

	^ (self verifyIfIContainA: aPortfolio) 
	ifTrue: [ self error: Portfolio accountAlreadyExistError ]
	ifFalse: [ ^false.]! !

!Portfolio methodsFor: 'testing' stamp: 'M 6/8/2022 20:03:00'!
hasRegistered: aTransaction

	^ portfolio anySatisfy: [ :aAccount | aAccount hasRegistered: aTransaction].
! !

!Portfolio methodsFor: 'testing' stamp: 'M 6/9/2022 16:21:09'!
validateAccountAlreadyExist: aPortfolio

	^ (self verifyIfIContainA: aPortfolio) 
	ifTrue: [ self error: Portfolio accountAlreadyExistError ]
	ifFalse: [ ^false.].

! !

!Portfolio methodsFor: 'testing' stamp: 'M 6/9/2022 15:52:28'!
validatePortfolio: aPortfolio

	(aPortfolio == self) 
	ifTrue: [ self error: Portfolio portfolioMustBeDiferentError ]
	ifFalse: []! !

!Portfolio methodsFor: 'testing' stamp: 'M 6/9/2022 16:20:11'!
verifyIfIContainA: aPortfolio

	^ portfolio anySatisfy: [ :otherPortfolio | 
		
		
		(otherPortfolio isKindOf: ReceptiveAccount) 
		ifTrue: [ 
			(aPortfolio isKindOf: ReceptiveAccount) ifTrue: [^ otherPortfolio == aPortfolio].
			(aPortfolio isKindOf: Portfolio) ifTrue: [ ^ aPortfolio verifyIfIContainA: otherPortfolio].
			].
		
		(otherPortfolio isKindOf: Portfolio ) 
		ifTrue: [ 
"			(aPortfolio isKindOf: Portfolio ) ifTrue: [ otherPortfolio validatePortfolio: aPortfolio ]."
			^ otherPortfolio verifyIfIContainA: aPortfolio 
			].
		
	].
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'error description' stamp: 'M 6/8/2022 20:13:37'!
accountAlreadyExistError

	^ 'La cuenta ya existe en el portfolio'! !

!Portfolio class methodsFor: 'error description' stamp: 'M 6/8/2022 23:40:57'!
portfolioMustBeDiferentError

	^ 'Un portfolio no se puede agregar a si mismo'! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Activos subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'M 6/7/2022 19:55:52'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'M 6/7/2022 19:55:34'!
amountOfTransactionsDone

	^ transactions size.! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'M 6/8/2022 18:52:21'!
balance

	^ transactions inject: 0 into: [ :aBalance :aTransaction | aTransaction makeOperationWithBalance: aBalance ].
	
"	^transactions sum: [ :aTransaction | aTransaction value ] ifEmpty: [ 0 ]"! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'M 6/8/2022 19:50:14'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'M 6/7/2022 20:17:01'!
madeSomeTransaction

	^ transactions isEmpty.! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'M 6/7/2022 19:53:21'!
register: aTransaction

	transactions add: aTransaction! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'M 6/7/2022 19:53:42'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'transference operations' stamp: 'M 6/8/2022 18:08:31'!
pataDepositoDeTransferencia: aTransference

	^ (self validateTransference: aTransference) pataDeposito.
	! !

!ReceptiveAccount methodsFor: 'transference operations' stamp: 'M 6/8/2022 19:53:41'!
pataExtraccionDeTransferencia: aTransference

	^ (self validateTransference: aTransference) pataExtraccion.! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'M 6/8/2022 18:17:50'!
validateTransference: aTransference

	( (aTransference isKindOf: Withdraw) or: [ aTransference isKindOf: Deposit ]) ifTrue: [ self error: ReceptiveAccount transactiontInvalidError].

	^ (transactions detect: [ :transaction | transaction = aTransference] ifNone: [ self error: ReceptiveAccount transactionNotRegisteredError])! !


!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'M 6/8/2022 20:42:04'!
estoyDentroDelPortfolio: aPortfolio

	^ aPortfolio validateAccountAlreadyExist: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ReceptiveAccount class' category: 'ServiciosFinancieros-Ejercicio'!
ReceptiveAccount class
	instanceVariableNames: ''!

!ReceptiveAccount class methodsFor: 'error description' stamp: 'M 6/8/2022 18:17:50'!
transactionNotRegisteredError

	^ 'La transaccion no fue registrada'! !

!ReceptiveAccount class methodsFor: 'error description' stamp: 'M 6/8/2022 18:12:44'!
transactiontInvalidError

	^ 'Solo se puede pedir la pata deposito o retiro a una transferencia.'! !


!classDefinition: #Transference category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transference
	instanceVariableNames: 'value accountToWithdraw accountToDeposit'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transference methodsFor: 'main protocol' stamp: 'M 6/8/2022 17:41:50'!
pataDeposito

	^ accountToDeposit.! !

!Transference methodsFor: 'main protocol' stamp: 'M 6/8/2022 17:42:01'!
pataExtraccion

	^ accountToWithdraw.! !


!Transference methodsFor: 'initialization' stamp: 'M 6/8/2022 17:36:46'!
initializeRegister: aValue toWithdrawFrom: anAccountToWithdraw andDepositOn: anAccountToDeposit 
	
	value := aValue.
	accountToWithdraw := anAccountToWithdraw.
	accountToDeposit := anAccountToDeposit.! !


!Transference methodsFor: 'accessing' stamp: 'M 6/7/2022 19:50:30'!
value

	^value ! !


!Transference methodsFor: 'comparing' stamp: 'M 6/8/2022 20:53:27'!
= aTransference

	^ (aTransference transference == self) or: [ self == aTransference ]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transference class' category: 'ServiciosFinancieros-Ejercicio'!
Transference class
	instanceVariableNames: ''!

!Transference class methodsFor: 'instance creation' stamp: 'M 6/8/2022 17:34:59'!
register: aValue toWithdrawFrom: anAccountToWithdraw andDepositOn: anAccountToDeposit 

	| transference |
	
	self validateValue: aValue .
	
	self validateTransferenceBetween: anAccountToWithdraw and: anAccountToDeposit.

	transference := self new initializeRegister: aValue toWithdrawFrom: anAccountToWithdraw andDepositOn: anAccountToDeposit.

	anAccountToDeposit register: (TransferenceDeposit withReference: transference).
	anAccountToWithdraw register: (TransferenceWithdraw withReference: transference ).

	^ transference.! !


!Transference class methodsFor: 'testing' stamp: 'M 6/7/2022 20:05:57'!
validateTransferenceBetween: anAccountToWithdraw and: anAccountToDeposit.

	(anAccountToWithdraw == anAccountToDeposit) ifTrue: [ self error: Transference accountMustBeDiferentError ].! !

!Transference class methodsFor: 'testing' stamp: 'M 6/7/2022 20:06:01'!
validateValue: aValue

	(aValue < (1*peso)) ifTrue: [ self error: AccountTransaction transactionInvalidValueError.].! !


!Transference class methodsFor: 'error description' stamp: 'M 6/7/2022 20:06:07'!
accountMustBeDiferentError

	^ 'Para realizar una transferencia las cuentas deben ser diferentes.'! !


!classDefinition: #TransferenceDeposit category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #TransferenceDeposit
	instanceVariableNames: 'accountToWithdraw transference'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferenceDeposit methodsFor: 'initialization' stamp: 'M 6/8/2022 17:37:12'!
initializeWithReference: aTransference 
	
	transference := aTransference.! !


!TransferenceDeposit methodsFor: 'accessing' stamp: 'M 6/8/2022 12:52:24'!
transference

	^ transference! !


!TransferenceDeposit methodsFor: 'main protocol' stamp: 'M 6/8/2022 18:52:21'!
makeOperationWithBalance: aBalance 

	^ aBalance + transference value.! !

!TransferenceDeposit methodsFor: 'main protocol' stamp: 'M 6/8/2022 17:44:01'!
pataDeposito

	^ transference pataDeposito .! !

!TransferenceDeposit methodsFor: 'main protocol' stamp: 'M 6/8/2022 17:44:23'!
pataExtraccion

	^ transference pataExtraccion .! !


!TransferenceDeposit methodsFor: 'comparing' stamp: 'M 6/8/2022 13:25:12'!
= aTrasference

	^ (transference == aTrasference) | (self == aTrasference).
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferenceDeposit class' category: 'ServiciosFinancieros-Ejercicio'!
TransferenceDeposit class
	instanceVariableNames: ''!

!TransferenceDeposit class methodsFor: 'instance creation' stamp: 'M 6/8/2022 17:37:00'!
withReference: aTransference 

	^self new initializeWithReference: aTransference ! !


!classDefinition: #TransferenceWithdraw category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #TransferenceWithdraw
	instanceVariableNames: 'accountToDeposit transference'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferenceWithdraw methodsFor: 'accessing' stamp: 'M 6/8/2022 12:52:30'!
transference

	^ transference! !


!TransferenceWithdraw methodsFor: 'initialization' stamp: 'M 6/8/2022 17:37:32'!
initializeWithReference: aTransference 

	transference := aTransference.! !


!TransferenceWithdraw methodsFor: 'comparing' stamp: 'M 6/8/2022 13:25:17'!
= aTrasference

	^ (transference == aTrasference) | (self == aTrasference).! !


!TransferenceWithdraw methodsFor: 'main protocol' stamp: 'M 6/8/2022 18:52:21'!
makeOperationWithBalance: aBalance 

	^ aBalance - transference value.! !

!TransferenceWithdraw methodsFor: 'main protocol' stamp: 'M 6/8/2022 18:15:23'!
pataDeposito

	^ transference pataDeposito.! !

!TransferenceWithdraw methodsFor: 'main protocol' stamp: 'M 6/8/2022 18:15:33'!
pataExtraccion

	^ transference pataExtraccion.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferenceWithdraw class' category: 'ServiciosFinancieros-Ejercicio'!
TransferenceWithdraw class
	instanceVariableNames: ''!

!TransferenceWithdraw class methodsFor: 'instance creation' stamp: 'M 6/8/2022 17:37:23'!
withReference: aTransference 

	^self new initializeWithReference: aTransference ! !

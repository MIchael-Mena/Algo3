!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'Portfolios tests' stamp: 'Modelando(11-04) 6/6/2022 21:18:15'!
test14ElBalanceDeUnPortfolioEsElBalanceDeLoQueContiene

	| portfolio accountOne accountTwo |

	portfolio := Portfolio new.
	
	accountOne := ReceptiveAccount new.
	Deposit register: 50 * peso on: accountOne.
	accountTwo := ReceptiveAccount new.
	Deposit register: 100 * peso on: accountTwo.
	
	portfolio add: accountOne.
	portfolio add: accountTwo.
	
	self assert: (portfolio balance) equals: 150 * peso.! !

!ReceptiveAccountTest methodsFor: 'Portfolios tests' stamp: 'Modelando(11-04) 6/6/2022 21:18:23'!
test15ElPortfolioTieneAlgunaCuentaQueRegistreUnaTransaccion

	| portfolio accountOne accountTwo |

	portfolio := Portfolio new.
	
	accountOne := ReceptiveAccount new.
	Deposit register: 50 * peso on: accountOne.
	accountTwo := ReceptiveAccount new.
	
	portfolio add: accountOne.
	portfolio add: accountTwo.
	
	self assert: (portfolio someAccountRegisterTransaction).


! !

!ReceptiveAccountTest methodsFor: 'Portfolios tests' stamp: 'Modelando(11-04) 6/6/2022 21:18:28'!
test16UnPortfolioPuedeContenerUnaCuentaUOtroPortfolio

	| portfolioOne portfolioTwo accountOne  |

	portfolioOne := Portfolio new.
	portfolioTwo := Portfolio new.
	accountOne := ReceptiveAccount new.
	
	portfolioOne add: accountOne.
	portfolioOne add: portfolioTwo.
	
	self assert: (portfolioOne cantidadDeCuentasOPortfolios) equals: 2.

! !

!ReceptiveAccountTest methodsFor: 'Portfolios tests' stamp: 'Modelando(11-04) 6/6/2022 21:18:33'!
test17UnPortfolioMeDevuelveTodasLasTransaccionesDeSuContenido

	| portfolioOne portfolioTwo accountOne accountTwo depositOne depositTwo array |

	array := OrderedCollection new.
	
	portfolioOne := Portfolio new.
	portfolioTwo := Portfolio new.
	accountOne := ReceptiveAccount new.
	accountTwo := ReceptiveAccount new.
	depositOne := Deposit register: 100* peso on: accountOne.
	depositTwo := Deposit register: 50* peso on: accountTwo. 
	
	portfolioOne add: accountOne.
	portfolioOne add: portfolioTwo.
	portfolioTwo add: accountTwo.

	array add: depositOne .		
	array add: depositTwo .
	
	self assert: array equals: (portfolioOne transactions) 

! !


!ReceptiveAccountTest methodsFor: 'Transference tests' stamp: 'Modelando(11-04) 6/6/2022 21:02:11'!
test08TransferenciaEntreDosCuentasReduceElBalanceDeLaCuentaExtraidaYIncrementaElBalanceDeLaCuentaDepositadaPorElValorDeLaTransaccion

	| accountToWithdraw accountToDeposit |
	
	accountToDeposit := ReceptiveAccount new.
	accountToWithdraw := ReceptiveAccount new.
	Deposit register: 100 * peso on: accountToWithdraw.

	Transference register: 25 * peso toWithdrawFrom: accountToWithdraw andDepositOn: accountToDeposit.

	self assert: 75 * peso equals: accountToWithdraw balance.
	self assert: 25 * peso equals: accountToDeposit balance.
	
! !

!ReceptiveAccountTest methodsFor: 'Transference tests' stamp: 'Modelando(11-04) 6/6/2022 21:02:11'!
test09EnUnaTransaccionEntreDosCuentasAmbasRegistranLaTransferencia

	| accountToWithdraw accountToDeposit transferencia |
	
	accountToDeposit := ReceptiveAccount new.
	accountToWithdraw := ReceptiveAccount new.
	Deposit register: 100 * peso on: accountToWithdraw.
	
	transferencia := Transference register: 25 * peso toWithdrawFrom: accountToWithdraw andDepositOn: accountToDeposit.
	
	self assert: (accountToDeposit registerATransaction: transferencia).
	self assert: (accountToDeposit amountOfTransactionsDone) equals: 1.
	
	self assert: (accountToWithdraw registerATransaction: transferencia).
	self assert: (accountToWithdraw amountOfTransactionsDone) equals: 2.! !

!ReceptiveAccountTest methodsFor: 'Transference tests' stamp: 'Modelando(11-04) 6/6/2022 21:02:11'!
test10UnaCuentaConoceSuContraparteDeLaTransaccion

	| accountToWithdraw accountToDeposit transference |

	accountToDeposit := ReceptiveAccount new.
	accountToWithdraw := ReceptiveAccount new.
	Deposit register: 100 * peso on: accountToWithdraw.

	transference := Transference register: 25 * peso toWithdrawFrom: accountToWithdraw andDepositOn: accountToDeposit.
	
"	self assert: (accountToDeposit contraparteDeTransaccionDeposit: transference) equals: accountToWithdraw.
	self assert: (accountToDeposit contraparteDeTransaccionWithdraw: transference) equals: accountToDeposit.
	
	self assert: (accountToWithdraw contraparteDeTransaccionWithdraw: transference) equals: accountToDeposit."
	
	self assert: (accountToDeposit contraparteDeTransaccion: transference) equals: accountToWithdraw.
	self assert: (accountToWithdraw contraparteDeTransaccion: transference) equals: accountToDeposit.! !

!ReceptiveAccountTest methodsFor: 'Transference tests' stamp: 'M 6/5/2022 20:34:55'!
test11NoSePuedePedirLaContraparteDeUnRetiroODeposito

	| account deposit withdraw |

	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 25 * peso on: account.

	self
		should: [ account contraparteDeTransaccion: deposit.
			account contraparteDeTransaccion: withdraw.
			]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText = ReceptiveAccount contrapartInvalidError ].

"	self assert: (account contraparteDeTransaccionDeposit: deposit) equals: account.
	self assert: (account contraparteDeTransaccionWithdraw: deposit) equals: account.
	"
! !

!ReceptiveAccountTest methodsFor: 'Transference tests' stamp: 'Modelando(11-04) 6/6/2022 21:02:11'!
test12UnaTransferenciaSeRealizaEntreDosCuentasDiferentes

	| account |

	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.

	self
		should: [ Transference register: 25 * peso toWithdrawFrom: account andDepositOn: account.]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText = Transference accountMustBeDiferentError ].
! !

!ReceptiveAccountTest methodsFor: 'Transference tests' stamp: 'Modelando(11-04) 6/6/2022 21:02:11'!
test13UnaTransaccionDebeTenerValorMayorACero

	| account |

	account := ReceptiveAccount new.

	self
		should: [ Transference register: 0 * peso toWithdrawFrom: account andDepositOn: account.
			Deposit register: -1 * peso on: account.
			Withdraw register: -50 * peso on: account ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText = AccountTransaction transactionInvalidValueError ].
! !


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

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'M 6/5/2022 23:11:02'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 50 * peso on: account.
	
	self assert: 1 equals: account amountOfTransactionsDone.
	self assert: (account registerATransaction: deposit).
	
"	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit)."! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'M 6/4/2022 20:48:57'!
testLaCuentaConoceLaTransaccionRegistrada

	| account deposit withdraw otherDeposit asd|
	
	asd := ReceptiveAccount new.
	otherDeposit := Deposit register: 100 * peso on: asd.
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self deny: (account hasRegistered: otherDeposit).
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'M 6/4/2022 18:08:44'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'as yet unclassified' stamp: 'M 6/6/2022 17:52:52'!
realizarOperacionConBalance: aBalance paraLaCuenta: aAccount 

	self subclassResponsibility.! !

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


!AccountTransaction class methodsFor: 'as yet unclassified' stamp: 'M 6/5/2022 20:53:57'!
transactionInvalidValueError

	^ 'El valor de una transacción debe ser mayor a cero.'! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'M 6/4/2022 18:50:34'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'M 6/4/2022 18:08:49'!
value

	^ value! !


!Deposit methodsFor: 'as yet unclassified' stamp: 'M 6/6/2022 17:52:52'!
realizarOperacionConBalance: aBalance paraLaCuenta: aAccount 

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


!Withdraw methodsFor: 'as yet unclassified' stamp: 'M 6/6/2022 17:52:52'!
realizarOperacionConBalance: aBalance paraLaCuenta: aAccount 

	^ aBalance - self value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'M 6/4/2022 18:08:23'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Portfolio
	instanceVariableNames: 'portfolio'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'as yet unclassified' stamp: 'Modelando(11-04) 6/6/2022 21:13:24'!
add: aAccount

	portfolio add: aAccount.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'Modelando(11-04) 6/6/2022 21:13:24'!
balance

	^ portfolio sum: [ :aAccount | aAccount balance] ifEmpty: [^0].
	
"	^ cuentas inject: 0 into: [ :aBalance : aAccount | aAccount balance]. "! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'Modelando(11-04) 6/6/2022 21:13:24'!
cantidadDeCuentasOPortfolios

	^ portfolio size! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'Modelando(11-04) 6/6/2022 21:13:24'!
initialize

	portfolio := OrderedCollection new.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'Modelando(11-04) 6/6/2022 21:13:24'!
someAccountRegisterTransaction

	^ portfolio anySatisfy: [ :aAccount | aAccount realizoAlgunaTransaccion]! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'Modelando(11-04) 6/6/2022 21:13:24'!
transactions
	
	| transactions |
	
	transactions := OrderedCollection new.
	
	portfolio do: [ :aAccount | transactions addAll: aAccount transactions].
	
	^ transactions ! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'M 6/4/2022 18:09:04'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'M 6/6/2022 17:53:50'!
balance

	^ transactions inject: 0 into: [ :aBalance :aTransaction | aTransaction realizarOperacionConBalance: aBalance paraLaCuenta: self ].
	
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


!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'M 6/5/2022 20:07:53'!
aaa: aAccount! !

!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'M 6/4/2022 21:02:35'!
amountOfTransactionsDone

	^ transactions size.! !

!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'M 6/5/2022 20:34:55'!
contraparteDeTransaccion: aTransaction

	( (aTransaction isKindOf: Withdraw) or: [ aTransaction isKindOf: Deposit ]) ifTrue: [ self error: ReceptiveAccount contrapartInvalidError].

	^ aTransaction contraparteDeUnaCuenta: self.



! !

!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'M 6/5/2022 19:19:58'!
contraparteDeTransaccionDeposit: aTransaction

	(transactions includes: aTransaction) 
	ifTrue: [ ^ aTransaction pataExtraccion]
	ifFalse: [ self error: Error].! !

!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'M 6/5/2022 19:20:07'!
contraparteDeTransaccionWithdraw: aTransaction

	(transactions includes: aTransaction) 
	ifTrue: [ ^ aTransaction pataDeposito]
	ifFalse: [ self error: Error].! !

!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'M 6/5/2022 23:24:41'!
realizoAlgunaTransaccion

	^ transactions isEmpty.! !

!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'M 6/5/2022 23:11:02'!
registerATransaction: aDeposit 

	^ transactions includes: aDeposit.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ReceptiveAccount class' category: 'ServiciosFinancieros-Ejercicio'!
ReceptiveAccount class
	instanceVariableNames: ''!

!ReceptiveAccount class methodsFor: 'as yet unclassified' stamp: 'M 6/5/2022 20:34:55'!
contrapartInvalidError

	^ 'Un deposito o retiro no tienen contraparte.'! !


!classDefinition: #Transference category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transference
	instanceVariableNames: 'value accountParaRetirar accountParaDepositar'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transference methodsFor: 'initialization' stamp: 'M 6/5/2022 19:40:58'!
initializeRegister: aValue toDebitOn: aAccountToDebit andAccreditOn: aAccountToAccredit 

	value := aValue.
	accountParaRetirar := aAccountToDebit.
	accountParaDepositar := aAccountToAccredit.! !


!Transference methodsFor: 'as yet unclassified' stamp: 'M 6/5/2022 20:31:26'!
contraparteDeUnaCuenta: aAccount

"	^ aAccount aaa: accountParaRetirar."

	(accountParaRetirar == aAccount)
	ifTrue: [ ^  accountParaDepositar]
	ifFalse: [ ^  accountParaRetirar]
	! !

!Transference methodsFor: 'as yet unclassified' stamp: 'M 6/5/2022 19:40:58'!
pataDeposito

	^ accountParaDepositar.
	! !

!Transference methodsFor: 'as yet unclassified' stamp: 'M 6/5/2022 19:40:49'!
pataExtraccion

	^ accountParaRetirar.
	! !

!Transference methodsFor: 'as yet unclassified' stamp: 'Modelando(11-04) 6/6/2022 21:04:58'!
realizarOperacionConBalance: aBalance paraLaCuenta: aAccount 

	 aAccount .
	(accountParaRetirar == aAccount) 
	ifTrue: [ ^ aBalance -  value].
	
	(accountParaDepositar == aAccount )
	ifTrue: [^ aBalance +  value]! !

!Transference methodsFor: 'as yet unclassified' stamp: 'Modelando(11-04) 6/6/2022 21:01:54'!
value

	^value ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transference class' category: 'ServiciosFinancieros-Ejercicio'!
Transference class
	instanceVariableNames: ''!

!Transference class methodsFor: 'instance creation' stamp: 'M 6/6/2022 17:46:48'!
register: aValue toWithdrawFrom: aAccountToDebit andDepositOn: aAccountToAccredit 

	| transference |

	self validateValue: aValue .
	self validateTransferenceBetween: aAccountToDebit and: aAccountToAccredit.

"	Withdraw register: aValue on: aAccountToDebit.
	Deposit register: aValue on: aAccountToAccredit."
	
	transference := self new initializeRegister: aValue toDebitOn: aAccountToDebit andAccreditOn: aAccountToAccredit.
	
"	transferenceParaRetirar := self new initializeRegister: aValue toDebitOn: aAccountToDebit.
	transferenceParaDepositar := self new initializeRegister: aValue andAccreditOn: aAccountToAccredit."
	
	aAccountToDebit register: transference.
	aAccountToAccredit register: transference.
	
"	aAccountToAccredit register: (TransferenceDeposit register: aValue withdrawnFrom: aAccountToDebit ).
	aAccountToDebit register: (TransferenceWithdraw register: aValue depositedOn: aAccountToAccredit )."

	^ transference.! !


!Transference class methodsFor: 'as yet unclassified' stamp: 'M 6/5/2022 20:37:40'!
accountMustBeDiferentError

	^ 'Para realizar una transferencia las cuentas deben ser diferentes.'! !

!Transference class methodsFor: 'as yet unclassified' stamp: 'Modelando(11-04) 6/6/2022 21:02:11'!
validateTransferenceBetween: aAccountToDebit and: aAccountToAccredit.

	(aAccountToDebit == aAccountToAccredit) ifTrue: [ self error: Transference accountMustBeDiferentError ].! !

!Transference class methodsFor: 'as yet unclassified' stamp: 'M 6/5/2022 21:06:26'!
validateValue: aValue

	(aValue < (1*peso)) ifTrue: [ self error: AccountTransaction transactionInvalidValueError.].! !


!classDefinition: #TransferenceDeposit category: 'ServiciosFinancieros-Ejercicio'!
Transference subclass: #TransferenceDeposit
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!


!classDefinition: #TransferenceWithdraw category: 'ServiciosFinancieros-Ejercicio'!
Transference subclass: #TransferenceWithdraw
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

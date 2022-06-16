!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:16:26'!
test01BalanceOfPortfolioWithoutAccountsIsZero

	self assert: 0 equals: Portfolio new balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:00'!
test02BalanceOfPortfolioWithOneAccountIsAccountBalance

	| account portfolio |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	self assert: account balance equals: portfolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:06'!
test03BalanceOfPortfolioIsCalculatedRecursivelyOnPortfolios

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortofolio |
	
	simplePortfolioAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortofolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolioAccount balance + simplePortfolio balance) equals: composedPortofolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:12'!
test04PortfolioWithoutAccountsHasNoRegisteredTransaction

	self deny: (Portfolio new hasRegistered: (Deposit for: 100 * peso))! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:18'!
test05PortfolioHasRegisteredItsAccountsTransactions

	| account portfolio deposit |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	self assert: (portfolio hasRegistered: deposit)! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:26'!
test06PortfolioLooksForRegisteredTransactionsRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolio hasRegistered: simplePortfolioAccountDeposit).
	self assert: (composedPortfolio hasRegistered: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:10'!
test07PortfolioHasNoTransactionWhenHasNoAccounts

	self assert: Portfolio new transactions isEmpty! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:28:08'!
test08PortfolioTransactionsIncludesAllItsAccountsTransactions

	| account portfolio accountDeposit portfolioTransactions anotherAccountWithdraw |
	
	account := ReceptiveAccount new.
	accountDeposit := Deposit register: 100 * peso on: account.
	anotherAccountWithdraw := Withdraw register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	portfolioTransactions := portfolio transactions.
	
	self assert: 2 equals: portfolioTransactions size.
	self assert: (portfolioTransactions includes: accountDeposit).
	self assert: (portfolioTransactions includes: anotherAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:28:20'!
test09PortfolioTransactionsAreCalculatedRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit composedPortfolioTransactions |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	composedPortfolioTransactions := composedPortfolio transactions.
	self assert: 2 equals: composedPortfolioTransactions size.
	self assert: (composedPortfolioTransactions includes: simplePortfolioAccountDeposit).
	self assert: (composedPortfolioTransactions includes: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:24'!
test10PortfolioCanNotIncludeTheSameAccountMoreThanOnce

	| account portfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio with: account.
	
	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: portfolio accountsSize.
			self assert: (portfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:28'!
test11PortfolioCanNotIncludeAccountOfItsPortfolios

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	composedPortfolio := Portfolio with: simplePortfolio.
	
	self 
		should: [ composedPortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: composedPortfolio accountsSize.
			self assert: (composedPortfolio accountsIncludes: simplePortfolio) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 11/29/2021 18:55:37'!
test12PortfolioCanNotIncludeItself

	| simplePortfolio |
	
	simplePortfolio := Portfolio new.
	
	self 
		should: [ simplePortfolio add: simplePortfolio ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 0 equals: simplePortfolio accountsSize. ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:01:51'!
test13ComposedPortfolioCanNotHaveParentPortfolioAccount

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio new.
	composedPortfolio := Portfolio with: simplePortfolio.
	composedPortfolio add: account.
	
	self 
		should: [ simplePortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: simplePortfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:12:16'!
test14ComposedPortfolioCanNotHaveAccountOfAnyRootParentRecursively

	| account leftParentPortfolio leftRootParentPortfolio portfolio rightParentPortfolio rightRootParentPortfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio new.
	leftParentPortfolio := Portfolio with: portfolio .
	leftRootParentPortfolio := Portfolio with: leftParentPortfolio.
	leftRootParentPortfolio add: account.
	
	rightParentPortfolio := Portfolio with: portfolio .
	rightRootParentPortfolio := Portfolio with: rightParentPortfolio.
	rightRootParentPortfolio add: account.

	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/29/2019 16:31:18'!
test15PortfolioCanNotIncludeAnyOfTheComposedAccountOfPortfolioToAdd

	| portfolioToAdd portfolioToModify rootPortfolio sharedAccount |
	
	sharedAccount := ReceptiveAccount new.
	portfolioToModify := Portfolio new.
	rootPortfolio := Portfolio with: sharedAccount with: portfolioToModify.
	portfolioToAdd := Portfolio with: sharedAccount.
	
	self 
		should: [ portfolioToModify add: portfolioToAdd ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolioToModify accountsIsEmpty ]! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:20'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:24'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:14'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:22'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:14'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:23'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !


!classDefinition: #ReportPortfolioTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #ReportPortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!ReportPortfolioTest methodsFor: 'portfolioTreePrinter' stamp: 'm 6/16/2022 17:21:00'!
test00LaEstructuraDeArbolDeUnaCuentaEsLaMismaCuenta

	self assert: (ReportPortfolioTreePrinter for: (ReceptiveAccount named: 'Cuenta de Juan') ) equals: {'Cuenta de Juan'} asOrderedCollection .! !

!ReportPortfolioTest methodsFor: 'portfolioTreePrinter' stamp: 'm 6/16/2022 17:20:29'!
test01LaEstructuraDeArbolDeUnPortfolioVacioEsElMismoPortfolio

	self assert: (ReportPortfolioTreePrinter for: (Portfolio named: 'Portfolio solo') ) equals: {'Portfolio solo'} asOrderedCollection .! !

!ReportPortfolioTest methodsFor: 'portfolioTreePrinter' stamp: 'm 6/16/2022 17:29:29'!
test02LaEstructuraDeArbolDeUnPortfolioSimpleEsLaIdentidadDeLasCuentasDeAcuerdoALaProfundidadDeCadaCuentaDelPortfolio 

	| portfolio account anotherAccount |
	
	account := ReceptiveAccount named: 'Cuenta de Juan'.
	anotherAccount := ReceptiveAccount named: 'Cuenta de Angeles'.
	portfolio := Portfolio named: 'Portfolio de la familia' with: account with: anotherAccount.
	
	self assert: (ReportPortfolioTreePrinter for: portfolio) equals: {'Portfolio de la familia'.'/tCuenta de Juan'.'/tCuenta de Angeles'} asOrderedCollection .! !

!ReportPortfolioTest methodsFor: 'portfolioTreePrinter' stamp: 'm 6/16/2022 17:29:21'!
test03LaEstructuraDeArbolDeUnPortfolioCompuestoEsLaIdentidadDeLasCuentasDeAcuerdoALaProfundidadDeCadaCuentaDelPortfolio

	| johnsAccount angiesAccount childrenPortfolio myAccount familyPortfolio |
	
	johnsAccount := ReceptiveAccount named: 'Cuenta de Juan'. 
	angiesAccount := ReceptiveAccount named: 'Cuenta de Angeles'. 
	childrenPortfolio := Portfolio named: 'Portfolio de hijos' with: johnsAccount with: angiesAccount. 
	myAccount := ReceptiveAccount named: 'Cuenta mia'. 
	familyPortfolio := Portfolio named: 'Portfolio de la familia' with: myAccount with: childrenPortfolio.

	self assert: (ReportPortfolioTreePrinter for: familyPortfolio) equals: 
	{'Portfolio de la familia'.'/tCuenta mia'.'/tPortfolio de hijos'.'/t/tCuenta de Juan'.'/t/tCuenta de Angeles'} asOrderedCollection .! !



!classDefinition: #ReportTransactionTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #ReportTransactionTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!ReportTransactionTest methodsFor: 'Account Summary' stamp: 'M 6/14/2022 20:32:07'!
test00ElResumenDeCuentaParaUnaCuentaSinTransaccionesTieneUnBalanceNulo

	self assert: (ReportAccountSummary for: ReceptiveAccount new) equals: {'balance = 0 * pesos'} asOrderedCollection .! !

!ReportTransactionTest methodsFor: 'Account Summary' stamp: 'm 6/16/2022 16:49:28'!
test01ElResumenDeCuentaParaUnaCuentaConUnDepositoEsElDetalleDelValorDelDepositoMasElBalance

	| account |

	account := ReceptiveAccount new.

	Deposit register: 100*peso on: account.

	self assert: (ReportAccountSummary for: account) equals: {'Deposito por 100 * pesos' . 'balance = 100 * pesos'} asOrderedCollection.! !

!ReportTransactionTest methodsFor: 'Account Summary' stamp: 'm 6/16/2022 16:50:51'!
test02ElResumenDeCuentaParaUnaCuentaConUnaExtraccionEsElDetalleDelValorDeLaExtraccionMasElBalance

	| account |

	account := ReceptiveAccount new.

	Withdraw register: 50*peso on: account.

	self assert: (ReportAccountSummary for: account) equals: {'Retiro por 50 * pesos' . 'balance = -50 * pesos'} asOrderedCollection .
	
	
	! !

!ReportTransactionTest methodsFor: 'Account Summary' stamp: 'm 6/16/2022 16:52:23'!
test03ElResumenDeCuentaParaUnaCuentaConUnaTransferenciaEsElDetalleDelValorDeLaTransferenciaMasElBalance

	| account otherAccount|

	account := ReceptiveAccount new.
	otherAccount := ReceptiveAccount new.

	Transfer amount: 50*peso from: account to: otherAccount. 

	self assert: (ReportAccountSummary for: account) equals: {'Salida por transferencia de 50 * pesos' . 'balance = -50 * pesos'} asOrderedCollection.
	
	
	! !

!ReportTransactionTest methodsFor: 'Account Summary' stamp: 'm 6/16/2022 16:52:53'!
test04ElResumenDeCuentaParaUnaCuentaConMuchasTransaccionesEsElDetalleDeTodasLasTransaccionesMasElBalance

	| account otherAccount|

	account := ReceptiveAccount new.
	otherAccount := ReceptiveAccount new.

	Deposit register: 100*peso on: account.
	Withdraw register: 50*peso on: account.
	Transfer amount: 20*peso from: account to: otherAccount. 
	Transfer amount: 30*peso from: otherAccount to: account. 

	self assert: (ReportAccountSummary for: account) 
	equals: {'Deposito por 100 * pesos' . 'Retiro por 50 * pesos' . 'Salida por transferencia de 20 * pesos'. 'Entrada por transferencia de 30 * pesos' . 'balance = 60 * pesos'} asOrderedCollection.
	
	
	! !


!ReportTransactionTest methodsFor: 'Account Transfer Net' stamp: 'M 6/14/2022 23:47:30'!
test05ElReporteNetoDeTransferenciaParaUnDepositoORetiroEsNulo

	| account |

	account := ReceptiveAccount new.

	Deposit register: 100*peso on: account.
	Withdraw register: 50*peso on: account.

	self assert: (ReportAccountTransferNet for: account) equals: 0*peso.! !

!ReportTransactionTest methodsFor: 'Account Transfer Net' stamp: 'm 6/16/2022 17:10:17'!
test06ElReporteNetoDeTransferenciaParaUnaCuentaEsLaDiferenciaEntreLasTransaferenciasEntrantesYSalientesDeUnaCuenta

	| account otherAccount|

	account := ReceptiveAccount new.
	otherAccount := ReceptiveAccount new.

	Deposit register: 100*peso on: account.
	Withdraw register: 50*peso on: account.
	Transfer amount: 20*peso from: account to: otherAccount. 
	Transfer amount: 30*peso from: otherAccount to: account. 

	self assert: (ReportAccountTransferNet for: account) equals: 10*peso.
	
	
	! !


!ReportTransactionTest methodsFor: 'Portfolio Transfer Net' stamp: 'm 6/16/2022 17:07:43'!
test10ElReporteNetoParaUnPortfolioVacioEsNulo

	self assert: (ReportAccountTransferNet for: Portfolio new) equals: 0*peso.! !

!ReportTransactionTest methodsFor: 'Portfolio Transfer Net' stamp: 'm 6/16/2022 17:12:26'!
test11ElReporteNetoDeTransferenciaParaUnPortfolioEsLaDiferenciaEntreLasTransaferenciasEntrantesYSalientesDeLasTransaccionesDelPortfolio

	| account anotherAccount portfolio |

	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.

	Deposit register: 100*peso on: account.
	Withdraw register: 50*peso on: account.
	Transfer amount: 20*peso from: account to: anotherAccount. 
	Transfer amount: 30*peso from: anotherAccount to: account. 
	portfolio add: account.

	self assert: (ReportAccountTransferNet for: portfolio ) equals: 10*peso.
	! !


!ReportTransactionTest methodsFor: 'Portfolio Summary' stamp: 'M 6/14/2022 21:42:22'!
test07ElResumenDeCuentaParaUnPortfolioSinTransaccionesTieneUnBalanceNulo

	self assert: (ReportAccountSummary for: Portfolio new) equals: {'balance = 0 * pesos'} asOrderedCollection .! !

!ReportTransactionTest methodsFor: 'Portfolio Summary' stamp: 'm 6/16/2022 16:53:37'!
test08ElResumenDeCuentaParaUnPortfolioQueCotieneUnaCuentaConMuchasTransaccionesEsElDetalleDeTodasLasTransaccionesEnElPortfolioMasElBalance

	| portfolioS account otherAccount |
	
	portfolioS := Portfolio new.
	account := ReceptiveAccount new.
	otherAccount := ReceptiveAccount new.
	
	Deposit register: 100*peso on: account.
	Withdraw register: 50*peso on: account.
	Transfer amount: 20*peso from: account to: otherAccount. 
	Transfer amount: 30*peso from: otherAccount to: account. 
	portfolioS add: account.

	self assert: (ReportAccountSummary for: portfolioS) equals: {'Deposito por 100 * pesos' . 'Retiro por 50 * pesos' . 'Salida por transferencia de 20 * pesos'. 'Entrada por transferencia de 30 * pesos' . 'balance = 60 * pesos'} asOrderedCollection .! !

!ReportTransactionTest methodsFor: 'Portfolio Summary' stamp: 'm 6/16/2022 16:56:20'!
test09ElResumenDeCuentaParaUnPortfolioCompuestoQueTieneUnaCuentaConTransaccionesEsElDetalleDeTodasLasTransaccionesEnElPortfolioMasElBalance

	| portfolioC portfolioS account |
	
	portfolioS := Portfolio new.
	portfolioC := Portfolio new.
	account := ReceptiveAccount new.
	
	Deposit register: 20*peso on: account.
	Withdraw register: 15*peso on: account.
	portfolioS add: account.
	portfolioC add: portfolioS.

	self assert: (ReportAccountSummary for: portfolioC) equals: {'Deposito por 20 * pesos'.'Retiro por 15 * pesos'.'balance = 5 * pesos'} asOrderedCollection.! !


!classDefinition: #TransferTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 21:07:03'!
test01ATransferDecreasesBalanceFromOriginAccountAndIncreasesItForDestinationAccount

	| destinationAccount originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 8 * peso equals: originAccount balance.
	self assert: 12 * peso equals: destinationAccount balance.! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 21:12:28'!
test02ATransferKnowsItsValue

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 2 * peso equals: transfer value.! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:01:44'!
test03DepositLegKnowsItsWithdrawCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer withdrawLeg equals: transfer depositLeg withdrawLeg! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:01:51'!
test04WithdrawLegKnowsItsDepositCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer depositLeg equals: transfer withdrawLeg depositLeg! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:02:36'!
test05OriginAndDestinationAccountsCannotBeTheSame

	| originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	self should: [ Transfer amount: 2 * peso from: originAccount to: originAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferToOriginErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]
! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:02:44'!
test06CannotTransferAZeroAmount

	| originAccount destinationAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 5 * peso on: destinationAccount.
	
	self should: [ Transfer amount: 0 from: originAccount to: destinationAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferZeroErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]
! !


!classDefinition: #Account category: 'ServiciosFinancieros-Solucion'!
Object subclass: #Account
	instanceVariableNames: 'name'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:40'!
balance

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:47'!
hasRegistered: aTransaction

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:15'!
transactions

	self subclassResponsibility ! !


!Account methodsFor: 'composition' stamp: 'LL 7/8/2021 21:45:50'!
addedTo: aPortfolio

	self subclassResponsibility! !

!Account methodsFor: 'composition' stamp: 'LL 7/8/2021 21:46:48'!
isComposedBy: anAccount

	self subclassResponsibility! !


!Account methodsFor: 'private' stamp: 'HAW 5/25/2019 12:23:27'!
addTransactionsTo: aCollectionOfTransactions

	self subclassResponsibility ! !


!Account methodsFor: 'initialize' stamp: 'M 6/14/2022 23:37:31'!
initializeNamed: aName

	name := aName.! !


!Account methodsFor: 'accessing' stamp: 'M 6/14/2022 23:36:04'!
name

	^ name.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Account class' category: 'ServiciosFinancieros-Solucion'!
Account class
	instanceVariableNames: ''!

!Account class methodsFor: 'as yet unclassified' stamp: 'M 6/15/2022 19:55:16'!
named: aName

	^ self new initializeNamed: aName.! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Solucion'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts parents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Portfolio methodsFor: 'initialization' stamp: 'HAW 5/25/2019 12:03:18'!
initialize

	accounts := OrderedCollection new.
	parents := OrderedCollection new.! !


!Portfolio methodsFor: 'main protocol' stamp: 'M 6/15/2022 20:08:54'!
accounts

	^ accounts.! !

!Portfolio methodsFor: 'main protocol' stamp: 'M 6/14/2022 21:44:08'!
balance
	
	^accounts sum: [ :anAccount | anAccount balance ] ifEmpty: [ 0*peso ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:28:29'!
hasRegistered: aTransaction

	^accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'm 6/16/2022 17:37:18'!
transactions
	
	| transactions |
	
	transactions := OrderedCollection new.
	
	accounts do: [ :anAccount | transactions addAll: anAccount transactions ].
	
	^transactions ! !


!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:20'!
accountsIncludes: anAccount

	^accounts includes: anAccount ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:05:04'!
accountsIsEmpty
	
	^accounts isEmpty ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:06'!
accountsSize
	
	^accounts size! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:19:20'!
add: accountToAdd

	self assertCanAdd: accountToAdd.
		
	accounts add: accountToAdd.
	accountToAdd addedTo: self 
	! !



!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:17:31'!
addRootParentsTo: rootParents

	parents 
		ifEmpty: [ rootParents add: self ] 
		ifNotEmpty: [ parents do: [ :aParent | aParent addRootParentsTo: rootParents ]]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:02:59'!
addedTo: aPortfolio 
	
	parents add: aPortfolio ! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:20:56'!
anyRootParentIsComposedBy: accountToAdd

	^self rootParents anySatisfy: [ :aParent | aParent isComposedBy: accountToAdd]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:20:36'!
assertCanAdd: accountToAdd

	(self anyRootParentIsComposedBy: accountToAdd) ifTrue: [ self signalCanNotAddAccount ].
! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/29/2019 16:24:54'!
isComposedBy: anAccount

	^ self = anAccount or: [ accounts anySatisfy: [ :composedAccount | (composedAccount isComposedBy: anAccount) or: [ anAccount isComposedBy: composedAccount ]]]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:17:31'!
rootParents
	
	| rootParents |
	
	rootParents := Set new.
	self addRootParentsTo: rootParents.
	
	^ rootParents! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 11:48:34'!
signalCanNotAddAccount
	
	self error: self class canNotAddAccountErrorMessage! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Solucion'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:48:55'!
canNotAddAccountErrorMessage
	
	^'Can not add repeated account to a portfolio'! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'M 6/14/2022 23:41:16'!
named: aName with: anAccount with: anotherAccount

	| portfolio |
	
	portfolio := self new initializeNamed: aName.
	portfolio add: anAccount;
		add: anotherAccount;
		yourself.

	^ portfolio
! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'M 6/14/2022 23:30:46'!
with: anAccount

	^self new 
		add: anAccount;
		yourself! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'M 6/14/2022 23:30:34'!
with: anAccount with: anotherAccount

	^self new 
		add: anAccount;
		add: anotherAccount;
		yourself! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Solucion'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'M 6/15/2022 19:56:01'!
initialize

	super initialize.
	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'M 6/15/2022 23:30:00'!
accounts

	^ OrderedCollection new.! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'M 6/11/2022 19:44:29'!
balance

	^transactions 
		inject: 0 * peso
		into: [ :currentBalance :transaction | transaction affectBalance: currentBalance ]! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/21/2019 18:55:56'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'private' stamp: 'HAW 5/25/2019 11:38:52'!
addTransactionsTo: aCollectionOfTransactions

	aCollectionOfTransactions addAll: transactions ! !


!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:03:32'!
addedTo: aPortfolio 
	
	! !

!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 11:54:51'!
isComposedBy: anAccount

	^self = anAccount ! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Solucion'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:39'!
affectBalance: aBalance

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'visitor' stamp: 'M 6/14/2022 19:50:09'!
accept: aReport

	self subclassResponsibility.! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:02'!
affectBalance: aBalance

	^aBalance + value ! !


!Deposit methodsFor: 'visitor' stamp: 'M 6/15/2022 19:33:17'!
accept: aReport

	^ aReport doSomethingForADeposit: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Solucion'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!Deposit class methodsFor: 'as yet unclassified' stamp: 'LL 7/8/2021 21:45:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #TransferLeg category: 'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #TransferLeg
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferLeg methodsFor: 'value' stamp: 'LL 9/20/2020 22:27:32'!
value

	^transfer value! !


!TransferLeg methodsFor: 'initialization' stamp: 'LL 9/20/2020 22:28:14'!
initializeWith: aTransfer

	transfer := aTransfer! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferLeg class' category: 'ServiciosFinancieros-Solucion'!
TransferLeg class
	instanceVariableNames: ''!

!TransferLeg class methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 22:45:01'!
of: aTransfer on: anAccount

	| transaction |
	
	transaction := self new initializeWith: 	aTransfer.
	anAccount register: transaction.	
	
	^transaction! !


!classDefinition: #TransferDepositLeg category: 'ServiciosFinancieros-Solucion'!
TransferLeg subclass: #TransferDepositLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferDepositLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:26:10'!
withdrawLeg

	^transfer withdrawLeg! !


!TransferDepositLeg methodsFor: 'balance' stamp: 'LL 9/20/2020 22:27:49'!
affectBalance: aBalance

	^aBalance + self value! !


!TransferDepositLeg methodsFor: 'visitor' stamp: 'M 6/14/2022 20:07:50'!
accept: aReport

	^ aReport doSomethingForADepositLeg: self! !


!classDefinition: #TransferWithdrawLeg category: 'ServiciosFinancieros-Solucion'!
TransferLeg subclass: #TransferWithdrawLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferWithdrawLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:25:47'!
depositLeg

	^transfer depositLeg! !


!TransferWithdrawLeg methodsFor: 'balance' stamp: 'LL 9/20/2020 22:27:55'!
affectBalance: aBalance

	^aBalance - self value! !


!TransferWithdrawLeg methodsFor: 'visitor' stamp: 'M 6/14/2022 20:08:06'!
accept: aReport

	^ aReport doSomethingForAWithdrawLeg: self! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:15'!
affectBalance: aBalance

	^aBalance - value! !


!Withdraw methodsFor: 'visitor' stamp: 'M 6/14/2022 20:07:33'!
accept: aReport

	^ aReport doSomethingForAWithdraw: self! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Solucion'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!Withdraw class methodsFor: 'as yet unclassified' stamp: 'LL 7/8/2021 21:45:05'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #ReportPortfolioTreePrinter category: 'ServiciosFinancieros-Solucion'!
Object subclass: #ReportPortfolioTreePrinter
	instanceVariableNames: 'portfolioTree'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!ReportPortfolioTreePrinter methodsFor: 'as yet unclassified' stamp: 'm 6/16/2022 17:34:36'!
for: aPortfolio withAPrefix: aTab

	portfolioTree add: aTab,aPortfolio name.

	aPortfolio accounts do: [ :anAccount | self for: anAccount withAPrefix: aTab,'/t'].

	^portfolioTree.! !

!ReportPortfolioTreePrinter methodsFor: 'as yet unclassified' stamp: 'M 6/16/2022 01:23:22'!
initialize

	portfolioTree := OrderedCollection new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ReportPortfolioTreePrinter class' category: 'ServiciosFinancieros-Solucion'!
ReportPortfolioTreePrinter class
	instanceVariableNames: ''!

!ReportPortfolioTreePrinter class methodsFor: 'as yet unclassified' stamp: 'm 6/16/2022 17:34:41'!
for: aPortfolio

	^ (ReportPortfolioTreePrinter new) for: aPortfolio withAPrefix: ''.
	! !


!classDefinition: #ReportTransaction category: 'ServiciosFinancieros-Solucion'!
Object subclass: #ReportTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!ReportTransaction methodsFor: 'main protocol' stamp: 'M 6/14/2022 19:58:04'!
doSomethingForADeposit: aDeposit

	self subclassResponsibility.! !

!ReportTransaction methodsFor: 'main protocol' stamp: 'M 6/14/2022 20:05:59'!
doSomethingForADepositLeg: aDepositLeg

	self subclassResponsibility.! !

!ReportTransaction methodsFor: 'main protocol' stamp: 'M 6/14/2022 20:05:48'!
doSomethingForAWithdraw: aWithdraw

	self subclassResponsibility.! !

!ReportTransaction methodsFor: 'main protocol' stamp: 'M 6/14/2022 20:05:41'!
doSomethingForAWithdrawLeg: aWithdrawLeg

	self subclassResponsibility.! !


!classDefinition: #ReportAccountSummary category: 'ServiciosFinancieros-Solucion'!
ReportTransaction subclass: #ReportAccountSummary
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!ReportAccountSummary methodsFor: 'converting' stamp: 'M 6/14/2022 20:14:35'!
balanceToStringFor: anAccount

	^ 'balance = ',(anAccount balance) asString! !

!ReportAccountSummary methodsFor: 'converting' stamp: 'M 6/14/2022 20:18:04'!
valueToStringFor: aTransaction

	^ (aTransaction value) asString! !


!ReportAccountSummary methodsFor: 'main protocol' stamp: 'M 6/14/2022 20:18:04'!
doSomethingForADeposit: aDeposit

	^ 'Deposito por ',(self valueToStringFor: aDeposit).
! !

!ReportAccountSummary methodsFor: 'main protocol' stamp: 'M 6/14/2022 20:18:04'!
doSomethingForADepositLeg: aDepositLeg

	^ 'Entrada por transferencia de ',(self valueToStringFor: aDepositLeg).! !

!ReportAccountSummary methodsFor: 'main protocol' stamp: 'M 6/14/2022 20:18:04'!
doSomethingForAWithdraw: aWithdraw

	^ 'Retiro por ',(self valueToStringFor: aWithdraw).! !

!ReportAccountSummary methodsFor: 'main protocol' stamp: 'M 6/14/2022 20:18:04'!
doSomethingForAWithdrawLeg: aWithdrawLeg

	^ 'Salida por transferencia de ',(self valueToStringFor: aWithdrawLeg).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ReportAccountSummary class' category: 'ServiciosFinancieros-Solucion'!
ReportAccountSummary class
	instanceVariableNames: ''!

!ReportAccountSummary class methodsFor: 'instance creation' stamp: 'm 6/16/2022 17:15:49'!
for: anAccount 

	| summary arrayOfReport |
	
	summary := self new.
	
	arrayOfReport := (anAccount transactions collect: [ :aTRansaction | aTRansaction accept: summary ]).

	arrayOfReport add: (summary balanceToStringFor: anAccount).

	^ arrayOfReport.! !


!classDefinition: #ReportAccountTransferNet category: 'ServiciosFinancieros-Solucion'!
ReportTransaction subclass: #ReportAccountTransferNet
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!ReportAccountTransferNet methodsFor: 'main protocol' stamp: 'M 6/14/2022 20:21:29'!
doSomethingForADeposit: aDeposit

	^ 0*peso.! !

!ReportAccountTransferNet methodsFor: 'main protocol' stamp: 'M 6/14/2022 20:19:41'!
doSomethingForADepositLeg: aDepositLeg

	^ aDepositLeg affectBalance: 0*peso.! !

!ReportAccountTransferNet methodsFor: 'main protocol' stamp: 'M 6/14/2022 20:21:33'!
doSomethingForAWithdraw: aWithdraw

	^ 0*peso.! !

!ReportAccountTransferNet methodsFor: 'main protocol' stamp: 'M 6/14/2022 20:19:54'!
doSomethingForAWithdrawLeg: aWithdrawLeg

	^ aWithdrawLeg affectBalance: 0*peso.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ReportAccountTransferNet class' category: 'ServiciosFinancieros-Solucion'!
ReportAccountTransferNet class
	instanceVariableNames: ''!

!ReportAccountTransferNet class methodsFor: 'as yet unclassified' stamp: 'm 6/16/2022 17:09:08'!
for: anAccount

	| transferNet |
	
	transferNet := self new.

	^ anAccount transactions sum: [ :aTransaction |  aTransaction accept: transferNet ] ifEmpty: [ 0*peso ]! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Solucion'!
Object subclass: #Transfer
	instanceVariableNames: 'value withdrawLeg depositLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Transfer methodsFor: 'value' stamp: 'LL 9/20/2020 21:13:00'!
value

	^value! !


!Transfer methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:39:46'!
depositLeg

	^depositLeg! !

!Transfer methodsFor: 'accessing' stamp: 'LL 9/20/2020 21:25:56'!
withdrawLeg
	
	^withdrawLeg! !


!Transfer methodsFor: 'initialization' stamp: 'LL 9/20/2020 21:25:21'!
initializeWith: aValue withdrawLeg: aWithdraw depositLeg: aDeposit

	value := aValue.
	withdrawLeg := aWithdraw.
	depositLeg := aDeposit! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Solucion'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 22:57:30'!
cannotTransferToOriginErrorDescription
	
	^'Transfer destionation cannot be the origin account'! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 23:00:53'!
cannotTransferZeroErrorDescription

	^'Transfer amount should be positive'! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 22:56:35'!
signalCannotTransferToOrigin
	
	self error: self cannotTransferToOriginErrorDescription! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 23:06:17'!
signalCannotTransferZero

	self error: self cannotTransferZeroErrorDescription! !


!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:05:22'!
assert: anAmountOfMoney canBeTransferedTo: destinationAccount from: originAccount

	self assertCanTransferTo: destinationAccount from: originAccount.
	self assertCanTransfer: anAmountOfMoney! !

!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:11:50'!
assertCanTransfer: anAmountOfMoney

	^ anAmountOfMoney isZero ifTrue: [ self signalCannotTransferZero ]! !

!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:04:58'!
assertCanTransferTo: destinationAccount from: originAccount

	^ originAccount = destinationAccount ifTrue: [ self signalCannotTransferToOrigin ]! !


!Transfer class methodsFor: 'instance creation' stamp: 'LL 9/20/2020 23:11:34'!
amount: anAmountOfMoney from: originAccount to: destinationAccount 
	
	| transfer depositLeg withdrawLeg |
	
	self assert: anAmountOfMoney canBeTransferedTo: destinationAccount from: originAccount.
	
	transfer := self new.
	
	withdrawLeg := TransferWithdrawLeg of: transfer on: originAccount.
	depositLeg := TransferDepositLeg of: transfer on: destinationAccount.
	
	^transfer initializeWith: anAmountOfMoney withdrawLeg: withdrawLeg depositLeg: depositLeg
	
	
	! !

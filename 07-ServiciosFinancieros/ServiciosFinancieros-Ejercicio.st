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

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'M 6/4/2022 21:07:49'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 50 * peso on: account.
	
	self assert: 1 equals: account amountOfTransactionsDone.
	self assert: (account madeATransaction: deposit).
	
"	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit)."! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'M 6/5/2022 18:47:20'!
test08TransferenciaEntreDosCuentasReduceElBalanceDeLaCuentaExtraidaYIncrementaElBalanceDeLaCuentaDepositadaPorElValorDeLaTransaccion

	| accountToWithdraw accountToDeposit |
	
	accountToDeposit := ReceptiveAccount new.
	accountToWithdraw := ReceptiveAccount new.
	Deposit register: 100 * peso on: accountToWithdraw.

	Transferencia register: 25 * peso toWithdrawFrom: accountToWithdraw andDepositOn: accountToDeposit.

	self assert: 75 * peso equals: accountToWithdraw balance.
	self assert: 25 * peso equals: accountToDeposit balance.
	
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'M 6/5/2022 18:29:43'!
test09EnUnaTransaccionEntreDosCuentasAmbasRegistranLaTransferencia

	| accountToWithdraw accountToDeposit transferencia |
	
	accountToDeposit := ReceptiveAccount new.
	accountToWithdraw := ReceptiveAccount new.
	Deposit register: 100 * peso on: accountToWithdraw.
	
	transferencia := Transferencia register: 25 * peso toWithdrawFrom: accountToWithdraw andDepositOn: accountToDeposit.
	
	self assert: (accountToDeposit madeATransaction: transferencia).
	self assert: (accountToWithdraw madeATransaction: transferencia).! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'M 6/5/2022 19:55:32'!
test10UnaCuentaConoceSuContraparteDeLaTransaccion

	| accountToWithdraw accountToDeposit transference |

	accountToDeposit := ReceptiveAccount new.
	accountToWithdraw := ReceptiveAccount new.
	Deposit register: 100 * peso on: accountToWithdraw.

	transference := Transferencia register: 25 * peso toWithdrawFrom: accountToWithdraw andDepositOn: accountToDeposit.
	
"	self assert: (accountToDeposit contraparteDeTransaccionDeposit: transference) equals: accountToWithdraw.
	self assert: (accountToDeposit contraparteDeTransaccionWithdraw: transference) equals: accountToDeposit.
	
	self assert: (accountToWithdraw contraparteDeTransaccionWithdraw: transference) equals: accountToDeposit."
	
	self assert: (accountToDeposit contraparteDeTransaccion: transference) equals: accountToWithdraw.
	self assert: (accountToWithdraw contraparteDeTransaccion: transference) equals: accountToDeposit.! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'M 6/5/2022 19:31:52'!
test11

	| account deposit |

	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.

	self assert: (account contraparteDeTransaccionDeposit: deposit) equals: account.
	self assert: (account contraparteDeTransaccionWithdraw: deposit) equals: account.
	
! !

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

!Deposit methodsFor: 'initialization' stamp: 'M 6/4/2022 18:50:34'!
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


!classDefinition: #Transferencia category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Transferencia
	instanceVariableNames: 'value accountParaRetirar accountParaDepositar'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transferencia methodsFor: 'initialization' stamp: 'M 6/5/2022 19:40:58'!
initializeRegister: aValue toDebitOn: aAccountToDebit andAccreditOn: aAccountToAccredit 

	value := aValue.
	accountParaRetirar := aAccountToDebit.
	accountParaDepositar := aAccountToAccredit.! !


!Transferencia methodsFor: 'as yet unclassified' stamp: 'M 6/5/2022 19:23:44'!
contraparteDeTransaccion: aTrasference

	self subclassResponsibility.! !

!Transferencia methodsFor: 'as yet unclassified' stamp: 'M 6/5/2022 19:40:58'!
pataDeposito

	^ accountParaDepositar.
	! !

!Transferencia methodsFor: 'as yet unclassified' stamp: 'M 6/5/2022 19:40:49'!
pataExtraccion

	^ accountParaRetirar.
	! !

!Transferencia methodsFor: 'as yet unclassified' stamp: 'M 6/5/2022 18:55:23'!
realizarOperacionConBalance: aBalance

	^ aBalance.! !

!Transferencia methodsFor: 'as yet unclassified' stamp: 'M 6/5/2022 19:56:44'!
xxx: aAccount

	(accountParaRetirar == aAccount)
	ifTrue: [ ^  accountParaDepositar]
	ifFalse: [ ^  accountParaRetirar]
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transferencia class' category: 'ServiciosFinancieros-Ejercicio'!
Transferencia class
	instanceVariableNames: ''!

!Transferencia class methodsFor: 'instance creation' stamp: 'M 6/5/2022 19:50:27'!
register: aValue toWithdrawFrom: aAccountToDebit andDepositOn: aAccountToAccredit 

	| transference |

	Withdraw register: aValue on: aAccountToDebit.
	Deposit register: aValue on: aAccountToAccredit.
	
	transference := self new initializeRegister: aValue toDebitOn: aAccountToDebit andAccreditOn: aAccountToAccredit.
	
"	transferenceParaRetirar := self new initializeRegister: aValue toDebitOn: aAccountToDebit.
	transferenceParaDepositar := self new initializeRegister: aValue andAccreditOn: aAccountToAccredit.
	
	aAccountToDebit register: transferenceParaRetirar.
	aAccountToAccredit register: transferenceParaDepositar."
	
	aAccountToDebit register: transference.
	aAccountToAccredit register: transference.

	^ transference.! !


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


!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'M 6/4/2022 21:02:35'!
amountOfTransactionsDone

	^ transactions size.! !

!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'M 6/5/2022 19:35:25'!
contraparteDeTransaccion: aTransaction

	^ aTransaction xxx: self.



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

!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'M 6/4/2022 21:07:49'!
madeATransaction: aDeposit 

	^ transactions includes: aDeposit.! !

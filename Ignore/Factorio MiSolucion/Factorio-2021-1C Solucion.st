!classDefinition: #SeparadoTest category: 'Factorio-2021-1C Solucion'!
TestCase subclass: #SeparadoTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Factorio-2021-1C Solucion'!

!SeparadoTest methodsFor: 'as yet unclassified' stamp: 'M 6/24/2022 19:55:56'!
cintaConectadaAUnaCaja

	^ CintaTransportadora conectadaA: Caja new.! !

!SeparadoTest methodsFor: 'as yet unclassified' stamp: 'M 6/24/2022 20:18:49'!
test01UnSeparadorInicialmenteEstaEnModoNeutro

	| separador |
	
	separador := Separador conDestinoPrimario: (CintaTransportadora new) yunDestinoSecundario: (CintaTransportadora new) conMenas: OrderedCollection new.

	self assert: separador modoActual equals: #Neutro.
	! !

!SeparadoTest methodsFor: 'as yet unclassified' stamp: 'M 6/24/2022 19:56:55'!
test02UnSeparadorSinCargaNoDespachaNada

	| separador destinoPrimario destinoSecundario |
	
	destinoPrimario := self cintaConectadaAUnaCaja.
	destinoSecundario := self cintaConectadaAUnaCaja.
	separador := Separador conDestinoPrimario: 	destinoPrimario yunDestinoSecundario:destinoSecundario conMenas: OrderedCollection new.
	
	separador transportarCarga.

	self assert: destinoPrimario estaVacia.
	self assert: destinoSecundario estaVacia.
	! !

!SeparadoTest methodsFor: 'as yet unclassified' stamp: 'M 6/24/2022 20:09:58'!
test03UnSeparadorEnModoNeutroConCargaDespachaAlDestinoPrimario

	| separador destinoPrimario destinoSecundario |
	
	destinoPrimario := self cintaConectadaAUnaCaja.
	destinoSecundario := self cintaConectadaAUnaCaja.
	separador := Separador conDestinoPrimario: 	destinoPrimario yunDestinoSecundario:destinoSecundario conMenas: (OrderedCollection with: MenaDeHierro new).
	
	separador transportarCarga.

	self deny: destinoPrimario estaVacia.
	self assert: destinoSecundario estaVacia.
	! !

!SeparadoTest methodsFor: 'as yet unclassified' stamp: 'M 6/24/2022 22:50:51'!
test04UnSeparadorEnModoNeutroPuedeCambiarAModoNeutro

	| separador destinoPrimario destinoSecundario |
	
	destinoPrimario := self cintaConectadaAUnaCaja.
	destinoSecundario := self cintaConectadaAUnaCaja.
	separador := Separador conDestinoPrimario: 	destinoPrimario yunDestinoSecundario:destinoSecundario conMenas: (OrderedCollection with: MenaDeHierro new).

	separador cambiarAModo: #Neutro.
	
	self assert: separador modoActual equals: #Neutro.! !

!SeparadoTest methodsFor: 'as yet unclassified' stamp: 'M 6/24/2022 20:24:02'!
test05UnSeparadorEnModoNeutroPuedeCambiarAModoBalanceado

	| separador destinoPrimario destinoSecundario |
	
	destinoPrimario := self cintaConectadaAUnaCaja.
	destinoSecundario := self cintaConectadaAUnaCaja.
	separador := Separador conDestinoPrimario: 	destinoPrimario yunDestinoSecundario:destinoSecundario conMenas: (OrderedCollection with: MenaDeHierro new).
	
	separador cambiarAModo: #Balanceado.
	
	self assert: separador modoActual equals: #Balanceado.! !

!SeparadoTest methodsFor: 'as yet unclassified' stamp: 'M 6/24/2022 20:24:57'!
test06UnSeparadorEnModoNeutroPuedeCambiarAModoFiltrado

	| separador destinoPrimario destinoSecundario |
	
	destinoPrimario := self cintaConectadaAUnaCaja.
	destinoSecundario := self cintaConectadaAUnaCaja.
	separador := Separador conDestinoPrimario: 	destinoPrimario yunDestinoSecundario:destinoSecundario conMenas: (OrderedCollection with: MenaDeHierro new).
	
	separador cambiarAModo: #Filtrado.
	
	self assert: separador modoActual equals: #Filtrado.! !

!SeparadoTest methodsFor: 'as yet unclassified' stamp: 'M 6/24/2022 20:26:31'!
test07UnSeparadorEnModoBalanceadoPuedeCambiarAModoNeutro

	| separador destinoPrimario destinoSecundario |
	
	destinoPrimario := self cintaConectadaAUnaCaja.
	destinoSecundario := self cintaConectadaAUnaCaja.
	separador := Separador conDestinoPrimario: 	destinoPrimario yunDestinoSecundario:destinoSecundario conMenas: (OrderedCollection with: MenaDeHierro new).
	
	separador cambiarAModo: #Balanceado.
	separador cambiarAModo: #Neutro.
	
	self assert: separador modoActual equals: #Neutro.! !

!SeparadoTest methodsFor: 'as yet unclassified' stamp: 'M 6/24/2022 20:27:00'!
test08UnSeparadorEnModoBalanceadoPuedeCambiarAModoBalanceado

	| separador destinoPrimario destinoSecundario |
	
	destinoPrimario := self cintaConectadaAUnaCaja.
	destinoSecundario := self cintaConectadaAUnaCaja.
	separador := Separador conDestinoPrimario: 	destinoPrimario yunDestinoSecundario:destinoSecundario conMenas: (OrderedCollection with: MenaDeHierro new).
	
	separador cambiarAModo: #Balanceado.
	separador cambiarAModo: #Balanceado.
	
	self assert: separador modoActual equals: #Balanceado.! !

!SeparadoTest methodsFor: 'as yet unclassified' stamp: 'M 6/24/2022 20:30:22'!
test09UnSeparadorEnModoBalanceadoNoPuedeCambiarAModoFiltrado

	| separador destinoPrimario destinoSecundario |
	
	destinoPrimario := self cintaConectadaAUnaCaja.
	destinoSecundario := self cintaConectadaAUnaCaja.
	separador := Separador conDestinoPrimario: 	destinoPrimario yunDestinoSecundario:destinoSecundario conMenas: (OrderedCollection with: MenaDeHierro new).
	
	separador cambiarAModo: #Balanceado.
	
	self 
	should: [ separador cambiarAModo: #Filtrado. ]  
	raise:  Error
	withExceptionDo: [ :anError | self assert: anError messageText equals: Separador cambioDeModoInvalido.
							self assert: separador modoActual equals: #Balanceado ]
	
	
	
! !

!SeparadoTest methodsFor: 'as yet unclassified' stamp: 'M 6/25/2022 00:10:12'!
test10UnSeparadorEnModoFiltradoPuedeCambiarAModoNeutro

	| separador destinoPrimario destinoSecundario |
	
	destinoPrimario := self cintaConectadaAUnaCaja.
	destinoSecundario := self cintaConectadaAUnaCaja.
	separador := Separador conDestinoPrimario: 	destinoPrimario yunDestinoSecundario:destinoSecundario conMenas: (OrderedCollection with: MenaDeHierro new).
	
	separador cambiarAModo: #Filtrado.
	separador cambiarAModo: #Neutro.
	
	self assert: separador modoActual equals: #Neutro.
	
	
	
! !

!SeparadoTest methodsFor: 'as yet unclassified' stamp: 'M 6/25/2022 00:10:19'!
test11UnSeparadorEnModoFiltradoPuedeCambiarAModoFiltrado

	| separador destinoPrimario destinoSecundario |
	
	destinoPrimario := self cintaConectadaAUnaCaja.
	destinoSecundario := self cintaConectadaAUnaCaja.
	separador := Separador conDestinoPrimario: 	destinoPrimario yunDestinoSecundario:destinoSecundario conMenas: (OrderedCollection with: MenaDeHierro new).
	
	separador cambiarAModo: #Filtrado .
	separador cambiarAModo: #Filtrado.
	
	self assert: separador modoActual equals: #Filtrado.
	
	
	
! !

!SeparadoTest methodsFor: 'as yet unclassified' stamp: 'M 6/25/2022 00:10:25'!
test12UnSeparadorEnModoFiltradoNoPuedeCambiarAModoBalanceado

	| separador destinoPrimario destinoSecundario |
	
	destinoPrimario := self cintaConectadaAUnaCaja.
	destinoSecundario := self cintaConectadaAUnaCaja.
	separador := Separador conDestinoPrimario: 	destinoPrimario yunDestinoSecundario:destinoSecundario conMenas: (OrderedCollection with: MenaDeHierro new).
	
	separador cambiarAModo: #Filtrado.
	
	self 
	should: [ separador cambiarAModo: #Balanceado. ]  
	raise:  Error
	withExceptionDo: [ :anError | self assert: anError messageText equals: Separador cambioDeModoInvalido.
							self assert: separador modoActual equals: #Filtrado ]
	
	
	
! !

!SeparadoTest methodsFor: 'as yet unclassified' stamp: 'M 6/25/2022 00:10:30'!
test13UnSeparadorCargdoEnModoFiltradoConCriterioMenaDeHierroDespachaLasMenasDeHierroADestinoSecundarioYElRestoAPrimario

	| separador destinoPrimario destinoSecundario menas menaDeHierro menaDeCarbon |
	
	destinoPrimario := self cintaConectadaAUnaCaja.
	destinoSecundario := self cintaConectadaAUnaCaja.
	menaDeHierro := MenaDeHierro new.
	menaDeCarbon := MenaDeCarbon new.
	menas := {menaDeHierro. menaDeCarbon} asOrderedCollection.
	
	separador := Separador conDestinoPrimario: 	destinoPrimario yunDestinoSecundario:destinoSecundario conMenas: menas .
	
	separador cambiarAModo: #Filtrado.
	separador transportarCarga.
	
	self assert: (destinoPrimario contieneA: menaDeCarbon ).
	self assert: (destinoSecundario contieneA: menaDeHierro).
	
	
	
! !

!SeparadoTest methodsFor: 'as yet unclassified' stamp: 'M 6/25/2022 00:10:53'!
test14UnSeparadorCargadoEnModoFiltradoConCriterioMenaDeCarboDespachaLasMenasCarbonADestinoSecundarioYElRestoASecundario

"	| separador destinoPrimario destinoSecundario menas menaDeHierro menaDeCarbon |
	
	destinoPrimario := self cintaConectadaAUnaCaja.
	destinoSecundario := self cintaConectadaAUnaCaja.
	menaDeHierro := MenaDeHierro new.
	menaDeCarbon := MenaDeCarbon new.
	menas := {menaDeHierro. menaDeCarbon} asOrderedCollection.
	
	separador := Separador conDestinoPrimario: 	destinoPrimario yunDestinoSecundario:destinoSecundario conMenas: menas .
	
	separador cambiarAModo: #Filtrado.
	separador transportarCarga.
	
	self assert: (destinoPrimario contieneA: menaDeCarbon ).
	self assert: (destinoSecundario contieneA: menaDeHierro)."
	
	
	
! !

!SeparadoTest methodsFor: 'as yet unclassified' stamp: 'M 6/24/2022 23:51:55'!
test15UnSeparadorEnModoBalanceadoConUnaMenaHierroDespachaSiempreAlDestinoPrimario

	| separador destinoPrimario destinoSecundario   |
	
	destinoPrimario := self cintaConectadaAUnaCaja.
	destinoSecundario := self cintaConectadaAUnaCaja.
	
	separador := Separador conDestinoPrimario: 	destinoPrimario yunDestinoSecundario:destinoSecundario conMenas: (OrderedCollection with: MenaDeHierro new).
	
	separador cambiarAModo: #Balanceado.
	separador transportarCarga.
	
	self assert: (destinoPrimario cantidadDeMenas) equals: 1.
	self assert: (destinoSecundario cantidadDeMenas) equals: 0.
	
	
	
! !

!SeparadoTest methodsFor: 'as yet unclassified' stamp: 'M 6/24/2022 23:52:03'!
test16UnSeparadorEnModoBalanceadoConUnaMenaCarbonDespachaSiempreAlDestinoPrimario

	| separador destinoPrimario destinoSecundario   |
	
	destinoPrimario := self cintaConectadaAUnaCaja.
	destinoSecundario := self cintaConectadaAUnaCaja.
	
	separador := Separador conDestinoPrimario: 	destinoPrimario yunDestinoSecundario:destinoSecundario conMenas: (OrderedCollection with: MenaDeCarbon new).
	
	separador cambiarAModo: #Balanceado.
	separador transportarCarga.
	
	self assert: (destinoPrimario cantidadDeMenas) equals: 1.
	self assert: (destinoSecundario cantidadDeMenas) equals: 0.
	
	
	
! !

!SeparadoTest methodsFor: 'as yet unclassified' stamp: 'M 6/24/2022 23:52:11'!
test17UnSeparadorEnModoBalanceadoConDosMenaCarbonDespachaEquitativamenteACadaDestino

	| separador destinoPrimario destinoSecundario   menaDeCarbon menaDeHierro menas |
	
	destinoPrimario := self cintaConectadaAUnaCaja.
	destinoSecundario := self cintaConectadaAUnaCaja.
	menaDeHierro := MenaDeHierro new.
	menaDeCarbon := MenaDeCarbon new.
	menas := {menaDeHierro. menaDeCarbon} asOrderedCollection.
	
	separador := Separador conDestinoPrimario: 	destinoPrimario yunDestinoSecundario:destinoSecundario conMenas: menas.
	
	separador cambiarAModo: #Balanceado.
	separador transportarCarga.
	
	self assert: (destinoPrimario cantidadDeMenas) equals: 1.
	self assert: (destinoSecundario cantidadDeMenas) equals: 1.
	
	
	
! !


!classDefinition: #Separador category: 'Factorio-2021-1C Solucion'!
Object subclass: #Separador
	instanceVariableNames: 'destinoPrimario destinoSecundario menas modoDeFuncionamiento'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Factorio-2021-1C Solucion'!

!Separador methodsFor: 'as yet unclassified' stamp: 'M 6/24/2022 23:07:22'!
cambiarAModo: unModo

	self comprobarCambioModo: unModo.
	
	modoDeFuncionamiento := SeparadorModoFuncionamiento con: unModo
	

"	modoDeFuncionamiento := unModo"! !

!Separador methodsFor: 'as yet unclassified' stamp: 'M 6/24/2022 23:10:12'!
comprobarCambioModo: unModo

	(modoDeFuncionamiento cambioModoValido: unModo) ifFalse: [ self error: self class cambioDeModoInvalido ].

"	(unModo = #Filtrado and: [ modoDeFuncionamiento = #Balanceado ]) ifTrue: [ self error: self class cambioDeModoInvalido ].
	(unModo = #Balanceado and: [ modoDeFuncionamiento = #Filtrado ]) ifTrue: [ self error: self class cambioDeModoInvalido ]."! !

!Separador methodsFor: 'as yet unclassified' stamp: 'M 6/24/2022 22:50:01'!
modoActual

	^ modoDeFuncionamiento modo.! !

!Separador methodsFor: 'as yet unclassified' stamp: 'M 6/24/2022 23:30:04'!
paraModoBalanceado

	menas do: [ :unaMena | 
			( destinoPrimario cantidadDeMenas = destinoSecundario cantidadDeMenas ) 
			ifTrue: [ destinoPrimario agregarMenas: (OrderedCollection with: unaMena) ]
			ifFalse: [ destinoSecundario agregarMenas: (OrderedCollection with: unaMena)  ]
			  ].! !

!Separador methodsFor: 'as yet unclassified' stamp: 'M 6/24/2022 23:29:50'!
paraModoFiltrado

	destinoPrimario agregarMenas: (menas select: [ :unaMena |  unaMena esDeMaterial: MenaDeCarbon] ).
	destinoSecundario agregarMenas: (menas select: [ :unaMena |  unaMena esDeMaterial: MenaDeHierro] ).! !

!Separador methodsFor: 'as yet unclassified' stamp: 'M 6/24/2022 23:29:07'!
paraModoNeutro

	destinoPrimario agregarMenas: menas! !

!Separador methodsFor: 'as yet unclassified' stamp: 'M 6/24/2022 23:25:31'!
transportarCarga

	modoDeFuncionamiento separarMenasPara: self.

"	(modoDeFuncionamiento isKindOf: Filtrado) 
	ifTrue: [
		destinoPrimario agregarMenas: (menas select: [ :unaMena |  unaMena esDeMaterial: MenaDeCarbon] ).
		destinoSecundario agregarMenas: (menas select: [ :unaMena |  unaMena esDeMaterial: MenaDeHierro] ).
		].
	
	(modoDeFuncionamiento isKindOf: Balanceado) 
	ifTrue: [ 
		menas do: [ :unaMena | 
			( destinoPrimario cantidadDeMenas = destinoSecundario cantidadDeMenas ) 
			ifTrue: [ destinoPrimario agregarMenas: (OrderedCollection with: unaMena) ]
			ifFalse: [ destinoSecundario agregarMenas: (OrderedCollection with: unaMena)  ]
			  ].
		].
	
	(modoDeFuncionamiento isKindOf: Neutro ) ifTrue: [ destinoPrimario agregarMenas: menas ]."
! !


!Separador methodsFor: 'initialization' stamp: 'M 6/24/2022 22:49:05'!
initializeConDestinoPrimario: unDestinoPrimario yDestinoSecundario: unDestinoSecundario conMenas: unasMenas 
	
	destinoPrimario := unDestinoPrimario.
	destinoSecundario := unDestinoSecundario.
	menas := unasMenas.
	modoDeFuncionamiento := Neutro new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Separador class' category: 'Factorio-2021-1C Solucion'!
Separador class
	instanceVariableNames: ''!

!Separador class methodsFor: 'as yet unclassified' stamp: 'M 6/24/2022 20:31:12'!
cambioDeModoInvalido

	^ 'No se puede cambiar a este modo ver doc....'! !

!Separador class methodsFor: 'as yet unclassified' stamp: 'M 6/24/2022 19:37:34'!
conDestinoPrimario: unDestinoPrimario yunDestinoSecundario: unDestinoSecundario conMenas: unasMenas

	^ self new initializeConDestinoPrimario: unDestinoPrimario yDestinoSecundario: unDestinoSecundario conMenas: unasMenas.! !


!classDefinition: #SeparadorModoFuncionamiento category: 'Factorio-2021-1C Solucion'!
Object subclass: #SeparadorModoFuncionamiento
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Factorio-2021-1C Solucion'!

!SeparadorModoFuncionamiento methodsFor: 'as yet unclassified' stamp: 'M 6/24/2022 23:23:41'!
cambioModoValido: unModo

	self subclassResponsibility.! !

!SeparadorModoFuncionamiento methodsFor: 'as yet unclassified' stamp: 'M 6/24/2022 23:23:50'!
modo! !

!SeparadorModoFuncionamiento methodsFor: 'as yet unclassified' stamp: 'M 6/24/2022 23:23:08'!
xxx
	
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SeparadorModoFuncionamiento class' category: 'Factorio-2021-1C Solucion'!
SeparadorModoFuncionamiento class
	instanceVariableNames: ''!

!SeparadorModoFuncionamiento class methodsFor: 'as yet unclassified' stamp: 'M 6/24/2022 22:57:58'!
con: unModoFuncionamiento

	^ (self subclasses detect: [ :unaSubclase | unaSubclase para: unModoFuncionamiento ]) new! !


!classDefinition: #Balanceado category: 'Factorio-2021-1C Solucion'!
SeparadorModoFuncionamiento subclass: #Balanceado
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Factorio-2021-1C Solucion'!

!Balanceado methodsFor: 'as yet unclassified' stamp: 'M 6/25/2022 00:01:38'!
cambioModoValido: unModo

	^ (unModo = #Filtrado) not! !

!Balanceado methodsFor: 'as yet unclassified' stamp: 'M 6/24/2022 23:00:17'!
modo

	^ #Balanceado! !

!Balanceado methodsFor: 'as yet unclassified' stamp: 'M 6/24/2022 23:30:04'!
separarMenasPara: unSeparador

	unSeparador paraModoBalanceado! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Balanceado class' category: 'Factorio-2021-1C Solucion'!
Balanceado class
	instanceVariableNames: ''!

!Balanceado class methodsFor: 'as yet unclassified' stamp: 'M 6/24/2022 23:00:35'!
para: unModoDeFuncionamiento

	^ unModoDeFuncionamiento = #Balanceado! !


!classDefinition: #Filtrado category: 'Factorio-2021-1C Solucion'!
SeparadorModoFuncionamiento subclass: #Filtrado
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Factorio-2021-1C Solucion'!

!Filtrado methodsFor: 'as yet unclassified' stamp: 'M 6/25/2022 00:00:46'!
cambioModoValido: unModo

	^ (unModo = #Balanceado) not! !

!Filtrado methodsFor: 'as yet unclassified' stamp: 'M 6/24/2022 23:00:08'!
modo

	^ #Filtrado! !

!Filtrado methodsFor: 'as yet unclassified' stamp: 'M 6/24/2022 23:29:50'!
separarMenasPara: unSeparador

	unSeparador paraModoFiltrado! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Filtrado class' category: 'Factorio-2021-1C Solucion'!
Filtrado class
	instanceVariableNames: ''!

!Filtrado class methodsFor: 'as yet unclassified' stamp: 'M 6/25/2022 00:11:08'!
para: unModoDeFuncionamiento

	^ unModoDeFuncionamiento = #Filtrado! !


!classDefinition: #Neutro category: 'Factorio-2021-1C Solucion'!
SeparadorModoFuncionamiento subclass: #Neutro
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Factorio-2021-1C Solucion'!

!Neutro methodsFor: 'as yet unclassified' stamp: 'M 6/24/2022 23:07:41'!
cambioModoValido: unModo

	^ true! !

!Neutro methodsFor: 'as yet unclassified' stamp: 'M 6/24/2022 22:50:19'!
modo 

	^ #Neutro! !

!Neutro methodsFor: 'as yet unclassified' stamp: 'M 6/24/2022 23:29:07'!
separarMenasPara: unSeparador

	unSeparador paraModoNeutro! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Neutro class' category: 'Factorio-2021-1C Solucion'!
Neutro class
	instanceVariableNames: ''!

!Neutro class methodsFor: 'as yet unclassified' stamp: 'M 6/24/2022 22:58:28'!
para: unModoDeFuncionamiento

	^ unModoDeFuncionamiento = #Neutro! !

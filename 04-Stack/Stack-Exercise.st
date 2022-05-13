!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: 'stacks'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'M 5/11/2022 20:30:32'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'M 5/10/2022 19:41:14'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'Modelando(11-04) 5/12/2022 21:04:15'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	
	stack push: 'something'.
	
	stack pop.
	
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'M 5/10/2022 19:43:58'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'M 5/10/2022 19:57:02'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	
	firstPushedObject := 'first'.
	
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	
	stack push: secondPushedObject.
	
	
	self assert: stack pop = secondPushedObject.
	
	self assert: stack pop = firstPushedObject.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'M 5/10/2022 19:57:31'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'M 5/10/2022 19:59:49'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	
	self assert: stack size = 1.
	
	stack top.
	
	self assert: stack size = 1.! !

!OOStackTest methodsFor: 'test' stamp: 'M 5/11/2022 20:21:25'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	
	self bloque: [ stack pop ] conMensajeDeError: OOStack stackEmptyErrorDescription.
	
	"self
	
		should: [ stack pop ]
		
		raise: Error - MessageNotUnderstood 
		
		withExceptionDo: [ :anError |
			
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]"
! !

!OOStackTest methodsFor: 'test' stamp: 'M 5/11/2022 20:20:00'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	
	stack push: 'something'.
	
	stack pop.
	
	self bloque: [ stack pop ] conMensajeDeError: OOStack stackEmptyErrorDescription.
	
	"self

		should: [ stack pop ]
		
		raise: Error - MessageNotUnderstood 
		
		withExceptionDo: [ :anError |
			
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]"
! !

!OOStackTest methodsFor: 'test' stamp: 'M 5/11/2022 20:21:37'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	
	self bloque: [ stack top ] conMensajeDeError: OOStack stackEmptyErrorDescription.
	
	"self
	
		should: [ stack top ]
		
		raise: Error - MessageNotUnderstood 
		
		withExceptionDo: [ :anError |
			
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]"
! !


!OOStackTest methodsFor: 'private' stamp: 'M 5/11/2022 20:19:37'!
bloque: unBloque conMensajeDeError: unMensajeDeError

	self

	should: unBloque
	
	raise: Error - MessageNotUnderstood 
	
	withExceptionDo: [ :anError |
		
		self assert: anError messageText = unMensajeDeError ]! !



!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'M 5/11/2022 21:00:28'!
test01CuandoElStackTieneOracionesYSeBuscaConUnPrefijoElPrefijoEsCaseSensitive

	|stack setenceFinder|

	stack := OOStack new.

	stack push: 'winter is coming'.

	stack push: 'winning is everything'.

	stack push: 'The winds of Winter'.

	stack push: 'Winter is here'.

	setenceFinder := SentenceFinderByPrefix new.

	self assert: 'Winter is here' = (setenceFinder find: 'Wint' with: stack).
	
	
	
	
	

	! !


!classDefinition: #EstadoStack category: 'Stack-Exercise'!
Object subclass: #EstadoStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!EstadoStack methodsFor: 'as yet unclassified' stamp: 'Modelando(11-04) 5/13/2022 13:37:48'!
cambiarANoVacio

	self subclassResponsibility ! !

!EstadoStack methodsFor: 'as yet unclassified' stamp: 'Modelando(11-04) 5/13/2022 13:38:30'!
cambiarAVacio

	self subclassResponsibility ! !

!EstadoStack methodsFor: 'as yet unclassified' stamp: 'Modelando(11-04) 5/13/2022 13:38:44'!
estaVacio

	self subclassResponsibility ! !


!classDefinition: #EstadoNoVacio category: 'Stack-Exercise'!
EstadoStack subclass: #EstadoNoVacio
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!EstadoNoVacio methodsFor: 'as yet unclassified' stamp: 'Modelando(11-04) 5/12/2022 20:55:48'!
cambiarANoVacio

	^self	! !

!EstadoNoVacio methodsFor: 'as yet unclassified' stamp: 'Modelando(11-04) 5/12/2022 20:55:03'!
cambiarAVacio
	
	^EstadoVacio new.! !

!EstadoNoVacio methodsFor: 'as yet unclassified' stamp: 'Modelando(11-04) 5/13/2022 13:36:13'!
estaVacio

	! !


!classDefinition: #EstadoVacio category: 'Stack-Exercise'!
EstadoStack subclass: #EstadoVacio
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!EstadoVacio methodsFor: 'as yet unclassified' stamp: 'Modelando(11-04) 5/12/2022 20:55:57'!
cambiarANoVacio

	^ EstadoNoVacio new.! !

!EstadoVacio methodsFor: 'as yet unclassified' stamp: 'Modelando(11-04) 5/12/2022 20:55:03'!
cambiarAVacio

	! !

!EstadoVacio methodsFor: 'as yet unclassified' stamp: 'Modelando(11-04) 5/13/2022 13:36:29'!
estaVacio
	
	|stack|
	stack := OOStack new.
	^ stack error: OOStack stackEmptyErrorDescription ! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'stack estado'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'as yet unclassified' stamp: 'Modelando(11-04) 5/12/2022 20:51:25'!
initialize

	"stack := OrderedCollection new."
	
	stack := OrderedCollection new.
	estado := EstadoVacio new.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'M 5/10/2022 20:01:39'!
isEmpty

	^ stack isEmpty.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'Modelando(11-04) 5/13/2022 13:36:44'!
pop
	
	estado estaVacio.
	
	(stack size = 1) ifTrue: [ estado := EstadoVacio new].
	
	^ stack removeLast. 
	! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'Modelando(11-04) 5/12/2022 20:55:48'!
push: aString
	
	estado := estado cambiarANoVacio.
	stack add: aString.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'M 5/10/2022 20:01:28'!
size

	^ stack size.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'Modelando(11-04) 5/13/2022 13:36:54'!
top

	estado estaVacio .	
	^stack last. 

	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'M 5/10/2022 20:04:48'!
stackEmptyErrorDescription

	^ 'Stack is empty'! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'M 5/11/2022 21:26:08'!
compararPalabra: unaPalabra con: unPrefijo

	unaPalabra
	! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'M 5/11/2022 21:18:22'!
find: aPrefix with: aStack

	| array tempStack |

	array := OrderedCollection new.
	
	tempStack := OOStack new.
	
	(aStack isEmpty) do: [ | ultimo |
		ultimo := aStack pop.
		(self compararPalabra: ultimo con: aPrefix) ifTrue: [ array push: ultimo ].
		tempStack push: ultimo.
		].


	(tempStack isEmpty) do: [ aStack push: (tempStack pop) ].

	^ array.

	
	! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'M 5/11/2022 20:49:49'!
initialize
! !

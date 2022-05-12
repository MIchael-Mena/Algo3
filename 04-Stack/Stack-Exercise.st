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

!OOStackTest methodsFor: 'test' stamp: 'M 5/10/2022 19:41:25'!
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


!OOStackTest methodsFor: 'as yet unclassified' stamp: 'M 5/11/2022 20:29:28'!
setUp

	stacks := OOStack new.! !


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


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'as yet unclassified' stamp: 'M 5/10/2022 20:01:41'!
initialize

	stack := OrderedCollection  new.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'M 5/10/2022 20:01:39'!
isEmpty

	^ stack isEmpty.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'M 5/11/2022 20:32:17'!
pop
	
	stack isEmpty ifTrue: [ ^ self error: OOStack stackEmptyErrorDescription ].

	(stack size > 0) ifTrue: [ ^ stack removeLast. ]. 
	
	"^ self xxx."! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'M 5/10/2022 20:02:30'!
push: aString
	
	stack add: aString.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'M 5/10/2022 20:01:28'!
size

	^ stack size.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'M 5/10/2022 20:18:34'!
top

	stack isEmpty ifTrue: [ ^ self error: OOStack stackEmptyErrorDescription ].

	stack isEmpty ifFalse: [ ^ stack last. ].

	! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'M 5/10/2022 20:28:31'!
xxx

	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'M 5/10/2022 20:04:48'!
stackEmptyErrorDescription

	^ 'Stack is empty'! !


!classDefinition: #StackEmpty category: 'Stack-Exercise'!
OOStack subclass: #StackEmpty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackEmpty methodsFor: 'as yet unclassified' stamp: 'M 5/10/2022 20:27:38'!
xxx

	^ self error: OOStack stackEmptyErrorDescription! !


!classDefinition: #StackWithElements category: 'Stack-Exercise'!
OOStack subclass: #StackWithElements
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackWithElements methodsFor: 'as yet unclassified' stamp: 'M 5/10/2022 20:27:49'!
xxx

	^ stack removeLast.! !


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

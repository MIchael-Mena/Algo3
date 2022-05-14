!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'M 5/13/2022 14:30:50'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'M 5/13/2022 14:30:50'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'M 5/13/2022 14:30:50'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	
	stack push: 'something'.
	
	stack pop.
	
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'M 5/13/2022 14:30:50'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'M 5/13/2022 14:30:50'!
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

!OOStackTest methodsFor: 'test' stamp: 'M 5/13/2022 14:30:50'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'M 5/13/2022 14:30:50'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	
	self assert: stack size = 1.
	
	stack top.
	
	self assert: stack size = 1.! !

!OOStackTest methodsFor: 'test' stamp: 'M 5/13/2022 16:59:30'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	
	self testABlock: [ stack pop ] withErrorMessage: OOStack stackEmptyErrorDescription.
! !

!OOStackTest methodsFor: 'test' stamp: 'M 5/13/2022 16:59:36'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	
	stack push: 'something'.
	
	stack pop.
	
	self testABlock: [ stack pop ] withErrorMessage: OOStack stackEmptyErrorDescription.
! !

!OOStackTest methodsFor: 'test' stamp: 'M 5/13/2022 16:59:40'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	
	self testABlock: [ stack top ] withErrorMessage: OOStack stackEmptyErrorDescription.! !


!OOStackTest methodsFor: 'private' stamp: 'M 5/13/2022 16:59:09'!
testABlock: aBlockWithError withErrorMessage: aErrorMessage

	self

	should: aBlockWithError
	
	raise: Error - MessageNotUnderstood 
	
	withExceptionDo: [ :anError |
		
		self assert: anError messageText = aErrorMessage ]! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'M 5/14/2022 12:02:02'!
test01CuandoElStackTieneOracionesYSeBuscaConUnPrefijoElPrefijoEsCaseSensitive

	|stack setenceFinder|

	stack := OOStack new.

"	stack push: 'winter is coming'.

	stack push: 'winning is everything'."

	stack push: 'The winds of Winter'.

	stack push: 'Winter is here'.

	setenceFinder := SentenceFinderByPrefix new.
	
	self assert: ( (setenceFinder find: 'Wint' with: stack) identityIncludes: 'Winter is here' ).
	
	self assert: ( (setenceFinder find: 'Wint' with: stack) identityIncludes: 'The winds of Winter' ).
	
	"Assert that: {'The winds of Winter'.'Winter is here'} isEqualTo: (setenceFinder find: 'Wint' with: stack)."

"	self assert: {'Winter is here'.'The winds of Winter'} = (setenceFinder find: 'Wint' with: stack)."
	
	
	
	
	

	! !


!classDefinition: #Container category: 'Stack-Exercise'!
Object subclass: #Container
	instanceVariableNames: 'data containerBinded position'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Container methodsFor: 'accessing' stamp: 'M 5/13/2022 17:49:45'!
data

	self subclassResponsibility.! !

!Container methodsFor: 'accessing' stamp: 'M 5/13/2022 16:15:19'!
position

	^ position.! !


!Container methodsFor: 'public' stamp: 'M 5/13/2022 16:52:29'!
downgradeByANewContaineWithAData: aString

	^ ContainerNoEmpty withData: aString andLink: self.! !

!Container methodsFor: 'public' stamp: 'M 5/13/2022 16:15:36'!
isEmpty

	self subclassResponsibility.! !

!Container methodsFor: 'public' stamp: 'M 5/13/2022 16:54:26'!
unlinkFromLowerContainer
	
	self subclassResponsibility.! !


!classDefinition: #ContainerEmpty category: 'Stack-Exercise'!
Container subclass: #ContainerEmpty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!ContainerEmpty methodsFor: 'initialize' stamp: 'M 5/13/2022 16:14:19'!
initialize

	position := 0.! !


!ContainerEmpty methodsFor: 'public' stamp: 'M 5/13/2022 14:32:55'!
isEmpty

	^ true.! !

!ContainerEmpty methodsFor: 'public' stamp: 'M 5/13/2022 16:54:27'!
unlinkFromLowerContainer

	^ self raiseErrorContainerEmpty.! !


!ContainerEmpty methodsFor: 'error handling' stamp: 'M 5/13/2022 14:30:50'!
raiseErrorContainerEmpty

	^ self error: OOStack stackEmptyErrorDescription! !


!ContainerEmpty methodsFor: 'accessing' stamp: 'M 5/13/2022 14:23:30'!
data

	^ self raiseErrorContainerEmpty.! !


!classDefinition: #ContainerNoEmpty category: 'Stack-Exercise'!
Container subclass: #ContainerNoEmpty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!ContainerNoEmpty methodsFor: 'initialize' stamp: 'M 5/13/2022 16:13:55'!
initializeWithData: aString andLink: aContainerToBind

	data := aString.
	
	position := aContainerToBind position + 1.
	
	containerBinded := aContainerToBind.! !


!ContainerNoEmpty methodsFor: 'public' stamp: 'M 5/13/2022 14:33:00'!
isEmpty

	^ false.! !

!ContainerNoEmpty methodsFor: 'public' stamp: 'M 5/13/2022 16:54:27'!
unlinkFromLowerContainer

	| oldContainerBinded |
	
	oldContainerBinded := containerBinded.
	
	containerBinded := nil.

	^ oldContainerBinded.! !


!ContainerNoEmpty methodsFor: 'accessing' stamp: 'M 5/13/2022 13:48:12'!
data

	^ data! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ContainerNoEmpty class' category: 'Stack-Exercise'!
ContainerNoEmpty class
	instanceVariableNames: ''!

!ContainerNoEmpty class methodsFor: 'instance creation' stamp: 'M 5/13/2022 16:12:33'!
withData: aString andLink: aContainerToBind

	^ self new initializeWithData: aString andLink: aContainerToBind.! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'topContainer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'public' stamp: 'M 5/13/2022 15:53:46'!
isEmpty

	^ topContainer isEmpty.! !

!OOStack methodsFor: 'public' stamp: 'M 5/13/2022 16:54:27'!
pop 

	| oldTopContainer |
	
	oldTopContainer := topContainer.

	topContainer := oldTopContainer unlinkFromLowerContainer.
	
	^ oldTopContainer data.! !

!OOStack methodsFor: 'public' stamp: 'M 5/13/2022 16:54:49'!
push: aString
	
	topContainer := topContainer downgradeByANewContaineWithAData: aString.! !

!OOStack methodsFor: 'public' stamp: 'M 5/13/2022 16:18:15'!
size

	^ topContainer position.! !

!OOStack methodsFor: 'public' stamp: 'M 5/13/2022 14:30:50'!
top

	^ topContainer data.! !


!OOStack methodsFor: 'initialize' stamp: 'M 5/13/2022 16:18:50'!
initialize

	topContainer := ContainerEmpty new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'M 5/13/2022 14:28:49'!
stackEmptyErrorDescription

	^ 'Stack is empty'! !


!classDefinition: #Sentence category: 'Stack-Exercise'!
Object subclass: #Sentence
	instanceVariableNames: 'sentenceVerified'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Sentence methodsFor: 'as yet unclassified' stamp: 'M 5/14/2022 15:04:00'!
concatenateSenteceValid: aSentence

	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Sentence class' category: 'Stack-Exercise'!
Sentence class
	instanceVariableNames: ''!

!Sentence class methodsFor: 'as yet unclassified' stamp: 'M 5/14/2022 15:19:42'!
newSentence: aSentence validating: aPrefix

	| subclass | 
	
	subclass := Sentence subclasses detect: [ :aSubclass | aSubclass searchInSentence: aSentence includeAPrefix: aPrefix ].
	
	^ subclass with: aSentence.

"	^ aSentence is: aPrefix substringAt: ( aSentence indexOf: (aPrefix at: 1) )."! !

!Sentence class methodsFor: 'as yet unclassified' stamp: 'M 5/14/2022 15:20:10'!
with: aSentence

	^ self new initializeWith: aSentence.! !


!classDefinition: #SentenceNoValid category: 'Stack-Exercise'!
Sentence subclass: #SentenceNoValid
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceNoValid methodsFor: 'as yet unclassified' stamp: 'M 5/14/2022 15:12:35'!
concatenateSenteceValid: unasOraciones

	^ unasOraciones! !

!SentenceNoValid methodsFor: 'as yet unclassified' stamp: 'M 5/14/2022 15:12:02'!
initializeWith: aSentence

	sentenceVerified := nil.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceNoValid class' category: 'Stack-Exercise'!
SentenceNoValid class
	instanceVariableNames: ''!

!SentenceNoValid class methodsFor: 'as yet unclassified' stamp: 'M 5/14/2022 15:19:42'!
searchInSentence: aSentence includeAPrefix: aPrefix

	^ ( aSentence is: aPrefix substringAt: ( aSentence indexOf: (aPrefix at: 1) ) ) not.! !


!classDefinition: #SentenceValid category: 'Stack-Exercise'!
Sentence subclass: #SentenceValid
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceValid methodsFor: 'as yet unclassified' stamp: 'M 5/14/2022 15:13:17'!
concatenateSenteceValid: aCollectionSentencesValid

	^( aCollectionSentencesValid , {sentenceVerified}).! !

!SentenceValid methodsFor: 'as yet unclassified' stamp: 'M 5/14/2022 15:11:52'!
initializeWith: aSentence

	sentenceVerified := aSentence.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceValid class' category: 'Stack-Exercise'!
SentenceValid class
	instanceVariableNames: ''!

!SentenceValid class methodsFor: 'as yet unclassified' stamp: 'M 5/14/2022 15:19:42'!
searchInSentence: aSentence includeAPrefix: aPrefix

	^ aSentence is: aPrefix substringAt: ( aSentence indexOf: (aPrefix at: 1) ).! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'M 5/14/2022 15:00:34'!
find: aPrefix with: aStack

	| tempSentence aCollectionSentencesValid sentenceVerified |

	(aStack isEmpty) ifTrue: [^{}].
	
	tempSentence := aStack pop.
	
	aCollectionSentencesValid := self find: aPrefix with: aStack.
	
	aStack push: tempSentence.
	
	sentenceVerified := Sentence newSentence: tempSentence validating: aPrefix.
	
	^ sentenceVerified concatenateSenteceValid: aCollectionSentencesValid.
	
"	(self findInSentence: tempSentence includeAPrefix: aPrefix) 
	ifTrue: [^( aCollectionSentencesValid , {tempSentence} )] 
	ifFalse: [^{aCollectionSentencesValid}]."


"	| tempSentence aCollectionSentencesValid |

	(aStack isEmpty) ifTrue: [^{}].
	
	tempSentence := aStack pop.
	
	aCollectionSentencesValid := self find: aPrefix with: aStack.
	
	aStack push: tempSentence.

	(self findInSentence: tempSentence includeAPrefix: aPrefix) 
	ifTrue: [^( aCollectionSentencesValid , {tempSentence} )] 
	ifFalse: [^{aCollectionSentencesValid}]."


	


"	| array tempStack |

	array := OrderedCollection new.
	
	tempStack := OOStack new.
	
	[aStack isEmpty] whileFalse: [ | ultimo |
		ultimo := aStack pop.
		(self compararPalabra: ultimo con: aPrefix) ifTrue: [ array add: ultimo ].
		tempStack push: ultimo.
		].

	[tempStack isEmpty] whileFalse: [ aStack push: (tempStack pop) ].

	^ array."

	
	! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'M 5/11/2022 20:49:49'!
initialize
! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'M 5/14/2022 15:30:34'!
searchInSentence: aSentence includeAPrefix: aPrefix

	"Este metodo se usa en la version recursiva con if y con while"

	^ aSentence is: aPrefix substringAt: ( aSentence indexOf: (aPrefix at: 1) ).! !

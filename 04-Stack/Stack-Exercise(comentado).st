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

!OOStackTest methodsFor: 'test' stamp: 'M 5/16/2022 16:54:54'!
test11AStackLimitedToTwoElementsCanNotPushMoreElements

	| stack  |
	
	stack := OOStack with: 2.
	
	stack push: 'a'.
	
	stack push: 'b'.
	
	self testABlock: [ stack push: 'c'. ] withErrorMessage: OOStack stackFulled.! !

!OOStackTest methodsFor: 'test' stamp: 'M 5/16/2022 14:28:30'!
test12TheLimitOfAStackMustBeGreaterthanZero
	
	self testABlock: [ OOStack with: 0 ] withErrorMessage: OOStack stackInvalidLimit.! !


!OOStackTest methodsFor: 'private' stamp: 'M 5/15/2022 21:05:25'!
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

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'M 5/16/2022 16:47:34'!
test01IfTheStackIsEmptyAnEmptyArrayIsReturned

	|stack|

	stack := OOStack new.
	
	self assert: (SentenceFinderByPrefix with: stack and: 'Wint') = {}.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'M 5/16/2022 16:48:23'!
test02APrefixCanNotContainEmptySpacesOrBeEmpty

	|stack|

	stack := OOStack new.
	
	self testABlock:  [SentenceFinderByPrefix with: stack and: 'W i n t e r' .
		SentenceFinderByPrefix with: stack and: ''] withErrorMessage: (SentenceFinderByPrefix aPrefixCanNotHaveEmptySpaces) .
	

	! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'M 5/16/2022 17:29:13'!
test03aPrefixCanOnlyContainLetters

	|stack|

	stack := OOStack new.
	
	stack push: 'Wint'.
	
	self testABlock:  
	[SentenceFinderByPrefix with: stack and: 'Wint132' .
	SentenceFinderByPrefix with: stack and: '$Wint-'.
	SentenceFinderByPrefix with: stack and: 911] 
	withErrorMessage: (SentenceFinderByPrefix prefixInvalidCharacter ).
	
	


	! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'M 5/16/2022 17:27:53'!
test04FinderAPrefixInAStackWithSentencesIsCaseSensitive

	|stack  |

	stack := OOStack new.

	stack push: 'winter is coming'.

	stack push: 'winning is everything'.

	stack push: 'The winds of Winter'.

	stack push: 'Winter is here'.
	
"	setenceFinder := SentenceFinderByPrefix with: stack and: 'Wint'."
	
"	setenceFinder := SentenceFinderByPrefix new."
	
"	self assert: ( (setenceFinder findSentence)  identityIncludes: 'Winter is here' )."
	
	self assert: (SentenceFinderByPrefix with: stack and: 'Wint') = {'Winter is here'}.
	
	self assert: (SentenceFinderByPrefix with: stack and: 'wint') = {'winter is coming'}.
	
"	self assert: ( (setenceFinder find: 'Wint' with: stack) identityIncludes: 'Winter is here' )."
	
"	Assert that: {'Winter is here'} isEqualTo: (setenceFinder find: 'Wint' with: stack).

	self assert: {'Winter is here'} = (setenceFinder find: 'Wint' with: stack)."
	
	
	
	

	! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'M 5/16/2022 17:28:02'!
test05FinderAPrefixInAStackWithSentencesReturnsAllSentencesContainingThePrefixAtTheBeginning

	|stack  |

	stack := OOStack new.

	stack push: 'winter is coming'.

	stack push: 'The winds of Winter'.
	
	stack push: 'winning is everything'.

	stack push: 'Winter is here'.
	
	self assert: (SentenceFinderByPrefix with: stack and: 'win') = {'winter is coming'. 'winning is everything'}.

	
	
	

	! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'M 5/16/2022 17:13:46'!
test06WhenFinishingTheSearchForAPrefixTheStackKeepsTheSameOrder

	|stack|

	stack := OOStack new.
	
	stack push: 'winter is coming'.

	stack push: 'winning is everything'.

	stack push: 'The winds of Winter'.

	stack push: 'Winter is here'.
	
	SentenceFinderByPrefix with: stack and: 'Wint'.
	
	self assert: {stack pop, stack pop, stack pop, stack pop} = {'Winter is here', 'The winds of Winter', 'winning is everything', 'winter is coming'}.
	
	


	! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'M 5/16/2022 17:24:39'!
test07TheOrderOfReturnedSentencesIsReverseToTheLiFOBehaviorOfTheStack

	|stack  |

	stack := OOStack new.

	stack push: 'winter is coming'.

	stack push: 'winds of Winter'.
	
	stack push: 'winning is everything'.

	stack push: 'winter is here'.
	
	self assert: (SentenceFinderByPrefix with: stack and: 'win') = {'winter is coming'. 'winds of Winter'. 'winning is everything'. 'winter is here'}.

	
	
	

	! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'M 5/15/2022 22:38:32'!
testABlock: aBlockWithError withErrorMessage: aErrorMessage

	self

	should: aBlockWithError
	
	raise: Error - MessageNotUnderstood 
	
	withExceptionDo: [ :anError |
		
		self assert: anError messageText = aErrorMessage ]! !


!classDefinition: #Container category: 'Stack-Exercise'!
Object subclass: #Container
	instanceVariableNames: 'data lowerContainer position'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Container methodsFor: 'accessing' stamp: 'M 5/13/2022 17:49:45'!
data

	self subclassResponsibility.! !

!Container methodsFor: 'accessing' stamp: 'M 5/13/2022 16:15:19'!
position

	^ position.! !


!Container methodsFor: 'public' stamp: 'M 5/16/2022 00:24:16'!
downgradeByANewContainerWithAData: aString

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

!ContainerNoEmpty methodsFor: 'initialize' stamp: 'M 5/16/2022 13:56:27'!
initializeWithData: aString andLink: aContainerToBind

	data := aString.
	
	position := aContainerToBind position + 1.
	
	lowerContainer := aContainerToBind.! !


!ContainerNoEmpty methodsFor: 'public' stamp: 'M 5/13/2022 14:33:00'!
isEmpty

	^ false.! !

!ContainerNoEmpty methodsFor: 'public' stamp: 'M 5/16/2022 13:54:47'!
unlinkFromLowerContainer

	| oldLowerContainer |
	
	oldLowerContainer := lowerContainer.
	
	lowerContainer := nil.

	^ oldLowerContainer.! !


!ContainerNoEmpty methodsFor: 'accessing' stamp: 'M 5/13/2022 13:48:12'!
data

	^ data! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ContainerNoEmpty class' category: 'Stack-Exercise'!
ContainerNoEmpty class
	instanceVariableNames: ''!

!ContainerNoEmpty class methodsFor: 'instance creation' stamp: 'M 5/16/2022 13:55:47'!
withData: aString andLink: aLowerContainer

	^ self new initializeWithData: aString andLink: aLowerContainer.! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'topContainer amountMax'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'public' stamp: 'M 5/13/2022 15:53:46'!
isEmpty

	^ topContainer isEmpty.! !

!OOStack methodsFor: 'public' stamp: 'M 5/15/2022 19:40:44'!
pop 

	| oldTopContainer |
	
	oldTopContainer := topContainer.

	topContainer := oldTopContainer unlinkFromLowerContainer.
	
	^ oldTopContainer data.! !

!OOStack methodsFor: 'public' stamp: 'M 5/16/2022 00:24:16'!
push: aString

	(amountMax = topContainer position )  ifTrue:[ ^ self error: OOStack stackFulled ].
		
	topContainer := topContainer downgradeByANewContainerWithAData: aString.! !

!OOStack methodsFor: 'public' stamp: 'M 5/13/2022 16:18:15'!
size

	^ topContainer position.! !

!OOStack methodsFor: 'public' stamp: 'M 5/13/2022 14:30:50'!
top

	^ topContainer data.! !


!OOStack methodsFor: 'initialize' stamp: 'M 5/13/2022 16:18:50'!
initialize

	topContainer := ContainerEmpty new.! !

!OOStack methodsFor: 'initialize' stamp: 'M 5/16/2022 13:56:12'!
initializeWith: aAmountMax

	topContainer := ContainerEmpty new.
	
	amountMax := aAmountMax.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'M 5/13/2022 14:28:49'!
stackEmptyErrorDescription

	^ 'Stack is empty'! !

!OOStack class methodsFor: 'error descriptions' stamp: 'M 5/16/2022 14:15:27'!
stackFulled

	^ 'The stack is full.'! !

!OOStack class methodsFor: 'error descriptions' stamp: 'M 5/16/2022 14:15:02'!
stackInvalidLimit

	^ 'Stack limit must be greater than zero.'! !


!OOStack class methodsFor: 'instance creation' stamp: 'M 5/16/2022 13:52:05'!
with: aAmountMax

	(aAmountMax < 1) ifTrue: [ self error: OOStack stackInvalidLimit ].

	^ self new initializeWith: aAmountMax.! !


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

!Sentence class methodsFor: 'as yet unclassified' stamp: 'M 5/15/2022 20:52:26'!
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

!SentenceNoValid methodsFor: 'as yet unclassified' stamp: 'M 5/15/2022 20:25:01'!
initializeWith: aSentence

	sentenceVerified := nil.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceNoValid class' category: 'Stack-Exercise'!
SentenceNoValid class
	instanceVariableNames: ''!

!SentenceNoValid class methodsFor: 'as yet unclassified' stamp: 'M 5/15/2022 21:29:53'!
searchInSentence: aSentence includeAPrefix: aPrefix

	^  (aSentence is: aPrefix substringAt: 1) not.
! !


!classDefinition: #SentenceValid category: 'Stack-Exercise'!
Sentence subclass: #SentenceValid
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceValid methodsFor: 'as yet unclassified' stamp: 'M 5/15/2022 20:18:56'!
concatenateSenteceValid: aCollectionSentencesValid

	^( aCollectionSentencesValid , {sentenceVerified}).! !

!SentenceValid methodsFor: 'as yet unclassified' stamp: 'M 5/14/2022 15:11:52'!
initializeWith: aSentence

	sentenceVerified := aSentence.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceValid class' category: 'Stack-Exercise'!
SentenceValid class
	instanceVariableNames: ''!

!SentenceValid class methodsFor: 'as yet unclassified' stamp: 'M 5/15/2022 20:20:05'!
searchInSentence: aSentence includeAPrefix: aPrefix

	^ (aSentence is: aPrefix substringAt: 1).! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'M 5/16/2022 14:18:01'!
findWithin: aStack a: aPrefix

	| tempSentence aCollectionSentencesValid |

	(aStack isEmpty) ifTrue: [^{}].
	
	tempSentence := aStack pop.
	
	aCollectionSentencesValid := self findWithin: aStack a: aPrefix.
	
	aStack push: tempSentence.

	(self searchInSentence: tempSentence includeAPrefix: aPrefix)
	ifTrue: [^( aCollectionSentencesValid , {tempSentence} )] 
	ifFalse: [^aCollectionSentencesValid].
	
	

"	| tempSentence aCollectionSentencesValid sentenceVerified |
	
	(aStack isEmpty) ifTrue: [^{}].

	tempSentence := aStack pop.

	aCollectionSentencesValid := self find: aPrefix with: aStack.

	aStack push: tempSentence.

	sentenceVerified := Sentence newSentence: tempSentence validating: aPrefix.

	^ sentenceVerified concatenateSenteceValid: aCollectionSentencesValid."





"	| array tempStack |

	array := OrderedCollection new.
	
	tempStack := OOStack new.
	
	[aStack isEmpty] whileFalse: [ | ultimo |
		ultimo := aStack pop.
		(self find: ultimo with: aPrefix) ifTrue: [ array add: ultimo ].
		tempStack push: ultimo.
		].

	[tempStack isEmpty] whileFalse: [ aStack push: (tempStack pop) ].

	^ array."

	
	! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'M 5/15/2022 20:13:39'!
searchInSentence: aSentence includeAPrefix: aPrefix

	"Este metodo se usa en la version recursiva con if y con while"

	^ (aSentence is: aPrefix substringAt: 1).

"	^ aSentence is: aPrefix substringAt: ( aSentence indexOf: (aPrefix at: 1) )."! !


!SentenceFinderByPrefix methodsFor: 'initialize' stamp: 'M 5/16/2022 14:18:22'!
initializeWith: aStack and: aPrefix

	self validatePrefix: aPrefix.
	
	^ self findWithin: aStack a: aPrefix.! !


!SentenceFinderByPrefix methodsFor: 'testing' stamp: 'M 5/16/2022 16:46:16'!
validatePrefix: aPrefix

	(aPrefix includesSubString: ' ') ifTrue: [ ^ self error: SentenceFinderByPrefix aPrefixCanNotHaveEmptySpaces ].
	
	aPrefix do: [:c | (c isLetter) ifFalse: [ ^ self error: SentenceFinderByPrefix prefixInvalidCharacter ] ].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'M 5/16/2022 16:46:16'!
aPrefixCanNotHaveEmptySpaces

	^ 'There are empty spaces in the prefix.'! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'M 5/16/2022 16:42:17'!
prefixInvalidCharacter

	^ 'Prefix can only contain letters.'! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'M 5/15/2022 23:06:02'!
with: aStack and: aPrefix

	^ self new initializeWith: aStack and: aPrefix.! !

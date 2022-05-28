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

!OOStackTest methodsFor: 'test' stamp: 'M 5/16/2022 17:40:36'!
test12TheLimitOfAStackMustBeAIntegerGreaterthanZero
	
	self testABlock: 
	[ OOStack with: 0.
	OOStack with: -1.
	OOStack with: 1.5] 
	withErrorMessage: OOStack stackInvalidLimit.! !


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

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'M 5/18/2022 22:22:24'!
addElements: aListElements at: aStack

	aListElements do: [:element | aStack push: element].! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'M 5/16/2022 16:47:34'!
test01IfTheStackIsEmptyAnEmptyArrayIsReturned

	|stack|

	stack := OOStack new.
	
	self assert: (SentenceFinderByPrefix with: stack and: 'Wint') = {}.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'M 5/16/2022 16:48:23'!
test02APrefixCanNotContainEmptySpacesOrBeEmpty

	|stack|

	stack := OOStack new.
	
	self testABlock:  [SentenceFinderByPrefix with: stack and: 'W i n t e r' .
		SentenceFinderByPrefix with: stack and: ''] withErrorMessage: (SentenceFinderByPrefix aPrefixCanNotHaveEmptySpaces) .
	

	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'M 5/16/2022 17:29:13'!
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

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'M 5/18/2022 22:22:44'!
test04FinderAPrefixInAStackWithSentencesIsCaseSensitive

	|stack  |

	stack := OOStack new.
	
	self addElements: {'winter is coming'.'winning is everything'.'The winds of Winter'.'Winter is here'} at: stack.

	self assert: (SentenceFinderByPrefix with: stack and: 'Wint') = {'Winter is here'}.
	
	self assert: (SentenceFinderByPrefix with: stack and: 'wint') = {'winter is coming'}.
	
	
	

	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'M 5/18/2022 22:23:35'!
test05FinderAPrefixInAStackWithSentencesReturnsAllSentencesContainingThePrefixAtTheBeginning

	|stack  |

	stack := OOStack new.
	
	self addElements: {'winter is coming'.'The winds of Winter'.'winning is everything'.'Winter is here'.} at: stack.
	
	self assert: (SentenceFinderByPrefix with: stack and: 'win') = {'winter is coming'. 'winning is everything'}.

	
	
	

	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'M 5/18/2022 22:24:20'!
test06WhenFinishingTheSearchForAPrefixTheStackKeepsTheSameOrder

	|stack|

	stack := OOStack new.
	
	self addElements: {'winter is coming'.'winning is everything'.'The winds of Winter'.'Winter is here'.} at: stack.
	
	SentenceFinderByPrefix with: stack and: 'Wint'.
	
	self assert: {stack pop, stack pop, stack pop, stack pop} = {'Winter is here', 'The winds of Winter', 'winning is everything', 'winter is coming'}.
	
	


	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'M 5/18/2022 22:25:00'!
test07TheOrderOfReturnedSentencesIsReverseToTheLiFOBehaviorOfTheStack

	|stack  |

	stack := OOStack new.

	self addElements:{'winter is coming'.'winds of Winter'.'winning is everything'.'winter is here'.} at: stack.
	
	self assert: (SentenceFinderByPrefix with: stack and: 'win') = {'winter is coming'. 'winds of Winter'. 'winning is everything'. 'winter is here'}.

	
	
	

	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'M 5/15/2022 22:38:32'!
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

!OOStack methodsFor: 'public' stamp: 'M 5/16/2022 17:52:06'!
push: aString

	self validateStackFulled.
		
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

!OOStack methodsFor: 'initialize' stamp: 'M 5/16/2022 17:54:05'!
initializeWith: aAmountMax

	self validateAmountMax: aAmountMax.

	topContainer := ContainerEmpty new.
	
	amountMax := aAmountMax.! !


!OOStack methodsFor: 'private' stamp: 'M 5/16/2022 17:50:49'!
validateAmountMax: aAmountMax

	(aAmountMax < 1 | (aAmountMax isInteger not) ) ifTrue: [ self error: OOStack stackInvalidLimit ].! !

!OOStack methodsFor: 'private' stamp: 'M 5/16/2022 17:52:41'!
validateStackFulled

	(amountMax = topContainer position )  ifTrue:[ ^ self error: OOStack stackFulled ].! !

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

!OOStack class methodsFor: 'error descriptions' stamp: 'M 5/16/2022 17:37:42'!
stackInvalidLimit

	^ 'Stack limit must be a intenger greater than zero.'! !


!OOStack class methodsFor: 'instance creation' stamp: 'M 5/16/2022 17:46:19'!
with: aAmountMax

	^ self new initializeWith: aAmountMax.! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'M 5/16/2022 17:32:40'!
findWithin: aStack a: aPrefix

	| tempSentence aCollectionSentencesValid |

	(aStack isEmpty) ifTrue: [^{}].
	
	tempSentence := aStack pop.
	
	aCollectionSentencesValid := self findWithin: aStack a: aPrefix.
	
	aStack push: tempSentence.

	(self searchInSentence: tempSentence includeAPrefix: aPrefix)
	ifTrue: [^( aCollectionSentencesValid , {tempSentence} )] 
	ifFalse: [^aCollectionSentencesValid].
	! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'M 5/16/2022 17:32:31'!
searchInSentence: aSentence includeAPrefix: aPrefix

	^ (aSentence is: aPrefix substringAt: 1).! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'M 5/16/2022 16:46:16'!
validatePrefix: aPrefix

	(aPrefix includesSubString: ' ') ifTrue: [ ^ self error: SentenceFinderByPrefix aPrefixCanNotHaveEmptySpaces ].
	
	aPrefix do: [:c | (c isLetter) ifFalse: [ ^ self error: SentenceFinderByPrefix prefixInvalidCharacter ] ].! !


!SentenceFinderByPrefix methodsFor: 'initialize' stamp: 'M 5/16/2022 14:18:22'!
initializeWith: aStack and: aPrefix

	self validatePrefix: aPrefix.
	
	^ self findWithin: aStack a: aPrefix.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'creation' stamp: 'M 5/15/2022 23:06:02'!
with: aStack and: aPrefix

	^ self new initializeWith: aStack and: aPrefix.! !


!SentenceFinderByPrefix class methodsFor: 'error description' stamp: 'M 5/16/2022 16:46:16'!
aPrefixCanNotHaveEmptySpaces

	^ 'There are empty spaces in the prefix.'! !

!SentenceFinderByPrefix class methodsFor: 'error description' stamp: 'M 5/16/2022 16:42:17'!
prefixInvalidCharacter

	^ 'Prefix can only contain letters.'! !

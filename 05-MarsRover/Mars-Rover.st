!classDefinition: #MarsRoverTest category: 'Mars-Rover'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'M 5/28/2022 19:08:32'!
test01ElMarsRoversComienzaEnLaPosicionInicialRecibida
	| marsRover |
	
	marsRover :=  MarsRover withInitialPosition: (0@0) andDirectionCardinal: 'N'.
	
	self assert: (marsRover position = (0@0))! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'M 5/28/2022 19:13:47'!
test02CuandoMarsRoversRecibeUnComandoForwardEnLaDireccionNorth
	| marsRover |

	marsRover :=  MarsRover withInitialPosition: (0@0) andDirectionCardinal: 'N'.
	
	marsRover comandsToRun: 'f'.

	self assert: (marsRover position = (0@1)).! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'M 5/28/2022 19:14:33'!
test03CuandoMarsRoversRecibeUnComandoForwardEnLaDireccionEast
	| marsRover |

	marsRover :=  MarsRover withInitialPosition: (0@0) andDirectionCardinal: 'E'.
	
	marsRover comandsToRun: 'f'.

	self assert: (marsRover position = (1@0)).! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'M 5/28/2022 20:41:50'!
test04CuandoMarsRoversRecibeMasDeUnComandoEjecutaTodosLosComandos
	| marsRover |

	marsRover :=  MarsRover withInitialPosition: (0@0) andDirectionCardinal: 'E'.
	
	marsRover comandsToRun: 'fb'.

	self assert: (marsRover position = (0@0)).! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'M 5/28/2022 21:01:37'!
test05CuandoMarsRoberAvanzaYGiraCambiaSuDireccion
	| marsRover |

	marsRover :=  MarsRover withInitialPosition: (0@0) andDirectionCardinal: 'E'.

	marsRover comandsToRun: 'flf'.

	self assert: (marsRover position = (1@1) ).
	
	self assert: ('N' = marsRover direccionActual ).! !


!classDefinition: #Comand category: 'Mars-Rover'!
Object subclass: #Comand
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!Comand methodsFor: 'as yet unclassified' stamp: 'M 5/28/2022 20:31:51'!
useToMoveIn: aDirection

	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Comand class' category: 'Mars-Rover'!
Comand class
	instanceVariableNames: ''!

!Comand class methodsFor: 'as yet unclassified' stamp: 'M 5/28/2022 19:58:19'!
with: aComand

	^ (Comand subclasses detect: [ :aSubclassDirection | aSubclassDirection isAComandValid: aComand ]) new.! !


!classDefinition: #Backward category: 'Mars-Rover'!
Comand subclass: #Backward
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!Backward methodsFor: 'as yet unclassified' stamp: 'M 5/28/2022 20:31:23'!
useToMoveIn: aDirection

	^ aDirection backward.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Backward class' category: 'Mars-Rover'!
Backward class
	instanceVariableNames: ''!

!Backward class methodsFor: 'as yet unclassified' stamp: 'M 5/28/2022 19:59:04'!
isAComandValid: aComand

	^ 'b' = aComand.! !


!classDefinition: #Forward category: 'Mars-Rover'!
Comand subclass: #Forward
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!Forward methodsFor: 'as yet unclassified' stamp: 'M 5/28/2022 20:22:22'!
useToMoveIn: aDirection

	^ aDirection forward.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Forward class' category: 'Mars-Rover'!
Forward class
	instanceVariableNames: ''!

!Forward class methodsFor: 'as yet unclassified' stamp: 'M 5/28/2022 19:59:08'!
isAComandValid: aComand

	^ 'f' = aComand.! !


!classDefinition: #Left category: 'Mars-Rover'!
Comand subclass: #Left
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!Left methodsFor: 'as yet unclassified' stamp: 'M 5/28/2022 21:17:29'!
useToMoveIn: aDirection! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Left class' category: 'Mars-Rover'!
Left class
	instanceVariableNames: ''!

!Left class methodsFor: 'as yet unclassified' stamp: 'M 5/28/2022 19:59:22'!
isAComandValid: aComand

	^ 'l' = aComand.! !


!classDefinition: #Right category: 'Mars-Rover'!
Comand subclass: #Right
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!Right methodsFor: 'as yet unclassified' stamp: 'M 5/28/2022 21:17:32'!
useToMoveIn: aDirection! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Right class' category: 'Mars-Rover'!
Right class
	instanceVariableNames: ''!

!Right class methodsFor: 'as yet unclassified' stamp: 'M 5/28/2022 19:59:28'!
isAComandValid: aComand

	^ 'r' = aComand.! !


!classDefinition: #Direction category: 'Mars-Rover'!
Object subclass: #Direction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!Direction methodsFor: 'as yet unclassified' stamp: 'M 5/28/2022 21:03:21'!
cardinal 

 	self subclassResponsibility.! !

!Direction methodsFor: 'as yet unclassified' stamp: 'M 5/28/2022 20:30:07'!
positionAMoveWithComands: aComand

	^ aComand useToMoveIn: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Direction class' category: 'Mars-Rover'!
Direction class
	instanceVariableNames: ''!

!Direction class methodsFor: 'as yet unclassified' stamp: 'M 5/28/2022 19:31:49'!
with: aDirection

	^ (Direction subclasses detect: [ :aSubclassDirection | aSubclassDirection isADirectionValid: aDirection ]) new.! !


!classDefinition: #East category: 'Mars-Rover'!
Direction subclass: #East
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!East methodsFor: 'as yet unclassified' stamp: 'M 5/28/2022 20:23:51'!
backward

	^(-1@0)! !

!East methodsFor: 'as yet unclassified' stamp: 'M 5/28/2022 21:03:33'!
cardinal

	^ 'E'! !

!East methodsFor: 'as yet unclassified' stamp: 'M 5/28/2022 20:10:32'!
forward

	^(1@0)! !

!East methodsFor: 'as yet unclassified' stamp: 'M 5/28/2022 21:12:13'!
left

	^ North new.! !

!East methodsFor: 'as yet unclassified' stamp: 'M 5/28/2022 20:23:08'!
positionAMoveWithComands: aComand

	^ aComand useToMoveIn: self.


"	(aComand = 'f') ifTrue: [ ^ (1@0)]."
! !

!East methodsFor: 'as yet unclassified' stamp: 'M 5/28/2022 21:12:36'!
right

	^ South new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'East class' category: 'Mars-Rover'!
East class
	instanceVariableNames: ''!

!East class methodsFor: 'as yet unclassified' stamp: 'M 5/28/2022 19:26:22'!
isADirectionValid: aDirection

	^ 'E' = aDirection.! !


!classDefinition: #North category: 'Mars-Rover'!
Direction subclass: #North
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!North methodsFor: 'as yet unclassified' stamp: 'M 5/28/2022 20:27:45'!
backward
	
	^ (0@-1)! !

!North methodsFor: 'as yet unclassified' stamp: 'M 5/28/2022 21:03:45'!
cardinal

	^ 'N'! !

!North methodsFor: 'as yet unclassified' stamp: 'M 5/28/2022 20:15:35'!
forward
	
	^ (0@1)! !

!North methodsFor: 'as yet unclassified' stamp: 'M 5/28/2022 21:13:14'!
left

	^ West new.! !

!North methodsFor: 'as yet unclassified' stamp: 'M 5/28/2022 21:13:44'!
right

	^ East new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'North class' category: 'Mars-Rover'!
North class
	instanceVariableNames: ''!

!North class methodsFor: 'as yet unclassified' stamp: 'M 5/28/2022 19:26:34'!
isADirectionValid: aDirection

	^ 'N' = aDirection.! !


!classDefinition: #South category: 'Mars-Rover'!
Direction subclass: #South
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!South methodsFor: 'as yet unclassified' stamp: 'M 5/28/2022 20:28:52'!
backward

	^ (0@1)! !

!South methodsFor: 'as yet unclassified' stamp: 'M 5/28/2022 21:03:51'!
cardinal

	^ 'S'! !

!South methodsFor: 'as yet unclassified' stamp: 'M 5/28/2022 20:28:41'!
forward

	^ (0@-1)! !

!South methodsFor: 'as yet unclassified' stamp: 'M 5/28/2022 21:15:02'!
left

	^ East new.
	! !

!South methodsFor: 'as yet unclassified' stamp: 'M 5/28/2022 21:15:15'!
right

	^ West new.
	! !


!classDefinition: #West category: 'Mars-Rover'!
Direction subclass: #West
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!West methodsFor: 'as yet unclassified' stamp: 'M 5/28/2022 20:29:33'!
backward

	^ (1@0)! !

!West methodsFor: 'as yet unclassified' stamp: 'M 5/28/2022 21:04:03'!
cardinal

	^ 'O'! !

!West methodsFor: 'as yet unclassified' stamp: 'M 5/28/2022 20:29:16'!
forward

	^ (-1@0)! !

!West methodsFor: 'as yet unclassified' stamp: 'M 5/28/2022 21:15:49'!
left

	^  South! !

!West methodsFor: 'as yet unclassified' stamp: 'M 5/28/2022 21:16:15'!
right

	^  North new.! !


!classDefinition: #MarsRover category: 'Mars-Rover'!
Object subclass: #MarsRover
	instanceVariableNames: 'pointInitial direction positionX positionY'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!MarsRover methodsFor: 'initialization' stamp: 'M 5/28/2022 19:35:52'!
initializeWithInitialPosition: aPointInitial andDirectionCardinal: aInitialDirection 

	positionX := aPointInitial x.
	positionY := aPointInitial y.
	direction := Direction with: aInitialDirection.! !


!MarsRover methodsFor: 'as yet unclassified' stamp: 'M 5/28/2022 21:24:42'!
comandsToRun: aComands 

	aComands do: [ :aComand |  
			(aComand  = $l) ifTrue: [ direction := direction left ].
			(aComand  = $r) ifTrue: [ direction := direction right ].
			( aComand = $f or: [aComand = $b] ) ifTrue: [
			positionX := (direction positionAMoveWithComands: (Comand with: (aComand asString) ) ) x + positionX.
			positionY := (direction positionAMoveWithComands: (Comand with: (aComand asString) ) ) y + positionY. ] ].


! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'M 5/28/2022 21:03:02'!
direccionActual

	^ direction cardinal! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'M 5/28/2022 18:51:43'!
position
	
	^ (positionX@positionY)! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'Mars-Rover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'instance creation' stamp: 'M 5/28/2022 18:48:59'!
withInitialPosition: aPointInitial andDirectionCardinal: aInitialDirection

	^self new initializeWithInitialPosition: aPointInitial andDirectionCardinal: aInitialDirection.! !

!classDefinition: #MarsRoverTest category: 'Mars-Rover'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!MarsRoverTest methodsFor: 'testing' stamp: 'M 5/30/2022 14:32:05'!
test01ElMarsRoverComienzaEnLaPosicionInicialAsignada
	| marsRover |
	
	marsRover :=  MarsRover withInitialPosition: (0@0) andDirectionCardinal: 'N'.
	
	self assert: (marsRover position = (0@0))! !

!MarsRoverTest methodsFor: 'testing' stamp: 'M 5/30/2022 13:42:15'!
test02ElMarsRoverSeMueveCuandoRecibeUnSoloComandoSegunLaDireccionInicialAsignada
	| marsRover |

	marsRover :=  MarsRover withInitialPosition: (0@0) andDirectionCardinal: 'N'.
	
	marsRover comandsToRun: 'f'.

	self assert: (marsRover position = (0@1)).! !

!MarsRoverTest methodsFor: 'testing' stamp: 'M 5/30/2022 15:17:49'!
test03ElMarsRoverPuedeEjecutarVariosComandosDeMovimientosSegunLaDireccionInicialAsignada
	| marsRover |

	marsRover :=  MarsRover withInitialPosition: (0@0) andDirectionCardinal: 'O'.
	
	marsRover comandsToRun: 'fffb'.

	self assert: (marsRover position = (-2@0)).! !

!MarsRoverTest methodsFor: 'testing' stamp: 'M 5/30/2022 15:17:18'!
test04CuandoElMarsRoverRecibeUnComandoDeGiroCambiaDeDireccion
	| marsRover |

	marsRover :=  MarsRover withInitialPosition: (0@0) andDirectionCardinal: 'S'.
	
	marsRover comandsToRun: 'l'.

	self assert: (marsRover currentDirection = 'E') .! !

!MarsRoverTest methodsFor: 'testing' stamp: 'M 5/30/2022 15:14:07'!
test05ELMarsRoberPuedeCombinarComandosDeGiroYMovimiento
	| marsRover |

	marsRover :=  MarsRover withInitialPosition: (0@0) andDirectionCardinal: 'E'.

	marsRover comandsToRun: 'flf'.

	self assert: (marsRover position = (1@1) ).
	
	self assert: ('N' = marsRover currentDirection ).! !


!classDefinition: #CardinalDirection category: 'Mars-Rover'!
Object subclass: #CardinalDirection
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!CardinalDirection methodsFor: 'angle of rotation' stamp: 'M 5/30/2022 13:34:15'!
ninetyDegreesLeft

	self subclassResponsibility.! !

!CardinalDirection methodsFor: 'angle of rotation' stamp: 'M 5/30/2022 13:34:23'!
ninetyDegreesRight

	self subclassResponsibility.! !


!CardinalDirection methodsFor: 'position to move' stamp: 'M 5/30/2022 13:34:48'!
positionToBackward

	self subclassResponsibility.! !

!CardinalDirection methodsFor: 'position to move' stamp: 'M 5/30/2022 13:35:47'!
positionToForward

	self subclassResponsibility.! !


!CardinalDirection methodsFor: 'accessing' stamp: 'M 5/28/2022 21:03:21'!
cardinal 

 	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CardinalDirection class' category: 'Mars-Rover'!
CardinalDirection class
	instanceVariableNames: ''!

!CardinalDirection class methodsFor: 'as yet unclassified' stamp: 'M 5/30/2022 15:03:20'!
with: aDirection

	^ (CardinalDirection subclasses detect: [ :aSubclassDirection | aSubclassDirection isADirectionValid: aDirection ]) new.! !


!classDefinition: #East category: 'Mars-Rover'!
CardinalDirection subclass: #East
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!East methodsFor: 'accessing' stamp: 'M 5/28/2022 21:03:33'!
cardinal

	^ 'E'! !


!East methodsFor: 'angle of rotation' stamp: 'M 5/30/2022 13:24:02'!
ninetyDegreesLeft

	^ North new.! !

!East methodsFor: 'angle of rotation' stamp: 'M 5/30/2022 13:23:41'!
ninetyDegreesRight

	^ South new.! !


!East methodsFor: 'position to move' stamp: 'M 5/30/2022 13:35:31'!
positionToBackward

	^(-1@0)! !

!East methodsFor: 'position to move' stamp: 'M 5/30/2022 13:26:51'!
positionToForward

	^(1@0)! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'East class' category: 'Mars-Rover'!
East class
	instanceVariableNames: ''!

!East class methodsFor: 'as yet unclassified' stamp: 'M 5/28/2022 19:26:22'!
isADirectionValid: aDirection

	^ 'E' = aDirection.! !


!classDefinition: #North category: 'Mars-Rover'!
CardinalDirection subclass: #North
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!North methodsFor: 'accessing' stamp: 'M 5/28/2022 21:03:45'!
cardinal

	^ 'N'! !


!North methodsFor: 'angle of rotation' stamp: 'M 5/30/2022 13:24:02'!
ninetyDegreesLeft

	^ West new.! !

!North methodsFor: 'angle of rotation' stamp: 'M 5/30/2022 13:23:42'!
ninetyDegreesRight

	^ East new.! !


!North methodsFor: 'position to move' stamp: 'M 5/30/2022 13:35:31'!
positionToBackward
	
	^ (0@-1)! !

!North methodsFor: 'position to move' stamp: 'M 5/30/2022 13:26:51'!
positionToForward
	
	^ (0@1)! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'North class' category: 'Mars-Rover'!
North class
	instanceVariableNames: ''!

!North class methodsFor: 'as yet unclassified' stamp: 'M 5/28/2022 19:26:34'!
isADirectionValid: aDirection

	^ 'N' = aDirection.! !


!classDefinition: #South category: 'Mars-Rover'!
CardinalDirection subclass: #South
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!South methodsFor: 'accessing' stamp: 'M 5/28/2022 21:03:51'!
cardinal

	^ 'S'! !


!South methodsFor: 'angle of rotation' stamp: 'M 5/30/2022 13:24:02'!
ninetyDegreesLeft

	^ East new.
	! !

!South methodsFor: 'angle of rotation' stamp: 'M 5/30/2022 13:23:42'!
ninetyDegreesRight

	^ West new.
	! !


!South methodsFor: 'position to move' stamp: 'M 5/30/2022 13:35:31'!
positionToBackward

	^ (0@1)! !

!South methodsFor: 'position to move' stamp: 'M 5/30/2022 13:26:51'!
positionToForward

	^ (0@-1)! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'South class' category: 'Mars-Rover'!
South class
	instanceVariableNames: ''!

!South class methodsFor: 'as yet unclassified' stamp: 'M 5/30/2022 13:44:40'!
isADirectionValid: aDirection

	^ 'S' = aDirection.! !


!classDefinition: #West category: 'Mars-Rover'!
CardinalDirection subclass: #West
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!West methodsFor: 'accessing' stamp: 'M 5/28/2022 21:04:03'!
cardinal

	^ 'O'! !


!West methodsFor: 'angle of rotation' stamp: 'M 5/30/2022 13:24:02'!
ninetyDegreesLeft

	^  South! !

!West methodsFor: 'angle of rotation' stamp: 'M 5/30/2022 13:23:42'!
ninetyDegreesRight

	^  North new.! !


!West methodsFor: 'position to move' stamp: 'M 5/30/2022 13:35:31'!
positionToBackward

	^ (1@0)! !

!West methodsFor: 'position to move' stamp: 'M 5/30/2022 13:26:51'!
positionToForward

	^ (-1@0)! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'West class' category: 'Mars-Rover'!
West class
	instanceVariableNames: ''!

!West class methodsFor: 'as yet unclassified' stamp: 'M 5/30/2022 13:47:34'!
isADirectionValid: aDirection

	^ 'O' = aDirection.! !


!classDefinition: #Comand category: 'Mars-Rover'!
Object subclass: #Comand
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!Comand methodsFor: 'public' stamp: 'M 5/30/2022 13:31:38'!
runComand: aMarsRover

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

!Backward methodsFor: 'public' stamp: 'M 5/30/2022 13:33:04'!
runComand: aMarsRover

	aMarsRover backward.! !

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

!Forward methodsFor: 'public' stamp: 'M 5/30/2022 13:33:00'!
runComand: aMarsRover

	aMarsRover forward.! !

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

!Left methodsFor: 'public' stamp: 'M 5/30/2022 13:32:50'!
runComand: aMarsRover

	aMarsRover left.! !

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

!Right methodsFor: 'public' stamp: 'M 5/30/2022 13:33:14'!
runComand: aMarsRover

	aMarsRover right.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Right class' category: 'Mars-Rover'!
Right class
	instanceVariableNames: ''!

!Right class methodsFor: 'as yet unclassified' stamp: 'M 5/28/2022 19:59:28'!
isAComandValid: aComand

	^ 'r' = aComand.! !


!classDefinition: #MarsRover category: 'Mars-Rover'!
Object subclass: #MarsRover
	instanceVariableNames: 'position direction'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!MarsRover methodsFor: 'initialization' stamp: 'M 5/30/2022 15:03:20'!
initializeWithInitialPosition: aPointInitial andDirectionCardinal: aInitialDirection 

	position := aPointInitial.
	direction := CardinalDirection with: aInitialDirection.! !


!MarsRover methodsFor: 'multiple command execution' stamp: 'M 5/30/2022 13:37:31'!
comandsToRun: aComands

	aComands do: [ :aComand | (Comand with: (aComand asString) ) runComand: self]

! !


!MarsRover methodsFor: 'comands - turn' stamp: 'M 5/30/2022 13:27:50'!
left

	direction := direction ninetyDegreesLeft.! !

!MarsRover methodsFor: 'comands - turn' stamp: 'M 5/30/2022 13:28:09'!
right

	direction := direction ninetyDegreesRight.! !


!MarsRover methodsFor: 'comands - movement' stamp: 'M 5/30/2022 14:31:19'!
backward

	position := position + (direction positionToBackward).! !

!MarsRover methodsFor: 'comands - movement' stamp: 'M 5/30/2022 14:31:19'!
forward

	position := position + (direction positionToForward).
	! !


!MarsRover methodsFor: 'accessing' stamp: 'M 5/30/2022 13:29:53'!
currentDirection

	^ direction cardinal! !

!MarsRover methodsFor: 'accessing' stamp: 'M 5/30/2022 14:31:18'!
position
	
	^ position.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'Mars-Rover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'instance creation' stamp: 'M 5/28/2022 18:48:59'!
withInitialPosition: aPointInitial andDirectionCardinal: aInitialDirection

	^self new initializeWithInitialPosition: aPointInitial andDirectionCardinal: aInitialDirection.! !

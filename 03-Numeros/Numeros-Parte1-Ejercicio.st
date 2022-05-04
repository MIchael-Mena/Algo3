!classDefinition: #NumeroTest category: 'Numeros-Parte1-Ejercicio'!
TestCase subclass: #NumeroTest
	instanceVariableNames: 'zero one two four oneFifth oneHalf five twoFifth twoTwentyfifth fiveHalfs three eight negativeOne negativeTwo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte1-Ejercicio'!

!NumeroTest methodsFor: 'tests' stamp: 'M 5/3/2022 21:09:50'!
test01isZeroReturnsTrueWhenAskToZero

	self assert: zero isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'M 5/3/2022 21:09:54'!
test02isZeroReturnsFalseWhenAskToOthersButZero

	self deny: one isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'M 5/3/2022 21:06:41'!
test03isOneReturnsTrueWhenAskToOne

	self assert: one isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'M 5/3/2022 21:08:22'!
test04isOneReturnsFalseWhenAskToOtherThanOne

	self deny: zero isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'M 5/3/2022 21:10:00'!
test05EnteroAddsWithEnteroCorrectly

	self assert: two equals: one + one! !

!NumeroTest methodsFor: 'tests' stamp: 'M 5/4/2022 13:28:10'!
test06EnteroMultipliesWithEnteroCorrectly

	self assert: four equals: two * two! !

!NumeroTest methodsFor: 'tests' stamp: 'M 5/4/2022 15:36:34'!
test07FraccionAddsWithFraccionCorrectly

"
    La suma de fracciones es:

	a/b + c/d = (a.d + c.b) / (b.d)

	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"

	| sevenTenths |
	
	sevenTenths := Numero with: (Numero with: 7) over: (Numero with: 10).
	
	self assert: sevenTenths equals: oneFifth + oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'M 5/4/2022 13:28:53'!
test08FraccionMultipliesWithFraccionCorrectly

"
    La multiplicacion de fracciones es:

	(a/b) * (c/d) = (a.c) / (b.d)
"

	self assert: twoTwentyfifth equals: oneFifth * twoFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'M 5/4/2022 13:28:56'!
test09AparentFraccionesAreEqual

	self assert: oneHalf equals: (Numero with: two over: four)! !

!NumeroTest methodsFor: 'tests' stamp: 'M 5/4/2022 13:28:59'!
test10AddingFraccionesCanReturnAnEntero

	self assert: one equals: oneHalf + oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'M 5/4/2022 13:29:02'!
test11MultiplyingFraccionesCanReturnAnEntero

	self assert: one equals: (twoFifth) * (fiveHalfs) ! !

!NumeroTest methodsFor: 'tests' stamp: 'M 5/4/2022 13:29:07'!
test12AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'M 5/4/2022 13:29:10'!
test13AFraccionCanNotBeOne

	self deny: oneHalf isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'M 5/4/2022 13:29:13'!
test14NegationOfEnteroIsCorrect

	self assert: negativeTwo equals: two negated! !

!NumeroTest methodsFor: 'tests' stamp: 'M 5/4/2022 13:29:16'!
test15NegationOfFraccionIsCorrect

	self assert: (Numero with: negativeOne over: two) equals: oneHalf negated! !

!NumeroTest methodsFor: 'tests' stamp: 'M 5/4/2022 13:29:19'!
test16SignIsCorrectlyAssignedToFractionWithTwoNegatives

	self assert: oneHalf equals: (Numero with: negativeOne over: negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'M 5/4/2022 13:29:23'!
test17SignIsCorrectlyAssignedToFractionWithNegativeDivisor

	self assert: oneHalf negated equals: (Numero with: one over: negativeTwo)! !


!NumeroTest methodsFor: 'setup' stamp: 'M 5/4/2022 18:59:38'!
setUp

	zero := Numero with: 0.
	
	one := Numero with: 1.
	
	two := Numero with: 2.
	
	three:= Numero with: 3.
	
	four := Numero with: 4.
	
	five := Numero with: 5.
	
	eight := Numero with: 8.
	
	negativeOne := Numero with: -1.
	
	negativeTwo := Numero with: -2.
	
	oneHalf := Numero with: one over: two.
	
	oneFifth := Numero with: one over: five.
	
	twoFifth := Numero with: two over: five.

	twoTwentyfifth := Numero with: two over: (Numero with: 25).
	
	fiveHalfs := Numero with: five over: two.
	! !


!classDefinition: #Numero category: 'Numeros-Parte1-Ejercicio'!
Object subclass: #Numero
	instanceVariableNames: 'type'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte1-Ejercicio'!

!Numero methodsFor: 'arithmetic operations' stamp: 'M 5/4/2022 15:33:56'!
* aMultiplier 

	self subclassResponsibility.

	"(type = #Entero and: [aMultiplier type = #Entero]) ifTrue:	
	
		[ ^self class with: value * aMultiplier integerValue ].
		
	(type = #Fraccion and: [aMultiplier type = #Fraccion]) ifTrue:
	
		[ ^self class with: (numerator * aMultiplier numerator) over: (denominator * aMultiplier denominator) ].
	
		
	self error: 'Tipo de número no soportado' "! !

!Numero methodsFor: 'arithmetic operations' stamp: 'M 5/3/2022 21:20:58'!
+ anAdder 

	self subclassResponsibility.

	"(type = #Entero and: [anAdder type = #Entero]) ifTrue:
	
		[ ^self class with: value + anAdder integerValue ].

	(type = #Fraccion and: [anAdder type = #Fraccion]) ifTrue:
	
		[ | newNumerator newDenominator |
			
		newNumerator := (numerator * anAdder denominator) + (denominator * anAdder numerator).
		
		newDenominator := denominator * anAdder denominator.
		
		^ self class with: newNumerator over: newDenominator ]."
	
	"self error: 'Tipo de número no soportado'"
	! !

!Numero methodsFor: 'arithmetic operations' stamp: 'M 5/4/2022 18:28:26'!
negated

	self subclassResponsibility.

	"type = #Entero ifTrue:
	
		[ ^self * (self class with: -1) ].
		
	type = #Fraccion ifTrue:
	
		[ ^self class with: numerator * (self class with: -1) over: denominator ]."! !


!Numero methodsFor: 'testing' stamp: 'M 5/4/2022 18:26:05'!
isNegative

	self subclassResponsibility.

	"type = #Entero ifTrue:
	
		[ ^value < 0 ].
		
	type = #Fraccion ifTrue:
	
		[ ^denominator < 0 ]."! !

!Numero methodsFor: 'testing' stamp: 'M 5/3/2022 21:07:01'!
isOne

	self subclassResponsibility.

	"type = #Entero ifTrue:
	
		[ ^value = 1 ].
		
	type = #Fraccion ifTrue:
	
		[ ^false ]."! !

!Numero methodsFor: 'testing' stamp: 'M 5/3/2022 21:07:06'!
isZero

	self subclassResponsibility.

	"type = #Entero ifTrue:
	
		[ ^value = 0 ].
		
	type = #Fraccion ifTrue:
	
		[ ^false ]."! !


!Numero methodsFor: 'initialization' stamp: 'M 5/3/2022 20:48:12'!
initializeWith: aValue

	self subclassResponsibility.

	"type := #Entero.
	
	value := aValue"! !

!Numero methodsFor: 'initialization' stamp: 'M 5/3/2022 21:04:26'!
initializeWith: aNumerator over: aDenominator

	"Estas precondiciones estan por si se comenten errores en la implementacion - Hernan"
	
	"aNumerator isZero ifTrue: [ self error: 'una fraccion no puede ser cero' ].
	
	aDenominator isOne ifTrue: [ self error: 'una fraccion no puede tener denominador 1 porque sino es un entero' ]."
	
	self subclassResponsibility.
	
	"type:=#Fraccion.
	
	numerator := aNumerator.
	
	denominator := aDenominator "! !


!Numero methodsFor: 'accessing' stamp: 'M 5/4/2022 19:30:22'!
denominator

	"^denominator"! !

!Numero methodsFor: 'accessing' stamp: 'M 5/4/2022 19:30:27'!
integerValue

	"Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
	
	"^value"! !

!Numero methodsFor: 'accessing' stamp: 'M 5/4/2022 19:30:32'!
numerator

	"^numerator"! !

!Numero methodsFor: 'accessing' stamp: 'M 5/4/2022 13:26:24'!
type

	^type! !


!Numero methodsFor: 'printing' stamp: 'M 5/4/2022 19:17:26'!
printOn: aStream

	self subclassResponsibility.

	"type = #Entero ifTrue:
	
		[ aStream print: value ].
		
	type = #Fraccion ifTrue:
	
		[ aStream 
			
			print: numerator;
			
			nextPut: $/;
			
			print: denominator ]."! !


!Numero methodsFor: 'comparing' stamp: 'M 5/4/2022 13:34:12'!
= anObject

	self subclassResponsibility.

	"^(anObject isKindOf: self class) and: [ type = anObject type and: 
		
		[ type = #Entero ifTrue: [ value = anObject integerValue] 
			
		ifFalse: [ type = #Fraccion ifTrue:
			
			[ (numerator * anObject denominator) = (denominator * anObject numerator) ]]]]"! !

!Numero methodsFor: 'comparing' stamp: 'M 5/4/2022 19:20:16'!
hash

	self subclassResponsibility.

"	type = #Entero ifTrue:
	
		[ ^value hash ].
		
	type = #Fraccion ifTrue:
	
		[ ^(numerator hash / denominator hash) hash ]. "! !


!Numero methodsFor: 'arithmetic operations - private' stamp: 'M 5/4/2022 18:30:39'!
// aDivisor 

	self subclassResponsibility.

	"type = #Entero ifTrue:
	
		[ ^self class with: value // aDivisor integerValue ].
		
	self error: 'Tipo de número no soportado' "! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'M 5/4/2022 18:18:13'!
greatestCommonDivisorWith: anEntero 

	self subclassResponsibility.

	"type = #Entero ifTrue:
	
		[^self class with: (value gcd: anEntero integerValue)].
		

	self error: 'Tipo de número no soportado' "! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Numero class' category: 'Numeros-Parte1-Ejercicio'!
Numero class
	instanceVariableNames: ''!

!Numero class methodsFor: 'error descriptions' stamp: 'M 5/3/2022 20:39:03'!
canNotDivideByZeroErrorDescription

	^'No se puede dividir por cero'! !


!Numero class methodsFor: 'instance creation' stamp: 'M 5/3/2022 20:43:23'!
with: aValue 

	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	
	aValue isInteger ifFalse: [  self error: 'aValue debe ser anInteger' ].
	
	"^self new initializeWith: aValue"
	^Entero new initializeWith: aValue ! !

!Numero class methodsFor: 'instance creation' stamp: 'M 5/4/2022 19:03:37'!
with: aDividend over: aDivisor

	| greatestCommonDivisor numerator denominator |
	
	aDivisor isZero ifTrue: [ self error: self canNotDivideByZeroErrorDescription ].
	
	aDividend isZero ifTrue: [ ^aDividend ].
	
	aDivisor isNegative ifTrue: [ ^self with: aDividend negated over: aDivisor negated].
	

	greatestCommonDivisor := aDividend greatestCommonDivisorWith: aDivisor. 
	
	numerator := aDividend // greatestCommonDivisor.
	
	denominator := aDivisor // greatestCommonDivisor.
	
	denominator isOne ifTrue: [ ^numerator ].
	
	^ Fraccion new initializeWith: numerator over: denominator.
	
	"^self new initializeWith: numerator over: denominator"! !


!classDefinition: #Entero category: 'Numeros-Parte1-Ejercicio'!
Numero subclass: #Entero
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte1-Ejercicio'!

!Entero methodsFor: 'arithmetic operations' stamp: 'M 5/4/2022 15:34:25'!
* aMultiplier

	^self class with: value * aMultiplier integerValue.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'M 5/4/2022 19:26:13'!
+ anAdder 

	^self class with: value + anAdder integerValue.
! !

!Entero methodsFor: 'arithmetic operations' stamp: 'M 5/4/2022 18:28:35'!
negated

	^self * (self class with: -1)! !


!Entero methodsFor: 'initialization' stamp: 'M 5/4/2022 13:27:36'!
initializeWith: aValue

	super initialize.
	
	value := aValue.! !


!Entero methodsFor: 'testing' stamp: 'M 5/4/2022 19:24:21'!
isInteger

	^true.! !

!Entero methodsFor: 'testing' stamp: 'M 5/4/2022 18:26:17'!
isNegative

	^value < 0! !

!Entero methodsFor: 'testing' stamp: 'M 5/4/2022 13:27:55'!
isOne

	^value = 1! !

!Entero methodsFor: 'testing' stamp: 'M 5/4/2022 13:27:51'!
isZero

	^value = 0.
	! !


!Entero methodsFor: 'comparing' stamp: 'M 5/4/2022 14:00:20'!
= anObject

	^(anObject isKindOf: self class) and: [anObject isInteger and: [ value =anObject  integerValue] ].! !

!Entero methodsFor: 'comparing' stamp: 'M 5/4/2022 19:23:07'!
hash

	^value hash! !


!Entero methodsFor: 'printing' stamp: 'M 5/4/2022 19:18:26'!
printOn: aStream
	
	aStream print: value! !


!Entero methodsFor: 'arithmetic operations - private' stamp: 'M 5/4/2022 18:31:11'!
// aDivisor

	^self class with: value // aDivisor integerValue.! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'M 5/4/2022 18:19:05'!
greatestCommonDivisorWith: anEntero 

	^self class with: (value gcd: anEntero integerValue).! !


!Entero methodsFor: 'accessing' stamp: 'M 5/4/2022 19:29:53'!
integerValue
	^value.! !


!classDefinition: #Fraccion category: 'Numeros-Parte1-Ejercicio'!
Numero subclass: #Fraccion
	instanceVariableNames: 'numerator denominator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte1-Ejercicio'!

!Fraccion methodsFor: 'arithmetic operations' stamp: 'M 5/4/2022 15:34:54'!
* aMultiplier

	^self class with: (numerator * aMultiplier numerator) over: (denominator * aMultiplier denominator).! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'M 5/4/2022 19:24:08'!
+ anAdder 

	| newNumerator newDenominator |
			
	newNumerator := (numerator * anAdder denominator) + (denominator * anAdder numerator).
		
	newDenominator := denominator * anAdder denominator.
		
	^ self class with: newNumerator over: newDenominator
! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'M 5/4/2022 18:28:44'!
negated

	^self class with: numerator * (self class with: -1) over: denominator! !


!Fraccion methodsFor: 'initialization' stamp: 'M 5/3/2022 21:05:53'!
initializeWith: aNumerator over: aDenominator

	super initialize.
	
	aNumerator isZero ifTrue: [ self error: 'una fraccion no puede ser cero' ].
	
	aDenominator isOne ifTrue: [ self error: 'una fraccion no puede tener denominador 1 porque sino es un entero' ].

	numerator := aNumerator.
	
	denominator := aDenominator! !


!Fraccion methodsFor: 'testing' stamp: 'M 5/4/2022 19:23:51'!
isFraction

	^true.! !

!Fraccion methodsFor: 'testing' stamp: 'M 5/4/2022 18:26:28'!
isNegative

	^denominator < 0! !

!Fraccion methodsFor: 'testing' stamp: 'M 5/4/2022 19:24:00'!
isOne

	^false! !

!Fraccion methodsFor: 'testing' stamp: 'M 5/4/2022 19:24:03'!
isZero

	^false! !


!Fraccion methodsFor: 'comparing' stamp: 'M 5/4/2022 14:01:53'!
= anObject

	^(anObject isKindOf: self class) and: [anObject isFraction and: [ (numerator * anObject denominator) = (denominator * anObject numerator) ] ].! !

!Fraccion methodsFor: 'comparing' stamp: 'M 5/4/2022 19:23:28'!
hash

	^(numerator hash / denominator hash) hash! !


!Fraccion methodsFor: 'printing' stamp: 'M 5/4/2022 19:19:50'!
printOn: aStream

	aStream 
			
			print: numerator;
			
			nextPut: $/;
			
			print: denominator! !


!Fraccion methodsFor: 'accessing' stamp: 'M 5/4/2022 19:31:01'!
denominator

	^denominator.! !

!Fraccion methodsFor: 'accessing' stamp: 'M 5/4/2022 19:30:47'!
numerator

	^numerator.! !

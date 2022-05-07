!classDefinition: #NumeroTest category: 'Numeros-Parte2-Ejercicio'!
TestCase subclass: #NumeroTest
	instanceVariableNames: 'zero one two four oneFifth oneHalf five twoFifth twoTwentyfifth fiveHalfs three eight negativeOne negativeTwo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!NumeroTest methodsFor: 'tests' stamp: 'M 5/6/2022 20:23:13'!
test01isZeroReturnsTrueWhenAskToZero

	self assert: zero isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'M 5/6/2022 20:23:15'!
test02isZeroReturnsFalseWhenAskToOthersButZero

	self deny: one isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'M 5/6/2022 20:23:33'!
test03isOneReturnsTrueWhenAskToOne

	self assert: one isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'M 5/6/2022 20:23:40'!
test04isOneReturnsFalseWhenAskToOtherThanOne

	self deny: zero isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'M 5/6/2022 20:23:43'!
test05EnteroAddsWithEnteroCorrectly

	self assert: two equals: one + one! !

!NumeroTest methodsFor: 'tests' stamp: 'M 5/6/2022 20:23:45'!
test06EnteroMultipliesWithEnteroCorrectly

	self assert: four equals: two * two! !

!NumeroTest methodsFor: 'tests' stamp: 'M 5/6/2022 20:23:48'!
test07EnteroDividesEnteroCorrectly

	self assert: one equals: two / two! !

!NumeroTest methodsFor: 'tests' stamp: 'M 5/6/2022 20:24:06'!
test08FraccionAddsWithFraccionCorrectly

"
    La suma de fracciones es:
	 
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |

	sevenTenths := (Entero with: 7) / (Entero with: 10).
	
	self assert: sevenTenths equals: oneFifth + oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'M 5/6/2022 20:24:19'!
test09FraccionMultipliesWithFraccionCorrectly

"
    La multiplicacion de fracciones es:
	 
	(a/b) * (c/d) = (a.c) / (b.d)
"

	self assert: twoTwentyfifth equals: oneFifth * twoFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'M 5/6/2022 20:24:30'!
test10FraccionDividesFraccionCorrectly

"
    La division de fracciones es:
	 
	(a/b) / (c/d) = (a.d) / (b.c)
"

	self assert: fiveHalfs equals: oneHalf / oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'M 5/6/2022 20:24:36'!
test11EnteroAddsFraccionCorrectly

"
	Ahora empieza la diversion!!
"

	self assert: (Entero with: 6) / (Entero with: 5) equals: one + oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'M 5/6/2022 20:24:40'!
test12FraccionAddsEnteroCorrectly

	self assert: (Entero with: 6) / (Entero with: 5) equals: oneFifth + one! !

!NumeroTest methodsFor: 'tests' stamp: 'M 5/6/2022 20:24:43'!
test13EnteroMultipliesFraccionCorrectly

	self assert: twoFifth equals: two * oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'M 5/6/2022 20:24:47'!
test14FraccionMultipliesEnteroCorrectly

	self assert: twoFifth equals: oneFifth * two! !

!NumeroTest methodsFor: 'tests' stamp: 'M 5/6/2022 20:24:50'!
test15EnteroDividesFraccionCorrectly

	self assert: fiveHalfs equals: one / twoFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'M 5/6/2022 20:24:52'!
test16FraccionDividesEnteroCorrectly

	self assert: twoTwentyfifth equals: twoFifth / five! !

!NumeroTest methodsFor: 'tests' stamp: 'M 5/6/2022 20:24:56'!
test17AFraccionCanBeEqualToAnEntero

	self assert: two equals: four / two! !

!NumeroTest methodsFor: 'tests' stamp: 'M 5/6/2022 20:24:58'!
test18AparentFraccionesAreEqual

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'M 5/6/2022 20:25:01'!
test19AddingFraccionesCanReturnAnEntero

	self assert: one equals: oneHalf + oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'M 5/6/2022 20:25:04'!
test20MultiplyingFraccionesCanReturnAnEntero

	self assert: one equals: (two/five) * (five/two)! !

!NumeroTest methodsFor: 'tests' stamp: 'M 5/6/2022 20:25:07'!
test21DividingFraccionesCanReturnAnEntero

	self assert: one equals: oneHalf / oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'M 5/6/2022 20:25:11'!
test22DividingEnterosCanReturnAFraccion

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'M 5/6/2022 20:25:20'!
test23CanNotDivideEnteroByZero

	self 
		should: [ one / zero ]
		
		raise: Error
		
		withExceptionDo: [ :anError | self assert: Numero canNotDivideByZeroErrorDescription equals: anError messageText ]! !

!NumeroTest methodsFor: 'tests' stamp: 'M 5/6/2022 20:25:31'!
test24CanNotDivideFraccionByZero

	self 
	
		should: [ oneHalf / zero ]
		
		raise: Error

		withExceptionDo: [ :anError | self assert: Numero canNotDivideByZeroErrorDescription equals: anError messageText ]! !

!NumeroTest methodsFor: 'tests' stamp: 'M 5/6/2022 20:25:34'!
test25AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'M 5/6/2022 20:25:38'!
test26AFraccionCanNotBeOne

	self deny: oneHalf isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'M 5/6/2022 20:25:41'!
test27EnteroSubstractsEnteroCorrectly

	self assert: two equals: three - one! !

!NumeroTest methodsFor: 'tests' stamp: 'M 5/6/2022 20:25:45'!
test28FraccionSubstractsFraccionCorrectly

	self assert: oneFifth equals: twoFifth - oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'M 5/6/2022 20:25:48'!
test29EnteroSubstractsFraccionCorrectly

	self assert: oneHalf equals: one - oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'M 5/6/2022 20:25:55'!
test30FraccionSubstractsEnteroCorrectly

	| sixFifth |
	
	sixFifth := (Entero with: 6) / (Entero with: 5).
	
	self assert: oneFifth equals: sixFifth - one! !

!NumeroTest methodsFor: 'tests' stamp: 'M 5/6/2022 20:26:02'!
test31SubstractingFraccionesCanReturnAnEntero

	| threeHalfs |
	
	threeHalfs := (Entero with: 3) / (Entero with: 2).
	
	self assert: one equals: threeHalfs - oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'M 5/6/2022 20:26:04'!
test32SubstractingSameEnterosReturnsZero

	self assert: zero equals: one - one! !

!NumeroTest methodsFor: 'tests' stamp: 'M 5/6/2022 20:26:07'!
test33SubstractingSameFraccionesReturnsZero

	self assert: zero equals: oneHalf - oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'M 5/6/2022 20:26:15'!
test34SubstractingAHigherValueToANumberReturnsANegativeNumber

	| negativeThreeHalfs |
	
	negativeThreeHalfs := (Entero with: -3) / (Entero with: 2).	
	
	self assert: negativeThreeHalfs equals: one - fiveHalfs! !

!NumeroTest methodsFor: 'tests' stamp: 'M 5/6/2022 20:26:20'!
test35FibonacciZeroIsOne

	self assert: one equals: zero fibonacci! !

!NumeroTest methodsFor: 'tests' stamp: 'M 5/6/2022 20:26:23'!
test36FibonacciOneIsOne

	self assert: one equals: one fibonacci! !

!NumeroTest methodsFor: 'tests' stamp: 'M 5/6/2022 20:26:29'!
test37FibonacciEnteroReturnsAddingPreviousTwoFibonacciEnteros

	self assert: five equals: four fibonacci.
	
	self assert: three equals: three fibonacci. 
	
	self assert: five fibonacci equals: four fibonacci + three fibonacci! !

!NumeroTest methodsFor: 'tests' stamp: 'M 5/6/2022 20:26:40'!
test38FibonacciNotDefinedForNegativeNumbers

	self 
	
		should: [negativeOne fibonacci]
		
		raise: Error
		
		withExceptionDo: [ :anError | self assert: Entero negativeFibonacciErrorDescription equals: anError messageText ]! !

!NumeroTest methodsFor: 'tests' stamp: 'M 5/6/2022 20:26:46'!
test39NegationOfEnteroIsCorrect

	self assert: negativeTwo equals: two negated! !

!NumeroTest methodsFor: 'tests' stamp: 'M 5/6/2022 20:26:48'!
test40NegationOfFraccionIsCorrect

	self assert: negativeOne / two equals: oneHalf negated ! !

!NumeroTest methodsFor: 'tests' stamp: 'M 5/6/2022 20:26:52'!
test41SignIsCorrectlyAssignedToFractionWithTwoNegatives

	self assert: oneHalf equals: (negativeOne / negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'M 5/6/2022 20:26:55'!
test42SignIsCorrectlyAssignedToFractionWithNegativeDivisor

	self assert: oneHalf negated equals: (one / negativeTwo)! !


!NumeroTest methodsFor: 'setup' stamp: 'M 5/6/2022 20:27:18'!
setUp

	zero := Entero with: 0.
	
	one := Entero with: 1.
	
	two := Entero with: 2.
	
	three:= Entero with: 3.
	
	four := Entero with: 4.
	
	five := Entero with: 5.
	
	eight := Entero with: 8.
	
	negativeOne := Entero with: -1.
	
	negativeTwo := Entero with: -2.
	

	oneHalf := one / two.
	
	oneFifth := one / five.
	
	twoFifth := two / five.
	
	twoTwentyfifth := two / (Entero with: 25).
	
	fiveHalfs := five / two.
	! !


!classDefinition: #Numero category: 'Numeros-Parte2-Ejercicio'!
Object subclass: #Numero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Numero methodsFor: 'arithmetic operations' stamp: 'M 5/6/2022 20:37:01'!
* aMultiplier

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'M 5/6/2022 20:37:05'!
+ anAdder

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'M 5/6/2022 20:37:08'!
- aSubtrahend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'M 5/6/2022 20:37:10'!
/ aDivisor

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'M 5/6/2022 20:37:14'!
negated

	^self * (Entero with: -1)! !


!Numero methodsFor: 'testing' stamp: 'M 5/6/2022 20:38:56'!
isNegative

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'M 5/6/2022 20:38:54'!
isOne

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'M 5/6/2022 20:38:51'!
isZero

	self subclassResponsibility ! !


!Numero methodsFor: 'private' stamp: 'M 5/6/2022 20:38:47'!
invalidNumberType

	self error: self class invalidNumberTypeErrorDescription! !


!Numero methodsFor: 'as yet unclassified' stamp: 'M 5/6/2022 20:38:40'!
beAddedToAFraction: anAddend

	self subclassResponsibility ! !

!Numero methodsFor: 'as yet unclassified' stamp: 'M 5/6/2022 20:37:37'!
beAddedToAnEntero: anAugend

	self subclassResponsibility ! !

!Numero methodsFor: 'as yet unclassified' stamp: 'M 5/6/2022 21:10:30'!
serDivididoConEntero: unEntero

	self subclassResponsibility.! !

!Numero methodsFor: 'as yet unclassified' stamp: 'M 5/6/2022 20:44:03'!
serDivididoConFraccion: unaFraccion

	self subclassResponsibility ! !

!Numero methodsFor: 'as yet unclassified' stamp: 'M 5/6/2022 20:44:09'!
serMulitplicadoConEntero: unEntero

	self subclassResponsibility ! !

!Numero methodsFor: 'as yet unclassified' stamp: 'M 5/6/2022 20:44:16'!
serMultiplicadoConFraccion: unaFraccion

	self subclassResponsibility ! !

!Numero methodsFor: 'as yet unclassified' stamp: 'M 5/7/2022 13:22:50'!
serRestadoConEntero: aQuotientEntero

	self subclassResponsibility ! !

!Numero methodsFor: 'as yet unclassified' stamp: 'M 5/7/2022 13:22:40'!
serRestadoConFraccion: aQuotientFraccion

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Numero class' category: 'Numeros-Parte2-Ejercicio'!
Numero class
	instanceVariableNames: ''!

!Numero class methodsFor: 'error descriptions' stamp: 'M 5/6/2022 20:36:46'!
canNotDivideByZeroErrorDescription

	^'No se puede Dividir por Cero'! !

!Numero class methodsFor: 'error descriptions' stamp: 'M 5/6/2022 20:36:50'!
invalidNumberTypeErrorDescription

	^ 'Tipo de Número Inválido'! !


!classDefinition: #Entero category: 'Numeros-Parte2-Ejercicio'!
Numero subclass: #Entero
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Entero methodsFor: 'arithmetic operations' stamp: 'M 5/6/2022 20:10:26'!
* aMultiplier 

	"(aMultiplier isKindOf: Entero) ifTrue: [^self class with: value * aMultiplier integerValue].
	
	(aMultiplier isKindOf: Fraccion ) ifTrue: [^ (aMultiplier numerator * self) / aMultiplier denominator ]
	"
	
	^aMultiplier serMulitplicadoConEntero: self .	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'M 5/6/2022 20:27:47'!
+ anAdder 

	"(anAdder isKindOf: Entero) ifTrue: [^self class with: value + anAdder integerValue].
	
	(anAdder isKindOf: Fraccion ) ifTrue: [^(self  * anAdder denominator) + anAdder numerator / anAdder denominator ].
"

	^anAdder beAddedToAnEntero: self. ! !

!Entero methodsFor: 'arithmetic operations' stamp: 'M 5/6/2022 20:27:56'!
- aSubtrahend 

	"^ self class with: value - aSubtrahend integerValue."
	
	"(aSubtrahend isKindOf: Entero) ifTrue:[^self class with: value - aSubtrahend integerValue ].
	
	(aSubtrahend isKindOf: Fraccion ) ifTrue: [^ ( (self * aSubtrahend denominator) - (aSubtrahend numerator ) )/ aSubtrahend denominator ]."
	
	^aSubtrahend serRestadoConEntero: self! !

!Entero methodsFor: 'arithmetic operations' stamp: 'M 5/6/2022 22:45:27'!
/ aDivisor 

	"Devuelve una Fraccion"

	^ aDivisor serDivididoConEntero: self.
		
	"(aDivisor isKindOf: Entero) ifTrue: [^ Fraccion with: unEntero over: self ].
	
	(aDivisor isKindOf: Fraccion ) ifTrue: [^ Fraccion with: (self denominator  * unEntero) over: self numerator ]."! !

!Entero methodsFor: 'arithmetic operations' stamp: 'M 5/7/2022 14:00:52'!
fibonacci

	| one two |

	one := Entero with: 1.
	
	two := Entero with: 2.
	
	self isNegative ifTrue: [self error: Entero negativeFibonacciErrorDescription ].	
	
	(self isZero or: [self isOne]) ifTrue: [^one].
	
	^ (self - one) fibonacci + (self - two) fibonacci
	
	"unFibonacci := Fibonacci with: self.
	
	unFibonacci isNegative 
	
	ifTrue: [self error: Entero negativeFibonacciErrorDescription ].	
	
	unFibonacci isPostive  
	
	ifTrue: [ (self isZero or: [self isOne]) ifTrue: [^one].
	
	FibonacciPositive noEsCasoBase: self ifTrue: [^ (self - one) fibonacci + (self - two) fibonacci ]
		]"! !


!Entero methodsFor: 'comparing' stamp: 'M 5/6/2022 20:28:36'!
= anObject

	^(anObject isKindOf: self class) and: [ value = anObject integerValue ]! !

!Entero methodsFor: 'comparing' stamp: 'M 5/6/2022 20:29:39'!
hash

	^value hash! !


!Entero methodsFor: 'initialization' stamp: 'M 5/6/2022 20:29:35'!
initializeWith: aValue 

	value := aValue! !


!Entero methodsFor: 'accessing' stamp: 'M 5/6/2022 20:29:29'!
integerValue

	"Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
	
	^value! !


!Entero methodsFor: 'printing' stamp: 'M 5/6/2022 20:29:10'!
printOn: aStream

	aStream print: value ! !


!Entero methodsFor: 'testing' stamp: 'M 5/6/2022 20:29:21'!
isNegative

	^value < 0! !

!Entero methodsFor: 'testing' stamp: 'M 5/6/2022 20:29:18'!
isOne

	^value = 1! !

!Entero methodsFor: 'testing' stamp: 'M 5/6/2022 20:29:15'!
isZero

	^value = 0! !


!Entero methodsFor: 'arithmetic operations - private' stamp: 'M 5/6/2022 20:54:42'!
// aDivisor 

	"Devuelve un entero como resultado de la division entre ambos, redondeado hacia abajo"

	^self class with: value // aDivisor integerValue! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'M 5/6/2022 20:29:43'!
greatestCommonDivisorWith: anEntero 

	^self class with: (value gcd: anEntero integerValue)! !


!Entero methodsFor: 'as yet unclassified' stamp: 'M 5/7/2022 13:16:31'!
beAddedToAFraction: anAugendFraccion

	^ (self  * anAugendFraccion denominator) + anAugendFraccion numerator / anAugendFraccion denominator ! !

!Entero methodsFor: 'as yet unclassified' stamp: 'M 5/7/2022 13:16:42'!
beAddedToAnEntero: anAugendEntero

	 ^self class with:  anAugendEntero integerValue + value.! !

!Entero methodsFor: 'as yet unclassified' stamp: 'M 5/7/2022 13:15:29'!
serDivididoConEntero: aQuotientEntero

	^ Fraccion with: aQuotientEntero over: self.! !

!Entero methodsFor: 'as yet unclassified' stamp: 'M 5/7/2022 13:15:42'!
serDivididoConFraccion: aQuotientFraccion

	^ Fraccion with: aQuotientFraccion numerator over: (aQuotientFraccion denominator * self value).! !

!Entero methodsFor: 'as yet unclassified' stamp: 'M 5/7/2022 13:10:47'!
serMulitplicadoConEntero: aMultiplierEntero

	^self class with: value * aMultiplierEntero integerValue! !

!Entero methodsFor: 'as yet unclassified' stamp: 'M 5/7/2022 13:11:00'!
serMultiplicadoConFraccion: aMultiplierFraccion

	^ ((self * aMultiplierFraccion  numerator ) / aMultiplierFraccion denominator)! !

!Entero methodsFor: 'as yet unclassified' stamp: 'M 5/7/2022 13:31:24'!
serRestadoConEntero: aMinuendFraccionEntero

	^self class with: aMinuendFraccionEntero integerValue - value ! !

!Entero methodsFor: 'as yet unclassified' stamp: 'M 5/7/2022 13:12:54'!
serRestadoConFraccion: aMinuendFraccion

	^ ( aMinuendFraccion numerator - (self * aMinuendFraccion denominator ) ) / aMinuendFraccion denominator! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Entero class' category: 'Numeros-Parte2-Ejercicio'!
Entero class
	instanceVariableNames: ''!

!Entero class methodsFor: 'instance creation' stamp: 'M 5/6/2022 20:39:29'!
negativeFibonacciErrorDescription

	^ ' Fibonacci no está definido aquí para Enteros Negativos'! !

!Entero class methodsFor: 'instance creation' stamp: 'M 5/6/2022 20:39:26'!
with: aValue 

	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	
	aValue isInteger ifFalse: [  self error: 'aValue debe ser anInteger' ].
	
	^self new initializeWith: aValue! !


!classDefinition: #Fraccion category: 'Numeros-Parte2-Ejercicio'!
Numero subclass: #Fraccion
	instanceVariableNames: 'numerator denominator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Fraccion methodsFor: 'arithmetic operations' stamp: 'M 5/6/2022 20:31:35'!
* aMultiplier 

	"^(numerator * aMultiplier numerator) / (denominator * aMultiplier denominator)"
	
	"(aMultiplier isKindOf: Entero) ifTrue: [^ ((self numerator * aMultiplier ) / self denominator)].
	
	(aMultiplier isKindOf: Fraccion ) ifTrue: [^(aMultiplier numerator * self numerator ) / ( aMultiplier denominator * self denominator )]."
	
	^aMultiplier serMultiplicadoConFraccion: self. ! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'M 5/6/2022 20:19:21'!
+ anAdder 

	"| newNumerator newDenominator |
	
	newNumerator := (numerator * anAdder denominator) + (denominator * anAdder numerator).
	
	newDenominator := denominator * anAdder denominator.
	
	^newNumerator / newDenominator "
	
	"(anAdder isKindOf: Entero) ifTrue: [^Fraccion with: self numerator + anAdder * self denominator over: self denominator ]."
	
	"(anAdder isKindOf: Entero) ifTrue: [ ^ self beAddedToAnEntero: anAdder] .
	
	(anAdder isKindOf: Fraccion ) ifTrue: [
		
	| newNumerator newDenominator |
	
	newNumerator := (numerator * anAdder denominator) + (denominator * anAdder numerator).
	
	newDenominator := denominator * anAdder denominator.
	
	^newNumerator / newDenominator  ]
"

	^anAdder beAddedToAFraction: self.
	! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'M 5/7/2022 13:02:39'!
- aSubtrahend 

	^ aSubtrahend serRestadoConFraccion: self.

	"(aSubtrahend isKindOf: Entero ) ifTrue: [^ ( self numerator - (aSubtrahend * self denominator ) ) / self denominator ].
	
	(aSubtrahend isKindOf: Fraccion ) ifTrue: [
		
	| newNumerator newDenominator |
	
	newNumerator := (numerator * aSubtrahend denominator) - (denominator * aSubtrahend numerator).
	
	newDenominator := denominator * aSubtrahend denominator.
	
	^newNumerator / newDenominator ]."! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'M 5/6/2022 20:17:45'!
/ aDivisor 

	"^(numerator * aDivisor denominator) / (denominator * aDivisor numerator)"
	
	"
	(aDivisor isKindOf: Entero) ifTrue: [^self numerator / (self denominator * aDivisor) ].
	
	(aDivisor isKindOf: Fraccion ) ifTrue: [^(self numerator * aDivisor denominator) / (self denominator * aDivisor numerator)]."
	
	^ aDivisor serDivididoConFraccion: self.! !


!Fraccion methodsFor: 'comparing' stamp: 'M 5/6/2022 20:20:26'!
= anObject

	^(anObject isKindOf: self class) and: [ (numerator * anObject denominator) = (denominator * anObject numerator) ]! !

!Fraccion methodsFor: 'comparing' stamp: 'M 5/6/2022 20:20:42'!
hash

	^(numerator hash / denominator hash) hash! !


!Fraccion methodsFor: 'accessing' stamp: 'M 5/6/2022 20:20:35'!
denominator

	^ denominator! !

!Fraccion methodsFor: 'accessing' stamp: 'M 5/6/2022 20:21:45'!
numerator

	^ numerator! !


!Fraccion methodsFor: 'initialization' stamp: 'M 5/6/2022 20:21:22'!
initializeWith: aNumerator over: aDenominator

	"Estas precondiciones estan por si se comenten errores en la implementacion - Hernan"
	
	aNumerator isZero ifTrue: [ self error: 'una fraccion no puede ser cero' ].
	
	aDenominator isOne ifTrue: [ self error: 'una fraccion no puede tener denominador 1 porque sino es un entero' ].
	
	numerator := aNumerator.
	
	denominator := aDenominator ! !


!Fraccion methodsFor: 'testing' stamp: 'M 5/6/2022 20:21:30'!
isNegative

	^numerator < 0! !

!Fraccion methodsFor: 'testing' stamp: 'M 5/6/2022 20:21:37'!
isOne

	^false! !

!Fraccion methodsFor: 'testing' stamp: 'M 5/6/2022 20:21:40'!
isZero

	^false! !


!Fraccion methodsFor: 'printing' stamp: 'M 5/6/2022 20:21:52'!
printOn: aStream

	aStream 
	
		print: numerator;
		
		nextPut: $/;
		
		print: denominator ! !


!Fraccion methodsFor: 'as yet unclassified' stamp: 'M 5/6/2022 20:16:08'!
beAddedToAFraction: anAddend

	| newNumerator newDenominator |
	
	newNumerator := (numerator * anAddend denominator) + (denominator * anAddend numerator).
	
	newDenominator := denominator * anAddend denominator.
	
	^newNumerator / newDenominator  ! !

!Fraccion methodsFor: 'as yet unclassified' stamp: 'M 5/6/2022 20:15:43'!
beAddedToAnEntero: anAugend

	^(anAugend  * self denominator) + self numerator / self denominator ! !

!Fraccion methodsFor: 'as yet unclassified' stamp: 'M 5/6/2022 21:02:26'!
serDivididoConEntero: unEntero

	^ Fraccion with: (self denominator  * unEntero) over: self numerator.
	
	"El orden de la division es este ya que es el entero el que se divide por la fraccion"
	! !

!Fraccion methodsFor: 'as yet unclassified' stamp: 'M 5/6/2022 20:15:00'!
serDivididoConFraccion: unaFraccion

	^(unaFraccion numerator * self denominator) / (unaFraccion denominator * self numerator)! !

!Fraccion methodsFor: 'as yet unclassified' stamp: 'M 5/6/2022 20:12:27'!
serMulitplicadoConEntero: unEntero

	^ ((self numerator * unEntero ) / self denominator)! !

!Fraccion methodsFor: 'as yet unclassified' stamp: 'M 5/6/2022 20:13:11'!
serMultiplicadoConFraccion: unaFraccion

	^ (unaFraccion numerator * self numerator ) / (unaFraccion denominator * self denominator) ! !

!Fraccion methodsFor: 'as yet unclassified' stamp: 'M 5/6/2022 20:13:29'!
serRestadoConEntero: unEntero

	^ ( (unEntero * self denominator) - (self numerator ) )/ self denominator ! !

!Fraccion methodsFor: 'as yet unclassified' stamp: 'M 5/7/2022 13:08:33'!
serRestadoConFraccion: aSubtrahendFraccion

	| newNumerator newDenominator |
	
	newNumerator := (aSubtrahendFraccion numerator * self denominator) - (aSubtrahendFraccion denominator * self numerator).
	
	newDenominator := aSubtrahendFraccion denominator * self denominator.
	
	^newNumerator / newDenominator! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Fraccion class' category: 'Numeros-Parte2-Ejercicio'!
Fraccion class
	instanceVariableNames: ''!

!Fraccion class methodsFor: 'intance creation' stamp: 'M 5/6/2022 20:39:19'!
with: aDividend over: aDivisor

	| greatestCommonDivisor numerator denominator |
	
	aDivisor isZero ifTrue: [ self error: self canNotDivideByZeroErrorDescription ].
	
	aDividend isZero ifTrue: [ ^aDividend ].
	
	aDivisor isNegative ifTrue:[ ^aDividend negated / aDivisor negated].
	
	
	greatestCommonDivisor := aDividend greatestCommonDivisorWith: aDivisor. 
	
	numerator := aDividend // greatestCommonDivisor.
	
	denominator := aDivisor // greatestCommonDivisor.
	
	denominator isOne ifTrue: [ ^numerator ].
	
	^self new initializeWith: numerator over: denominator
	! !

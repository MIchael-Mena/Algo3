!classDefinition: #CicloReproductivoDeAvispasTest category: 'AlgoIII-2022-1C-2Parcial-AvispasYAbejas-P4'!
TestCase subclass: #CicloReproductivoDeAvispasTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2022-1C-2Parcial-AvispasYAbejas-P4'!

!CicloReproductivoDeAvispasTest methodsFor: 'tests' stamp: 'JMB 6/20/2022 00:13:48'!
test01EnElInicioDeLosTiemposHayUnaCantidadDeAvispasVivas

	| unHabitat |
	unHabitat := Habitat conAvispasComeOrugas: 2 yConOrugas: 0.	
	self assert: 2 equals: unHabitat cantidadDeAvispasVivas.
	! !

!CicloReproductivoDeAvispasTest methodsFor: 'tests' stamp: 'JMB 6/20/2022 00:13:41'!
test02EnElInicioDeLosTiemposNoHayHuevosDeAvispas

	| unHabitat |
	unHabitat := Habitat conAvispasComeOrugas: 2 yConOrugas: 0.	
	self assert: 0 equals: unHabitat cantidadDeHuevosDeAvispas.! !

!CicloReproductivoDeAvispasTest methodsFor: 'tests' stamp: 'JMB 6/20/2022 00:13:35'!
test03LasAvispasMuerenAlCambiarDeTemporada
	| unHabitat |
	unHabitat := Habitat conAvispasComeOrugas: 2 yConOrugas: 0.	
	
	unHabitat avanzarUnaTemporada.
	
	self assert: 0 equals: unHabitat cantidadDeAvispasVivas.
	! !

!CicloReproductivoDeAvispasTest methodsFor: 'tests' stamp: 'JMB 6/19/2022 23:54:32'!
test04AlReproducirseUnaAvispaEnLaTemporadaSiguienteSeGestaLaAvispaDescendiente
	| unHabitat avispaQueDejaUnHuevo |
	unHabitat := Habitat conAvispasComeOrugas: 2 yConOrugas: 1.
	avispaQueDejaUnHuevo := unHabitat avispas first.
	avispaQueDejaUnHuevo intentarReproducirse.
	
	unHabitat avanzarUnaTemporada.
	
	self assert: 1 equals: unHabitat cantidadDeAvispasVivas.
	! !

!CicloReproductivoDeAvispasTest methodsFor: 'tests' stamp: 'JMB 6/19/2022 23:54:49'!
test05ReproducirseUnaAvispaEnLaTemporadaSiguienteSeGestaLaAvispaDescendientePeroNoPuedeGestarNingunaEnDosTemporadas
	| habitat avispaQueDejaUnaCria |
	habitat := Habitat conAvispasComeOrugas: 2 yConOrugas: 1.
	avispaQueDejaUnaCria := habitat avispas first.
	avispaQueDejaUnaCria intentarReproducirse.
	
	habitat avanzarUnaTemporada.
	habitat avanzarUnaTemporada.
	
	self assert: 0 equals: habitat cantidadDeAvispasVivas.
	! !

!CicloReproductivoDeAvispasTest methodsFor: 'tests' stamp: 'JMB 6/19/2022 23:54:57'!
test06AlReproducirseUnaAvispaComeOrugasEnLaTemporadaSiguienteGestaUnaDescendienteConSuFirmaGenetica
	| habitat avispaQueDejaUnHuevo |
	habitat := Habitat conAvispasComeOrugas: 2 yConOrugas: 1.
	avispaQueDejaUnHuevo := habitat avispas first.
	avispaQueDejaUnHuevo intentarReproducirse.
	
	habitat avanzarUnaTemporada.
	
	self assert: 1 equals: (habitat cantidadDeAvispasVivasCumplanCon: [ : unaAvispa | unaAvispa tieneMismaFirmaGeneticaDe: avispaQueDejaUnHuevo ]).
	! !

!CicloReproductivoDeAvispasTest methodsFor: 'tests' stamp: 'JMB 6/20/2022 00:11:45'!
test07AlReproducirseUnaAvispaComePolillasEnLaTemporadaSiguienteGestaUnaDescendienteConSuFirmaGenetica
	| habitat avispaQueDejaUnHuevo |
	habitat := Habitat conAvispasComePolillas: 2 yConPolillas: 1.
	avispaQueDejaUnHuevo := habitat avispas first.
	avispaQueDejaUnHuevo intentarReproducirse.
	
	habitat avanzarUnaTemporada.
	
	self assert: 1 equals: (habitat cantidadDeAvispasVivasCumplanCon: [ : unaAvispa | unaAvispa tieneMismaFirmaGeneticaDe: avispaQueDejaUnHuevo ]).
	! !

!CicloReproductivoDeAvispasTest methodsFor: 'tests' stamp: 'JMB 6/20/2022 00:01:29'!
test08AlReproducirseUnaAvispaLadronaEnLaTemporadaSiguienteGestaUnaDescendienteConSuFirmaGenetica
	| habitat avispaQueDejaUnHuevo avispaQueRoba |
	habitat := Habitat conAvispasComeOrugas: 1 ladronas: 	1 yConOrugas: 1 conPolillas: 0.
	avispaQueDejaUnHuevo := (habitat elegirAvispasQueCumplanCon: [: cadaAvispa | cadaAvispa esComeOrugas]) first.
	avispaQueRoba := (habitat elegirAvispasQueCumplanCon: [: cadaAvispa | cadaAvispa esLadrona]) first.
	avispaQueDejaUnHuevo intentarReproducirse.
	avispaQueRoba intentarReproducirse.
	
	habitat avanzarUnaTemporada.
	
	self assert: 1 equals: (habitat cantidadDeAvispasVivasCumplanCon: [ : unaAvispa | unaAvispa tieneMismaFirmaGeneticaDe: avispaQueRoba ]).
	! !


!classDefinition: #ControlPoblacionalTest category: 'AlgoIII-2022-1C-2Parcial-AvispasYAbejas-P4'!
TestCase subclass: #ControlPoblacionalTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2022-1C-2Parcial-AvispasYAbejas-P4'!

!ControlPoblacionalTest methodsFor: 'tests' stamp: 'JMB 6/20/2022 22:13:13'!
test01EnElInicioDeLosTiemposElHabitatComienzaConUnaPoblacionDeOrugas
	| habitat |
	habitat := Habitat conOrugas: 1.
	self assert: 1 equals: habitat cantidadDeOrugas. ! !

!ControlPoblacionalTest methodsFor: 'tests' stamp: 'JMB 6/20/2022 22:13:21'!
test02EnElInicioDeLosTiemposElHabitatComienzaConUnaPoblacionDePolillas
	| habitat |
	habitat := Habitat conPolillas: 1.
	self assert: 1 equals: habitat cantidadDePolillas. ! !


!ControlPoblacionalTest methodsFor: 'tests orugas' stamp: 'M 7/6/2022 17:45:17'!
test03UnHabitatConVariacionDePoblacionConstanteCeroTieneCeroOrugasDespuesDeAvanzarUnaTemporada

	| habitat |
	
	habitat := Habitat conOrugas: 2 variandoCon: (VariacionPoblacionConstante con: 0).
	
	habitat avanzarUnaTemporada.
	
	self assert: 0 equals: habitat cantidadDeOrugas.! !

!ControlPoblacionalTest methodsFor: 'tests orugas' stamp: 'M 7/6/2022 17:45:24'!
test04UnHabitatConVariacionDePoblacionConstanteDiezTieneDiezOrugasDespuesDeAvanzarUnaTemporada

	| habitat |
	
	habitat := Habitat conOrugas: 2 variandoCon: (VariacionPoblacionConstante con: 10).
	
	habitat avanzarUnaTemporada.
	
	self assert: 10 equals: habitat cantidadDeOrugas.! !

!ControlPoblacionalTest methodsFor: 'tests orugas' stamp: 'M 7/6/2022 17:30:36'!
test05UnaVariacionDePoblacionConstanteDebeSerMayorOIgualACero

	self should: [Habitat conOrugas: 2 variandoCon: (VariacionPoblacionConstante con: -1)] 
	raise:  Error
	withExceptionDo: [ :unError | self assert: unError messageText equals: VariacionPoblacionConstante tamañoDePoblacionInvalidoError]

	
	
	! !

!ControlPoblacionalTest methodsFor: 'tests orugas' stamp: 'M 7/6/2022 17:45:37'!
test06UnHabitatConVariacionDePoblacionConstanteDiezTieneDiezOrugasTemporadaTrasTemporadaSimImportarLoQueOcurraEnMedioDeAlgunaTemporada

	| habitat cantidadOrugasTemporadaDos cantidadOrugasTemporadaUno |
	
	habitat := Habitat conOrugas: 2 variandoCon: (VariacionPoblacionConstante con: 10).
	
	habitat tomarUnaOrugaSiNoHayHace: [ self fail ].
	
	habitat avanzarUnaTemporada.
	
	cantidadOrugasTemporadaUno := habitat cantidadDeOrugas.
	
	habitat avanzarUnaTemporada.
	
	cantidadOrugasTemporadaDos := habitat cantidadDeOrugas.
	
	self assert: 10 equals: cantidadOrugasTemporadaUno.
	self assert: cantidadOrugasTemporadaUno equals: cantidadOrugasTemporadaDos.
	
	! !

!ControlPoblacionalTest methodsFor: 'tests orugas' stamp: 'M 7/6/2022 17:45:47'!
test07UnHabitatConVariacionDePoblacionActualConTasaCeroNoVariaYMantieneLaCantidadDeOrugasFinalAlAvanzarDeTemporada

	| habitat |
	
	habitat := Habitat conOrugas: 9 variandoCon: (VariacionPoblacionFinal conTasa: 0).
	
	habitat avanzarUnaTemporada.
	
	self assert: 9 + (9*0) truncated equals: habitat cantidadDeOrugas.
	! !

!ControlPoblacionalTest methodsFor: 'tests orugas' stamp: 'M 7/6/2022 17:46:04'!
test08UnHabitatConVariacionDePoblacionActualConTasaMayorACeroVariaParaLaProximaTemporadaSegunLaCantidadDeOrugasFinalDeLaTemporadaAnterior

	| habitat |
	
	habitat := Habitat conOrugas: 9 variandoCon: (VariacionPoblacionFinal conTasa: 20/100).
	
	habitat avanzarUnaTemporada.
	
	self assert: 9 + (9*20/100) truncated equals: habitat cantidadDeOrugas.
	! !

!ControlPoblacionalTest methodsFor: 'tests orugas' stamp: 'M 7/6/2022 17:31:10'!
test09LaVariacionDePoblacionActualDebeTenerUnaTasaMayorACero

	self should:  [ Habitat conOrugas: 9 variandoCon: (VariacionPoblacionFinal conTasa: -50/20). ]
	raise:  Error
	withExceptionDo: [ :unError | self assert: unError messageText equals: VariacionPoblacionFinal tasaInvalidadError ]
	! !

!ControlPoblacionalTest methodsFor: 'tests orugas' stamp: 'M 7/6/2022 17:47:57'!
test10UnHabitatConVariacionDePoblacionActualConTasaMayorACeroVariaTemporadaTrasTemporadaSegunLaCantidadDeOrugasFinalDeLaTemporadaAnterior

	| habitat cantidadOrugasTemporadaDos cantidadOrugasTemporadaUno |
	
	habitat := Habitat conOrugas: 10 variandoCon: (VariacionPoblacionFinal conTasa: 20/100).
	
	habitat tomarUnaOrugaSiNoHayHace: [ self fail ].
	
	habitat avanzarUnaTemporada.
	
	cantidadOrugasTemporadaUno := habitat cantidadDeOrugas.
	
	habitat avanzarUnaTemporada.
	
	cantidadOrugasTemporadaDos := habitat cantidadDeOrugas.
	
	self assert: 9+(9*20/100) truncated equals: cantidadOrugasTemporadaUno.
	self assert: 10+(10*20/100) equals: cantidadOrugasTemporadaDos.
	
	! !

!ControlPoblacionalTest methodsFor: 'tests orugas' stamp: 'M 7/6/2022 17:48:09'!
test11UnHabitatConVariacionDePoblacionInicialConTasaCeroNoVariaYMantieneLaCantidadDeOrugasInicialAlAvanzarDeTemporada

	| habitat |
	
	habitat := Habitat conOrugas: 9 variandoCon: (VariacionPoblacionInicial conTasa: 0).
	
	habitat avanzarUnaTemporada.
	
	self assert: 9 + (9*0) truncated equals: habitat cantidadDeOrugas.
	! !

!ControlPoblacionalTest methodsFor: 'tests orugas' stamp: 'M 7/6/2022 17:48:20'!
test12UnHabitatConVariacionDePoblacionInicialConTasaMayorACeroVariaParaLaProximaTemporadaSegunLaCantidadDeOrugasInicialDeLaTemporadaAnterior

	| habitat |
	
	habitat := Habitat conOrugas: 9 variandoCon: (VariacionPoblacionInicial conTasa: 20/100).
	
	habitat tomarUnaOrugaSiNoHayHace: [ self fail ].
	
	habitat avanzarUnaTemporada.
	
	self assert: 9 + (9*20/100) truncated equals: habitat cantidadDeOrugas.
	! !

!ControlPoblacionalTest methodsFor: 'tests orugas' stamp: 'M 7/6/2022 17:31:20'!
test13LaVariacionDePoblacionInicialDebeTenerUnaTasaMayorACero

	self should:  [ Habitat conOrugas: 9 variandoCon: (VariacionPoblacionInicial conTasa: -50/20). ]
	raise:  Error
	withExceptionDo: [ :unError | self assert: unError messageText equals: VariacionPoblacionInicial tasaInvalidadError ]
	! !

!ControlPoblacionalTest methodsFor: 'tests orugas' stamp: 'M 7/6/2022 17:59:51'!
test14UnHabitatConVariacionDePoblacionInicialConTasaMayorACeroVariaTemporadaTrasTemporadaSegunLaCantidadDeOrugasInicialDeLaTemporadaAnterior

	| habitat cantidadOrugasTemporadaDos cantidadOrugasTemporadaUno |
	
	habitat := Habitat conOrugas: 9 variandoCon: (VariacionPoblacionInicial conTasa: 20/100).
	
	habitat tomarUnaOrugaSiNoHayHace: [ self fail ].
	
	habitat avanzarUnaTemporada.
	
	cantidadOrugasTemporadaUno := habitat cantidadDeOrugas.
	
	habitat tomarUnaOrugaSiNoHayHace: [ self fail ].
	
	habitat avanzarUnaTemporada.
	
	cantidadOrugasTemporadaDos := habitat cantidadDeOrugas.
	
	self assert: 9+(9*20/100) truncated equals: cantidadOrugasTemporadaUno.
	self assert: 10+(10*20/100) equals: cantidadOrugasTemporadaDos.
	
	! !


!ControlPoblacionalTest methodsFor: 'tests polillas' stamp: 'M 7/6/2022 17:50:06'!
test15UnHabitatConVariacionDePoblacionConstanteCeroTieneCeroPolillasDespuesDeAvanzarUnaTemporada

	| habitat |
	
	habitat := Habitat conPolillas: 2 variandoCon: (VariacionPoblacionConstante con: 0).
	
	habitat avanzarUnaTemporada.
	
	self assert: 0 equals: habitat cantidadDePolillas.! !

!ControlPoblacionalTest methodsFor: 'tests polillas' stamp: 'M 7/6/2022 17:50:45'!
test16UnHabitatConVariacionDePoblacionConstanteDiezTieneDiezPolillasDespuesDeAvanzarUnaTemporada

	| habitat |
	
	habitat := Habitat conPolillas: 2 variandoCon: (VariacionPoblacionConstante con: 10).
	
	habitat avanzarUnaTemporada.
	
	self assert: 10 equals: habitat cantidadDePolillas.! !

!ControlPoblacionalTest methodsFor: 'tests polillas' stamp: 'M 7/6/2022 17:55:28'!
test17UnHabitatConVariacionDePoblacionActualConTasaCeroNoVariaYMantieneLaCantidadDePolillasFinalAlAvanzarDeTemporada

	| habitat |
	
	habitat := Habitat conPolillas: 9 variandoCon: (VariacionPoblacionFinal conTasa: 0).
	
	habitat avanzarUnaTemporada.
	
	self assert: 9 + (9*0) truncated equals: habitat cantidadDePolillas.! !

!ControlPoblacionalTest methodsFor: 'tests polillas' stamp: 'M 7/6/2022 17:56:52'!
test18UnHabitatConVariacionDePoblacionActualConTasaMayorACeroVariaParaLaProximaTemporadaSegunLaCantidadDePolillasFinalDeLaTemporadaAnterior

	| habitat |
	
	habitat := Habitat conPolillas: 9 variandoCon: (VariacionPoblacionFinal conTasa: 20/100).
	
	habitat avanzarUnaTemporada.
	
	self assert: 9 + (9*20/100) truncated equals: habitat cantidadDePolillas.! !

!ControlPoblacionalTest methodsFor: 'tests polillas' stamp: 'M 7/6/2022 17:57:40'!
test19UnHabitatConVariacionDePoblacionInicialConTasaCeroNoVariaYMantieneLaCantidadDePolillasInicialAlAvanzarDeTemporada

	| habitat |
	
	habitat := Habitat conPolillas: 9 variandoCon: (VariacionPoblacionInicial conTasa: 0).
	
	habitat avanzarUnaTemporada.
	
	self assert: 9 + (9*0) truncated equals: habitat cantidadDePolillas.
	! !

!ControlPoblacionalTest methodsFor: 'tests polillas' stamp: 'M 7/6/2022 17:58:49'!
test20UnHabitatConVariacionDePoblacionInicialConTasaMayorACeroVariaParaLaProximaTemporadaSegunLaCantidadDeOrugasInicialDeLaTemporadaAnterior

	| habitat |
	
	habitat := Habitat conPolillas: 9 variandoCon: (VariacionPoblacionInicial conTasa: 20/100).
	
	habitat tomarUnaPolillaSiNoHayHace: [ self fail ].
	
	habitat avanzarUnaTemporada.
	
	self assert: 9 + (9*20/100) truncated equals: habitat cantidadDePolillas.! !

!ControlPoblacionalTest methodsFor: 'tests polillas' stamp: 'M 7/6/2022 17:59:42'!
test21UnHabitatConVariacionDePoblacionInicialConTasaMayorACeroVariaTemporadaTrasTemporadaSegunLaCantidadDePolillasInicialDeLaTemporadaAnterior

	| habitat cantidadOrugasTemporadaDos cantidadOrugasTemporadaUno |
	
	habitat := Habitat conPolillas: 9 variandoCon: (VariacionPoblacionInicial conTasa: 20/100).
	
	habitat tomarUnaPolillaSiNoHayHace: [ self fail ].
	
	habitat avanzarUnaTemporada.
	
	cantidadOrugasTemporadaUno := habitat cantidadDePolillas.
	
	habitat tomarUnaPolillaSiNoHayHace: [ self fail ].
	
	habitat avanzarUnaTemporada.
	
	cantidadOrugasTemporadaDos := habitat cantidadDePolillas.
	
	self assert: 9+(9*20/100) truncated equals: cantidadOrugasTemporadaUno.
	self assert: 10+(10*20/100) equals: cantidadOrugasTemporadaDos.! !


!ControlPoblacionalTest methodsFor: 'tests poblacion selectiva' stamp: 'M 7/6/2022 23:25:29'!
test22

	| cantidadDeOrugasTemporadaDos cantidadDeOrugasTemporadaUno habitat temporadasElegidas variacionSelectiva |
	
	temporadasElegidas := OrderedCollection with: 2.
	
	variacionSelectiva := VariacionPoblacionSelectiva para: temporadasElegidas 
	variandoCon: (VariacionPoblacionConstante con: 0) 
	variacionTemporadasRestantes: (VariacionPoblacionConstante con: 10).

	habitat := Habitat conOrugas: 1 variandoCon: variacionSelectiva.
	
	habitat avanzarUnaTemporada.
	cantidadDeOrugasTemporadaUno := habitat cantidadDeOrugas.
	
	habitat avanzarUnaTemporada.
	cantidadDeOrugasTemporadaDos := habitat cantidadDeOrugas.
	
	self assert: 10 equals: cantidadDeOrugasTemporadaUno.
	self assert: 0 equals: cantidadDeOrugasTemporadaDos.
	! !


!classDefinition: #ReproduccionAvispasTests category: 'AlgoIII-2022-1C-2Parcial-AvispasYAbejas-P4'!
TestCase subclass: #ReproduccionAvispasTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2022-1C-2Parcial-AvispasYAbejas-P4'!

!ReproduccionAvispasTests methodsFor: 'avispas come orugas' stamp: 'JMB 5/19/2022 18:54:29'!
test01CuandoUnAvispaComeOrugasSeReproducePorPrimeraVezDejaUnHuevo
	| unHabitat |
	unHabitat := self habitatConOrugas: 1 yUnaAvispaComeOrugasQueIntentoReproducirse: 1.	
	self assert: 1 equals: unHabitat cantidadDeHuevosDeAvispas.! !

!ReproduccionAvispasTests methodsFor: 'avispas come orugas' stamp: 'JMB 5/19/2022 18:54:29'!
test02CadaVezQueUnaAvispaComeOrugasSeReproduceDejaUnHuevoMas
	| unHabitat |
	unHabitat := self habitatConOrugas: 2 yUnaAvispaComeOrugasQueIntentoReproducirse: 2.		
	self assert: 2 equals: unHabitat cantidadDeHuevosDeAvispas.! !

!ReproduccionAvispasTests methodsFor: 'avispas come orugas' stamp: 'JMB 5/19/2022 18:54:29'!
test03ParaDejarUnHuevoUnaAvispaComeOrugasReduceLaPoblacionDeUnaOrugaANinguna
	| unHabitat |
	unHabitat := self habitatConOrugas: 1 yUnaAvispaComeOrugasQueIntentoReproducirse: 1.		
	self assert: 0 equals: unHabitat cantidadDeOrugas.! !

!ReproduccionAvispasTests methodsFor: 'avispas come orugas' stamp: 'JMB 5/19/2022 18:54:29'!
test04ParaDejarUnHuevoUnaAvispaComeOrugasDecrementaEnUnoLaPoblacionDeOrugasDelHabitat
	| unHabitat |
	unHabitat := self habitatConOrugas: 2 yUnaAvispaComeOrugasQueIntentoReproducirse: 1.		
	self assert: 1 equals: unHabitat cantidadDeOrugas.! !

!ReproduccionAvispasTests methodsFor: 'avispas come orugas' stamp: 'JMB 5/19/2022 18:54:29'!
test05CuandoNoHayOrugasUnaAvispaComeOrugasNoPuedeDejarHuevos
	| unHabitat |
	unHabitat := self habitatConOrugas: 0 yUnaAvispaComeOrugasQueIntentoReproducirse: 1.	
	self assert: 0 equals: unHabitat cantidadDeHuevosDeAvispas.! !


!ReproduccionAvispasTests methodsFor: 'avispas come polillas' stamp: 'JMB 5/19/2022 18:52:26'!
test06CuandoUnaAvispaComePolillasSeReproduceDejaUnHuevo
	| unHabitat |.
	unHabitat := self habitatConUnaAvispaComePolillasQueSeIntentaReproducirUnaVezTeniendoPolillas: 1.	
	self assert: 1 equals: unHabitat cantidadDeHuevosDeAvispas.! !

!ReproduccionAvispasTests methodsFor: 'avispas come polillas' stamp: 'JMB 5/19/2022 18:52:26'!
test07ParaDejarUnHuevoUnaAvispaComePolillasReduceLaPoblacionDeUnaPolillaANinguna
	| unHabitat |
	unHabitat := self habitatConUnaAvispaComePolillasQueSeIntentaReproducirUnaVezTeniendoPolillas: 1.	
	self assert: 0 equals: unHabitat cantidadDePolillas.! !

!ReproduccionAvispasTests methodsFor: 'avispas come polillas' stamp: 'JMB 5/19/2022 18:52:26'!
test08ParaDejarUnHuevoUnaAvispaComePolillasDecrementaEnUnoLaPoblacionDePolillasDelHabitat
	| unHabitat |
	unHabitat := self habitatConUnaAvispaComePolillasQueSeIntentaReproducirUnaVezTeniendoPolillas: 2.	
	self assert: 1 equals: unHabitat cantidadDePolillas.! !

!ReproduccionAvispasTests methodsFor: 'avispas come polillas' stamp: 'JMB 5/19/2022 18:52:26'!
test09CuandoNoHayPolillasUnaAvispaComePolillasNoPuedeDejarHuevos
	| unHabitat |
	unHabitat := self habitatConUnaAvispaComePolillasQueSeIntentaReproducirUnaVezTeniendoPolillas: 0.	
	self assert: 0 equals: unHabitat cantidadDeHuevosDeAvispas.! !


!ReproduccionAvispasTests methodsFor: 'firma genetica' stamp: 'JMB 6/19/2022 23:55:36'!
test10CuandoUnaAvispaComeOrugasSeReproduceDejaUnHuevoConSuFirmaGenetica
	| unHabitat unaAvispaAReproducirse |
	unHabitat := Habitat conAvispasComeOrugas: 1 yConOrugas: 1.
	unaAvispaAReproducirse := (self elegirAvispasComeOrugasDe: unHabitat) first.
	
	unaAvispaAReproducirse intentarReproducirse.
	
	self assert: 1 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaAReproducirse firmaGenetica).! !

!ReproduccionAvispasTests methodsFor: 'firma genetica' stamp: 'JMB 6/20/2022 00:13:26'!
test11CuandoUnaAvispaComeOrugasAunNoSeReprodujoNoTieneHuevosConSuFirmaGenetica
	| unHabitat unaAvispaAReproducirse |
	unHabitat := Habitat conAvispasComeOrugas: 1 yConOrugas: 0.
	unaAvispaAReproducirse := (self elegirAvispasComeOrugasDe: unHabitat) first.
	
	unaAvispaAReproducirse intentarReproducirse.
	
	self assert: 0 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaAReproducirse firmaGenetica).! !

!ReproduccionAvispasTests methodsFor: 'firma genetica' stamp: 'JMB 6/20/2022 00:07:10'!
test12CuandoUnaAvispaComePolillasSeReproduceDejaUnHuevoConSuFirmaGenetica
	| unHabitat unaAvispaComePolillas unaAvispaComeOrugas |
	unHabitat := Habitat conAvispasComeOrugas: 1 comePolillas: 1 ladronas: 0 yConOrugas: 0 conPolillas: 1.
	unaAvispaComePolillas := (self elegirAvispasComePolillasDe: unHabitat) first.
	unaAvispaComeOrugas := (self elegirAvispasComeOrugasDe: unHabitat) first.
	
	unaAvispaComePolillas intentarReproducirse.
	
	self assert: 1 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaComePolillas firmaGenetica).
	self assert: 0 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaComeOrugas firmaGenetica).! !

!ReproduccionAvispasTests methodsFor: 'firma genetica' stamp: 'JMB 6/19/2022 23:55:49'!
test13DosAvispasDelMismoTipoDejanHuevosDeLaMismaLineaGenetica
	| unHabitat unaAvispaComeOrugas otraAvispaComeOrugas |
	unHabitat := Habitat conAvispasComeOrugas: 2 yConOrugas: 1.
	unaAvispaComeOrugas := (self elegirAvispasComeOrugasDe: unHabitat) first.
	otraAvispaComeOrugas := (self elegirAvispasComeOrugasDe: unHabitat) last.
	
	unaAvispaComeOrugas intentarReproducirse.
	
	self assert: 1 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaComeOrugas firmaGenetica).
	self assert: 1 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: otraAvispaComeOrugas firmaGenetica).! !


!ReproduccionAvispasTests methodsFor: 'avispas ladronas' stamp: 'JMB 6/20/2022 00:01:41'!
test14CuandoUnaAvispaLadronaSeReproduceDejaUnHuevoConSuFirmaGenetica
	| unHabitat unaAvispaASerRobada unaAvispaLadrona |
	unHabitat := Habitat conAvispasComeOrugas: 1 ladronas: 1 yConOrugas: 1 conPolillas: 0.
	unaAvispaASerRobada := (self elegirAvispasComeOrugasDe: unHabitat) first.
	unaAvispaLadrona := (self elegirAvispasLadronasDe: unHabitat) first.
	unaAvispaASerRobada intentarReproducirse.
	 
	unaAvispaLadrona intentarReproducirse.
	
	self assert: 1 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaLadrona firmaGenetica).! !

!ReproduccionAvispasTests methodsFor: 'avispas ladronas' stamp: 'JMB 6/20/2022 00:01:55'!
test15CuandoUnaAvispaLadronaSeReproduceLeSacaUnHuevoAOtraAvispa
	| unHabitat unaAvispaASerRobada unaAvispaLadrona |
	unHabitat := Habitat conAvispasComeOrugas: 1 ladronas: 1 yConOrugas: 1 conPolillas: 0.
	unaAvispaASerRobada := (self elegirAvispasComeOrugasDe: unHabitat) first.
	unaAvispaLadrona := (self elegirAvispasLadronasDe: unHabitat) first.
	unaAvispaASerRobada intentarReproducirse.
	 
	unaAvispaLadrona intentarReproducirse.
	
	self assert: 0 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaASerRobada firmaGenetica).! !

!ReproduccionAvispasTests methodsFor: 'avispas ladronas' stamp: 'JMB 6/20/2022 00:05:00'!
test16CuandoUnaAvispaLadronaSeReproduceSoloRobaUnHuevo
	| unHabitat unaAvispaASerRobada unaAvispaLadrona |
	unHabitat := Habitat conAvispasComeOrugas: 1 ladronas: 1 yConOrugas: 2 conPolillas: 0.
	unaAvispaASerRobada := (self elegirAvispasComeOrugasDe: unHabitat) first.
	unaAvispaLadrona := (self elegirAvispasLadronasDe: unHabitat) first.
	unaAvispaASerRobada intentarReproducirse.
	unaAvispaASerRobada intentarReproducirse.
	 
	unaAvispaLadrona intentarReproducirse.
	
	self assert: 1 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaASerRobada firmaGenetica).! !

!ReproduccionAvispasTests methodsFor: 'avispas ladronas' stamp: 'JMB 6/20/2022 00:02:30'!
test17CuandoUnaAvispaLadronaNoTieneRecursosNoDejaUnHuevo
	| unHabitat unaAvispaLadrona |
	unHabitat := Habitat conAvispasComeOrugas: 1 ladronas: 1 yConOrugas: 0 conPolillas: 0.
	unaAvispaLadrona := (self elegirAvispasLadronasDe: unHabitat) first.
	 
	unaAvispaLadrona intentarReproducirse.
	
	self assert: 0 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaLadrona firmaGenetica).! !


!ReproduccionAvispasTests methodsFor: 'avispas ladronas - selectivas' stamp: 'JMB 6/19/2022 23:56:29'!
test18CuandoUnaAvispaLadronaSeReproduceRobaHuevosDeVariasAvispas
	| unHabitat unaAvispaASerRobada unaAvispaLadrona otraAvispaASerRobada |
	unHabitat := Habitat conAvispasComeOrugas: 1 comePolillas: 1 ladronas: 1 yConOrugas: 1 conPolillas: 1.
	unaAvispaASerRobada := (self elegirAvispasComeOrugasDe: unHabitat) first.
	otraAvispaASerRobada := (self elegirAvispasComePolillasDe: unHabitat) first.
	unaAvispaLadrona := (self elegirAvispasLadronasDe: unHabitat) first.
	unaAvispaASerRobada intentarReproducirse.
	otraAvispaASerRobada intentarReproducirse.
	unaAvispaLadrona intentarReproducirse.
	
	unaAvispaLadrona intentarReproducirse.
	
	self assert: 0 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaASerRobada firmaGenetica).
	self assert: 0 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: otraAvispaASerRobada firmaGenetica).
	self assert: 2 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaLadrona firmaGenetica).
	! !

!ReproduccionAvispasTests methodsFor: 'avispas ladronas - selectivas' stamp: 'JMB 6/19/2022 23:58:14'!
test19CuandoUnaAvispaLadronaSeReproduceNoVuelveARobarDeLaUltimaLineaGeneticaQueYaHaRobado
	| unHabitat unaAvispaASerRobada unaAvispaLadrona |
	unHabitat := Habitat conAvispasComeOrugas: 1 comePolillas: 0 ladronas: 1 yConOrugas: 2 conPolillas: 0.
	unaAvispaASerRobada := (self elegirAvispasComeOrugasDe: unHabitat) first.
	unaAvispaLadrona := (self elegirAvispasLadronasDe: unHabitat) first.
	unaAvispaASerRobada intentarReproducirse.
	unaAvispaASerRobada intentarReproducirse.
	unaAvispaLadrona intentarReproducirse. 
	
	unaAvispaLadrona intentarReproducirse.
	
	self assert: 1 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaLadrona firmaGenetica).
	self assert: 1 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaASerRobada firmaGenetica).! !

!ReproduccionAvispasTests methodsFor: 'avispas ladronas - selectivas' stamp: 'JMB 6/19/2022 23:58:35'!
test20CuandoUnaAvispaLadronaSeReproduceNoRobaHuevosDeNingunaFirmaGeneticaALaQueLeHayaRobadoPreviamente
	| unHabitat unaAvispaASerRobada unaAvispaLadrona otraAvispaASerRobada |
	unHabitat := Habitat conAvispasComeOrugas: 1 comePolillas: 1 ladronas: 1 yConOrugas: 2 conPolillas: 2.
	unaAvispaASerRobada := (self elegirAvispasComeOrugasDe: unHabitat) first.
	otraAvispaASerRobada := (self elegirAvispasComePolillasDe: unHabitat) first.
	unaAvispaLadrona := (self elegirAvispasLadronasDe: unHabitat) first.
	unaAvispaASerRobada intentarReproducirse.
	unaAvispaASerRobada intentarReproducirse.
	otraAvispaASerRobada intentarReproducirse.
	unaAvispaLadrona intentarReproducirse.
	unaAvispaLadrona intentarReproducirse.
	
	unaAvispaLadrona intentarReproducirse.
	
	self assert: 1 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaASerRobada firmaGenetica).
	self assert: 0 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: otraAvispaASerRobada firmaGenetica).
	self assert: 2 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaLadrona firmaGenetica).
	! !


!ReproduccionAvispasTests methodsFor: 'avispas' stamp: 'JMB 5/20/2022 20:28:03'!
elegirAvispasComeOrugasDe: unHabitat

	^ unHabitat elegirAvispasQueCumplanCon: [: cadaAvispa | cadaAvispa esComeOrugas]! !

!ReproduccionAvispasTests methodsFor: 'avispas' stamp: 'JMB 5/20/2022 20:28:10'!
elegirAvispasComePolillasDe: unHabitat

	^ unHabitat elegirAvispasQueCumplanCon: [: cadaAvispa | cadaAvispa esComePolillas]! !

!ReproduccionAvispasTests methodsFor: 'avispas' stamp: 'JMB 5/20/2022 20:28:19'!
elegirAvispasLadronasDe: unHabitat

	^ unHabitat elegirAvispasQueCumplanCon: [: cadaAvispa | cadaAvispa esLadrona]! !


!ReproduccionAvispasTests methodsFor: 'habitats' stamp: 'JMB 6/19/2022 23:55:26'!
habitatConOrugas: unaCantidadDeOrugasAGestar yUnaAvispaComeOrugasQueIntentoReproducirse: cantidadDeVecesAReproducirse
	| unHabitat unaAvispaAReproducirse |
	unHabitat := Habitat conAvispasComeOrugas: 1 yConOrugas: unaCantidadDeOrugasAGestar.
	unaAvispaAReproducirse := (self elegirAvispasComeOrugasDe: unHabitat) first.
	
	cantidadDeVecesAReproducirse timesRepeat: [ unaAvispaAReproducirse intentarReproducirse ].
	^ unHabitat ! !

!ReproduccionAvispasTests methodsFor: 'habitats' stamp: 'JMB 6/20/2022 00:11:57'!
habitatConUnaAvispaComePolillasQueSeIntentaReproducirUnaVezTeniendoPolillas: unaCantidadDePolillasAGestar
	| unHabitat unaAvispaAReproducirse |
	unHabitat := Habitat conAvispasComePolillas: 1 yConPolillas: unaCantidadDePolillasAGestar.
	unaAvispaAReproducirse := (self elegirAvispasComePolillasDe: unHabitat) first.
	unaAvispaAReproducirse intentarReproducirse.
	
	^ unHabitat! !


!classDefinition: #Avispa category: 'AlgoIII-2022-1C-2Parcial-AvispasYAbejas-P4'!
Object subclass: #Avispa
	instanceVariableNames: 'habitat estrategiaReproductiva'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2022-1C-2Parcial-AvispasYAbejas-P4'!

!Avispa methodsFor: 'initialization' stamp: 'JMB 5/22/2022 23:00:33'!
initializeEn: unHabitat  siguiendo: unaEstrategiaReproductiva
	habitat := unHabitat.
	estrategiaReproductiva := unaEstrategiaReproductiva! !


!Avispa methodsFor: 'testing' stamp: 'JMB 5/22/2022 22:58:26'!
esComeOrugas
	^ estrategiaReproductiva usaOrugasParaAlimentarLasCrias! !

!Avispa methodsFor: 'testing' stamp: 'JMB 5/22/2022 22:58:59'!
esComePolillas
	^ estrategiaReproductiva usaPolillasParaAlimentarLasCrias ! !

!Avispa methodsFor: 'testing' stamp: 'JMB 6/20/2022 22:03:51'!
esLadrona
	^ estrategiaReproductiva robaHuevos ! !

!Avispa methodsFor: 'testing' stamp: 'JMB 5/22/2022 21:44:17'!
tieneMismaFirmaGeneticaDe: unaAvispa
	^ self firmaGenetica = unaAvispa firmaGenetica! !


!Avispa methodsFor: 'reproduccion' stamp: 'JMB 5/22/2022 22:36:28'!
firmaGenetica
	^ estrategiaReproductiva firmaGenetica ! !

!Avispa methodsFor: 'reproduccion' stamp: 'JMB 5/22/2022 22:24:03'!
intentarReproducirse
	estrategiaReproductiva realizarPor: self en: habitat.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Avispa class' category: 'AlgoIII-2022-1C-2Parcial-AvispasYAbejas-P4'!
Avispa class
	instanceVariableNames: ''!

!Avispa class methodsFor: 'instance creation' stamp: 'JMB 5/23/2022 18:30:02'!
en: unHabitat con: unaFirmaGenetica
	
	^ self en: unHabitat siguiendo: (EstrategiaReproductiva empleadaPor: unaFirmaGenetica)! !

!Avispa class methodsFor: 'instance creation' stamp: 'JMB 5/22/2022 23:01:04'!
en: unHabitat siguiendo: unaEstrategiaReproductiva
	^self new initializeEn: unHabitat siguiendo: unaEstrategiaReproductiva! !


!classDefinition: #EstrategiaReproductiva category: 'AlgoIII-2022-1C-2Parcial-AvispasYAbejas-P4'!
Object subclass: #EstrategiaReproductiva
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2022-1C-2Parcial-AvispasYAbejas-P4'!

!EstrategiaReproductiva methodsFor: 'testing' stamp: 'JMB 6/20/2022 22:03:51'!
robaHuevos
	^ false! !

!EstrategiaReproductiva methodsFor: 'testing' stamp: 'JMB 5/22/2022 22:58:26'!
usaOrugasParaAlimentarLasCrias
	^ false! !

!EstrategiaReproductiva methodsFor: 'testing' stamp: 'JMB 5/22/2022 22:58:59'!
usaPolillasParaAlimentarLasCrias
	^ false! !


!EstrategiaReproductiva methodsFor: 'reproduccion' stamp: 'JMB 5/22/2022 22:43:55'!
firmaGenetica
	^ self class firmaGenetica ! !

!EstrategiaReproductiva methodsFor: 'reproduccion' stamp: 'JMB 5/22/2022 22:23:37'!
realizarPor: unaAvispa en: unHabitat
	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EstrategiaReproductiva class' category: 'AlgoIII-2022-1C-2Parcial-AvispasYAbejas-P4'!
EstrategiaReproductiva class
	instanceVariableNames: ''!

!EstrategiaReproductiva class methodsFor: 'instance creation' stamp: 'JMB 5/23/2022 18:31:01'!
empleadaPor: unaFirmaGenetica 
	
	^ self subclasses 
		detect: [ : cadaEstrategiaReproductiva | cadaEstrategiaReproductiva esEmpleadaPor: unaFirmaGenetica ] 
		ifFound: [ : tipoDeAvispaCompatible | tipoDeAvispaCompatible new ]
		ifNone: [ self error: 'La firma genetica no es compatible con ninguna estrategia repreductiva' ]! !


!EstrategiaReproductiva class methodsFor: 'firma genetica' stamp: 'JMB 5/23/2022 18:31:01'!
esEmpleadaPor: unaFirmaGenetica
	^ self firmaGenetica = unaFirmaGenetica ! !

!EstrategiaReproductiva class methodsFor: 'firma genetica' stamp: 'JMB 5/22/2022 22:43:01'!
firmaGenetica
	self subclassResponsibility ! !


!classDefinition: #AlimentaCriasConOrugas category: 'AlgoIII-2022-1C-2Parcial-AvispasYAbejas-P4'!
EstrategiaReproductiva subclass: #AlimentaCriasConOrugas
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2022-1C-2Parcial-AvispasYAbejas-P4'!

!AlimentaCriasConOrugas methodsFor: 'testing' stamp: 'JMB 5/22/2022 22:58:26'!
usaOrugasParaAlimentarLasCrias
	^ true! !


!AlimentaCriasConOrugas methodsFor: 'reproduccion' stamp: 'JMB 5/22/2022 23:19:04'!
realizarPor: unaAvispa en: unHabitat
	unHabitat tomarUnaOrugaSiNoHayHace: [ ^ self ].
	unHabitat dejarUnHuevoDeAvispa: unaAvispa. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AlimentaCriasConOrugas class' category: 'AlgoIII-2022-1C-2Parcial-AvispasYAbejas-P4'!
AlimentaCriasConOrugas class
	instanceVariableNames: ''!

!AlimentaCriasConOrugas class methodsFor: 'firma genetica' stamp: 'JMB 5/22/2022 22:43:13'!
firmaGenetica
	^#'come-orugas'! !


!classDefinition: #AlimentaCriasConPolillas category: 'AlgoIII-2022-1C-2Parcial-AvispasYAbejas-P4'!
EstrategiaReproductiva subclass: #AlimentaCriasConPolillas
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2022-1C-2Parcial-AvispasYAbejas-P4'!

!AlimentaCriasConPolillas methodsFor: 'testing' stamp: 'JMB 5/22/2022 22:58:59'!
usaPolillasParaAlimentarLasCrias
	^ true! !


!AlimentaCriasConPolillas methodsFor: 'reproduccion' stamp: 'JMB 5/22/2022 23:23:41'!
realizarPor: unaAvispa en: unHabitat
	unHabitat tomarUnaPolillaSiNoHayHace: [ ^ self ].
	unHabitat dejarUnHuevoDeAvispa: unaAvispa.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AlimentaCriasConPolillas class' category: 'AlgoIII-2022-1C-2Parcial-AvispasYAbejas-P4'!
AlimentaCriasConPolillas class
	instanceVariableNames: ''!

!AlimentaCriasConPolillas class methodsFor: 'firma genetica' stamp: 'JMB 5/22/2022 22:43:22'!
firmaGenetica
	^#'come-polillas'! !


!classDefinition: #RobaHuevos category: 'AlgoIII-2022-1C-2Parcial-AvispasYAbejas-P4'!
EstrategiaReproductiva subclass: #RobaHuevos
	instanceVariableNames: 'firmasGeneticasExceptuadas'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2022-1C-2Parcial-AvispasYAbejas-P4'!

!RobaHuevos methodsFor: 'initialization' stamp: 'JMB 5/22/2022 23:36:03'!
initialize
	super initialize.
	firmasGeneticasExceptuadas := OrderedCollection with: self firmaGenetica! !


!RobaHuevos methodsFor: 'reproduccion' stamp: 'JMB 5/22/2022 23:36:16'!
realizarPor: unaAvispa en: unHabitat
	| firmaGeneticaRobada  |
	firmaGeneticaRobada := unHabitat robarUnHuevoQueNoSeaDe: firmasGeneticasExceptuadas siNoHayHace: [ ^ self ].
	unHabitat dejarUnHuevoDeAvispa: unaAvispa.
	self exceptuarFirmaGenetica: firmaGeneticaRobada.! !


!RobaHuevos methodsFor: 'testing' stamp: 'JMB 6/20/2022 22:03:51'!
robaHuevos
	^ true! !


!RobaHuevos methodsFor: 'privados' stamp: 'JMB 5/22/2022 23:36:16'!
exceptuarFirmaGenetica: firmaGeneticaRobada

	^ firmasGeneticasExceptuadas add: firmaGeneticaRobada! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RobaHuevos class' category: 'AlgoIII-2022-1C-2Parcial-AvispasYAbejas-P4'!
RobaHuevos class
	instanceVariableNames: ''!

!RobaHuevos class methodsFor: 'firma genetica' stamp: 'JMB 5/22/2022 22:43:37'!
firmaGenetica
	^#ladrona! !


!classDefinition: #Habitat category: 'AlgoIII-2022-1C-2Parcial-AvispasYAbejas-P4'!
Object subclass: #Habitat
	instanceVariableNames: 'avispas cantidadDeHuevosDeAvispasYSuAlimentoPorLineaGenetica cantidadDeOrugas variacionPoblacionOrugas cantidadDeOrugasInicial cantidadDePolillas variacionPoblacionPolillas cantidadDePolillasInicial poblacionOrugas poblacionPolillas'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2022-1C-2Parcial-AvispasYAbejas-P4'!

!Habitat methodsFor: 'initialization' stamp: 'M 7/6/2022 22:41:25'!
initializeConAvispas: unasAvispasIniciales yConOrugas: unaCantidadInicialDeOrugas conPolillas: unaCantidadInicalDePolillas variandoCon: unaVariacionPoblacion 

	cantidadDeHuevosDeAvispasYSuAlimentoPorLineaGenetica := Dictionary new.
	avispas := unasAvispasIniciales.
	
	poblacionOrugas := PoblacionControlada conTamaño: unaCantidadInicialDeOrugas variandoCon: unaVariacionPoblacion.
	
	poblacionPolillas := PoblacionControlada conTamaño: unaCantidadInicalDePolillas variandoCon: unaVariacionPoblacion.
	
"	cantidadDeOrugas := unaCantidadInicialDeOrugas.
	cantidadDeOrugasInicial := unaCantidadInicialDeOrugas.
	variacionPoblacionOrugas := unaVariacionPoblacion.
	
	cantidadDePolillas := unaCantidadInicalDePolillas.
	cantidadDePolillasInicial := unaCantidadInicalDePolillas.
	variacionPoblacionPolillas := unaVariacionPoblacion."! !

!Habitat methodsFor: 'initialization' stamp: 'M 7/6/2022 22:32:15'!
initializeConOrugas: unaCantidadDeOrugas variandoCon: unaVariacionPoblacional 

	self initializeConAvispas: OrderedCollection new yConOrugas: unaCantidadDeOrugas conPolillas: 0 variandoCon: (VariacionPoblacionConstante con: 0).
	
	cantidadDeOrugasInicial := unaCantidadDeOrugas.
	cantidadDePolillasInicial := 0.
	
	variacionPoblacionOrugas := unaVariacionPoblacional.
	variacionPoblacionPolillas := VariacionPoblacionConstante con: 0.! !

!Habitat methodsFor: 'initialization' stamp: 'M 7/6/2022 22:32:15'!
initializeConPolillas: unaCantidadDePolillas variandoCon: unaVariacionPoblacional 

	self initializeConAvispas: OrderedCollection new yConOrugas: 0 conPolillas: unaCantidadDePolillas variandoCon: (VariacionPoblacionConstante con: 0).
	
	cantidadDeOrugasInicial := 0.
	cantidadDePolillasInicial := unaCantidadDePolillas.
	
	variacionPoblacionOrugas := VariacionPoblacionConstante con: 0.
	variacionPoblacionPolillas := unaVariacionPoblacional.! !


!Habitat methodsFor: 'avispas' stamp: 'JMB 5/20/2022 01:09:25'!
avispas
	^ avispas! !

!Habitat methodsFor: 'avispas' stamp: 'JMB 5/17/2022 21:13:53'!
cantidadDeAvispasVivas
	^ avispas size! !

!Habitat methodsFor: 'avispas' stamp: 'JMB 5/20/2022 20:44:36'!
cantidadDeAvispasVivasCumplanCon: unaCondicion 
	^ (self elegirAvispasQueCumplanCon: unaCondicion) size! !

!Habitat methodsFor: 'avispas' stamp: 'JMB 5/20/2022 20:38:25'!
elegirAvispasQueCumplanCon: unaCondicionASeleccionar 
	^ avispas select: unaCondicionASeleccionar ! !


!Habitat methodsFor: 'huevos de avispas' stamp: 'JMB 5/18/2022 12:05:53'!
cantidadDeHuevosConLaFirmaGenetica: unaFirmaGenetica
	^ cantidadDeHuevosDeAvispasYSuAlimentoPorLineaGenetica at: unaFirmaGenetica ifAbsent: [ 0 ]! !

!Habitat methodsFor: 'huevos de avispas' stamp: 'JMB 5/18/2022 12:14:19'!
cantidadDeHuevosDeAvispas
	^ cantidadDeHuevosDeAvispasYSuAlimentoPorLineaGenetica values sum: [ : unaCantidadDeHuevos | unaCantidadDeHuevos ] ifEmpty: [ 0 ]! !

!Habitat methodsFor: 'huevos de avispas' stamp: 'JMB 5/18/2022 16:40:25'!
dejarUnHuevoDeAvispa: unaAvispaAAovar
	| cantidadDeHuevos |
	cantidadDeHuevos := self cantidadDeHuevosConLaFirmaGenetica: unaAvispaAAovar firmaGenetica.
	self contabilizar: cantidadDeHuevos + 1 a: unaAvispaAAovar firmaGenetica.! !

!Habitat methodsFor: 'huevos de avispas' stamp: 'JMB 5/22/2022 23:31:19'!
robarUnHuevoQueNoSeaDe: firmasGeneticasExcluidas siNoHayHace: unBloqueAEvaluarSiNoHayHuevosARobar
	
	(self tieneHuevosDeAvispasQueNoSeanDe: firmasGeneticasExcluidas) 
		ifFalse: [ ^ unBloqueAEvaluarSiNoHayHuevosARobar value ].
	^ self robarUnHuevoQueNoSeaDe: firmasGeneticasExcluidas! !

!Habitat methodsFor: 'huevos de avispas' stamp: 'JMB 5/20/2022 20:41:07'!
tieneHuevosDeAvispasQueNoSeanDe: unasFirmasGeneticas

	^ self cantidadDeHuevosDeAvispas > (self cantidadDeHuevosConLasFirmasGeneticas: unasFirmasGeneticas)! !


!Habitat methodsFor: 'alimentos de las avispas' stamp: 'M 7/6/2022 23:08:47'!
cantidadDeOrugas

	^ poblacionOrugas tamaño.

"	^ cantidadDeOrugas"! !

!Habitat methodsFor: 'alimentos de las avispas' stamp: 'M 7/6/2022 23:08:47'!
cantidadDePolillas

	^ poblacionPolillas tamaño.

"	^ cantidadDePolillas"! !

!Habitat methodsFor: 'alimentos de las avispas' stamp: 'M 7/6/2022 22:53:02'!
tomarUnaOrugaSiNoHayHace: unBloqueAEvaluarSiNoNoHayOrugas

	poblacionOrugas tomarUnoSiNoHayHace: unBloqueAEvaluarSiNoNoHayOrugas.

"	cantidadDeOrugas > 0
		ifTrue: [ 	cantidadDeOrugas := cantidadDeOrugas - 1 ]
		ifFalse: unBloqueAEvaluarSiNoNoHayOrugas"! !

!Habitat methodsFor: 'alimentos de las avispas' stamp: 'M 7/6/2022 22:55:20'!
tomarUnaPolillaSiNoHayHace: unBloqueAEvaluarSiNoHayPolillas

	poblacionPolillas tomarUnoSiNoHayHace: unBloqueAEvaluarSiNoHayPolillas.

"	cantidadDePolillas > 0
		ifTrue: [	cantidadDePolillas := cantidadDePolillas - 1 ]
		ifFalse: unBloqueAEvaluarSiNoHayPolillas"! !


!Habitat methodsFor: 'ciclo' stamp: 'JMB 6/20/2022 00:33:02'!
avanzarUnaTemporada
	self gestarNuevaGeneracionDeAvispas.
	self consumirHuevosDeAvispas.
	self avanzarUnaTemporadaEnLasPoblacionesControladas! !


!Habitat methodsFor: 'ciclo - privados' stamp: 'M 7/6/2022 22:49:55'!
avanzarUnaTemporadaEnLasPoblacionesControladas

"	cantidadDeOrugas := (variacionPoblacion isKindOf: VariacionPoblacion) 
	ifTrue: [variacionPoblacion evaluar: cantidadDeOrugas conTamañoInicial: cantidadDeOrugasInicial]
	ifFalse: [ 0 ]."

"	cantidadDeOrugas := variacionPoblacionOrugas ifNil: [0] ifNotNil: [ variacionPoblacionOrugas evaluar: cantidadDeOrugas conTamañoInicial: cantidadDeOrugasInicial ].
	cantidadDeOrugasInicial := cantidadDeOrugas.
	
	cantidadDePolillas := variacionPoblacionPolillas ifNil: [0] ifNotNil: [ variacionPoblacionPolillas evaluar: cantidadDePolillas conTamañoInicial: cantidadDePolillasInicial ].
	cantidadDePolillasInicial := cantidadDePolillas."
	
"	cantidadDeOrugas := variacionPoblacionOrugas evaluar: cantidadDeOrugas conTamañoInicial: cantidadDeOrugasInicial.
	cantidadDeOrugasInicial := cantidadDeOrugas.
	
	cantidadDePolillas := variacionPoblacionPolillas evaluar: cantidadDePolillas conTamañoInicial: cantidadDePolillasInicial.
	cantidadDePolillasInicial := cantidadDePolillas."
	
	poblacionOrugas avanzarUnaTemporada.
	poblacionPolillas avanzarUnaTemporada.! !

!Habitat methodsFor: 'ciclo - privados' stamp: 'JMB 5/20/2022 21:05:13'!
consumirHuevosDeAvispas

	^ cantidadDeHuevosDeAvispasYSuAlimentoPorLineaGenetica := Dictionary new! !

!Habitat methodsFor: 'ciclo - privados' stamp: 'JMB 5/22/2022 23:12:17'!
gestarNuevaGeneracionDeAvispas
	"
	avispas := OrderedCollection new.
 	self firmasGeneticaConHuevos do: [ : unaFirmaGenetica | 		avispas addAll: (self gestarNuevaGeneracionDeAvispasPara: unaFirmaGenetica)].
	"
	avispas := self firmasGeneticaConHuevos inject: OrderedCollection new addingAll: [ :  unaFirmaGenetica | 
		self gestarNuevaGeneracionDeAvispasPara: unaFirmaGenetica].! !

!Habitat methodsFor: 'ciclo - privados' stamp: 'JMB 5/22/2022 23:02:47'!
gestarNuevaGeneracionDeAvispasPara: unaFirmaGenetica
	| cantidadDeAvispasAGestar |
	cantidadDeAvispasAGestar := 		self cantidadDeHuevosConLaFirmaGenetica: unaFirmaGenetica.
	^ (1 to: cantidadDeAvispasAGestar) collect: [ :each | Avispa en: self con: unaFirmaGenetica ].
	! !


!Habitat methodsFor: 'privados' stamp: 'JMB 5/20/2022 20:40:46'!
cantidadDeHuevosConLasFirmasGeneticas: unasFirmasGeneticas

	^ unasFirmasGeneticas sum: [ : unaFirmaGenetica | self cantidadDeHuevosConLaFirmaGenetica: unaFirmaGenetica ] ifEmpty: [ 0 ]! !

!Habitat methodsFor: 'privados' stamp: 'JMB 5/18/2022 16:38:08'!
contabilizar: unaCantidadDeHuevos a: unaFirmaGenetica
	cantidadDeHuevosDeAvispasYSuAlimentoPorLineaGenetica at: unaFirmaGenetica put: unaCantidadDeHuevos! !

!Habitat methodsFor: 'privados' stamp: 'JMB 5/20/2022 20:47:27'!
firmaGeneticaARobarQueNoSea: firmasGeneticasExcluidas
	^ (self firmasGeneticaConHuevos difference: firmasGeneticasExcluidas) first! !

!Habitat methodsFor: 'privados' stamp: 'JMB 5/20/2022 21:03:25'!
firmasGeneticaConHuevos
	
	^ cantidadDeHuevosDeAvispasYSuAlimentoPorLineaGenetica keys select: [: cadaFirmaGenetica | (self cantidadDeHuevosConLaFirmaGenetica: cadaFirmaGenetica) > 0]! !

!Habitat methodsFor: 'privados' stamp: 'JMB 5/18/2022 22:33:05'!
robarUnHuevoQueNoSeaDe: firmasGeneticasExcluidas
	| cantidadDeHuevos unaFirmaGeneticaARobar |
	unaFirmaGeneticaARobar := self firmaGeneticaARobarQueNoSea: firmasGeneticasExcluidas.
	cantidadDeHuevos := self cantidadDeHuevosConLaFirmaGenetica: unaFirmaGeneticaARobar.
	self contabilizar: cantidadDeHuevos - 1 a: unaFirmaGeneticaARobar.
	^ unaFirmaGeneticaARobar! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Habitat class' category: 'AlgoIII-2022-1C-2Parcial-AvispasYAbejas-P4'!
Habitat class
	instanceVariableNames: ''!

!Habitat class methodsFor: 'instance creation' stamp: 'M 7/6/2022 22:32:15'!
conAvispasComeOrugas: unaCantidadDeAvispasComeOrugas comePolillas: unaCantidadDeAvispasComePolillas ladronas: unaCantidadDeAvispasLadronas yConOrugas: unaCantidadInicialDeOrugas conPolillas: unaCantidadInicialDePolillas
	| unasAvispas habitat |
	habitat := self new.
	unasAvispas := (self gestarEn: habitat avispas: unaCantidadDeAvispasComeOrugas siguiendo: AlimentaCriasConOrugas new) asOrderedCollection.
	unasAvispas addAll: (self gestarEn: habitat avispas: unaCantidadDeAvispasComePolillas siguiendo: AlimentaCriasConPolillas new).
	unasAvispas addAll: (self gestarEn: habitat avispas: unaCantidadDeAvispasLadronas siguiendo: RobaHuevos new).
	^habitat initializeConAvispas: unasAvispas yConOrugas: unaCantidadInicialDeOrugas conPolillas: unaCantidadInicialDePolillas variandoCon: (VariacionPoblacionConstante con: 0)! !

!Habitat class methodsFor: 'instance creation' stamp: 'JMB 6/20/2022 00:03:41'!
conAvispasComeOrugas: unaCantidadDeAvispasComeOrugas ladronas: unaCantidadDeAvispasLadronas yConOrugas: unaCantidadInicialDeOrugas conPolillas: unaCantidadInicialDePolillas
	^ self conAvispasComeOrugas: unaCantidadDeAvispasComeOrugas comePolillas: 0 ladronas: unaCantidadDeAvispasLadronas yConOrugas: unaCantidadInicialDeOrugas conPolillas: unaCantidadInicialDePolillas! !

!Habitat class methodsFor: 'instance creation' stamp: 'JMB 6/19/2022 23:53:25'!
conAvispasComeOrugas: unaCantidadDeAvispasComeOrugas yConOrugas: unaCantidadInicialDeOrugas
	^ self conAvispasComeOrugas: unaCantidadDeAvispasComeOrugas comePolillas: 0 ladronas: 0 yConOrugas: unaCantidadInicialDeOrugas conPolillas: 0! !

!Habitat class methodsFor: 'instance creation' stamp: 'JMB 6/20/2022 00:11:29'!
conAvispasComePolillas: unaCantidadDeAvispasComePolillas yConPolillas: unaCantidadInicialDePolillas
	^ self conAvispasComeOrugas: 0 comePolillas: unaCantidadDeAvispasComePolillas ladronas: 0 yConOrugas: 0 conPolillas: unaCantidadInicialDePolillas! !

!Habitat class methodsFor: 'instance creation' stamp: 'JMB 6/20/2022 00:18:04'!
conOrugas: unaCantidadInicialDeOrugas
	^ self conAvispasComeOrugas: 0 comePolillas: 0 ladronas: 0 yConOrugas: unaCantidadInicialDeOrugas conPolillas: 0! !

!Habitat class methodsFor: 'instance creation' stamp: 'M 7/6/2022 22:58:37'!
conOrugas: unaCantidadDeOrugas conPolillas: unaCantidadDePolillas variandoCon: unaVariacionPoblacion

	^ self new initializeConAvispas: #() yConOrugas: unaCantidadDeOrugas conPolillas: unaCantidadDePolillas variandoCon: unaVariacionPoblacion.
! !

!Habitat class methodsFor: 'instance creation' stamp: 'M 7/6/2022 22:34:49'!
conOrugas: unaCantidadDeOrugas variandoCon: unaVariacionPoblacion

	^ self new initializeConAvispas: #() yConOrugas: unaCantidadDeOrugas conPolillas: 0 variandoCon: unaVariacionPoblacion.

"	^self new initializeConOrugas: unaCantidadDeOrugas variandoCon: unaVariacionPoblacion"! !

!Habitat class methodsFor: 'instance creation' stamp: 'JMB 6/20/2022 20:59:22'!
conPolillas: unaCantidadInicialDePolillas
	^ self conAvispasComeOrugas: 0 comePolillas: 0 ladronas: 0 yConOrugas: 0 conPolillas: unaCantidadInicialDePolillas! !

!Habitat class methodsFor: 'instance creation' stamp: 'M 7/6/2022 22:35:05'!
conPolillas: unaCantidadDePolillas variandoCon: unaVariacionPoblacion

	^ self new initializeConAvispas: #() yConOrugas: 0 conPolillas: unaCantidadDePolillas variandoCon: unaVariacionPoblacion.

"	^self new initializeConPolillas: unaCantidadDePolillas variandoCon: unaVariacionPoblacion"! !


!Habitat class methodsFor: 'privado' stamp: 'JMB 5/23/2022 18:28:54'!
gestarEn: unHabitat avispas: unaCantidadDeAvispas siguiendo: unaEstrategiaReproductiva
	^ (1 to: unaCantidadDeAvispas) collect: [ : each | Avispa en: unHabitat siguiendo: unaEstrategiaReproductiva ]
	! !


!classDefinition: #PoblacionControlada category: 'AlgoIII-2022-1C-2Parcial-AvispasYAbejas-P4'!
Object subclass: #PoblacionControlada
	instanceVariableNames: 'tamaño variacionPoblacion tamañoInicial temporada'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2022-1C-2Parcial-AvispasYAbejas-P4'!

!PoblacionControlada methodsFor: 'initialization' stamp: 'M 7/6/2022 23:38:07'!
initializeConTamaño: unTamaño variandoCon: unaVariacionPoblacion 

	tamaño := unTamaño.
	tamañoInicial := unTamaño.
	variacionPoblacion := unaVariacionPoblacion.
	temporada := 0.! !


!PoblacionControlada methodsFor: 'as yet unclassified' stamp: 'M 7/6/2022 23:38:24'!
avanzarUnaTemporada

	tamaño := variacionPoblacion evaluar: self.
	tamañoInicial := tamaño.
	temporada := temporada + 1.! !

!PoblacionControlada methodsFor: 'as yet unclassified' stamp: 'M 7/6/2022 23:08:47'!
tamaño

	^ tamaño ! !

!PoblacionControlada methodsFor: 'as yet unclassified' stamp: 'M 7/6/2022 23:09:05'!
tamañoAlInicioDeTemporada

	^ tamañoInicial! !

!PoblacionControlada methodsFor: 'as yet unclassified' stamp: 'M 7/6/2022 23:38:54'!
temporadaActual

	^ temporada.! !

!PoblacionControlada methodsFor: 'as yet unclassified' stamp: 'M 7/6/2022 22:54:49'!
tomarUnoSiNoHayHace: unBloqueAEvaluarSiNoNoHayPoblacion

	tamaño > 0
		ifTrue: [ 	tamaño := tamaño - 1 ]
		ifFalse: unBloqueAEvaluarSiNoNoHayPoblacion! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PoblacionControlada class' category: 'AlgoIII-2022-1C-2Parcial-AvispasYAbejas-P4'!
PoblacionControlada class
	instanceVariableNames: ''!

!PoblacionControlada class methodsFor: 'instance creation' stamp: 'M 7/6/2022 22:43:41'!
conTamaño: unTamaño variandoCon: unaVariacionPoblacion

	^self new initializeConTamaño: unTamaño variandoCon: unaVariacionPoblacion ! !


!classDefinition: #VariacionPoblacion category: 'AlgoIII-2022-1C-2Parcial-AvispasYAbejas-P4'!
Object subclass: #VariacionPoblacion
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2022-1C-2Parcial-AvispasYAbejas-P4'!

!VariacionPoblacion methodsFor: 'as yet unclassified' stamp: 'M 7/6/2022 23:14:33'!
evaluar: unaPoblacionControlada

	self subclassResponsibility.! !


!classDefinition: #VariacionPoblacionConstante category: 'AlgoIII-2022-1C-2Parcial-AvispasYAbejas-P4'!
VariacionPoblacion subclass: #VariacionPoblacionConstante
	instanceVariableNames: 'tamaño'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2022-1C-2Parcial-AvispasYAbejas-P4'!

!VariacionPoblacionConstante methodsFor: 'as yet unclassified' stamp: 'M 7/6/2022 23:12:06'!
evaluar: unaPoblacionControlada

	^ tamaño.! !

!VariacionPoblacionConstante methodsFor: 'as yet unclassified' stamp: 'M 7/6/2022 17:14:17'!
evaluar: unTamaño conTamañoInicial: unTamañoInicial 

	^ tamaño! !


!VariacionPoblacionConstante methodsFor: 'initialization' stamp: 'M 7/6/2022 17:15:38'!
initializeCon: unTamaño 

	tamaño := unTamaño.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'VariacionPoblacionConstante class' category: 'AlgoIII-2022-1C-2Parcial-AvispasYAbejas-P4'!
VariacionPoblacionConstante class
	instanceVariableNames: ''!

!VariacionPoblacionConstante class methodsFor: 'instance creation' stamp: 'M 7/6/2022 17:18:31'!
con: unTamaño 

	self validarTamaño: unTamaño.

	^self new initializeCon: unTamaño ! !


!VariacionPoblacionConstante class methodsFor: 'as yet unclassified' stamp: 'M 7/6/2022 17:19:16'!
tamañoDePoblacionInvalidoError

	^ 'El tamaño de la poblacion debe ser mayor a cero.'! !

!VariacionPoblacionConstante class methodsFor: 'as yet unclassified' stamp: 'M 7/6/2022 17:32:15'!
validarTamaño: unTamaño

	(unTamaño < 0) ifTrue: [ self error: VariacionPoblacionConstante tamañoDePoblacionInvalidoError ]! !


!classDefinition: #VariacionPoblacionFinal category: 'AlgoIII-2022-1C-2Parcial-AvispasYAbejas-P4'!
VariacionPoblacion subclass: #VariacionPoblacionFinal
	instanceVariableNames: 'tasa'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2022-1C-2Parcial-AvispasYAbejas-P4'!

!VariacionPoblacionFinal methodsFor: 'as yet unclassified' stamp: 'M 7/6/2022 23:13:17'!
evaluar: unaPoblacionControlada

	^ unaPoblacionControlada tamaño + (unaPoblacionControlada tamaño*tasa) truncated.
! !

!VariacionPoblacionFinal methodsFor: 'as yet unclassified' stamp: 'M 7/6/2022 17:20:35'!
evaluar: unTamaño conTamañoInicial: unTamañoInicial 

	^ unTamaño + (unTamaño*tasa) truncated.! !


!VariacionPoblacionFinal methodsFor: 'initialization' stamp: 'M 7/6/2022 17:22:01'!
initializeConTasa: unaTasa 

	tasa := unaTasa.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'VariacionPoblacionFinal class' category: 'AlgoIII-2022-1C-2Parcial-AvispasYAbejas-P4'!
VariacionPoblacionFinal class
	instanceVariableNames: ''!

!VariacionPoblacionFinal class methodsFor: 'as yet unclassified' stamp: 'M 7/6/2022 17:17:57'!
conTasa: unaTasa 

	self validarTasa: unaTasa.

	^self new initializeConTasa: unaTasa ! !

!VariacionPoblacionFinal class methodsFor: 'as yet unclassified' stamp: 'M 7/6/2022 17:20:03'!
tasaInvalidadError

	^ 'El valor de la tasa debe ser mayor a cero'! !

!VariacionPoblacionFinal class methodsFor: 'as yet unclassified' stamp: 'M 7/6/2022 17:32:05'!
validarTasa: unaTasa

	(unaTasa < 0) ifTrue: [ self error: VariacionPoblacionFinal tasaInvalidadError ]! !


!classDefinition: #VariacionPoblacionInicial category: 'AlgoIII-2022-1C-2Parcial-AvispasYAbejas-P4'!
VariacionPoblacion subclass: #VariacionPoblacionInicial
	instanceVariableNames: 'tasa'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2022-1C-2Parcial-AvispasYAbejas-P4'!

!VariacionPoblacionInicial methodsFor: 'as yet unclassified' stamp: 'M 7/6/2022 23:13:33'!
evaluar: unaPoblacionControlada

	^ unaPoblacionControlada tamañoAlInicioDeTemporada + (unaPoblacionControlada tamañoAlInicioDeTemporada*tasa) truncated.! !

!VariacionPoblacionInicial methodsFor: 'as yet unclassified' stamp: 'M 7/6/2022 17:24:40'!
evaluar: unTamaño conTamañoInicial: unTamañoInicial 

	^ unTamañoInicial + (unTamañoInicial*tasa) truncated.! !

!VariacionPoblacionInicial methodsFor: 'as yet unclassified' stamp: 'M 7/6/2022 23:13:43'!
initializeConTasa: unaTasa 

	tasa := unaTasa.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'VariacionPoblacionInicial class' category: 'AlgoIII-2022-1C-2Parcial-AvispasYAbejas-P4'!
VariacionPoblacionInicial class
	instanceVariableNames: ''!

!VariacionPoblacionInicial class methodsFor: 'as yet unclassified' stamp: 'M 7/6/2022 23:11:20'!
conTasa: unaTasa 

	self validarTasa: unaTasa.

	^self new initializeConTasa: unaTasa ! !

!VariacionPoblacionInicial class methodsFor: 'as yet unclassified' stamp: 'M 7/6/2022 23:11:27'!
tasaInvalidadError

	^ 'El valor de la tasa debe ser mayor a cero'! !

!VariacionPoblacionInicial class methodsFor: 'as yet unclassified' stamp: 'M 7/6/2022 23:11:33'!
validarTasa: unaTasa

	(unaTasa < 0) ifTrue: [ self error: VariacionPoblacionFinal tasaInvalidadError ]! !


!classDefinition: #VariacionPoblacionSelectiva category: 'AlgoIII-2022-1C-2Parcial-AvispasYAbejas-P4'!
VariacionPoblacion subclass: #VariacionPoblacionSelectiva
	instanceVariableNames: 'variacionPoblacion variacionPoblacionParaTemporadasRestantes temporadasSeleccionadas'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2022-1C-2Parcial-AvispasYAbejas-P4'!

!VariacionPoblacionSelectiva methodsFor: 'initialization' stamp: 'M 7/6/2022 23:26:19'!
initializePara: unasTemporadasSeleccionadas variandoCon: unaVariacionPoblacion variacionTemporadasRestantes: unaVariacionPoblacionParaTemporadasRestantes 
	
	temporadasSeleccionadas := unasTemporadasSeleccionadas.
	variacionPoblacion := unaVariacionPoblacion.
	variacionPoblacionParaTemporadasRestantes := unaVariacionPoblacionParaTemporadasRestantes.! !


!VariacionPoblacionSelectiva methodsFor: 'as yet unclassified' stamp: 'M 7/6/2022 23:50:44'!
evaluar: unaPoblacionControlada 
	
	(temporadasSeleccionadas anySatisfy: [ :unaTemporada | unaTemporada = (unaPoblacionControlada temporadaActual + 1) ]) 
	ifTrue: [ ^ variacionPoblacion evaluar: unaPoblacionControlada ]
	ifFalse: [ ^ variacionPoblacionParaTemporadasRestantes evaluar: unaPoblacionControlada ].
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'VariacionPoblacionSelectiva class' category: 'AlgoIII-2022-1C-2Parcial-AvispasYAbejas-P4'!
VariacionPoblacionSelectiva class
	instanceVariableNames: ''!

!VariacionPoblacionSelectiva class methodsFor: 'instance creation' stamp: 'M 7/6/2022 23:25:50'!
para: unasTemporadasSeleccionadas variandoCon: unaVariacionPoblacion variacionTemporadasRestantes: unaVariacionPoblacionParaTemporadasRestantes

	^self new initializePara: unasTemporadasSeleccionadas variandoCon: unaVariacionPoblacion variacionTemporadasRestantes: unaVariacionPoblacionParaTemporadasRestantes ! !


!classDefinition: #VariacionPoblacional category: 'AlgoIII-2022-1C-2Parcial-AvispasYAbejas-P4'!
Object subclass: #VariacionPoblacional
	instanceVariableNames: 'tamaño tipoDeVariacion tasa'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2022-1C-2Parcial-AvispasYAbejas-P4'!

!VariacionPoblacional methodsFor: 'initialization' stamp: 'M 7/5/2022 23:06:14'!
initializeConstanteCon: unTamaño 

	tipoDeVariacion := #constante.
	tamaño := unTamaño.! !

!VariacionPoblacional methodsFor: 'initialization' stamp: 'M 7/5/2022 23:03:46'!
initializeUsando: unTipoDeVariacion conTasa: unaTasa 

	tipoDeVariacion := unTipoDeVariacion.
	tasa := unaTasa.! !


!VariacionPoblacional methodsFor: 'as yet unclassified' stamp: 'M 7/6/2022 00:15:20'!
evaluar: unTamaño conTamañoInicial: unTamañoInicial 

	(tipoDeVariacion = #constante) ifTrue: [ ^ tamaño ].
	
	(tipoDeVariacion = #poblacionActual) ifTrue: [ ^ unTamaño + (unTamaño*tasa) truncated ].
	
	(tipoDeVariacion = #poblacionInicial) ifTrue: [ ^ unTamañoInicial + (unTamañoInicial*tasa) truncated ].
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'VariacionPoblacional class' category: 'AlgoIII-2022-1C-2Parcial-AvispasYAbejas-P4'!
VariacionPoblacional class
	instanceVariableNames: ''!

!VariacionPoblacional class methodsFor: 'instance creation' stamp: 'M 7/5/2022 23:43:18'!
constanteCon: unTamaño 

	self validarTamaño: unTamaño.

	^self new initializeConstanteCon: unTamaño ! !

!VariacionPoblacional class methodsFor: 'instance creation' stamp: 'M 7/5/2022 23:43:05'!
usando: unTipoDeVariacion conTasa: unaTasa 

	self validarTasa: unaTasa.

	^self new initializeUsando: unTipoDeVariacion conTasa: unaTasa ! !


!VariacionPoblacional class methodsFor: 'validacion' stamp: 'M 7/6/2022 17:31:34'!
validarTamaño: unTamaño

	(unTamaño < 0) ifTrue: [ self error: VariacionPoblacional tamañoDePoblacionInvalidoError ]! !

!VariacionPoblacional class methodsFor: 'validacion' stamp: 'M 7/6/2022 17:31:34'!
validarTasa: unaTasa

	(unaTasa < 0) ifTrue: [ self error: VariacionPoblacional tasaInvalidadError ]! !


!VariacionPoblacional class methodsFor: 'mensajes de error' stamp: 'M 7/5/2022 22:52:29'!
tamañoDePoblacionInvalidoError

	^ 'El tamaño de la poblacion debe ser mayor a cero.'! !

!VariacionPoblacional class methodsFor: 'mensajes de error' stamp: 'M 7/6/2022 13:10:34'!
tasaInvalidadError

	^ 'El valor de la tasa debe ser mayor a cero'! !

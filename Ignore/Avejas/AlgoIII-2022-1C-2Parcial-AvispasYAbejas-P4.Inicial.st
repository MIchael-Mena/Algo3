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
	instanceVariableNames: 'avispas cantidadDeOrugas cantidadDePolillas cantidadDeHuevosDeAvispasYSuAlimentoPorLineaGenetica'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2022-1C-2Parcial-AvispasYAbejas-P4'!

!Habitat methodsFor: 'initialization' stamp: 'JMB 6/19/2022 23:52:00'!
initializeConAvispas: unasAvispasIniciales yConOrugas: unaCantidadInicialDeOrugas conPolillas: unaCantidadInicalDePolillas
	cantidadDeHuevosDeAvispasYSuAlimentoPorLineaGenetica := Dictionary new.
	cantidadDeOrugas := unaCantidadInicialDeOrugas.
	cantidadDePolillas := unaCantidadInicalDePolillas.
	avispas := unasAvispasIniciales! !


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


!Habitat methodsFor: 'alimentos de las avispas' stamp: 'JMB 5/18/2022 16:41:14'!
cantidadDeOrugas
	^ cantidadDeOrugas! !

!Habitat methodsFor: 'alimentos de las avispas' stamp: 'JMB 5/18/2022 11:07:25'!
cantidadDePolillas
	^ cantidadDePolillas! !

!Habitat methodsFor: 'alimentos de las avispas' stamp: 'JMB 5/22/2022 23:22:37'!
tomarUnaOrugaSiNoHayHace: unBloqueAEvaluarSiNoNoHayOrugas
	cantidadDeOrugas > 0
		ifTrue: [ 	cantidadDeOrugas := cantidadDeOrugas - 1 ]
		ifFalse: unBloqueAEvaluarSiNoNoHayOrugas! !

!Habitat methodsFor: 'alimentos de las avispas' stamp: 'JMB 5/22/2022 23:23:10'!
tomarUnaPolillaSiNoHayHace: unBloqueAEvaluarSiNoHayPolillas
	cantidadDePolillas > 0
		ifTrue: [	cantidadDePolillas := cantidadDePolillas - 1 ]
		ifFalse: unBloqueAEvaluarSiNoHayPolillas! !


!Habitat methodsFor: 'ciclo' stamp: 'JMB 6/20/2022 00:33:02'!
avanzarUnaTemporada
	self gestarNuevaGeneracionDeAvispas.
	self consumirHuevosDeAvispas.
	self avanzarUnaTemporadaEnLasPoblacionesControladas! !


!Habitat methodsFor: 'ciclo - privados' stamp: 'JMB 6/20/2022 00:33:02'!
avanzarUnaTemporadaEnLasPoblacionesControladas
	cantidadDeOrugas := 0.
	cantidadDePolillas := 0.! !

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

!Habitat class methodsFor: 'instance creation' stamp: 'JMB 6/20/2022 22:04:48'!
conAvispasComeOrugas: unaCantidadDeAvispasComeOrugas comePolillas: unaCantidadDeAvispasComePolillas ladronas: unaCantidadDeAvispasLadronas yConOrugas: unaCantidadInicialDeOrugas conPolillas: unaCantidadInicialDePolillas
	| unasAvispas habitat |
	habitat := self new.
	unasAvispas := (self gestarEn: habitat avispas: unaCantidadDeAvispasComeOrugas siguiendo: AlimentaCriasConOrugas new) asOrderedCollection.
	unasAvispas addAll: (self gestarEn: habitat avispas: unaCantidadDeAvispasComePolillas siguiendo: AlimentaCriasConPolillas new).
	unasAvispas addAll: (self gestarEn: habitat avispas: unaCantidadDeAvispasLadronas siguiendo: RobaHuevos new).
	^habitat initializeConAvispas: unasAvispas yConOrugas: unaCantidadInicialDeOrugas conPolillas: unaCantidadInicialDePolillas! !

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

!Habitat class methodsFor: 'instance creation' stamp: 'JMB 6/20/2022 20:59:22'!
conPolillas: unaCantidadInicialDePolillas
	^ self conAvispasComeOrugas: 0 comePolillas: 0 ladronas: 0 yConOrugas: 0 conPolillas: unaCantidadInicialDePolillas! !


!Habitat class methodsFor: 'privado' stamp: 'JMB 5/23/2022 18:28:54'!
gestarEn: unHabitat avispas: unaCantidadDeAvispas siguiendo: unaEstrategiaReproductiva
	^ (1 to: unaCantidadDeAvispas) collect: [ : each | Avispa en: unHabitat siguiendo: unaEstrategiaReproductiva ]
	! !

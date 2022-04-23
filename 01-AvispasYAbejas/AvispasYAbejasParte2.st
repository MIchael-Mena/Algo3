!classDefinition: #AvispaOriana category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #AvispaOriana
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AvispaOriana class' category: 'AvispasYAbejasParte2'!
AvispaOriana class
	instanceVariableNames: 'unHabitat huevos orugas'!

!AvispaOriana class methodsFor: 'as yet unclassified' stamp: 'M 4/22/2022 18:10:40'!
eliminarHuevos
	huevos := 0.! !

!AvispaOriana class methodsFor: 'as yet unclassified' stamp: 'M 4/22/2022 17:49:00'!
huevosPuestos
	^huevos.! !

!AvispaOriana class methodsFor: 'as yet unclassified' stamp: 'M 4/23/2022 19:17:03'!
intentarReproducirse
	"Orugas paraAlimentarse ifTrue: [ huevos := huevos + 1 ]."
	Habitat consumirUnaOruga ifTrue: [ huevos := huevos + 1 ].
	! !


!AvispaOriana class methodsFor: '--** private fileout/in **--' stamp: 'M 4/23/2022 19:24:17'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	unHabitat := nil.
	huevos := 0.
	orugas := 11.! !


!classDefinition: #Habitat category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #Habitat
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Habitat class' category: 'AvispasYAbejasParte2'!
Habitat class
	instanceVariableNames: 'orugas'!

!Habitat class methodsFor: 'as yet unclassified' stamp: 'M 4/22/2022 22:39:52'!
cantidadDeHuevosDeAvispas
	^AvispaOriana huevosPuestos.! !

!Habitat class methodsFor: 'as yet unclassified' stamp: 'M 4/23/2022 19:11:48'!
cantidadDeOrugas
	^orugas.! !

!Habitat class methodsFor: 'as yet unclassified' stamp: 'M 4/23/2022 19:13:31'!
consumirUnaOruga
	^ self hayOrugas & self consumirOruga.! !

!Habitat class methodsFor: 'as yet unclassified' stamp: 'M 4/23/2022 19:11:20'!
crearOrugas: unaCantidadDeOrugas
	orugas  := orugas + unaCantidadDeOrugas.! !

!Habitat class methodsFor: 'as yet unclassified' stamp: 'M 4/23/2022 19:18:08'!
retrocederAlInicioDeLosTiempos
	AvispaOriana eliminarHuevos.
	orugas := 0.! !


!Habitat class methodsFor: 'private' stamp: 'M 4/23/2022 19:15:24'!
consumirOruga
	orugas := orugas - 1.
	^true.! !

!Habitat class methodsFor: 'private' stamp: 'M 4/23/2022 19:13:50'!
hayOrugas
	^orugas > 0.! !


!Habitat class methodsFor: '--** private fileout/in **--' stamp: 'M 4/23/2022 19:24:17'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	orugas := -1.! !


!classDefinition: #Orugas category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #Orugas
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Orugas class' category: 'AvispasYAbejasParte2'!
Orugas class
	instanceVariableNames: 'orugasVivas'!

!Orugas class methodsFor: 'as yet unclassified' stamp: 'M 4/22/2022 20:51:59'!
cantidadOrugasVivas
	^orugasVivas ! !

!Orugas class methodsFor: 'as yet unclassified' stamp: 'M 4/22/2022 22:45:45'!
crearUnaCantidadOrugas: unaCantidadDeOrugas
	orugasVivas := unaCantidadDeOrugas + orugasVivas.! !

!Orugas class methodsFor: 'as yet unclassified' stamp: 'M 4/22/2022 21:02:06'!
eliminarOrugas
	orugasVivas  := 0.! !

!Orugas class methodsFor: 'as yet unclassified' stamp: 'M 4/23/2022 19:12:23'!
paraAlimentarse
	^ self hayOrugas & self consumirOruga.
	! !


!Orugas class methodsFor: 'private' stamp: 'M 4/23/2022 19:14:06'!
consumirOruga
	orugasVivas := orugasVivas - 1.
	^true.! !

!Orugas class methodsFor: 'private' stamp: 'M 4/23/2022 18:29:50'!
hayOrugas
	^orugasVivas > 0.! !


!Orugas class methodsFor: '--** private fileout/in **--' stamp: 'M 4/23/2022 19:24:17'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	orugasVivas := 609.! !


!classDefinition: #PruebasReproduccionDeAvispas category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #PruebasReproduccionDeAvispas
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasReproduccionDeAvispas class' category: 'AvispasYAbejasParte2'!
PruebasReproduccionDeAvispas class
	instanceVariableNames: 'unaOrugas unasOrugas'!

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'M 4/22/2022 22:48:03'!
test01EnElInicioDeLosTiemposNoHayHuevos	

	self retrocederElHabitatAlInicioDeLosTiempos.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'M 4/22/2022 22:47:55'!
test02CuandoOrianaLaAvispaSeReproducePorPrimeraVezDejaUnHuevo

	self retrocederElHabitatAlInicioDeLosTiempos. 
	
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOriana intentarReproducirse.
	
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'M 4/22/2022 22:48:18'!
test03CadaVezQueOrianaSeReproduceDejaUnHuevoMas

	self retrocederElHabitatAlInicioDeLosTiempos. 
	
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOriana intentarReproducirse.
	
	self laAvispaOriana intentarReproducirse.
	

	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 2.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'M 4/22/2022 22:48:47'!
test04ParaDejarUnHuevoOrianaLaAvispaReduceLaPoblacionDeUnaOrugaANinguna

	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self queElHabitatTengaUnaOrugaMas.
	
	self laAvispaOriana intentarReproducirse.
	
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'M 4/22/2022 22:48:43'!
test05ParaDejarUnHuevoOrianaLaAvispaDecrementaEnUnoLaPoblacionDeOrugasDelHabitat

	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self queElHabitatTengaDosOrugasMas.
	
	self laAvispaOriana intentarReproducirse.
	
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'M 4/22/2022 22:48:59'!
test06CuandoNoHayOrugasOrianaLaAvispaNoPuedeDejarHuevos

	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaOriana intentarReproducirse.
	
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'M 4/23/2022 18:51:17'!
test07CuandoOrnellaLaAvispaSeReproduceDejaUnHuevo

	self retrocederElHabitatAlInicioDeLosTiempos. 
	
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOrnella intentarReproducirse.
	

	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'M 4/23/2022 18:52:13'!
test08ParaDejarUnHuevoOrnellaLaAvispaReduceLaPoblacionDeUnaOrugaANinguna

	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self queElHabitatTengaUnaOrugaMas.
	
	self laAvispaOrnella intentarReproducirse.
	
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'M 4/23/2022 18:52:43'!
test09CuandoNoHayOrugasOrnellaLaAvispaNoPuedeDejarHuevos

	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaOrnella intentarReproducirse.
	
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'M 4/23/2022 18:53:25'!
test10CuandoPollyLaAvispaSeReproduceDejaUnHuevo

	self retrocederElHabitatAlInicioDeLosTiempos. 
	
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaPolly intentarReproducirse.
	
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'M 4/23/2022 18:57:24'!
test11ParaDejarUnHuevoPollyLaAvispaReduceLaPoblacionDeUnaPolillaANinguna

	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self queElHabitatTengaUnaPolillaMas.
	
	self laAvispaPolly intentarReproducirse.
	

	Assert that: self habitat cantidadDePolillas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'M 4/23/2022 18:57:34'!
test12ParaDejarUnHuevoPollyLaAvispaDecrementaEnUnoLaPoblacionDePolillasDelHabitat

	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self queElHabitatTengaDosPolillasMas.
	
	self laAvispaPolly intentarReproducirse.
	
	
	Assert that: self habitat cantidadDePolillas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'M 4/23/2022 18:57:42'!
test13CuandoNoHayPolillasPollyLaAvispaNoPuedeDejarHuevos

	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaPolly intentarReproducirse.
	
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:15:06'!
test14CuandoOrianaLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:15:02'!
test15CuandoOrianaLaAvispaAunNoSeReprodujoNoTieneHuevosConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:14:58'!
test16CuandoPollyLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDePolly isEqualTo: 1.
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:14:54'!
test17CuandoOrnellaLaAvispaSeReproduceDejaUnHuevoConLaMismaFirmaGeneticaQueOriana
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOrnella isEqualTo: 1.
	Assert 
		that: self cantidadDeHuevosConLaFirmaGeneticaDeOrnella  
		isEqualTo: self cantidadDeHuevosConLaFirmaGeneticaDeOriana! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:27'!
test18CuandoLaraLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOrnella intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeLara isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:22'!
test19CuandoLaraLaAvispaSeReproduceLeSacaElHuevoAOtraAvispa
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOriana intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:18'!
test20CuandoLaraLaAvispaSeReproduceLeSacaElHuevoAPolly
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaPolly intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDePolly isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:12'!
test21CuandoLaraLaAvispaNoTieneRecursosNoDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
		
	self laAvispaLara intentarReproducirse.
		
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeLara isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'JMB 4/19/2022 19:14:52'!
cantidadDeHuevosConLaFirmaGeneticaDeLara
	Assert isTrue: false description: 'Reemplazar esto por la implementaci�n correspondiente'.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'JMB 4/19/2022 19:14:57'!
cantidadDeHuevosConLaFirmaGeneticaDeOriana
	Assert isTrue: false description: 'Reemplazar esto por la implementaci�n correspondiente'.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'JMB 4/19/2022 19:15:03'!
cantidadDeHuevosConLaFirmaGeneticaDeOrnella
	Assert isTrue: false description: 'Reemplazar esto por la implementaci�n correspondiente'.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'JMB 4/19/2022 19:15:09'!
cantidadDeHuevosConLaFirmaGeneticaDePolly
	Assert isTrue: false description: 'Reemplazar esto por la implementaci�n correspondiente'.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'M 4/22/2022 20:20:25'!
habitat
	^Habitat! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'M 4/23/2022 19:22:49'!
hacerQueElHabitatTengaLosRecursosSuficientes
	"Habitat cambiarARecursosSuficientes."
	Habitat crearOrugas: 100.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'JMB 4/19/2022 19:14:28'!
laAvispaLara
	Assert isTrue: false description: 'Reemplazar esto por la implementaci�n correspondiente'.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'M 4/22/2022 20:21:01'!
laAvispaOriana
	^AvispaOriana! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'JMB 4/19/2022 19:14:39'!
laAvispaOrnella
	Assert isTrue: false description: 'Reemplazar esto por la implementaci�n correspondiente'.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'JMB 4/19/2022 19:14:46'!
laAvispaPolly
	Assert isTrue: false description: 'Reemplazar esto por la implementaci�n correspondiente'.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'M 4/23/2022 19:23:49'!
queElHabitatTengaDosOrugasMas
	"Orugas crearUnaCantidadOrugas: 2."
	Habitat  crearOrugas:  2.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'JMB 4/19/2022 19:15:33'!
queElHabitatTengaDosPolillasMas
	Assert isTrue: false description: 'Reemplazar esto por la implementaci�n correspondiente'.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'M 4/23/2022 19:23:35'!
queElHabitatTengaUnaOrugaMas
	"Orugas crearUnaCantidadOrugas: 1."
	Habitat crearOrugas: 1.
	! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'JMB 4/19/2022 19:15:42'!
queElHabitatTengaUnaPolillaMas
	Assert isTrue: false description: 'Reemplazar esto por la implementaci�n correspondiente'.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'M 4/23/2022 18:08:55'!
retrocederElHabitatAlInicioDeLosTiempos
	Habitat retrocederAlInicioDeLosTiempos.
	"AvispaOriana eliminarHuevos.
	Orugas eliminarOrugas."! !


!PruebasReproduccionDeAvispas class methodsFor: '--** private fileout/in **--' stamp: 'M 4/23/2022 19:24:17'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	unaOrugas := nil.
	unasOrugas := nil.! !

AvispaOriana initializeAfterFileIn!
Habitat initializeAfterFileIn!
Orugas initializeAfterFileIn!
PruebasReproduccionDeAvispas initializeAfterFileIn!
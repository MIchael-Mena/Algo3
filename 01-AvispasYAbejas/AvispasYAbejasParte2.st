!classDefinition: #AvispaOriana category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #AvispaOriana
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AvispaOriana class' category: 'AvispasYAbejasParte2'!
AvispaOriana class
	instanceVariableNames: 'huevos'!

!AvispaOriana class methodsFor: 'as yet unclassified' stamp: 'M 4/22/2022 18:10:40'!
eliminarHuevos
	huevos := 0.! !

!AvispaOriana class methodsFor: 'as yet unclassified' stamp: 'M 4/22/2022 17:49:00'!
huevosPuestos
	^huevos.! !

!AvispaOriana class methodsFor: 'as yet unclassified' stamp: 'M 4/23/2022 23:28:43'!
intentarReproducirse
	Orugas paraAlimentarse ifTrue: [ huevos := huevos + 1 ].
	"Habitat consumirUnaOruga ifTrue: [ huevos := huevos + 1 ]."
	! !


!AvispaOriana class methodsFor: '--** private fileout/in **--' stamp: 'M 4/23/2022 23:32:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	huevos := 0.! !


!classDefinition: #AvispaOrnella category: 'AvispasYAbejasParte2'!
AvispaOriana subclass: #AvispaOrnella
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AvispaOrnella class' category: 'AvispasYAbejasParte2'!
AvispaOrnella class
	instanceVariableNames: ''!

!AvispaOrnella class methodsFor: '--** private fileout/in **--' stamp: 'M 4/23/2022 23:32:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	huevos := 0.! !


!classDefinition: #AvispaPolly category: 'AvispasYAbejasParte2'!
AvispaOriana subclass: #AvispaPolly
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AvispaPolly class' category: 'AvispasYAbejasParte2'!
AvispaPolly class
	instanceVariableNames: ''!

!AvispaPolly class methodsFor: 'as yet unclassified' stamp: 'M 4/23/2022 23:28:02'!
intentarReproducirse
	Polillas paraAlimentarse ifTrue: [ huevos := huevos + 1 ].! !


!AvispaPolly class methodsFor: '--** private fileout/in **--' stamp: 'M 4/23/2022 23:32:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	huevos := 0.! !


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

!Habitat class methodsFor: 'as yet unclassified' stamp: 'M 4/23/2022 23:29:00'!
cantidadDeHuevosDeAvispas
	|huevosTotales|
	huevosTotales := 0.
	huevosTotales := AvispaOriana huevosPuestos + huevosTotales .
	huevosTotales := AvispaOrnella huevosPuestos + huevosTotales .
	huevosTotales := AvispaPolly huevosPuestos + huevosTotales .
	^huevosTotales.
	! !

!Habitat class methodsFor: 'as yet unclassified' stamp: 'M 4/23/2022 23:29:12'!
cantidadDeOrugas
	^Orugas cantidadVivos.
	"^orugas."! !

!Habitat class methodsFor: 'as yet unclassified' stamp: 'M 4/23/2022 23:29:22'!
cantidadDePolillas
	^Polillas cantidadVivos.! !

!Habitat class methodsFor: 'as yet unclassified' stamp: 'M 4/23/2022 23:21:00'!
consumirUnaOruga
	^ self hayPolillas & self consumirPolilla.! !

!Habitat class methodsFor: 'as yet unclassified' stamp: 'M 4/23/2022 20:18:36'!
crearOrugas: unaCantidadDeOrugas
	orugas  := orugas + unaCantidadDeOrugas.! !

!Habitat class methodsFor: 'as yet unclassified' stamp: 'M 4/23/2022 23:29:35'!
retrocederAlInicioDeLosTiempos
	AvispaOriana eliminarHuevos.
	AvispaOrnella eliminarHuevos.
	AvispaPolly  eliminarHuevos.
	Orugas eliminarInsectos.
	Polillas eliminarInsectos.
	"orugas := 0."! !


!Habitat class methodsFor: 'private' stamp: 'M 4/23/2022 21:30:01'!
consumirPolilla
	orugas := orugas - 1.
	^true.! !

!Habitat class methodsFor: 'private' stamp: 'M 4/23/2022 23:21:00'!
hayPolillas
	^orugas > 0.! !


!Habitat class methodsFor: '--** private fileout/in **--' stamp: 'M 4/23/2022 23:32:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	orugas := 0.! !


!classDefinition: #Insectos category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #Insectos
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Insectos class' category: 'AvispasYAbejasParte2'!
Insectos class
	instanceVariableNames: 'insectosVivos'!

!Insectos class methodsFor: 'as yet unclassified' stamp: 'M 4/23/2022 20:01:52'!
cantidadVivos
	^insectosVivos ! !

!Insectos class methodsFor: 'as yet unclassified' stamp: 'M 4/23/2022 20:08:53'!
crearUnaCantidadInsectos: unaCantidadDeInsectos
	insectosVivos := unaCantidadDeInsectos + insectosVivos .! !

!Insectos class methodsFor: 'as yet unclassified' stamp: 'M 4/23/2022 20:10:24'!
eliminarInsectos
	insectosVivos  := 0.! !

!Insectos class methodsFor: 'as yet unclassified' stamp: 'M 4/23/2022 20:10:16'!
paraAlimentarse
	^ self hayInsectos & self consumirInsecto .
	! !


!Insectos class methodsFor: 'private' stamp: 'M 4/23/2022 20:08:07'!
consumirInsecto
	insectosVivos := insectosVivos - 1.
	^true.! !

!Insectos class methodsFor: 'private' stamp: 'M 4/23/2022 20:09:59'!
hayInsectos
	^insectosVivos > 0.! !


!Insectos class methodsFor: '--** private fileout/in **--' stamp: 'M 4/23/2022 23:32:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	insectosVivos := 0.! !


!classDefinition: #Orugas category: 'AvispasYAbejasParte2'!
Insectos subclass: #Orugas
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Orugas class' category: 'AvispasYAbejasParte2'!
Orugas class
	instanceVariableNames: ''!

!Orugas class methodsFor: '--** private fileout/in **--' stamp: 'M 4/23/2022 23:32:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	insectosVivos := 0.! !


!classDefinition: #Polillas category: 'AvispasYAbejasParte2'!
Insectos subclass: #Polillas
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Polillas class' category: 'AvispasYAbejasParte2'!
Polillas class
	instanceVariableNames: ''!

!Polillas class methodsFor: '--** private fileout/in **--' stamp: 'M 4/23/2022 23:32:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	insectosVivos := -1.! !


!classDefinition: #Orug category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #Orug
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Orug class' category: 'AvispasYAbejasParte2'!
Orug class
	instanceVariableNames: 'orugasVivas'!

!Orug class methodsFor: 'as yet unclassified' stamp: 'M 4/22/2022 20:51:59'!
cantidadOrugasVivas
	^orugasVivas ! !

!Orug class methodsFor: 'as yet unclassified' stamp: 'M 4/23/2022 23:20:27'!
crearUnaCantidadPolillas: unaCantidadDeOrugas
	orugasVivas := unaCantidadDeOrugas + orugasVivas.! !

!Orug class methodsFor: 'as yet unclassified' stamp: 'M 4/23/2022 23:20:44'!
eliminarPolillas
	orugasVivas  := 0.! !

!Orug class methodsFor: 'as yet unclassified' stamp: 'M 4/23/2022 23:21:00'!
paraAlimentarse
	^ self hayPolillas & self consumirOruga.
	! !


!Orug class methodsFor: 'private' stamp: 'M 4/23/2022 21:30:01'!
consumirPolilla
	orugasVivas := orugasVivas - 1.
	^true.! !

!Orug class methodsFor: 'private' stamp: 'M 4/23/2022 23:21:00'!
hayPolillas
	^orugasVivas > 0.! !


!Orug class methodsFor: '--** private fileout/in **--' stamp: 'M 4/23/2022 23:32:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	orugasVivas := 609.! !


!classDefinition: #Poli category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #Poli
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Poli class' category: 'AvispasYAbejasParte2'!
Poli class
	instanceVariableNames: 'polillasVivas'!

!Poli class methodsFor: 'as yet unclassified' stamp: 'M 4/23/2022 21:28:15'!
cantidadPolillasVivas
	^polillasVivas ! !

!Poli class methodsFor: 'as yet unclassified' stamp: 'M 4/23/2022 23:21:28'!
crearUnaCantidadPolillas: unaCantidadDeOrugas
	polillasVivas := unaCantidadDeOrugas + polillasVivas .! !

!Poli class methodsFor: 'as yet unclassified' stamp: 'M 4/23/2022 23:21:19'!
eliminarPolillas
	polillasVivas  := 0.! !

!Poli class methodsFor: 'as yet unclassified' stamp: 'M 4/23/2022 23:21:44'!
paraAlimentarse
	^ self hayPolillas & self consumirPolilla .
	! !


!Poli class methodsFor: 'private' stamp: 'M 4/23/2022 23:20:05'!
consumirPolilla
	polillasVivas := polillasVivas - 1.
	^true.! !

!Poli class methodsFor: 'private' stamp: 'M 4/23/2022 23:21:12'!
hayPolillas
	^polillasVivas > 0.! !


!Poli class methodsFor: '--** private fileout/in **--' stamp: 'M 4/23/2022 23:32:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	polillasVivas := nil.! !


!classDefinition: #PruebasReproduccionDeAvispas category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #PruebasReproduccionDeAvispas
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasReproduccionDeAvispas class' category: 'AvispasYAbejasParte2'!
PruebasReproduccionDeAvispas class
	instanceVariableNames: ''!

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


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'M 4/23/2022 20:35:51'!
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


!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'M 4/23/2022 20:44:43'!
test14CuandoOrianaLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica

	self retrocederElHabitatAlInicioDeLosTiempos. 
	
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOriana intentarReproducirse.
	
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'M 4/23/2022 20:44:51'!
test15CuandoOrianaLaAvispaAunNoSeReprodujoNoTieneHuevosConSuFirmaGenetica

	self retrocederElHabitatAlInicioDeLosTiempos. 
	
	self laAvispaOriana intentarReproducirse.
	
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'M 4/23/2022 20:46:10'!
test16CuandoPollyLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica

	self retrocederElHabitatAlInicioDeLosTiempos. 
	
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaPolly intentarReproducirse.
	
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDePolly isEqualTo: 1.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'M 4/23/2022 20:46:22'!
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
	Assert isTrue: false description: 'Reemplazar esto por la implementación correspondiente'.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'M 4/23/2022 20:49:56'!
cantidadDeHuevosConLaFirmaGeneticaDeOriana
	^AvispaOriana huevosPuestos.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'JMB 4/19/2022 19:15:03'!
cantidadDeHuevosConLaFirmaGeneticaDeOrnella
	Assert isTrue: false description: 'Reemplazar esto por la implementación correspondiente'.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'JMB 4/19/2022 19:15:09'!
cantidadDeHuevosConLaFirmaGeneticaDePolly
	Assert isTrue: false description: 'Reemplazar esto por la implementación correspondiente'.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'M 4/22/2022 20:20:25'!
habitat
	^Habitat! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'M 4/23/2022 23:31:13'!
hacerQueElHabitatTengaLosRecursosSuficientes
	"Habitat cambiarARecursosSuficientes."
	Orugas crearUnaCantidadInsectos: 100.
	Polillas crearUnaCantidadInsectos: 100.
	"Habitat crearOrugas: 100."! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'JMB 4/19/2022 19:14:28'!
laAvispaLara
	Assert isTrue: false description: 'Reemplazar esto por la implementación correspondiente'.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'M 4/22/2022 20:21:01'!
laAvispaOriana
	^AvispaOriana! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'M 4/23/2022 23:31:19'!
laAvispaOrnella
	^AvispaOrnella .! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'M 4/23/2022 23:31:24'!
laAvispaPolly
	^AvispaPolly.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'M 4/23/2022 23:31:40'!
queElHabitatTengaDosOrugasMas
	Orugas crearUnaCantidadInsectos: 2.
	"Habitat  crearOrugas:  2."! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'M 4/23/2022 23:31:45'!
queElHabitatTengaDosPolillasMas
	Polillas crearUnaCantidadInsectos: 2.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'M 4/23/2022 23:32:05'!
queElHabitatTengaUnaOrugaMas
	Orugas crearUnaCantidadInsectos: 1.
	"Habitat crearOrugas: 1."
	! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'M 4/23/2022 23:32:11'!
queElHabitatTengaUnaPolillaMas
	Polillas crearUnaCantidadInsectos: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'M 4/23/2022 23:32:18'!
retrocederElHabitatAlInicioDeLosTiempos
	Habitat retrocederAlInicioDeLosTiempos.! !

AvispaOriana initializeAfterFileIn!
AvispaOrnella initializeAfterFileIn!
AvispaPolly initializeAfterFileIn!
Habitat initializeAfterFileIn!
Insectos initializeAfterFileIn!
Orugas initializeAfterFileIn!
Polillas initializeAfterFileIn!
Orug initializeAfterFileIn!
Poli initializeAfterFileIn!
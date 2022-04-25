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

!AvispaOriana class methodsFor: 'public' stamp: 'M 4/25/2022 14:57:28'!
eliminarHuevos
	huevos := 0.! !

!AvispaOriana class methodsFor: 'public' stamp: 'M 4/25/2022 15:00:11'!
huevosConFirmaGenetica
	^LineaGenetica buscarFirmaGenetica: 'O'.! !

!AvispaOriana class methodsFor: 'public' stamp: 'M 4/25/2022 15:00:19'!
huevosPuestos
	^huevos.! !

!AvispaOriana class methodsFor: 'public' stamp: 'M 4/25/2022 15:17:38'!
intentarReproducirse
	Habitat consumirUnaOruga ifTrue: [ self reproducirse].! !

!AvispaOriana class methodsFor: 'public' stamp: 'M 4/25/2022 15:28:21'!
perderUnHuevo
	|puedePerderUnHuevo|
	puedePerderUnHuevo := self hayHuevos.
	puedePerderUnHuevo ifTrue: [ self eliminarUnHuevoConFirmaGenetica ].
	^ puedePerderUnHuevo.! !


!AvispaOriana class methodsFor: 'private' stamp: 'M 4/25/2022 15:28:21'!
eliminarUnHuevoConFirmaGenetica
	huevos := huevos - 1.
	LineaGenetica eliminarUnaFirmaGenetica: 'O'.! !

!AvispaOriana class methodsFor: 'private' stamp: 'M 4/25/2022 14:58:33'!
hayHuevos
	^ huevos > 0! !

!AvispaOriana class methodsFor: 'private' stamp: 'M 4/25/2022 15:17:50'!
reproducirse
	huevos := huevos + 1.
	LineaGenetica  agregarUnaFirmaGenetica: 'O'! !


!AvispaOriana class methodsFor: '--** private fileout/in **--' stamp: 'M 4/25/2022 17:04:53'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	huevos := 0.! !


!classDefinition: #AvispaLara category: 'AvispasYAbejasParte2'!
AvispaOriana subclass: #AvispaLara
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AvispaLara class' category: 'AvispasYAbejasParte2'!
AvispaLara class
	instanceVariableNames: ''!

!AvispaLara class methodsFor: 'public' stamp: 'M 4/25/2022 15:00:51'!
huevosConFirmaGenetica
	^LineaGenetica buscarFirmaGenetica: 'L'.! !

!AvispaLara class methodsFor: 'public' stamp: 'M 4/25/2022 16:12:11'!
intentarReproducirse
	(self robarUnHuevo: AvispaOriana) | (self robarUnHuevo: AvispaOrnella) | (self robarUnHuevo: AvispaPolly).! !


!AvispaLara class methodsFor: 'private' stamp: 'M 4/25/2022 15:28:21'!
eliminarUnHuevoConFirmaGenetica
	huevos := huevos - 1.
	LineaGenetica eliminarUnaFirmaGenetica: 'L'.! !

!AvispaLara class methodsFor: 'private' stamp: 'M 4/25/2022 15:23:08'!
reproducirse
	huevos := huevos + 1.
	LineaGenetica  agregarUnaFirmaGenetica: 'L'.! !

!AvispaLara class methodsFor: 'private' stamp: 'M 4/25/2022 16:08:38'!
robarUnHuevo: unaAvispa
	|puedoRobar|
	puedoRobar := unaAvispa perderUnHuevo.
	puedoRobar ifTrue: [ self reproducirse].
	^puedoRobar.! !


!AvispaLara class methodsFor: '--** private fileout/in **--' stamp: 'M 4/25/2022 17:04:53'!
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

!AvispaOrnella class methodsFor: '--** private fileout/in **--' stamp: 'M 4/25/2022 17:04:53'!
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

!AvispaPolly class methodsFor: 'public' stamp: 'M 4/25/2022 15:08:19'!
huevosConFirmaGenetica
	^LineaGenetica buscarFirmaGenetica: 'P'.! !

!AvispaPolly class methodsFor: 'public' stamp: 'M 4/25/2022 15:19:17'!
intentarReproducirse
	Habitat consumirUnaPolilla ifTrue: [ self reproducirse].
	! !


!AvispaPolly class methodsFor: 'private' stamp: 'M 4/25/2022 15:28:21'!
eliminarUnHuevoConFirmaGenetica
	huevos := huevos - 1.
	LineaGenetica eliminarUnaFirmaGenetica: 'P'.! !

!AvispaPolly class methodsFor: 'private' stamp: 'M 4/25/2022 15:19:23'!
reproducirse
	huevos := huevos + 1.
	LineaGenetica  agregarUnaFirmaGenetica: 'P'! !


!AvispaPolly class methodsFor: '--** private fileout/in **--' stamp: 'M 4/25/2022 17:04:53'!
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
	instanceVariableNames: 'polillas orugas recursosSuficientes'!

!Habitat class methodsFor: 'public' stamp: 'M 4/25/2022 15:34:34'!
cambiarARecursosInsuficientes
	recursosSuficientes := false.! !

!Habitat class methodsFor: 'public' stamp: 'M 4/25/2022 16:19:08'!
cambiarARecursosSuficientes
	recursosSuficientes := true.! !

!Habitat class methodsFor: 'public' stamp: 'M 4/25/2022 15:01:31'!
cantidadDeHuevosDeAvispas
	|huevosTotales|
	huevosTotales := 0.
	huevosTotales := AvispaOriana huevosPuestos + huevosTotales .
	huevosTotales := AvispaOrnella huevosPuestos + huevosTotales .
	huevosTotales := AvispaPolly huevosPuestos + huevosTotales .
	huevosTotales := AvispaLara huevosPuestos + huevosTotales .
	^huevosTotales.! !

!Habitat class methodsFor: 'public' stamp: 'M 4/25/2022 15:01:35'!
cantidadDeOrugas
	^orugas cantidadVivos .
! !

!Habitat class methodsFor: 'public' stamp: 'M 4/25/2022 15:01:40'!
cantidadDePolillas
	^polillas cantidadVivos.! !

!Habitat class methodsFor: 'public' stamp: 'M 4/25/2022 15:33:18'!
consumirUnaOruga
	recursosSuficientes ifTrue: [ ^recursosSuficientes ] ifFalse: [ ^orugas consumirUna ].
	! !

!Habitat class methodsFor: 'public' stamp: 'M 4/25/2022 15:33:36'!
consumirUnaPolilla
	recursosSuficientes ifTrue: [ ^recursosSuficientes ] ifFalse: [ ^polillas consumirUna ].
	! !

!Habitat class methodsFor: 'public' stamp: 'M 4/25/2022 15:01:55'!
crearUnaCantidadOrugas: unaCantidadDeOrugas
	orugas crearUnaCantidad: unaCantidadDeOrugas.! !

!Habitat class methodsFor: 'public' stamp: 'M 4/25/2022 15:01:59'!
crearUnaCantidadPolillas: unaCantidadDePolillas
	polillas crearUnaCantidad: unaCantidadDePolillas.! !

!Habitat class methodsFor: 'public' stamp: 'M 4/25/2022 15:36:04'!
retrocederAlInicioDeLosTiempos
	self eliminarHuevosDeAvispas.
	LineaGenetica finalizarLegado.
	self exterminarInsectos.
	self cambiarARecursosInsuficientes.! !


!Habitat class methodsFor: 'private' stamp: 'M 4/25/2022 15:02:09'!
eliminarHuevosDeAvispas
	AvispaOriana eliminarHuevos.
	AvispaOrnella eliminarHuevos.
	AvispaPolly  eliminarHuevos.
	AvispaLara eliminarHuevos! !

!Habitat class methodsFor: 'private' stamp: 'M 4/25/2022 15:02:12'!
exterminarInsectos
	orugas exterminar.
	polillas exterminar! !


!Habitat class methodsFor: '--** private fileout/in **--' stamp: 'M 4/25/2022 17:04:53'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	polillas := Polillas.
	orugas := Orugas.
	recursosSuficientes := false.! !


!classDefinition: #LineaGenetica category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #LineaGenetica
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LineaGenetica class' category: 'AvispasYAbejasParte2'!
LineaGenetica class
	instanceVariableNames: 'firmasGeneticas'!

!LineaGenetica class methodsFor: 'public' stamp: 'M 4/25/2022 15:02:29'!
agregarUnaFirmaGenetica: unaFirma
	firmasGeneticas at: unaFirma put:  ((self buscarFirmaGenetica: unaFirma) + 1).! !

!LineaGenetica class methodsFor: 'public' stamp: 'M 4/25/2022 15:02:33'!
buscarFirmaGenetica: unaFirma
	^ firmasGeneticas at: unaFirma ifAbsent: [ 0 ].! !

!LineaGenetica class methodsFor: 'public' stamp: 'M 4/25/2022 15:02:38'!
eliminarUnaFirmaGenetica: unaFirma
	firmasGeneticas at: unaFirma put:  ((self buscarFirmaGenetica: unaFirma) - 1).! !

!LineaGenetica class methodsFor: 'public' stamp: 'M 4/25/2022 15:02:43'!
finalizarLegado
	firmasGeneticas := Dictionary new.! !


!LineaGenetica class methodsFor: '--** private fileout/in **--' stamp: 'M 4/25/2022 17:04:53'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	firmasGeneticas := ((Dictionary new)).! !


!classDefinition: #Orugas category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #Orugas
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Orugas class' category: 'AvispasYAbejasParte2'!
Orugas class
	instanceVariableNames: 'insectosVivos'!

!Orugas class methodsFor: 'private' stamp: 'M 4/25/2022 15:02:55'!
consumir
	insectosVivos := insectosVivos - 1.! !

!Orugas class methodsFor: 'private' stamp: 'M 4/25/2022 15:03:23'!
hayVivas
	^insectosVivos > 0.! !


!Orugas class methodsFor: 'public' stamp: 'M 4/25/2022 15:03:08'!
cantidadVivos
 	^insectosVivos! !

!Orugas class methodsFor: 'public' stamp: 'M 4/25/2022 15:03:02'!
consumirUna
	|puedoConsumirInsecto|
	puedoConsumirInsecto := self hayVivas.
	puedoConsumirInsecto ifTrue: [ self consumir].
	^ puedoConsumirInsecto.! !

!Orugas class methodsFor: 'public' stamp: 'M 4/25/2022 15:03:13'!
crearUnaCantidad: unaCantidadDeInsectos
	insectosVivos := unaCantidadDeInsectos + insectosVivos.! !

!Orugas class methodsFor: 'public' stamp: 'M 4/25/2022 15:03:17'!
exterminar
	insectosVivos := 0.! !


!Orugas class methodsFor: '--** private fileout/in **--' stamp: 'M 4/25/2022 17:04:53'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	insectosVivos := 0.! !


!classDefinition: #Polillas category: 'AvispasYAbejasParte2'!
Orugas subclass: #Polillas
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Polillas class' category: 'AvispasYAbejasParte2'!
Polillas class
	instanceVariableNames: ''!

!Polillas class methodsFor: '--** private fileout/in **--' stamp: 'M 4/25/2022 17:04:53'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	insectosVivos := 0.! !


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

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'M 4/25/2022 15:04:52'!
test01EnElInicioDeLosTiemposNoHayHuevos	

	self retrocederElHabitatAlInicioDeLosTiempos.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'M 4/25/2022 15:04:59'!
test02CuandoOrianaLaAvispaSeReproducePorPrimeraVezDejaUnHuevo

	self retrocederElHabitatAlInicioDeLosTiempos. 
	
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOriana intentarReproducirse.
	
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'M 4/25/2022 15:05:05'!
test03CadaVezQueOrianaSeReproduceDejaUnHuevoMas

	self retrocederElHabitatAlInicioDeLosTiempos. 
	
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOriana intentarReproducirse.
	
	self laAvispaOriana intentarReproducirse.
	

	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 2.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'M 4/25/2022 15:05:09'!
test04ParaDejarUnHuevoOrianaLaAvispaReduceLaPoblacionDeUnaOrugaANinguna

	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self queElHabitatTengaUnaOrugaMas.
	
	self laAvispaOriana intentarReproducirse.
	
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'M 4/25/2022 15:05:16'!
test05ParaDejarUnHuevoOrianaLaAvispaDecrementaEnUnoLaPoblacionDeOrugasDelHabitat

	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self queElHabitatTengaDosOrugasMas.
	
	self laAvispaOriana intentarReproducirse.
	
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'M 4/25/2022 15:05:21'!
test06CuandoNoHayOrugasOrianaLaAvispaNoPuedeDejarHuevos

	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaOriana intentarReproducirse.
	
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'M 4/25/2022 15:05:30'!
test07CuandoOrnellaLaAvispaSeReproduceDejaUnHuevo

	self retrocederElHabitatAlInicioDeLosTiempos. 
	
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOrnella intentarReproducirse.
	

	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'M 4/25/2022 15:05:35'!
test08ParaDejarUnHuevoOrnellaLaAvispaReduceLaPoblacionDeUnaOrugaANinguna

	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self queElHabitatTengaUnaOrugaMas.
	
	self laAvispaOrnella intentarReproducirse.
	
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'M 4/25/2022 15:05:40'!
test09CuandoNoHayOrugasOrnellaLaAvispaNoPuedeDejarHuevos

	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaOrnella intentarReproducirse.
	
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'M 4/25/2022 15:05:47'!
test10CuandoPollyLaAvispaSeReproduceDejaUnHuevo

	self retrocederElHabitatAlInicioDeLosTiempos. 
	
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaPolly intentarReproducirse.
	
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'M 4/25/2022 15:05:53'!
test11ParaDejarUnHuevoPollyLaAvispaReduceLaPoblacionDeUnaPolillaANinguna

	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self queElHabitatTengaUnaPolillaMas.
	
	self laAvispaPolly intentarReproducirse.
	

	Assert that: self habitat cantidadDePolillas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'M 4/25/2022 15:05:58'!
test12ParaDejarUnHuevoPollyLaAvispaDecrementaEnUnoLaPoblacionDePolillasDelHabitat

	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self queElHabitatTengaDosPolillasMas.
	
	self laAvispaPolly intentarReproducirse.
	
	
	Assert that: self habitat cantidadDePolillas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'M 4/25/2022 15:06:05'!
test13CuandoNoHayPolillasPollyLaAvispaNoPuedeDejarHuevos

	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaPolly intentarReproducirse.
	
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'M 4/25/2022 15:06:50'!
test14CuandoOrianaLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica

	self retrocederElHabitatAlInicioDeLosTiempos. 
	
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOriana intentarReproducirse.
	
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'M 4/25/2022 15:06:54'!
test15CuandoOrianaLaAvispaAunNoSeReprodujoNoTieneHuevosConSuFirmaGenetica

	self retrocederElHabitatAlInicioDeLosTiempos. 
	
	self laAvispaOriana intentarReproducirse.
	
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'M 4/25/2022 15:07:01'!
test16CuandoPollyLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica

	self retrocederElHabitatAlInicioDeLosTiempos. 
	
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaPolly intentarReproducirse.
	
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDePolly isEqualTo: 1.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'M 4/25/2022 15:07:12'!
test17CuandoOrnellaLaAvispaSeReproduceDejaUnHuevoConLaMismaFirmaGeneticaQueOriana

	self retrocederElHabitatAlInicioDeLosTiempos. 
	
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOrnella intentarReproducirse.
	
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOrnella isEqualTo: 1.
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOrnella  isEqualTo: self cantidadDeHuevosConLaFirmaGeneticaDeOriana.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'M 4/25/2022 15:07:26'!
test18CuandoLaraLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica

	self retrocederElHabitatAlInicioDeLosTiempos. 
	
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOrnella intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeLara isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'M 4/25/2022 15:07:37'!
test19CuandoLaraLaAvispaSeReproduceLeSacaElHuevoAOtraAvispa

	self retrocederElHabitatAlInicioDeLosTiempos. 
	
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOriana intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.

	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'M 4/25/2022 15:07:43'!
test20CuandoLaraLaAvispaSeReproduceLeSacaElHuevoAPolly

	self retrocederElHabitatAlInicioDeLosTiempos. 
	
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaPolly intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	

	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDePolly isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'M 4/25/2022 15:07:48'!
test21CuandoLaraLaAvispaNoTieneRecursosNoDejaUnHuevo

	self retrocederElHabitatAlInicioDeLosTiempos. 
	
	self laAvispaLara intentarReproducirse.
	

	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeLara isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'M 4/25/2022 15:03:33'!
cantidadDeHuevosConLaFirmaGeneticaDeLara
	^AvispaLara  huevosConFirmaGenetica.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'M 4/25/2022 15:03:38'!
cantidadDeHuevosConLaFirmaGeneticaDeOriana
	^AvispaOriana huevosConFirmaGenetica.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'M 4/25/2022 15:03:42'!
cantidadDeHuevosConLaFirmaGeneticaDeOrnella
	^AvispaOrnella  huevosConFirmaGenetica. ! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'M 4/25/2022 15:03:47'!
cantidadDeHuevosConLaFirmaGeneticaDePolly
	^AvispaPolly  huevosConFirmaGenetica.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'M 4/25/2022 15:03:52'!
habitat
	^Habitat! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'M 4/25/2022 15:03:55'!
hacerQueElHabitatTengaLosRecursosSuficientes
	Habitat cambiarARecursosSuficientes.
! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'M 4/25/2022 15:03:58'!
laAvispaLara
	^AvispaLara ! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'M 4/25/2022 15:04:02'!
laAvispaOriana
	^AvispaOriana! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'M 4/25/2022 15:04:07'!
laAvispaOrnella
	^AvispaOrnella .! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'M 4/25/2022 15:04:11'!
laAvispaPolly
	^AvispaPolly.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'M 4/25/2022 15:04:22'!
queElHabitatTengaDosOrugasMas
	Habitat  crearUnaCantidadOrugas:  2.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'M 4/25/2022 15:04:27'!
queElHabitatTengaDosPolillasMas
	Habitat  crearUnaCantidadPolillas:  2.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'M 4/25/2022 15:04:31'!
queElHabitatTengaUnaOrugaMas
	Habitat  crearUnaCantidadOrugas:  1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'M 4/25/2022 15:04:36'!
queElHabitatTengaUnaPolillaMas
	Habitat  crearUnaCantidadPolillas:  1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'M 4/25/2022 15:04:40'!
retrocederElHabitatAlInicioDeLosTiempos
	Habitat retrocederAlInicioDeLosTiempos.! !

AvispaOriana initializeAfterFileIn!
AvispaLara initializeAfterFileIn!
AvispaOrnella initializeAfterFileIn!
AvispaPolly initializeAfterFileIn!
Habitat initializeAfterFileIn!
LineaGenetica initializeAfterFileIn!
Orugas initializeAfterFileIn!
Polillas initializeAfterFileIn!
!classDefinition: #RecuperatorioTest category: 'AlgoIII-2021-2C-RecuDel2doParcial'!
TestCase subclass: #RecuperatorioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2021-2C-RecuDel2doParcial'!

!RecuperatorioTest methodsFor: 'as yet unclassified' stamp: 'M 6/20/2022 21:13:16'!
setUp

"	fiubaCity := FiubaCity new.
	fiubaCity agregarServicios: TorreAgua new.
	fiubaCity  agregarServicios: PlantaSolar new."! !

!RecuperatorioTest methodsFor: 'as yet unclassified' stamp: 'M 6/20/2022 20:31:07'!
test00PodemosUsarMedidasDeElectricidadYAgua

"	self assert: 10 * ep equals: 0 * ep + (10 * ep).
	self assert: 15 * wp equals: 0 * wp + (15 * wp)."

	! !

!RecuperatorioTest methodsFor: 'as yet unclassified' stamp: 'M 6/20/2022 19:41:00'!
test01SifiubaCityNoTieneServicios

	| fiubaCity |
	
	fiubaCity := FiubaCity new.
	
	self assert: fiubaCity waterPoints equals: 0.
	self assert: fiubaCity energyPoints equals: 0.
	
! !

!RecuperatorioTest methodsFor: 'as yet unclassified' stamp: 'M 6/20/2022 19:41:04'!
test02fiubaCityTieneServiciosDeAgua

	| fiubaCity |
	
	fiubaCity := FiubaCity new.
	
	fiubaCity agregarServicios: TorreAgua new.
	
	self assert: fiubaCity waterPoints equals: 200.! !

!RecuperatorioTest methodsFor: 'as yet unclassified' stamp: 'M 6/20/2022 19:41:07'!
test03fiubaCityTieneServiciosDeElectricidad

	| fiubaCity |
	
	fiubaCity := FiubaCity new.
	
	fiubaCity agregarServicios: PlantaSolar new.
	
	self assert: fiubaCity energyPoints equals: 500.
	
	! !

!RecuperatorioTest methodsFor: 'as yet unclassified' stamp: 'M 6/20/2022 20:47:31'!
test04fiubaCityNoPuedeTenerZonasSiNoHayServicios

	| fiubaCity |
	
	fiubaCity := FiubaCity new.
	
	self should: [fiubaCity agregarZona: ZonaResidencial new.
		fiubaCity agregarZona: ZonaIndustrial new.
		fiubaCity agregarZona: ZonaComercial new ]
	raise:  Error
	withExceptionDo: [ :aError | self assert: aError messageText equals: FiubaCity noHaySuficientAguaOEnergiaError.
		self assert: fiubaCity waterPoints equals: 0.
		self assert: fiubaCity energyPoints equals: 0. ]
	
! !

!RecuperatorioTest methodsFor: 'as yet unclassified' stamp: 'M 6/20/2022 20:03:44'!
test05fiubaCityPuedeTenerVariasZonasResindencialesSiExistenServiciosDeElectricidadYAguaSuficientes

	| fiubaCity |
	
	fiubaCity := FiubaCity new.
	
	fiubaCity agregarServicios: TorreAgua new.
	fiubaCity  agregarServicios: PlantaSolar new.
	fiubaCity agregarZona: ZonaResidencial new.
	fiubaCity agregarZona: ZonaResidencial new.
	
	self assert: fiubaCity waterPoints equals: 182.
	self assert: fiubaCity energyPoints equals: 490.! !

!RecuperatorioTest methodsFor: 'as yet unclassified' stamp: 'M 6/20/2022 21:04:58'!
test06fiubaCityPuedeTenerVariasZonasComercialesSiExistenServiciosDeElectricidadYAguaSuficientes

	| fiubaCity |
	
	fiubaCity := FiubaCity new.
	
	fiubaCity agregarServicios: TorreAgua new.
	fiubaCity  agregarServicios: PlantaSolar new.
	
	self should:  [ 	fiubaCity agregarZona: ZonaComercial new.
				fiubaCity agregarZona: ZonaResidencial new. ]
	raise:  Error
	withExceptionDo: [ :aError | self assert: aError messageText equals: FiubaCity noHaySuficientesZonasResidencialesError.
		self assert: fiubaCity waterPoints equals: 200.
		self assert: fiubaCity energyPoints equals: 500. ].! !

!RecuperatorioTest methodsFor: 'as yet unclassified' stamp: 'M 6/20/2022 20:41:34'!
test07fiubaCityPuedeTenerVariasZonasComercialesSiHayAlmenosUnaZonaResidencialYtieneServiciosDeElectricidadYAguaSuficientes

	| fiubaCity |
	
	fiubaCity := FiubaCity new.
	
	fiubaCity agregarServicios: TorreAgua new.
	fiubaCity  agregarServicios: PlantaSolar new.
	fiubaCity agregarZona: ZonaResidencial new.
	fiubaCity agregarZona: ZonaComercial new.
	fiubaCity agregarZona: ZonaComercial new.
	
	self assert: fiubaCity waterPoints equals: 187.
	self assert: fiubaCity energyPoints equals: 479.! !

!RecuperatorioTest methodsFor: 'as yet unclassified' stamp: 'M 6/20/2022 20:42:26'!
test08fiubaCityPuedeTenerVariasZonasIndustrialesSiExistenServiciosDeElectricidadYAguaSuficientes

	| fiubaCity |
	
	fiubaCity := FiubaCity new.
	
	fiubaCity agregarServicios: TorreAgua new.
	fiubaCity  agregarServicios: PlantaSolar new.
	fiubaCity agregarZona: ZonaIndustrial new.
	fiubaCity agregarZona: ZonaIndustrial new.
	
	self assert: fiubaCity waterPoints equals: 180.
	self assert: fiubaCity energyPoints equals: 480.! !

!RecuperatorioTest methodsFor: 'as yet unclassified' stamp: 'M 6/20/2022 21:04:45'!
test09fiubaCityPuedeTenerVariasZonasSiExistenServiciosDeElectricidadYAguaSuficientes

	| fiubaCity |
	
	fiubaCity := FiubaCity new.
	
	fiubaCity agregarServicios: TorreAgua new.
	fiubaCity  agregarServicios: PlantaSolar new.
	fiubaCity agregarZona: ZonaIndustrial new.
	fiubaCity agregarZona: ZonaResidencial new.
	fiubaCity agregarZona: ZonaComercial new.
	
	self assert: fiubaCity waterPoints equals: 179.
	self assert: fiubaCity energyPoints equals: 477.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RecuperatorioTest class' category: 'AlgoIII-2021-2C-RecuDel2doParcial'!
RecuperatorioTest class
	instanceVariableNames: ''!

!RecuperatorioTest class methodsFor: 'class initialization' stamp: 'SF 12/19/2021 15:02:52'!
initialize

	"Este método está para crear unidades"
	"No lo deben tocar ni darle importancia durante el examen"
	
	| ep wp |
	ep := BaseUnit named: 'energypoint' sign: 'ep'.
	wp := BaseUnit named: 'waterpoint' sign: 'wp'.
	
	Smalltalk at: #ep put: ep.
	Smalltalk at: #wp put: wp.! !


!classDefinition: #FiubaCity category: 'AlgoIII-2021-2C-RecuDel2doParcial'!
Object subclass: #FiubaCity
	instanceVariableNames: 'waterPoints energyPoints zonas'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2021-2C-RecuDel2doParcial'!

!FiubaCity methodsFor: 'as yet unclassified' stamp: 'M 6/20/2022 20:24:38'!
agregarAgua: unaCantidadAgua

	waterPoints := waterPoints + unaCantidadAgua! !

!FiubaCity methodsFor: 'as yet unclassified' stamp: 'M 6/20/2022 20:24:59'!
agregarEnergia: unaCantidadEnergia

	energyPoints := energyPoints + unaCantidadEnergia! !

!FiubaCity methodsFor: 'as yet unclassified' stamp: 'M 6/20/2022 20:20:01'!
agregarServicios: unServicio 

	unServicio agregarServicio: self.

"	(unServicio isKindOf: TorreAgua) ifTrue: [ waterPoints := waterPoints + 200. ].
	
	(unServicio isKindOf: PlantaSolar) ifTrue: [ energyPoints := energyPoints + 500.]"! !

!FiubaCity methodsFor: 'as yet unclassified' stamp: 'M 6/20/2022 21:08:24'!
agregarZona: unaZona

	self validadCiudadEsAptaPara: unaZona.

	self validarServiciosSuficientesPara: unaZona.

	zonas add: unaZona.



! !

!FiubaCity methodsFor: 'as yet unclassified' stamp: 'M 6/20/2022 19:57:15'!
energyPoints

	zonas do: [ :aZona | energyPoints := aZona consumirElectricidad: energyPoints ].
	
	^ energyPoints! !

!FiubaCity methodsFor: 'as yet unclassified' stamp: 'M 6/20/2022 20:53:55'!
hayZonasResidenciales

	^ zonas anySatisfy: [ :aZona | aZona esResidencial ].! !

!FiubaCity methodsFor: 'as yet unclassified' stamp: 'M 6/20/2022 19:43:35'!
initialize

	energyPoints := 0.
	waterPoints := 0.
	
	zonas := OrderedCollection new.! !

!FiubaCity methodsFor: 'as yet unclassified' stamp: 'M 6/20/2022 21:08:17'!
validadCiudadEsAptaPara: unaZona

	( unaZona esAptaParaEdificarEn: self ) ifFalse: [ self error: self class noHaySuficientesZonasResidencialesError ].! !

!FiubaCity methodsFor: 'as yet unclassified' stamp: 'M 6/20/2022 21:08:27'!
validarServiciosSuficientesPara: unaZona

	( unaZona haySuficienteElectricidad: energyPoints andAgua: waterPoints ) ifFalse: [self error: self class noHaySuficientAguaOEnergiaError].! !

!FiubaCity methodsFor: 'as yet unclassified' stamp: 'M 6/20/2022 19:59:51'!
waterPoints

	zonas do: [ :aZona | waterPoints := aZona consumirAgua: waterPoints ].

	^ waterPoints! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'FiubaCity class' category: 'AlgoIII-2021-2C-RecuDel2doParcial'!
FiubaCity class
	instanceVariableNames: ''!

!FiubaCity class methodsFor: 'as yet unclassified' stamp: 'M 6/20/2022 20:47:10'!
noHaySuficientAguaOEnergiaError
	
	^ 'No suficiente agua o electricidad'! !

!FiubaCity class methodsFor: 'as yet unclassified' stamp: 'M 6/20/2022 20:48:26'!
noHaySuficientesZonasResidencialesError
	
	^ 'Una zona comercial necesita al menos una zona residencial'! !


!classDefinition: #Servicio category: 'AlgoIII-2021-2C-RecuDel2doParcial'!
Object subclass: #Servicio
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2021-2C-RecuDel2doParcial'!

!Servicio methodsFor: 'as yet unclassified' stamp: 'M 6/20/2022 20:32:48'!
agregarServicio: unaCiudad

	self subclassResponsibility.! !


!classDefinition: #PlantaSolar category: 'AlgoIII-2021-2C-RecuDel2doParcial'!
Servicio subclass: #PlantaSolar
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2021-2C-RecuDel2doParcial'!

!PlantaSolar methodsFor: 'as yet unclassified' stamp: 'M 6/20/2022 20:21:26'!
agregarServicio: unaCiudad

	unaCiudad agregarEnergia: 500.! !


!classDefinition: #TorreAgua category: 'AlgoIII-2021-2C-RecuDel2doParcial'!
Servicio subclass: #TorreAgua
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2021-2C-RecuDel2doParcial'!

!TorreAgua methodsFor: 'as yet unclassified' stamp: 'M 6/20/2022 20:26:02'!
agregarServicio: unaCiudad

	unaCiudad agregarAgua: 200.! !


!classDefinition: #Zona category: 'AlgoIII-2021-2C-RecuDel2doParcial'!
Object subclass: #Zona
	instanceVariableNames: 'consumoAgua consumoElectricidad'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2021-2C-RecuDel2doParcial'!

!Zona methodsFor: 'as yet unclassified' stamp: 'M 6/20/2022 20:12:16'!
consumirAgua: unaCantidadAgua

	^ unaCantidadAgua - consumoAgua ! !

!Zona methodsFor: 'as yet unclassified' stamp: 'M 6/20/2022 20:12:21'!
consumirElectricidad: unaCantidadElectricidad

	^ unaCantidadElectricidad - consumoElectricidad.! !

!Zona methodsFor: 'as yet unclassified' stamp: 'M 6/20/2022 20:59:41'!
esAptaParaEdificarEn: unaZona

	self subclassResponsibility.! !

!Zona methodsFor: 'as yet unclassified' stamp: 'M 6/20/2022 20:56:37'!
esResidencial

	self subclassResponsibility.! !

!Zona methodsFor: 'as yet unclassified' stamp: 'M 6/20/2022 20:12:32'!
haySuficienteElectricidad: anEnergyPoints andAgua: aWaterPoints

	^ anEnergyPoints >= consumoElectricidad and: [aWaterPoints >= consumoAgua ]! !


!classDefinition: #ZonaComercial category: 'AlgoIII-2021-2C-RecuDel2doParcial'!
Zona subclass: #ZonaComercial
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2021-2C-RecuDel2doParcial'!

!ZonaComercial methodsFor: 'as yet unclassified' stamp: 'M 6/20/2022 20:59:41'!
esAptaParaEdificarEn: unaCiudad

	^ unaCiudad hayZonasResidenciales.! !

!ZonaComercial methodsFor: 'as yet unclassified' stamp: 'M 6/20/2022 20:54:54'!
esResidencial

	^ false.! !

!ZonaComercial methodsFor: 'as yet unclassified' stamp: 'M 6/20/2022 20:09:08'!
initialize

	consumoAgua := 2.
	consumoElectricidad := 8.! !


!classDefinition: #ZonaIndustrial category: 'AlgoIII-2021-2C-RecuDel2doParcial'!
Zona subclass: #ZonaIndustrial
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2021-2C-RecuDel2doParcial'!

!ZonaIndustrial methodsFor: 'as yet unclassified' stamp: 'M 6/20/2022 20:59:41'!
esAptaParaEdificarEn: unaCiudad

	^ true.! !

!ZonaIndustrial methodsFor: 'as yet unclassified' stamp: 'M 6/20/2022 20:54:47'!
esResidencial

	^ false.! !

!ZonaIndustrial methodsFor: 'as yet unclassified' stamp: 'M 6/20/2022 20:10:12'!
initialize

	consumoAgua := 10.
	consumoElectricidad := 10.! !


!classDefinition: #ZonaResidencial category: 'AlgoIII-2021-2C-RecuDel2doParcial'!
Zona subclass: #ZonaResidencial
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2021-2C-RecuDel2doParcial'!

!ZonaResidencial methodsFor: 'as yet unclassified' stamp: 'M 6/20/2022 20:59:41'!
esAptaParaEdificarEn: unaCiudad

	^ true.! !

!ZonaResidencial methodsFor: 'as yet unclassified' stamp: 'M 6/20/2022 20:54:16'!
esResidencial

	^ true.! !

!ZonaResidencial methodsFor: 'as yet unclassified' stamp: 'M 6/20/2022 19:54:53'!
initialize

	consumoAgua := 9.
	consumoElectricidad := 5.! !

RecuperatorioTest initialize!
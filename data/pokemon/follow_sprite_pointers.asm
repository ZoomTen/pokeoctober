_NUM_FOLLOW_SPRITES = 0
follow_sprite: MACRO
	dba \1 ; sprite location
	db  \2 ; which palette to use (see constants/sprite_data_constants.asm#sprite palettes)
_NUM_FOLLOW_SPRITES = _NUM_FOLLOW_SPRITES + 1
ENDM

FollowSpritePointers::
	follow_sprite BulbasaurSpriteGFX, PAL_OW_GREEN ;BULBASAUR
	follow_sprite IvysaurSpriteGFX, PAL_OW_GREEN ;IVYSAUR
	follow_sprite VenusaurSpriteGFX, PAL_OW_GREEN ;VENUSAUR
	follow_sprite CharmanderSpriteGFX, PAL_OW_RED ;CHARMANDER
	follow_sprite CharmeleonSpriteGFX, PAL_OW_RED ;CHARMELEON
	follow_sprite CharizardSpriteGFX, PAL_OW_RED ;CHARIZARD
	follow_sprite SquirtleSpriteGFX, PAL_OW_BLUE ;SQUIRTLE
	follow_sprite WartortleSpriteGFX, PAL_OW_BLUE ;WARTORTLE
	follow_sprite BlastoiseSpriteGFX, PAL_OW_BLUE ;BLASTOISE
	follow_sprite CaterpieSpriteGFX, PAL_OW_GREEN ;CATERPIE
	follow_sprite MetapodSpriteGFX, PAL_OW_GREEN ;METAPOD
	follow_sprite ButterfreeSpriteGFX, PAL_OW_RED ;BUTTERFREE
	follow_sprite WeedleSpriteGFX, PAL_OW_RED ;WEEDLE
	follow_sprite KakunaSpriteGFX, PAL_OW_BROWN ;KAKUNA
	follow_sprite BeedrillSpriteGFX, PAL_OW_RED ;BEEDRILL
	follow_sprite PidgeySpriteGFX, PAL_OW_BROWN ;PIDGEY
	follow_sprite PidgeottoSpriteGFX, PAL_OW_BROWN ;PIDGEOTTO
	follow_sprite PidgeotSpriteGFX, PAL_OW_BROWN ;PIDGEOT
	follow_sprite RattataSpriteGFX, PAL_OW_PINK ;RATTATA
	follow_sprite RaticateSpriteGFX, PAL_OW_BROWN ;RATICATE
	follow_sprite SpearowSpriteGFX, PAL_OW_BROWN ;SPEAROW
	follow_sprite FearowSpriteGFX, PAL_OW_BROWN ;FEAROW
	follow_sprite EkansSpriteGFX, PAL_OW_PINK ;EKANS 
	follow_sprite ArbokSpriteGFX, PAL_OW_PINK ;ARBOK
	follow_sprite PikachuSpriteGFX, PAL_OW_RED ;PIKACHU
	follow_sprite RaichuSpriteGFX, PAL_OW_RED ;RAICHU
	follow_sprite SandshrewSpriteGFX, PAL_OW_BROWN ;SANDSHREW
	follow_sprite SandslashSpriteGFX, PAL_OW_BROWN ;SANDSLASH
	follow_sprite NidoranFSpriteGFX, PAL_OW_BLUE ;NIDORAN_F
	follow_sprite NidorinaSpriteGFX, PAL_OW_BLUE ;NIDORINA
	follow_sprite NidoqueenSpriteGFX, PAL_OW_BLUE ;NIDOQUEEN
	follow_sprite NidoranMSpriteGFX, PAL_OW_PINK ;NIDORAN_M
	follow_sprite NidorinoSpriteGFX, PAL_OW_PINK ;NIDORINO
	follow_sprite NidokingSpriteGFX, PAL_OW_PINK ;NIDOKING
	follow_sprite ClefairySpriteGFX, PAL_OW_RED ;CLEFAIRY
	follow_sprite ClefableSpriteGFX, PAL_OW_RED ;CLEFABLE,
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;VULPIX
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;NINETALES
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;JIGGLYPUFF
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;WIGGLYTUFF
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;ZUBAT
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;GOLBAT
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;ODDISH
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;GLOOM
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;VILEPLUME
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;PARAS
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;PARASECT
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;VENONAT
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;VENOMOTH
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;DIGLETT
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;DUGTRIO
	follow_sprite MeowthSpriteGFX, PAL_OW_BROWN ;MEOWTH
	follow_sprite PersianSpriteGFX, PAL_OW_BROWN ;PERSIAN
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;PSYDUCK
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;GOLDUCK
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;MANKEY
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;PRIMEAPE
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;GROWLITHE
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;ARCANINE
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;POLIWAG
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;POLIWHIRL
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;POLIWRATH
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;ABRA
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;KADABRA
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;ALAKAZAM
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;MACHOP
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;MACHOKE
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;MACHAMP
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;BELLSPROUT
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;WEEPINBELL
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;VICTREEBEL
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;TENTACOOL
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;TENTACRUEL
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;GEODUDE
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;GRAVELER
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;GOLEM
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;PONYTA
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;RAPIDASH
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;SLOWPOKE
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;SLOWBRO
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;MAGNEMITE
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;MAGNETON
	follow_sprite FarfetchdSpriteGFX, PAL_OW_BROWN;FARFETCH_D
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;DODUO
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;DODRIO
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;SEEL
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;DEWGONG
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;GRIMER
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;MUK
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;SHELLDER
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;CLOYSTER
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;GASTLY
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;HAUNTER
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;GENGAR
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;ONIX
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;DROWZEE
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;HYPNO
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;KRABBY
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;KINGLER
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;VOLTORB
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;ELECTRODE
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;EXEGGCUTE
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;EXEGGUTOR
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;CUBONE
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;MAROWAK
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;HITMONLEE
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;HITMONCHAN
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;LICKITUNG
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;KOFFING
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;WEEZING
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;RHYHORN
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;RHYDON
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;CHANSEY
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;TANGELA
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;KANGASKHAN
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;HORSEA
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;SEADRA
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;GOLDEEN
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;SEAKING
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;STARYU
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;STARMIE
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;MR__MIME
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;SCYTHER
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;JYNX
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;ELECTABUZZ
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;MAGMAR
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;PINSIR
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;TAUROS
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;MAGIKARP
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;GYARADOS
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;LAPRAS
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;DITTO
	follow_sprite EeveeSpriteGFX, PAL_OW_BROWN ;EEVEE
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;VAPOREON
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;JOLTEON
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;FLAREON
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;PORYGON
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;OMANYTE
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;OMASTAR
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;KABUTO
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;KABUTOPS
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;AERODACTYL
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;SNORLAX
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;ARTICUNO
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;ZAPDOS
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;MOLTRES
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;DRATINI
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;DRAGONAIR
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;DRAGONITE
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;MEWTWO
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;MEW
;Johto Icons
	follow_sprite WooperSpriteGFX, PAL_OW_GREEN ;CHIKORITA
	follow_sprite WooperSpriteGFX, PAL_OW_GREEN ;PETAMOLE
	follow_sprite WooperSpriteGFX, PAL_OW_GREEN ;MEGANIUM
	follow_sprite WooperSpriteGFX, PAL_OW_RED ;CYNDAQUIL
	follow_sprite WooperSpriteGFX, PAL_OW_RED ;QUILAVA
	follow_sprite WooperSpriteGFX, PAL_OW_RED ;TYPHLOSION
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;TOTODILE
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;CROCONAW
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;FERALIGATR
	follow_sprite WooperSpriteGFX, PAL_OW_GREEN ;BAYLEEF
	follow_sprite WooperSpriteGFX, PAL_OW_BROWN ;SENTRET
	follow_sprite WooperSpriteGFX, PAL_OW_BROWN ;FURRET
	follow_sprite WooperSpriteGFX, PAL_OW_BROWN ;HOOTHOOT
	follow_sprite WooperSpriteGFX, PAL_OW_BROWN ;NOCTOWL
	follow_sprite WooperSpriteGFX, PAL_OW_RED ;LEDYBA
	follow_sprite WooperSpriteGFX, PAL_OW_RED ;LEDIAN
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;SPINARAK
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;ARIADOS
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;CROBAT
	follow_sprite YanmaSpriteGFX,  PAL_OW_GREEN ;YANMA
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;TONBOSS
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;BELLIGNAN
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;CHINCHOU
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;LANTURN
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;PICHU
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;CLEFFA
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;IGGLYBUFF
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;TOGEPI
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;TOGETIC
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;NATU
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;KATU
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;XATU
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;MAREEP
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;FLAAFFY
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;AMPHAROS
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;BELLOSSOM
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;MARILL
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;AZUMARILL
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;SUDOWOODO
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;POLITOED
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;HOPPIP
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;SKIPLOOM
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;JUMPLUFF
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;AIPOM
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;SUNKERN
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;SUNFLORA
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;LUXSWAN
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;WOOPER
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;QUAGSIRE
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;ESPEON
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;UMBREON
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;MURKROW
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;SLOWKING
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;MISDREAVUS
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;UNOWN
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;WOBBUFFET
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;BIPULLA  
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;GIRAFARIG
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;TOPSYSPOT  
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;PINECO
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;FORRETRESS
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;SHUCKLE
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;SHUQLOUR
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;DUNSPARCE
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;GLIGAR
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;STEELIX
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;SNUBBULL
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;GRANBULL
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;QWILFISH
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;SCIZOR
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;TRICULES
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;HERACROSS
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;SNEASEL
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;TEDDIURSA
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;URSARING
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;SLUGMA
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;MAGCARGO
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;SWINUB
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;PILOSWINE
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;CHOMOSWINE
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;CORSOLA
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;REMORAID
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;OCTILLERY
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;DELIBIRD
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;MANTINE
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;SKARMORY
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;HOUNDOUR
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;HOUNDOOM
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;KINGDRA
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;PHANPY
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;DONPHAN
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;PORYGON2
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;STANTLER
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;SMEARGLE
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;TYROGUE
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;HITMONTOP
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;SMOOCHUM
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;ELEKID
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;MAGBY
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;MILTANK
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;BLISSEY
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;RAIKOU
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;ENTEI
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;SUICUNE
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;LARVITAR
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;PUPITAR
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;TYRANITAR
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;LUGIA
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;HO_OH
	follow_sprite CelebiSpriteGFX, PAL_OW_BROWN;CELEBI
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;COINPUR
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;ADBARSTORK
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;PUPPERON
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;MOIBELLE
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;BELLEDAM
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;CLEFLING
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;MALLODY
	follow_sprite WooperSpriteGFX, PAL_OW_SILVER  ;CAMOUFLAKE
	follow_sprite WooperSpriteGFX, PAL_OW_RED ;COALTA
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;BURGELA
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;VULPIII
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;WORFURS
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;WEARLYCAN
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;DODAERIE
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;PARASPOR
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;MOLAMBINO
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;KIWACKI
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;SILKANE
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;MORPHOBIA
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;TERRACHNID
	follow_sprite WooperSpriteGFX, PAL_OW_BLUE ;SMUJJ

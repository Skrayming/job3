ConfigWebhookRendezVouspolicem = "https://discord.com/api/webhooks/924694731236180039/8Y3dk9Udrs7Z3nXLHdo3FOb8FrzTROwAButunMOx1-tJNcqSG7R8EsTe-8OukD7Et95L" -- Metez le webhook de votre salon disocrd configure pour le job ems 


Config = {

     MarkerType = 22, -- Pour voir les différents type de marker: https://docs.fivem.net/docs/game-references/markers/
     MarkerSizeLargeur = 0.3, -- Largeur du marker
     MarkerSizeEpaisseur = 0.3, -- Épaisseur du marker
     MarkerSizeHauteur = 0.3, -- Hauteur du marker
     MarkerDistance = 6.0, -- Distane de visibiliter du marker (1.0 = 1 mètre)
     MarkerColorR = 69, -- Voir pour les couleurs RGB: https://www.google.com/search?q=html+color+picker&rlz=1C1GCEA_enFR965FR965&oq=html+color+&aqs=chrome.2.69i59j0i131i433i512j0i512l5j69i60.3367j0j7&sourceid=chrome&ie=UTF-8
     MarkerColorG = 112, -- Voir pour les couleurs RGB: https://www.google.com/search?q=html+color+picker&rlz=1C1GCEA_enFR965FR965&oq=html+color+&aqs=chrome.2.69i59j0i131i433i512j0i512l5j69i60.3367j0j7&sourceid=chrome&ie=UTF-8
     MarkerColorB = 246, -- Voir pour les couleurs RGB: https://www.google.com/search?q=html+color+picker&rlz=1C1GCEA_enFR965FR965&oq=html+color+&aqs=chrome.2.69i59j0i131i433i512j0i512l5j69i60.3367j0j7&sourceid=chrome&ie=UTF-8
     MarkerOpacite = 180, -- Opacité du marker (min: 0, max: 255)
     MarkerSaute = true, -- Si le marker saute (true = oui, false = non)
     MarkerTourne = true, -- Si le marker tourne (true = oui, false = non)

    --  TextCoffre = "Appuyez sur ~b~[E] ~s~pour accèder au ~b~coffre ~s~!",  -- Text Menu coffre
     TextVestaire = "Appuyez sur ~b~[E] ~s~pour pour accèder au ~b~vestaire ~s~!", -- Text Menu Vestaire
    --  TextBoss = "Appuyez sur ~b~[E] ~s~pour pour accèder au ~b~action patron ~s~!",  -- Text Menu Boss
     TextGarageVehicule = "Appuyez sur ~b~[E] ~s~pour accèder au ~b~garage ~s~!",  -- Text Garage Voiture
     TextGarageHeli = "Appuyez sur ~b~[E] ~s~pour accèder au ~b~garage ~s~!",  -- Text Garage Hélico
     TextAccueil = "Appuyez sur ~b~[E] ~s~pour parler à l'accueil ~s~!",  -- Text Ascenseur
	

 Vehiculespolicem = { 
    {buttoname = "↓ ~y~Municipale ~s~↓", rightlabel = "", spawnname = "", spawnzone = vector3(-2012.4093017578, -478.76501464844, 12.213412284851), headingspawn = 47.97018051147461},     
 	{buttoname = "Peugeot 3008", rightlabel = "→", spawnname = "3008plm", spawnzone = vector3(-2012.4093017578, -478.76501464844, 12.213412284851), headingspawn = 47.97018051147461},
    {buttoname = "Peugeot 5008", rightlabel = "→", spawnname = "5008pm", spawnzone = vector3(-2012.4093017578, -478.76501464844, 12.213412284851), headingspawn = 47.97018051147461},
    {buttoname = "Skoda Combi", rightlabel = "→", spawnname = "skodacombipm", spawnzone = vector3(-2012.4093017578, -478.76501464844, 12.213412284851), headingspawn = 47.97018051147461},
 	{buttoname = "Ford Focus", rightlabel = "→", spawnname = "focus3pm", spawnzone = vector3(-2012.4093017578, -478.76501464844, 12.213412284851), headingspawn = 47.97018051147461},
 	{buttoname = "Renault Megane 3", rightlabel = "→", spawnname = "megane3plm", spawnzone = vector3(-2012.4093017578, -478.76501464844, 12.213412284851), headingspawn = 47.97018051147461},
 	{buttoname = "Renault Megane 4", rightlabel = "→", spawnname = "megane4plm", spawnzone = vector3(-2012.4093017578, -478.76501464844, 12.213412284851), headingspawn = 47.97018051147461},
    {buttoname = "Peugeot Expert", rightlabel = "→", spawnname = "expertplm", spawnzone = vector3(-2012.4093017578, -478.76501464844, 12.213412284851), headingspawn = 47.97018051147461},
 	{buttoname = "Renault Master", rightlabel = "→", spawnname = "masterplm", spawnzone = vector3(-2012.4093017578, -478.76501464844, 12.213412284851), headingspawn = 47.97018051147461},
 	{buttoname = "Moto Yamaha Tracer", rightlabel = "→", spawnname = "tracerplm", spawnzone = vector3(-2012.4093017578, -478.76501464844, 12.213412284851), headingspawn = 47.97018051147461},
 	{buttoname = "Peugeot Partner", rightlabel = "→", spawnname = "partnertepeepm", spawnzone = vector3(-2012.4093017578, -478.76501464844, 12.213412284851), headingspawn = 47.97018051147461},
 	{buttoname = "Ford kuga", rightlabel = "→", spawnname = "kugapm", spawnzone = vector3(-2012.4093017578, -478.76501464844, 12.213412284851), headingspawn = 47.97018051147461},
 	{buttoname = "Renault Clio 3", rightlabel = "→", spawnname = "clio3pm", spawnzone = vector3(-2012.4093017578, -478.76501464844, 12.213412284851), headingspawn = 47.97018051147461},
 	{buttoname = "Peugeot 308", rightlabel = "→", spawnname = "308pm", spawnzone = vector3(-2012.4093017578, -478.76501464844, 12.213412284851), headingspawn = 47.97018051147461},
 	{buttoname = "Peugeot 208", rightlabel = "→", spawnname = "208pm", spawnzone = vector3(-2012.4093017578, -478.76501464844, 12.213412284851), headingspawn = 47.97018051147461},
 	{buttoname = "Velo", rightlabel = "→", spawnname = "velopm", spawnzone = vector3(-2012.4093017578, -478.76501464844, 12.213412284851), headingspawn = 47.97018051147461},
 },

Helicopolicem = { 
 	{buttonameheli = "Hélicoptère", rightlabel = "→", spawnnameheli = "polmav2", spawnzoneheli = vector3(449.1641, -981.3759, 43.6913), headingspawnheli = 93.3062}, -- Garage Hélico
 },

policemCloak = {
    clothes = {
        specials = {
                [0] = {
                    label = "Reprendre sa tenue : ~y~Civile",
                    minimum_grade = 0,
                    variations = {male = {}, female = {}},
                    onEquip = function()
                        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin) TriggerEvent('skinchanger:loadSkin', skin) end)
                        SetPedArmour(PlayerPedId(), 0)
                    end
                },
                [1] = {
                    minimum_grade = 0,
                    label = "Prendre Tenue : ~b~GSI",
                    variations = {
                    male = {
                       ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
                       ['torso_1'] = 49,   ['torso_2'] = 0,
                       ['decals_1'] = 0,   ['decals_2'] = 0,
                       ['arms'] = 33,
                       ['pants_1'] = 4,   ['pants_2'] = 0,
                       ['shoes_1'] = 25,   ['shoes_2'] = 0,
                       ['helmet_1'] = 39,  ['helmet_2'] = 0,
                       ['chain_1'] = 4,    ['chain_2'] = 0,
                       ['mask_1'] = 12,     ['mask_2'] = 0,
                   },
                   female = {
                       ['bags_1'] = 0, ['bags_2'] = 0,
                           ['tshirt_1'] = 15,['tshirt_2'] = 2,
                           ['torso_1'] = 65, ['torso_2'] = 2,
                           ['arms'] = 36, ['arms_2'] = 0,
                           ['pants_1'] = 38, ['pants_2'] = 2,
                           ['shoes_1'] = 12, ['shoes_2'] = 6,
                           ['mask_1'] = 0, ['mask_2'] = 0,
                           ['bproof_1'] = 0,
                           ['chain_1'] = 0,
                           ['helmet_1'] = -1, ['helmet_2'] = 0,
                    }
                },
                onEquip = function()  
                end
                }
            },
            grades = {
                [2] = {
                    label = "Prendre Tenue : ~b~Pull PM",
                    minimum_grade = 0,
                    variations = {
                    male = {
                        ['tshirt_1'] = 105,  ['tshirt_2'] = 0,
                        ['torso_1'] = 151,   ['torso_2'] = 1,
                        ['decals_1'] = 0,   ['decals_2'] = 0,
                        ['arms'] = 42,
                        ['pants_1'] = 46,   ['pants_2'] = 0,
                        ['shoes_1'] = 25,   ['shoes_2'] = 0,
                        ['helmet_1'] = -1,  ['helmet_2'] = 0,
                        ['chain_1'] = 3,    ['chain_2'] = 0,
                        ['mask_1'] = -1,  ['mask_2'] = 0,
                        ['bproof_1'] = 0,  ['bproof_2'] = 0,
                        ['ears_1'] = -1,     ['ears_2'] = 0,
                    }
                },
                onEquip = function()
                end
            },

            [3] = {
                minimum_grade = 0,
                label = "Prendre Tenue : ~b~Polo STG",
                variations = {
                male = {
                    ['tshirt_1'] = 105,  ['tshirt_2'] = 0,
                    ['torso_1'] = 4,   ['torso_2'] = 0,
                    ['decals_1'] = 0,   ['decals_2'] = 0,
                    ['arms'] = 41,
                    ['pants_1'] = 46,   ['pants_2'] = 0,
                    ['shoes_1'] = 25,   ['shoes_2'] = 0,
                    ['helmet_1'] = -1,  ['helmet_2'] = 0,
                    ['chain_1'] = 3,    ['chain_2'] = 0,
                    ['mask_1'] = -1,  ['mask_2'] = 0,
                    ['bproof_1'] = 0,  ['bproof_2'] = 0,
                    ['ears_1'] = -1,     ['ears_2'] = 0,
                },
                female = {
                   ['tshirt_1'] = 1,  ['tshirt_2'] = 0,
                   ['torso_1'] = 2,   ['torso_2'] = 0,
                   ['decals_1'] = 0,   ['decals_2'] = 0,
                   ['arms'] = 57,
                   ['pants_1'] = 30,   ['pants_2'] = 0,
                   ['shoes_1'] = 25,   ['shoes_2'] = 0,
                   ['helmet_1'] = -1,  ['helmet_2'] = 0,
                   ['chain_1'] = 0,    ['chain_2'] = 0,
                   ['mask_1'] = -1,  ['mask_2'] = 0,
                   ['bproof_1'] = 0,  ['bproof_2'] = 0,
                   ['ears_1'] = -1,     ['ears_2'] = 0,
                }
           },
            onEquip = function()
            end
        }, 

    [5] = {
        minimum_grade = 0,
        label = "Prendre Tenue : ~b~Polo GRT",
        variations = {
            male = {
                ['tshirt_1'] = 105,  ['tshirt_2'] = 0,
                ['torso_1'] = 4,   ['torso_2'] = 1,
                ['decals_1'] = 0,   ['decals_2'] = 0,
                ['arms'] = 41,
                ['pants_1'] = 46,   ['pants_2'] = 0,
                ['shoes_1'] = 25,   ['shoes_2'] = 0,
                ['helmet_1'] = -1,  ['helmet_2'] = 0,
                ['chain_1'] = 3,    ['chain_2'] = 0,
                ['mask_1'] = -1,  ['mask_2'] = 0,
                ['bproof_1'] = 0,  ['bproof_2'] = 0,
                ['ears_1'] = -1,     ['ears_2'] = 0,
             }
   },
    onEquip = function()
    end
}, 

[6] = {
    minimum_grade = 0,
    label = "Prendre Tenue : ~b~Polo GRP",
    variations = {
        male = {
            ['tshirt_1'] = 105,  ['tshirt_2'] = 0,
            ['torso_1'] = 4,   ['torso_2'] = 2,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 41,
            ['pants_1'] = 46,   ['pants_2'] = 0,
            ['shoes_1'] = 25,   ['shoes_2'] = 0,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['chain_1'] = 3,    ['chain_2'] = 0,
            ['mask_1'] = -1,  ['mask_2'] = 0,
            ['bproof_1'] = 0,  ['bproof_2'] = 0,
            ['ears_1'] = -1,     ['ears_2'] = 0,
         }
},
onEquip = function()
end
},

[7] = {
    minimum_grade = 0,
    label = "Prendre Tenue : ~b~polo BGD",
    variations = {
        male = {
            ['tshirt_1'] = 105,  ['tshirt_2'] = 0,
            ['torso_1'] = 4,   ['torso_2'] = 3,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 41,
            ['pants_1'] = 46,   ['pants_2'] = 0,
            ['shoes_1'] = 25,   ['shoes_2'] = 0,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['chain_1'] = 3,    ['chain_2'] = 0,
            ['mask_1'] = -1,  ['mask_2'] = 0,
            ['bproof_1'] = 0,  ['bproof_2'] = 0,
            ['ears_1'] = -1,     ['ears_2'] = 0,
         }
},
onEquip = function()
end
},

[8] = {
    minimum_grade = 0,
    label = "Prendre Tenue : ~b~Polo BCH",
    variations = {
    male = {
        ['tshirt_1'] = 105,  ['tshirt_2'] = 0,
        ['torso_1'] = 4,   ['torso_2'] = 4,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 41,
        ['pants_1'] = 46,   ['pants_2'] = 0,
        ['shoes_1'] = 25,   ['shoes_2'] = 0,
        ['helmet_1'] = -1,  ['helmet_2'] = 0,
        ['chain_1'] = 3,    ['chain_2'] = 0,
        ['mask_1'] = -1,  ['mask_2'] = 0,
        ['bproof_1'] = 0,  ['bproof_2'] = 0,
        ['ears_1'] = -1,     ['ears_2'] = 0,
     }
},
onEquip = function()
end
},

[9] = {
    minimum_grade = 0,
    label = "Prendre Tenue : ~b~Polo BCP",
    variations = {
        male = {
            ['tshirt_1'] = 105,  ['tshirt_2'] = 0,
            ['torso_1'] = 4,   ['torso_2'] = 5,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 41,
            ['pants_1'] = 46,   ['pants_2'] = 0,
            ['shoes_1'] = 25,   ['shoes_2'] = 0,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['chain_1'] = 3,    ['chain_2'] = 0,
            ['mask_1'] = -1,  ['mask_2'] = 0,
            ['bproof_1'] = 0,  ['bproof_2'] = 0,
            ['ears_1'] = -1,     ['ears_2'] = 0,
         }
},
onEquip = function()
end
},

[10] = {
    minimum_grade = 0,
    label = "Prendre Tenue : ~b~Polo CSS",
    variations = {
        male = {
            ['tshirt_1'] = 105,  ['tshirt_2'] = 0,
            ['torso_1'] = 4,   ['torso_2'] = 6,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 41,
            ['pants_1'] = 46,   ['pants_2'] = 0,
            ['shoes_1'] = 25,   ['shoes_2'] = 0,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['chain_1'] = 3,    ['chain_2'] = 0,
            ['mask_1'] = -1,  ['mask_2'] = 0,
            ['bproof_1'] = 0,  ['bproof_2'] = 0,
            ['ears_1'] = -1,     ['ears_2'] = 0,
         },
},
onEquip = function()
end
},


[11] = {
    minimum_grade = 0,
    label = "Prendre Tenue : ~b~Polo CDS",
    variations = {
        male = {
            ['tshirt_1'] = 105,  ['tshirt_2'] = 0,
            ['torso_1'] = 4,   ['torso_2'] = 7,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 41,
            ['pants_1'] = 46,   ['pants_2'] = 0,
            ['shoes_1'] = 25,   ['shoes_2'] = 0,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['chain_1'] = 3,    ['chain_2'] = 0,
            ['mask_1'] = -1,  ['mask_2'] = 0,
            ['bproof_1'] = 0,  ['bproof_2'] = 0,
            ['ears_1'] = -1,     ['ears_2'] = 0,
         }
},
onEquip = function()
end
},
[12] = {
    minimum_grade = 0,
    label = "Prendre Tenue : ~b~Polo CDS-SUP",
    variations = {
        male = {
            ['tshirt_1'] = 105,  ['tshirt_2'] = 0,
            ['torso_1'] = 4,   ['torso_2'] =8,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 41,
            ['pants_1'] = 46,   ['pants_2'] = 0,
            ['shoes_1'] = 25,   ['shoes_2'] = 0,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['chain_1'] = 3,    ['chain_2'] = 0,
            ['mask_1'] = -1,  ['mask_2'] = 0,
            ['bproof_1'] = 0,  ['bproof_2'] = 0,
            ['ears_1'] = -1,     ['ears_2'] = 0,
         }
},
onEquip = function()
end
},
[14] = {
    minimum_grade = 0,
    label = "Prendre Tenue : ~b~Polo CDE",
    variations = {
        male = {
            ['tshirt_1'] = 105,  ['tshirt_2'] = 0,
            ['torso_1'] = 4,   ['torso_2'] = 9,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 41,
            ['pants_1'] = 46,   ['pants_2'] = 0,
            ['shoes_1'] = 25,   ['shoes_2'] = 0,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['chain_1'] = 3,    ['chain_2'] = 0,
            ['mask_1'] = -1,  ['mask_2'] = 0,
            ['bproof_1'] = 0,  ['bproof_2'] = 0,
            ['ears_1'] = -1,     ['ears_2'] = 0,
         }
},
onEquip = function()
end
},
[15] = {
    minimum_grade = 0,
    label = "Prendre Tenue : ~b~Polo DRT-ADJ",
    variations = {
        male = {
            ['tshirt_1'] = 105,  ['tshirt_2'] = 0,
            ['torso_1'] = 4,   ['torso_2'] = 10,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 41,
            ['pants_1'] = 46,   ['pants_2'] = 0,
            ['shoes_1'] = 25,   ['shoes_2'] = 0,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['chain_1'] = 3,    ['chain_2'] = 0,
            ['mask_1'] = -1,  ['mask_2'] = 0,
            ['bproof_1'] = 0,  ['bproof_2'] = 0,
            ['ears_1'] = -1,     ['ears_2'] = 0,
         }
},
onEquip = function()
end
},
[16] = {
    minimum_grade = 0,
    label = "Prendre Tenue : ~b~Polo DRT",
    variations = {
        male = {
            ['tshirt_1'] = 105,  ['tshirt_2'] = 0,
            ['torso_1'] = 4,   ['torso_2'] = 11,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 41,
            ['pants_1'] = 46,   ['pants_2'] = 0,
            ['shoes_1'] = 25,   ['shoes_2'] = 0,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['chain_1'] = 3,    ['chain_2'] = 0,
            ['mask_1'] = -1,  ['mask_2'] = 0,
            ['bproof_1'] = 0,  ['bproof_2'] = 0,
            ['ears_1'] = -1,     ['ears_2'] = 0,
         }
},
onEquip = function()
end
},


[17] = {
    minimum_grade = 0,
    label = "Prendre Tenue : ~b~Polo Long STG",
    variations = {
        male = {
            ['tshirt_1'] = 105,  ['tshirt_2'] = 0,
            ['torso_1'] = 150,   ['torso_2'] = 0,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 42,
            ['pants_1'] = 46,   ['pants_2'] = 0,
            ['shoes_1'] = 25,   ['shoes_2'] = 0,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['chain_1'] = 3,    ['chain_2'] = 0,
            ['mask_1'] = -1,  ['mask_2'] = 0,
            ['bproof_1'] = 0,  ['bproof_2'] = 0,
            ['ears_1'] = -1,     ['ears_2'] = 0,
         }
},
onEquip = function()
end
},
[18] = {
    minimum_grade = 0,
    label = "Prendre Tenue : ~b~Polo Long GRT",
    variations = {
        male = {
            ['tshirt_1'] = 105,  ['tshirt_2'] = 0,
            ['torso_1'] = 150,   ['torso_2'] = 1,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 42,
            ['pants_1'] = 46,   ['pants_2'] = 0,
            ['shoes_1'] = 25,   ['shoes_2'] = 0,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['chain_1'] = 3,    ['chain_2'] = 0,
            ['mask_1'] = -1,  ['mask_2'] = 0,
            ['bproof_1'] = 0,  ['bproof_2'] = 0,
            ['ears_1'] = -1,     ['ears_2'] = 0,
         }
},
onEquip = function()
end
},
[19] = {
    minimum_grade = 0,
    label = "Prendre Tenue : ~b~Polo Long GRP",
    variations = {
        male = {
            ['tshirt_1'] = 105,  ['tshirt_2'] = 0,
            ['torso_1'] = 150,   ['torso_2'] = 2,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 42,
            ['pants_1'] = 46,   ['pants_2'] = 0,
            ['shoes_1'] = 25,   ['shoes_2'] = 0,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['chain_1'] = 3,    ['chain_2'] = 0,
            ['mask_1'] = -1,  ['mask_2'] = 0,
            ['bproof_1'] = 0,  ['bproof_2'] = 0,
            ['ears_1'] = -1,     ['ears_2'] = 0,
         }
},
onEquip = function()
end
},
[20] = {
    minimum_grade = 0,
    label = "Prendre Tenue : ~b~Polo Long BGD",
    variations = {
        male = {
            ['tshirt_1'] = 105,  ['tshirt_2'] = 0,
            ['torso_1'] = 150,   ['torso_2'] = 3,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 42,
            ['pants_1'] = 46,   ['pants_2'] = 0,
            ['shoes_1'] = 25,   ['shoes_2'] = 0,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['chain_1'] = 3,    ['chain_2'] = 0,
            ['mask_1'] = -1,  ['mask_2'] = 0,
            ['bproof_1'] = 0,  ['bproof_2'] = 0,
            ['ears_1'] = -1,     ['ears_2'] = 0,
         }
},
onEquip = function()
end
},
[21] = {
    minimum_grade = 0,
    label = "Prendre Tenue : ~b~Polo Long BCH",
    variations = {
        male = {
            ['tshirt_1'] = 105,  ['tshirt_2'] = 0,
            ['torso_1'] = 150,   ['torso_2'] = 4,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 42,
            ['pants_1'] = 46,   ['pants_2'] = 0,
            ['shoes_1'] = 25,   ['shoes_2'] = 0,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['chain_1'] = 3,    ['chain_2'] = 0,
            ['mask_1'] = -1,  ['mask_2'] = 0,
            ['bproof_1'] = 0,  ['bproof_2'] = 0,
            ['ears_1'] = -1,     ['ears_2'] = 0,
         }
},
onEquip = function()
end
},
[22] = {
    minimum_grade = 0,
    label = "Prendre Tenue : ~b~Polo Long BCP",
    variations = {
        male = {
            ['tshirt_1'] = 105,  ['tshirt_2'] = 0,
            ['torso_1'] = 150,   ['torso_2'] = 5,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 42,
            ['pants_1'] = 46,   ['pants_2'] = 0,
            ['shoes_1'] = 25,   ['shoes_2'] = 0,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['chain_1'] = 3,    ['chain_2'] = 0,
            ['mask_1'] = -1,  ['mask_2'] = 0,
            ['bproof_1'] = 0,  ['bproof_2'] = 0,
            ['ears_1'] = -1,     ['ears_2'] = 0,
         }
},
onEquip = function()
end
},
[23] = {
    minimum_grade = 0,
    label = "Prendre Tenue : ~b~Polo long CSS",
    variations = {
        male = {
            ['tshirt_1'] = 105,  ['tshirt_2'] = 0,
            ['torso_1'] = 150,   ['torso_2'] = 6,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 42,
            ['pants_1'] = 46,   ['pants_2'] = 0,
            ['shoes_1'] = 25,   ['shoes_2'] = 0,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['chain_1'] = 3,    ['chain_2'] = 0,
            ['mask_1'] = -1,  ['mask_2'] = 0,
            ['bproof_1'] = 0,  ['bproof_2'] = 0,
            ['ears_1'] = -1,     ['ears_2'] = 0,
         }
},
onEquip = function()
end
},
[24] = {
    minimum_grade = 0,
    label = "Prendre Tenue : ~b~Polo Long CDS",
    variations = {
        male = {
            ['tshirt_1'] = 105,  ['tshirt_2'] = 0,
            ['torso_1'] = 150,   ['torso_2'] = 7,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 42,
            ['pants_1'] = 46,   ['pants_2'] = 0,
            ['shoes_1'] = 25,   ['shoes_2'] = 0,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['chain_1'] = 3,    ['chain_2'] = 0,
            ['mask_1'] = -1,  ['mask_2'] = 0,
            ['bproof_1'] = 0,  ['bproof_2'] = 0,
            ['ears_1'] = -1,     ['ears_2'] = 0,
         }
},
onEquip = function()
end
},
[25] = {
    minimum_grade = 0,
    label = "Prendre Tenue : ~b~Polo Long CDS-SUP",
    variations = {
        male = {
            ['tshirt_1'] = 105,  ['tshirt_2'] = 0,
            ['torso_1'] = 150,   ['torso_2'] = 8,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 42,
            ['pants_1'] = 46,   ['pants_2'] = 0,
            ['shoes_1'] = 25,   ['shoes_2'] = 0,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['chain_1'] = 3,    ['chain_2'] = 0,
            ['mask_1'] = -1,  ['mask_2'] = 0,
            ['bproof_1'] = 0,  ['bproof_2'] = 0,
            ['ears_1'] = -1,     ['ears_2'] = 0,
         }
},
onEquip = function()
end
},

[27] = {
    minimum_grade = 0,
    label = "Prendre Tenue : ~b~Polo Long CDE",
    variations = {
        male = {
            ['tshirt_1'] = 105,  ['tshirt_2'] = 0,
            ['torso_1'] = 150,   ['torso_2'] = 9,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 42,
            ['pants_1'] = 46,   ['pants_2'] = 0,
            ['shoes_1'] = 25,   ['shoes_2'] = 0,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['chain_1'] = 3,    ['chain_2'] = 0,
            ['mask_1'] = -1,  ['mask_2'] = 0,
            ['bproof_1'] = 0,  ['bproof_2'] = 0,
            ['ears_1'] = -1,     ['ears_2'] = 0,
         }
},
onEquip = function()
end
},

[28] = {
    minimum_grade = 0,
    label = "Prendre Tenue : ~b~Polo Long DRT-ADJ",
    variations = {
        male = {
            ['tshirt_1'] = 105,  ['tshirt_2'] = 0,
            ['torso_1'] = 150,   ['torso_2'] = 10,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 42,
            ['pants_1'] = 46,   ['pants_2'] = 0,
            ['shoes_1'] = 25,   ['shoes_2'] = 0,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['chain_1'] = 3,    ['chain_2'] = 0,
            ['mask_1'] = -1,  ['mask_2'] = 0,
            ['bproof_1'] = 0,  ['bproof_2'] = 0,
            ['ears_1'] = -1,     ['ears_2'] = 0,
         }
},
onEquip = function()
end
},

[29] = {
    minimum_grade = 0,
    label = "Prendre Tenue : ~b~Polo Long DRT",
    variations = {
        male = {
            ['tshirt_1'] = 105,  ['tshirt_2'] = 0,
            ['torso_1'] = 150,   ['torso_2'] = 11,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 42,
            ['pants_1'] = 46,   ['pants_2'] = 0,
            ['shoes_1'] = 25,   ['shoes_2'] = 0,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['chain_1'] = 3,    ['chain_2'] = 0,
            ['mask_1'] = -1,  ['mask_2'] = 0,
            ['bproof_1'] = 0,  ['bproof_2'] = 0,
            ['ears_1'] = -1,     ['ears_2'] = 0,
         }
},
onEquip = function()
end
},


[0] = {
    minimum_grade = 0,
    label = "Prendre Tenue : ~b~Femme",
    variations = {
        female = {
            ['tshirt_1'] = 1,  ['tshirt_2'] = 0,
            ['torso_1'] = 2,   ['torso_2'] = 0,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 57,
            ['pants_1'] = 30,   ['pants_2'] = 0,
            ['shoes_1'] = 25,   ['shoes_2'] = 0,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['chain_1'] = 3,    ['chain_2'] = 0,
            ['mask_1'] = -1,  ['mask_2'] = 0,
            ['bproof_1'] = 0,  ['bproof_2'] = 0,
            ['ears_1'] = -1,     ['ears_2'] = 0,
         }
    },
     onEquip = function()
     end
 }, 

},
        [9] = {
           minimum_grade = 0,
           label = "Tenue Comissaire",
           variations = {
           male = {
               tshirt_1 = 58,  tshirt_2 = 0,
               torso_1 = 55,   torso_2 = 0,
               decals_1 = 8,   decals_2 = 3,
               arms = 41,
               pants_1 = 25,   pants_2 = 0,
               shoes_1 = 25,   shoes_2 = 0,
               helmet_1 = -1,  helmet_2 = 0,
               chain_1 = 0,    chain_2 = 0,
               ears_1 = 2,     ears_2 = 0
           },
           female = {
               tshirt_1 = 35,  tshirt_2 = 0,
               torso_1 = 48,   torso_2 = 0,
               decals_1 = 7,   decals_2 = 3,
               arms = 44,
               pants_1 = 34,   pants_2 = 0,
               shoes_1 = 27,   shoes_2 = 0,
               helmet_1 = -1,  helmet_2 = 0,
               chain_1 = 0,    chain_2 = 0,
               ears_1 = 2,     ears_2 = 0
          }
      },
       onEquip = function()
       end
      },
    }
},


Position = {
 	    -- Boss = {vector3(462.2895, -985.4934, 30.7280)}, -- Menu boss 
 	    -- Coffre = {vector3(448.94113, -997.3993, 30.6895)}, -- Menu coffre 
        Vestaire = {vector3(-2041.4671630859, -461.08728027344, 16.424432754517)}, -- Menu Vestaire 
        Accueil = {vector3(-2048.9848632813, -463.04476928711, 12.240758895874)}, -- Menu Pour Accueil 
        GarageVehicule = {vector3(-2020.4562988281, -464.79376220703, 11.521349906921)}, -- Menu Garage Vehicule
 	    GarageHeli = {vector3(-2043.0881347656, -452.18664550781, -1.8961865901947)}, -- Menu Garage Helico
    }
}


local QBCore = exports['qb-core']:GetCoreObject()

local shower = false

CreateThread(function()
    for i, v in pairs(Config.Locations) do
        local coords = Config.Locations[i].coords
        exports['qb-target']:AddCircleZone("sphere1", vector3(coords.x, coords.y, coords.z), 0.6, {
            name="sphere1",
            useZ = true,
            }, {
                options = {
                    {
                        type = "client",
                        event = 'serrulata-shower:client:takeShower',
                        icon = 'fas fa-shower',
                        label = 'Take Shower',
                        canInteract = function(entity, distance, coords, name)
                            if shower == false and distance < 1 then
                                return true
                            else
                                return false
                            end
                        end
                    },
                },
            distance = 1.5
        })
    end
end)

RegisterNetEvent('serrulata-shower:client:takeShower', function()
    if shower == false then
        shower = true
        FreezeEntityPosition((PlayerPedId()), true)
        local coords = GetEntityCoords(PlayerPedId())
        progressBar()
        while shower == true do
            if not HasNamedPtfxAssetLoaded("core") then
                RequestNamedPtfxAsset("core")
                while not HasNamedPtfxAssetLoaded("core") do
                    Wait(1)
                end
            end
            UseParticleFxAssetNextCall("core") 
            particles  = StartParticleFxLoopedAtCoord("ent_sht_water", coords.x, coords.y, coords.z +1.2, 0.0, 0.0, 0.0, 1.0, false, false, false, false) 
            UseParticleFxAssetNextCall("core") 
            Wait(3000)
        end
    end
end)

function progressBar()
    if shower == true then
        QBCore.Functions.Progressbar("shower", "Taking a shower", 9000, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = "anim@mp_yacht@shower@male@",
            anim = "male_shower_enter_into_idle",
            flags = 16,
        }, {}, {}, function() -- Done
            FreezeEntityPosition((PlayerPedId()), false)
            ClearPedTasksImmediately(PlayerPedId()) 
            StopParticleFxLooped(particles, 0) 
            TriggerServerEvent('hud:server:RelieveStress', 25)
            shower = false
        end, function() -- Cancel
            FreezeEntityPosition((PlayerPedId()), false)
            ClearPedTasksImmediately(PlayerPedId()) 
            StopParticleFxLooped(particles, 0) 
            shower = false
        end)
    end
end

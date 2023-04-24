ESX = exports["es_extended"]:getSharedObject()

Citizen.CreateThread(function() -- PROCESSO --
    if not HasModelLoaded('s_m_m_doctor_01') then
       RequestModel('s_m_m_doctor_01')
       while not HasModelLoaded('s_m_m_doctor_01') do
          Citizen.Wait(5)
       end
    end

npc = CreatePed(4, 's_m_m_doctor_01', 297.7092, -586.8920, 42.2608, 79.2501, false, true)
FreezeEntityPosition(npc, true)
SetEntityInvincible(npc, true)
SetBlockingOfNonTemporaryEvents(npc, true)

local VenditaNpc = false
local options = {
    
    {
        name = 'ox:medico',
        event = 'krs:acquista',
        icon = 'fa-solid fa-hand-holding-medical',
        label = 'Acquista',
        canInteract = function(entity)
            return not IsEntityDead(entity)
        end
    }
}

local optionNames = { 'ox:medico'}
exports.ox_target:addLocalEntity(npc,options)


end)

local VenditaNpc = nil

RegisterNetEvent('krs:acquista')
AddEventHandler('krs:acquista', function(value)
    VenditaNpc = value
end)

RegisterNetEvent('krs:acquista') 
AddEventHandler('krs:acquista', function()
    local Ped = PlayerPedId()
    local input = lib.inputDialog('Parla con il medico 😷', {
        {type = 'select', label = 'Vendita di cure mediche ⚕️', options = {
            {label = "Medikit", value = "medikit"},
            {label = "Bende", value = "bandage"},
        }},
    })
    
    if input and #input > 0 then
        TriggerServerEvent('krs:acquista', input[1])
    end
end)


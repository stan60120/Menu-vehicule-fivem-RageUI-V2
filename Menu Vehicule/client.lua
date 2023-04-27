ESX = nil --(nul)


local PlayerData = {}

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)  
    PlayerData.job = job  
    Citizen.Wait(5000) 
end)

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(10)
    end
    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end
    if ESX.IsPlayerLoaded() then

        ESX.PlayerData = ESX.GetPlayerData()

    end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    ESX.PlayerData = xPlayer
end)


RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    ESX.PlayerData.job = job
end)

RegisterNetEvent('esx:setJob2')
AddEventHandler('esx:setJob2', function(job2)
    ESX.PlayerData.job2 = job2
end)

local capot = {                     
    action = {
  
  
  
        'Ouvrir',
  
        'Fermer',
  
    },
  
    list = 1
}

local chest = {
    action = {
  
  
  
        'Ouvrir',
  
        'Fermer',
  
    },
  
    list = 1

}

local windos = {
    action = {
  
  
  
        'Avant Gauche',
  
        'Avant Droite',

        'Arrière Gauche',

        'Arrière Droite',

        'Toutes les fenêtres',
  
    },
  
    list = 1

}

local doors = {
    action = {
  
  
  
        'Avant Gauche',
  
        'Avant Droite',

        'Arrière Gauche',

        'Arrière Droite',

        'Toutes les portes',
  
    },
  
    list = 1

}

function menuTest()

    local menu = RageUI.CreateMenu("~p~StanDEV~p~", "Menu Principal")
    local submenu = RageUI.CreateSubMenu(menu, "~p~Gestion du vehicule", nil)

    RageUI.Visible(menu, not RageUI.Visible(menu))

    while menu do

        Citizen.Wait(0)

        RageUI.IsVisible(menu, true , true, true, function()

            RageUI.ButtonWithStyle("Gestion du vehicule", nil, {RightLabel = "🚔"}, not cooldown, function(Hovered, Active, Selected)
                if Selected then
                end
            end, submenu)
        
        end, function()
        end)

        RageUI.IsVisible(subM, true , true, true, function()

            RageUI.Separator("~p~↓ Inventaire ↓")

        end, function()
        end)

        RageUI.IsVisible(submenu, true , true, true, function()

            RageUI.Separator("~B~↓ Gestion du vehicule ↓")

            RageUI.Checkbox("Eteindre/Allumer moteur", nil, Checkbx, {}, function(_,_,s,Checked)
                Checkbx = Checked
                if s then
                    if Checkbx then
                        local car = GetVehiclePedIsUsing(PlayerPedId())
                        SetVehicleEngineOn(car, false, true, true)
                        SetVehicleUndriveable(car, true)
                     else
                        local car = GetVehiclePedIsUsing(PlayerPedId())
                        SetVehicleEngineOn(car, true, true, true)
                        SetVehicleUndriveable(car, false)
                    end
                end
            end)

            RageUI.List('Gestion du capot', capot.action, capot.list, nil, {RightLabel = ""}, true, function(Hovered, Active, Selected, Index)

                if (Selected) then 

                    if Index == 1 then
                        SetVehicleDoorOpen(GetVehiclePedIsIn(PlayerPedId()), 4, false, false)

                    elseif Index == 2 then
                        SetVehicleDoorShut(GetVehiclePedIsIn(PlayerPedId()), 4, false, false)

                end

            end

               capot.list = Index;              

            end)

            RageUI.List('Gestion du coffre', chest.action, chest.list, nil, {RightLabel = ""}, true, function(Hovered, Active, Selected, Index)

                if (Selected) then 

                    if Index == 1 then
                        SetVehicleDoorOpen(GetVehiclePedIsIn(PlayerPedId()), 5, false, false)

                    elseif Index == 2 then
                        SetVehicleDoorShut(GetVehiclePedIsIn(PlayerPedId()), 5, false, false)

                end

            end

               chest.list = Index;              

            end)

            RageUI.List('Gestion des portes', doors.action, doors.list, nil, {RightLabel = ""}, true, function(Hovered, Active, Selected, Index)

                if (Selected) then 

                    if Index == 1 then
                        if not avantg then
                            avantg = true
                            SetVehicleDoorOpen(GetVehiclePedIsIn(PlayerPedId()), 0, false, false)
                        elseif avantg then
                            avantg = false
                            SetVehicleDoorShut(GetVehiclePedIsIn(PlayerPedId()), 0, false, false)
                        end
                    end

                    if Index == 2 then
                        if not avantd then
                            avantd = true
                            SetVehicleDoorOpen(GetVehiclePedIsIn(PlayerPedId()), 1, false, false)
                        elseif avantd then
                            avantd = false
                            SetVehicleDoorShut(GetVehiclePedIsIn(PlayerPedId()), 1, false, false)
                        end
                    end

                    if Index == 3 then
                        if not arrg then
                            arrg = true
                            SetVehicleDoorOpen(GetVehiclePedIsIn(PlayerPedId()), 2, false, false)
                        elseif arrg then
                            arrg = false
                            SetVehicleDoorShut(GetVehiclePedIsIn(PlayerPedId()), 2, false, false)
                        end
                    end

                    if Index == 4 then
                        if not arrd then
                            arrd = true
                            SetVehicleDoorOpen(GetVehiclePedIsIn(PlayerPedId()), 3, false, false)
                        elseif arrd then
                            arrd = false
                            SetVehicleDoorShut(GetVehiclePedIsIn(PlayerPedId()), 3, false, false)
                        end
                    end

                    if Index == 5 then
                        if not alldoors then
                            alldoors = true
                            SetVehicleDoorOpen(GetVehiclePedIsIn(PlayerPedId()), 0, false, false)
                            SetVehicleDoorOpen(GetVehiclePedIsIn(PlayerPedId()), 1, false, false)
                            SetVehicleDoorOpen(GetVehiclePedIsIn(PlayerPedId()), 2, false, false)
                            SetVehicleDoorOpen(GetVehiclePedIsIn(PlayerPedId()), 3, false, false)
                            SetVehicleDoorOpen(GetVehiclePedIsIn(PlayerPedId()), 4, false, false)
                            SetVehicleDoorOpen(GetVehiclePedIsIn(PlayerPedId()), 5, false, false)

                        elseif alldoors then
                            alldoors = false
                            SetVehicleDoorShut(GetVehiclePedIsIn(PlayerPedId()), 0, false, false)
                            SetVehicleDoorShut(GetVehiclePedIsIn(PlayerPedId()), 1, false, false)
                            SetVehicleDoorShut(GetVehiclePedIsIn(PlayerPedId()), 2, false, false)
                            SetVehicleDoorShut(GetVehiclePedIsIn(PlayerPedId()), 3, false, false)
                            SetVehicleDoorShut(GetVehiclePedIsIn(PlayerPedId()), 4, false, false)
                            SetVehicleDoorShut(GetVehiclePedIsIn(PlayerPedId()), 5, false, false)
                        end
                    end

            end

               doors.list = Index;              

            end)

            RageUI.List('Gestion fenêtres', windos.action, windos.list, nil, {RightLabel = ""}, true, function(Hovered, Active, Selected, Index)

                if (Selected) then 

                    if Index == 1 then
                        if not avantg then
                            avantg = true
                            RollDownWindow(GetVehiclePedIsIn(PlayerPedId()), 0) 
                        elseif avantg then
                            avantg = false
                            RollUpWindow(GetVehiclePedIsIn(PlayerPedId()), 0) 
                        end
                    end

                    if Index == 2 then
                        if not avantd then
                            avantd = true
                            RollDownWindow(GetVehiclePedIsIn(PlayerPedId()), 1) 
                        elseif avantd then
                            avantd = false
                            RollUpWindow(GetVehiclePedIsIn(PlayerPedId()), 1) 
                        end
                    end

                    if Index == 3 then
                        if not arrg then
                            arrg = true
                            RollDownWindow(GetVehiclePedIsIn(PlayerPedId()), 2) 
                        elseif arrg then
                            arrg = false
                            RollUpWindow(GetVehiclePedIsIn(PlayerPedId()), 2) 
                        end
                    end

                    if Index == 4 then
                        if not arrd then
                            arrd = true
                            RollDownWindow(GetVehiclePedIsIn(PlayerPedId()), 3) 
                        elseif arrd then
                            arrd = false
                            RollUpWindow(GetVehiclePedIsIn(PlayerPedId()), 3) 
                        end
                    end

                    if Index == 5 then
                        if not allw then
                            allw = true
                            RollDownWindow(GetVehiclePedIsIn(PlayerPedId()), 0)
                            RollDownWindow(GetVehiclePedIsIn(PlayerPedId()), 1) 
                            RollDownWindow(GetVehiclePedIsIn(PlayerPedId()), 2) 
                            RollDownWindow(GetVehiclePedIsIn(PlayerPedId()), 3) 


                        elseif allw then
                            allw = false
                            RollUpWindow(GetVehiclePedIsIn(PlayerPedId()), 0) 
                            RollUpWindow(GetVehiclePedIsIn(PlayerPedId()), 1) 
                            RollUpWindow(GetVehiclePedIsIn(PlayerPedId()), 2) 
                            RollUpWindow(GetVehiclePedIsIn(PlayerPedId()), 3) 

                        end
                    end
            end

               windos.list = Index;              

            end)

            RageUI.IsVisible(infos, true, true, true, function()
                local veh = GetVehiclePedIsIn(PlayerPedId(), false)
                local vehf = GetVehicleFuelLevel(veh)
                local vehp = GetVehicleEngineTemperature(veh)
                local vehn = GetVehicleDoorLockStatus(veh)
                local vehe = GetEntityHealth(veh) / 10
                local plaque = GetVehicleNumberPlateText(veh)
                if vehn == 1 then
                    RageUI.Separator("Status du véhicule : ~g~Ouvert")
                else
                    RageUI.Separator("Status du véhicule : ~r~Fermé")
                end
                if vehe == 10 then
                    RageUI.Separator("État du véhicule : 0 %")
                else
                    RageUI.Separator("État du véhicule : "..math.ceil(vehe).." %")
                end
                RageUI.Separator("Niveau d'essence : "..math.ceil(vehf).." %")
                RageUI.Separator("Température du moteur : "..math.ceil(vehp).."°C")
                RageUI.Separator("Plaque du véhicule : "..(plaque).."")
            
            end, function() 
            end)

        end, function()
        end)




        if not RageUI.Visible(menu) and not RageUI.Visible(submenu) then
            menu = RMenu:DeleteType("menu", true)
        end

    end

end


RegisterCommand('menu', function()
    menuTest()
end, false)
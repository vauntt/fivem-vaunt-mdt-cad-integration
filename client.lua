local tabEnabled = false
local tabLoaded = false
local tabletObject = nil

function REQUEST_NUI_FOCUS(bool)
    SetNuiFocus(bool, bool)
    if bool == true then
        SendNUIMessage({ showtab = true })
        startAnim()
    else
        SendNUIMessage({ hidetab = true })
        stopAnim()
    end
    return bool
end

RegisterNUICallback(
    "vaunt-mdt-bus",
    function(data)
        if data.load then
            tabLoaded = true
        elseif data.hide then
            SetNuiFocus(false, false)
            tabEnabled = false
            stopAnim()
        end
    end
)

function startAnim()
    Citizen.CreateThread(function()
        RequestAnimDict("amb@world_human_seat_wall_tablet@female@base")
        while not HasAnimDictLoaded("amb@world_human_seat_wall_tablet@female@base") do
            Citizen.Wait(0)
        end
        attachObject()
        TaskPlayAnim(GetPlayerPed(-1), "amb@world_human_seat_wall_tablet@female@base", "base" ,8.0, -8.0, -1, 50, 0, false, false, false)
    end)
end

function attachObject()
	if tabletObject ~= nil then
		-- delete tablet object
		DeleteObject(tabletObject) 
	end
	--create model of tablet 
	tabletObject = CreateObject(GetHashKey("prop_cs_tablet"), 0, 0, 0, true, true, true) 
    AttachEntityToEntity(tabletObject, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 57005), 0.17, 0.10, -0.13, 20.0, 180.0, 180.0, true, true, false, true, 1, true)
end

function stopAnim()
    StopAnimTask(GetPlayerPed(-1), "amb@world_human_seat_wall_tablet@female@base", "base" ,8.0, -8.0, -1, 50, 0, false, false, false)
    DeleteEntity(tabletObject)
end

Citizen.CreateThread(
    function()
        local l = 0
        local timeout = false
        while not tabLoaded do
            Citizen.Wait(0)
            l = l + 1
            if l > 500 then
                tabLoaded = true
                timeout = true
            end
        end

        if timeout == true then
            print("Failed to load vaunt mdt nui...")
        -- return ---- Quit
        end
        REQUEST_NUI_FOCUS(false)

        while true do
            if (IsControlJustPressed(0, 244)) and GetLastInputMethod( 0 ) then
                tabEnabled = not tabEnabled
                REQUEST_NUI_FOCUS(tabEnabled)
                Citizen.Wait(0)
            end
            if (tabEnabled) then
                local ped = GetPlayerPed(-1)
                DisableControlAction(0, 1, tabEnabled) -- LookLeftRight
                DisableControlAction(0, 2, tabEnabled) -- LookUpDown
                DisableControlAction(0, 24, tabEnabled) -- Attack
                DisablePlayerFiring(ped, tabEnabled) -- Disable weapon firing
                DisableControlAction(0, 142, tabEnabled) -- MeleeAttackAlternate
                DisableControlAction(0, 106, tabEnabled) -- VehicleMouseControlOverride
            end
            Citizen.Wait(0)
        end
    end
)

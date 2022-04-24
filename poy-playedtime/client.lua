QBCore = exports['qb-core']:GetCoreObject()


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(60000)
        TriggerServerEvent('exelds:updateOnlineTime')
    end
end)

AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    TriggerEvent('poyonstart:sendnotif')

end)


RegisterNetEvent('poyonstart:sendnotif', function()

    QBCore.Functions.TriggerCallback('poyonstart:gettime', function(zurt)
        for i=1, #zurt, 1 do 
            saat = zurt[i].saat
            dakika = zurt[i].dakika
        end
        SendNUIMessage ({
            type = 'normal', 
            saat = saat, 
            dakika = dakika,
        })
    end)
end)


RegisterCommand('notideneme', function()
    TriggerEvent('poyonstart:sendnotif')

end)
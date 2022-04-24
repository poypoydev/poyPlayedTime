QBCore = exports['qb-core']:GetCoreObject()


RegisterServerEvent("exelds:updateOnlineTime")
AddEventHandler("exelds:updateOnlineTime", function()
    local _source = source
    local xPlayer = QBCore.Functions.GetPlayer(_source)
    if xPlayer ~= nil then
        for k,v in pairs(GetPlayerIdentifiers(source))do
            if string.sub(v, 1, string.len("license:")) == "license:" then
                license = v
            end
            
        end
    exports.ghmattimysql:execute('UPDATE players SET onlinesure = onlinesure + @onlinesure WHERE license = @identifier',
                {
                    ['@onlinesure'] = 1,
                    ['@identifier'] = license
                })
    end            
end)

QBCore.Functions.CreateCallback('poyonstart:gettime', function(source, cb)
    for k,v in pairs(GetPlayerIdentifiers(source))do
        if string.sub(v, 1, string.len("license:")) == "license:" then
          license = v
        end
      
    end
    licens1e = license
    exports.ghmattimysql:execute('SELECT * FROM players WHERE license = @identifier',{['@identifier'] = licens1e}, function(result)
        for i=1, #result, 1 do
            onlinesure2 = result[i].onlinesure
        end       
        tablo = {}
        local saat = 0
        local onlinesure = tonumber(onlinesure2)
        if onlinesure >= 60 then
            while onlinesure >= 60 do
            saat =  saat + 1
            onlinesure = onlinesure - 60
            end
        end
        table.insert(tablo,{
            dakika = onlinesure,
            saat = saat
        })

        cb(tablo)
        
        
    end)
    

end)



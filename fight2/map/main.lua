local console = require 'jass.console'
local CJ = require "jass.common"
local runtime	= require 'jass.runtime'
setmetatable(_ENV, {__index = getmetatable(CJ).__index})



--table
table.removeByValue = function (tbl,value)
    local index = table.indexOf(tbl,value);
    return table.remove(tbl,index)
end

table.indexOf = function(tbl, value)
    for k, v in ipairs(tbl) do if (v == value) then return k end end
    return false
end

table.copy = function(orig)
    local copy
    if type(orig) == "table" then
        copy = {}
        for orig_key, orig_value in pairs(orig) do
            copy[orig_key] = orig_value
        end
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end














console.enable = true
print = console.write
print('hello world')
DisplayTextToPlayer(Player(0), 0, 0, 'lualualua')
function act()
    -- body
    
end
local t = CreateTrigger() 
TriggerRegisterTimerEvent(t, 2, false)

require 'eventCentre'

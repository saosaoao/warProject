BodyType.UNIT = 0
BodyType.EFFECT = 1
Widget = {
    useEffect = true,
    typeFunc = {
        [BodyType.UNIT] = {
            move = SetUnitPosition,
            getX = GetUnitX,
            getY = GetUnitY,
            getZ = BlzGetUnitZ,
            setZ = function(unit, z)
                UnitAddAbility(unit, FourCC('Amrf'))
                SetUnitFlyHeight(unit, z, 1000)
                UnitRemoveAbility(unit, FourCC('Amrf'))
            end,
            remove = function(unit)
                KillUnit(unit)
            end
        },
        [BodyType.EFFECT] = {
            move = BlzSetSpecialEffectPosition,
            getX = BlzGetLocalSpecialEffectX,
            getY = BlzGetLocalSpecialEffectY,
            getZ = BlzGetLocalSpecialEffectZ,
            setZ = BlzSetSpecialEffectZ,
            remove = function(eff)
                DestroyEffect(eff)
            end
        }
    },
    events = List:new()
}

function Widget:new(target,wType)
    local o = {}
    setmetatable(o, self)
    self.__index = self
    o.target = target
    o.wType = wType
    return o
end

function Widget:on(eventName,listener,this) 
    EventCentre:createEvent(eventName,listener,this)
    local listenerList = self.events:getKey(eventName)
    if (listenerList) then
        table.insert( listenerList, listener)
    else
        self.events:add(eventName,{listener})
    end
end

function Widget:off(eventName)

end

function Widget:moveTo()


end
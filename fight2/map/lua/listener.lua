Listener = {}
function Listener:new(data, callFunc, target)
    local o = {}
    setmetatable(o, self)
    self.__index = self
    o.data = data
    o.callFunc = callFunc
    o.target = target
    o.trigger = data.trg
    return o
end

function Listener:removeFromList()
    EventCentre:createEvent()
end

function Listener:run()
    self.callFunc(self.data.args)
    if (self.data.isOnce) then
        self:removeFromList()
    end
end

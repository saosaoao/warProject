require "List"
EventCentre = {}

EventCentre.EventList = List:new() --事件列表
EventCentre.ListenerList = List:new() --监听体列表
EventCentre.GameTriggers = {}

require "listener"

function EventCentre:createEvent(eventStr, trg_type)
    if (self.EventList:get(eventStr)) then
        return
    end
    local trg = CreateTrigger()
    if (trg_type == "game" or trg_type == nil) then
        table.insert(self.GameTriggers, trg)
    end
    self.EventList:add(eventStr, trg)
end

function EventCentre:addListener(eventStr, listener)
    local listenerList = self.ListenerList
    if (self.EventList:getKey(eventStr) == nil) then
        self:createEvent(eventStr)
    end
    local listeners = listenerList.get(eventStr)
    if (listeners) then
        table.insert(listeners,listener)
    else
        listenerList:add(eventStr,{listener})
    end
end

function EventCentre:removeListener(listener)
    local eventStr = self.EventList:getKey(listener.trg)
    local listenerList = self.ListenerList
    local listeners = listenerList.get(eventStr)
    if (listeners) then
        table.remove(eventStr,listener)
    end
end









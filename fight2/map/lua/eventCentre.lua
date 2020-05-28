require "List"
EventCentre = {}

EventCentre.EventList = List:new() --事件列表
EventCentre.ListenerList = List:new() --监听体列表
EventCentre.RemoveListener = List:new() --等待移除等监听体列表
EventCentre.EventEmitter = {} --事件派发列表
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

--派发事件体
function EventCentre:emit(eventStr, target)
    local emitter = {
        name = eventStr,
        target = target
    }
    table.insert(EventCentre.EventEmitter, emitter)
end

function EventCentre:dispatchEvent()
    while #EventCentre.EventEmitter > 0 do
    end
end

function EventCentre:addListener(eventStr, listener)
    local listenerList = self.ListenerList
    if (self.EventList:getKey(eventStr) == nil) then
        self:createEvent(eventStr)
    end
    local listeners = listenerList.get(eventStr)
    if (listeners) then
        table.insert(listeners, listener)
    else
        listenerList:add(eventStr, {listener})
    end
end

function EventCentre:removeListener(listener)
    local eventStr = self.EventList:getKey(listener.trg)
    local listenerList = self.ListenerList
    local listeners = listenerList:get(eventStr)
    if (listeners) then
        table.remove(eventStr, listener)
    end
end

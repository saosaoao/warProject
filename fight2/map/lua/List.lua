List = {}
function List:new()
    local o = {}
    setmetatable(o, self)
    self.__index = self
    o._list = {}
    o._keys = {}
    return o
end

function List:add(key, value)
    if (self.list[key]) then
        return
    end
    self._list[key] = value
    table.insert(self._keys, key)
end

function List:remove(key) 
    if(table.removeByValue(self._keys,key)) then
        self._list[key] = nil
    end
end

function List:forEach(func) 
    for k,v in ipairs(self._keys) do
        func(self._list[v],v)
    end
end

function List:clear()
    self._list = {}
    self._keys = {}
end

function List:get(key)
    return self._list[key]
end

function List:getKeyIndex(key)
    return table.indexOf(self._keys,key)
end

function List:getByIndex(index)
    local key = this._keys[index]
    return table._list[key]
end

function List:getKey(value)
    for k,v in ipairs(self._keys) do
        if(self._list[v] == value) then
            return v
        end
    end
end

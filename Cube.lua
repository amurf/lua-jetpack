Cube = {}
Cube.__index = Cube

function Cube:new(this_x, this_y, this_width, this_height)
    local obj = {
        x      = this_x,
        y      = this_y,
        width  = this_width,
        height = this_height,
        color  = {255,255,255,100},
    }
    setmetatable(obj, Cube)
    return obj
end

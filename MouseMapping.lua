mouse_mapping = {}

mouse_buttons = {
    'l', -- Left Mouse Button
    'm', -- Middle Mouse Button
    'r', -- Right Mouse Button
    'wd', -- Mouse Wheel Down
    'wu', -- Mouse Wheel Up
    'x1', -- Button 4 Down
    'x2', -- Button 5 Down
}

-- P key: grid_mode toggle between smooth/grid
function mouse_mapping.l(cube)
    cube.color = RED
end

-- S key: Set starting point
function mouse_mapping.r(cube)
    cube.color = GRAY
end


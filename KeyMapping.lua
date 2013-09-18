key_mapping = {}

-- P key: grid_mode toggle between smooth/grid
function key_mapping.p(cube)
    settings.grid_mode = (not settings.grid_mode) and true or false
end

-- S key: Set starting point
function key_mapping.s(cube)
    cube.color = YELLOW
end

-- E key: Set ending point
function key_mapping.e(cube)
    cube.color = GREEN
end

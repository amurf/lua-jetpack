require 'Cube'
require 'Colours'
require 'KeyMapping'
require 'MouseMapping'

function love.load()

    settings = {
        grid_mode = false
    }

    -- This needs to be in a config file somewhere
    cube_width    = 30
    cube_height   = 30

    num_of_x_cubes = love.graphics.getWidth() / cube_width
    num_of_y_cubes = love.graphics.getHeight() / cube_height
    cubes          = {}

    for x = 1,num_of_x_cubes do
        cubes[x] = {}
        for y = 1,num_of_y_cubes do
                          -- Cube(pos_x, pos_y, height, width)
            cubes[x][y] = Cube:new((x-1)*cube_width, (y-1)*cube_height,
                                        cube_width-1, cube_height-1)
        end
    end

end

function love.update()

    local this_cube = currently_selected_cube()
    for i = 1, #mouse_buttons do
        local button = mouse_buttons[i]
        if (love.mouse.isDown(button) and
                mouse_mapping[button]) then
            mouse_mapping[button](this_cube)
        end
    end

end

function love.draw()
    local width  = love.graphics.getWidth()
    local height = love.graphics.getHeight()
    for x = 1, #cubes do
        for y = 1, #cubes[x] do
            local this_cube = cubes[x][y]
            love.graphics.setColor(this_cube.color)
            if settings.grid_mode then
                love.graphics.rectangle("fill", this_cube.x, this_cube.y,
                    this_cube.width + 1, this_cube.height + 1 )
            else
                love.graphics.rectangle("fill", this_cube.x, this_cube.y,
                    this_cube.width, this_cube.height )
            end
        end
    end
end

function love.keypressed(key)
   local this_cube = currently_selected_cube()
   if (key_mapping[key]) then
       key_mapping[key](this_cube)
   end
end

function currently_selected_cube()
    local x      = love.mouse.getX()
    local y      = love.mouse.getY()
    local x_cube = find_nearest_cube(x, cube_width)
    local y_cube = find_nearest_cube(y, cube_height)

    return cubes[x_cube][y_cube]
end

function find_nearest_cube(x_or_y, total_cubes)
    return math.floor( (x_or_y/total_cubes)+1 )
end



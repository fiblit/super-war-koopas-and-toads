tile = {
    x = 0,
    y = 0,
    passable = true,
    sprite = nil
}
basemap = {
    width = 0,
    height = 0,
    tiles = {}
}

-- Load some default values for rect
function love.load()
    love.graphics.setDefaultFilter("linear", "nearest")
    basemap.width = 40
    basemap.height = 20
    spritesheet = {
        ["grass"] = love.graphics.newImage("assets/grass.png"),
        ["rgrass"] = love.graphics.newImage("assets/ruinedgrass.png")
    }
    for i = 1, basemap.height do
        for j = 1, basemap.width do
            basemap.tiles[j + i * basemap.width] = {
                x = j * spritesheet["grass"]:getWidth(),
                y = i * spritesheet["grass"]:getHeight(),
                passable = true,
                sprite = spritesheet["grass"]
            }
        end
    end
end

-- Increase the size of the rect per frame
function love.update(dt)
end

-- Draw a coloured rect
function love.draw()
    for i, tile in pairs(basemap.tiles) do
        s = 2
        love.graphics.draw(tile.sprite, s * tile.x, s * tile.y, 0, s)
    end
end

function love.keypressed(key, scancode, isrepeat)
    if key == "escape" then
        love.event.quit()
    end
end


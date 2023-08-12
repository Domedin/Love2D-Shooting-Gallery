function love.load()
    target = {}
    target.x = 300
    target.y = 300
    target.radius = 50

    score = 0
    timer = 0
end

function love.update(dt)
    
end

function love.draw()
    love.graphics.setColor(0, 0.5, 0.4)
    love.graphics.circle("fill", target.x, target.y, target.radius)
end
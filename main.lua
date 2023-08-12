function love.load()
    target = {}
    target.x = 300
    target.y = 300
    target.radius = 35

    score = 0
    timer = 0
    gameState = 1

    gameFont = love.graphics.newFont(40)
    
    sprites= {}
    sprites.Background = love.graphics.newImage('Sprites/Background.png')
    sprites.Target = love.graphics.newImage('Sprites/Target.png')
    sprites.Crosshairs = love.graphics.newImage('Sprites/Crosshairs.png')

    love.mouse.setVisible(false)    
end

function love.update(dt)
    if timer > 0 then
        timer = timer - dt
    end
    if timer < 0 then
        timer = 0
        gameState = 1
    end
end

function love.draw()
    love.graphics.setColor(1, 1, 1)
    love.graphics.draw(sprites.Background, 0, 0)
    
    love.graphics.setColor(1, 1, 1)
    love.graphics.setFont(gameFont)
    love.graphics.print("Score: " .. score, 10, 5)
    love.graphics.print("Timer: " .. math.ceil(timer), 265, 5)

    if gameState == 1 then
        love.graphics.setColor(0, 0, 0)
        love.graphics.printf("Click anywhere to begin", 0, 360, love.graphics.getWidth(), "center")
    end

    if gameState == 2 then
        love.graphics.setColor(1, 1, 1)
        love.graphics.draw(sprites.Target, target.x - target.radius, target.y - target.radius)
    end
    love.graphics.draw(sprites.Crosshairs, love.mouse.getX() -17.5, love.mouse.getY() - 17.5)
    
end

function love.mousepressed(x, y, button)
    if button == 1 and gameState == 2 then
        local mouseToTarget = distanceBetween(x, y, target.x, target.y)
        if mouseToTarget < 50 then
            score = score + 1
            target.x = math.random(target.radius, love.graphics.getWidth() - target.radius)
            target.y = math.random(target.radius, love.graphics.getHeight() - target.radius)
        end
    elseif button == 1 and gameState == 1 then
        gameState = 2
        timer = 10
        score = 0
    end
end

function distanceBetween(x1, y1, x2, y2)
    return math.sqrt((x2 - x1) ^ 2 + (y2 - y1) ^ 2)
end
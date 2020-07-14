
local MainScene = class("MainScene", function()
    return display.newScene("MainScene")
end)

function MainScene:ctor()
    local layer = display.newColorLayer(cc.c4b(255,255,255,255))
    local cardNode = display.newNode()
    self:addChild(layer)
    self:addChild(cardNode)
    local chest_close = display.newSprite("chest_close.png")
    local chest_open = display.newSprite("chest_open.png")
    
    local cards = {}
    for i=1,20 do
        cards[i] = i
    end
    
    chest_open:setVisible(false)
    layer:addChild(chest_close)
    layer:addChild(chest_open)
    chest_open:setPosition(display.width/2,display.height*0.75)
    chest_close:setPosition(display.width/2,display.height*0.75)
    self:addNodeEventListener(cc.NODE_TOUCH_EVENT, function(event) 
        chest_open:setVisible(true)
        chest_close:setVisible(false)
        local randSend = self:randArray(cards)
        local randArrayResult = {}
        local rand = math.random
        math.randomseed(os.time())
        chest_close:setPosition(display.width/2,display.height*0.75)

        local randNumber = rand(5,7)
        cardNode:removeAllChildren()
        local startPos = cc.p(display.width/4,display.height/2-100)
        for i=1,randNumber do
            randArrayResult[i] = randSend[i]
            print("rands:"..randArrayResult[i])
            local path = "card/card_"..randArrayResult[i]..".png"
            local card = display.newSprite(path)
            cardNode:addChild(card)
            local posx = 0
            local posy = 0
            if i<=4 then
                posx = startPos.x+300*(i-1)
                posy = startPos.y
            else
                posx = startPos.x+300*(i-5)
                posy = startPos.y-300
            end
            card:setPosition(posx,posy)
        end
       
    end)
    self:setTouchEnabled(true)

end
--打乱数组
function MainScene:randArray(arr)
    local tmp, index
    for i=1, #arr-1 do
        index = math.random(i, #arr)
        if i ~= index then
            tmp = arr[index]
            arr[index] = arr[i]
            arr[i] = tmp
        end
    end
    return arr
end

function MainScene:onEnter()
end

function MainScene:onExit()
end


return MainScene

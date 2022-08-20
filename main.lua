os.loadAPI(“h2touchpanel") 

function door(isOpen)
    rs.setOutput(“right”, isOpen)
end

local buttons = {}
buttons[1] = {name = “OPEN”, cmd = function() door(true) end } 
buttons[2] = {name = “CLOSE”, cmd = function() door(false) end }

local monitor = peripheral.wrap(“top”)
local option = {topPos = 1, bottomPos = 10}
local panel = h2touchpanel.makePanel(buttons, 1, 2, monitor, option) 
panel:draw()

while true do
    local event, btn = panel:pullButtonPushEvent() 
    btn:run()
    panel:drawPushedButtonEffect(btn, 0.5)
end

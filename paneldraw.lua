os.loadAPI(h2touchpanel)

local password = 0
function input(num)
    password = password * 10 + num
end

function clear() 
    password = 0
end

function enter()
    if password == 1234 then
        print(‘OK! Open the door.’) 
        rs.setOutput(“right”, true) 
        sleep(5) 
        rs.setOutput(“right”, false)
    else
        print(‘NG! Please retry!’)
    end
password = 0
end

local buttons = {}
buttons[1] = { name = “1”, cmd = function() input(1) end } 
buttons[2] = { name = “2”, cmd = function() input(2) end } 
buttons[3] = { name = “3”, cmd = function() input(3) end } 
buttons[4] = { name = “4”, cmd = function() input(4) end } 
buttons[5] = { name = “5”, cmd = function() input(5) end } 
buttons[6] = { name = “6”, cmd = function() input(6) end } 
buttons[7] = { name = “7”, cmd = function() input(7) end } 
buttons[8] = { name = “8”, cmd = function() input(8) end } 
buttons[9] = { name = “9”, cmd = function() input(9) end } 
buttons[10] = { name = “0”, cmd = function() input(0) end } 
buttons[11] = { name = “clear”, cmd = function() clear() end } 
buttons[12] = { name = “enter”, cmd = function() enter() end }

local monitor = peripheral.wrap(“top”)
local option = { topPos = 2, bottomPos = 9 }
local panel = h2touchpanel.makePanel(buttons, 3, 4, monitor, option) 
panel:draw()

while true do
    local event, btn = panel:pullButtonPushEvent() 
    btn:run()
    panel:drawPushedButtonEffect(btn, 0.5)
end
monitor = peripheral.wrap(“top”) 
monitor.clear()

while true do
    time = os.time()
    time_str = textutils.formatTime(time)
    monitor.setCursorPos(1, 1) 
    monitor.clearLine() 
    monitor.write(time_str) 
    sleep(1)
end
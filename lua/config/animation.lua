local Animation = require('animation')
local duration = 300 -- ms
local fps = 30 -- frames per second
local easing = require('animation.easing')

local i = 0

local function callback(fraction)
   i = i + 1
   print('frame ', i)
end

local animation = Animation(duration, fps, easing.line, callback)
animation:run()
animation:is_running()
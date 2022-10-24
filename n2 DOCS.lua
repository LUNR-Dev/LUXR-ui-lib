CALL LIB
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/LUNR-Dev/UI-libs/main/n2's%20lib"))()

-----
MKAE WINDOW
local window = library:Window({name = "<font color=\"#AA55EB\">Name</font>"})

-----
MAKE PAGE
local referto = window:Page({Name = "name"})
---
SECTIONS
local Section = refer2page:Section({Name = "1set tab", size = 300})
local Section2 = refer2page:Section({Name = "2nd tab", Side = "Right"})
-----
MAKE LABEl
local label = section:Label({Name = "label hello random"})
-----
MAKE TOGGLE
local toggle = section:Toggle({Name = " toggle", Default = true, Callback = function(val)
print("your code here")
warn(val)
end})
----
MAKE SLIDER
DECIMALS IS HOW MUCH YOU WANT IT TO GO UP BY
local slider = aimbot_section:Slider({Default = 10, Minimum = 0, Maximum = 30, Decimals = 10, Suffix = "%", Callback = function(val)
print("whatever you want your slider to do")
warn(val) 
end})
-------
MAKE BUTTON
local button = aimbot_section:Button({Name = "random button", Callback = function()
warn("clicked")
end})
------

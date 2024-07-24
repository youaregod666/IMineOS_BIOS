
-- Import libraries
local GUI = require("GUI")
local system = require("System")
local fs = require("filesystem")

---------------------------------------------------------------------------------

-- Add a new window to MineOS workspace
local workspace, window, menu = system.addWindow(GUI.filledWindow(1, 1, 100, 40, 0x000000))

-- Add single cell layout to window
local layout = window:addChild(GUI.layout(1, 1, window.width, window.height, 1, 1))

-- Add nice gray text object to layout
--layout:addChild(GUI.text(1, 1, 0xFFFFFF, system.getUser()))

layout:addChild(GUI.roundedButton(2, 18, 30, 3, 0xFFFFFF, 0x000000, 0x000000, 0xFFFFFF, "Convert To EFI")).onTouch = function()
    fs.makeDirectory("/.com.IMineOS.EFI")
    fs.makeDirectory("/.com.IMineOS.EFI/EFI")
    fs.copy("/OS.lua", "/.com.IMineOS.EFI/EFI/EFI.lua")
end

-- Create callback function with resizing rules when window changes its' size
window.onResize = function(newWidth, newHeight)
  window.backgroundPanel.width, window.backgroundPanel.height = newWidth, newHeight
  layout.width, layout.height = newWidth, newHeight
end

---------------------------------------------------------------------------------

-- Draw changes on screen after customizing your window
workspace:draw()

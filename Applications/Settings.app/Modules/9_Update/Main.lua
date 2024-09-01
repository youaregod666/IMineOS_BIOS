
local GUI = require("GUI")
local text = require("Text")
local filesystem = require("Filesystem")
local paths = require("Paths")
local system = require("System")
local fs = require("Filesystem")
local image = require("Image")
local SHA = require("SHA-256")
local component = require("Component")
local EFI = component.eeprom
local internet = require("internet")
local Event = require("Event")

local module = {}

local workspace, window, localization = table.unpack({...})
local userSettings = system.getUserSettings()

--------------------------------------------------------------------------------

module.name = "Update"
module.margin = 3
module.onTouch = function()

	local function addButton(parent, x, width, ...)
	local button = parent:addChild(GUI.button(x, 1, width, 3, 0xE1E1E1, 0x696969, 0x696969, 0xE1E1E1, ...))
	button.colors.disabled = {
	background = 0xE1E1E1,
	text = 0xB4B4B4
	}

	return button
	end

	local function flashEFI(url)
		internet.download(url, "/tempEFI.lua")
		EFI.set(fs.read("/tempEFI.lua"))
		EFI.setLabel("IMineOS BIOS")
		fs.remove("/tempEFI.lua")
	end

	local function FlashHillOSUEFI()
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/EFI/Minified.lua", "/tempEFI.lua")
		EFI.set(fs.read("/tempEFI.lua"))
		EFI.setLabel("HillOS UEFI")
		fs.remove("/tempEFI.lua")

	end

	local function DownloadHillOS()
		-- .Ø_O
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/.system/.%C3%98_O/DISK_KEY_SETUP.nope", "/.system/.Ø_O/DISK_KEY_SETUP.nope")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/.system/.%C3%98_O/EFI_KEY_SETUP.nope", "/.system/.Ø_O/EFI_KEY_SETUP.nope")
		-- Boot/EFI
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/.system/Boot/EFI/EFI.lua", "/.system/Boot/EFI/EFI.lua")
		-- Icons
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/.system/Icons/Application.pic", "/.system/Icons/Application.pic")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/.system/Icons/Archive.pic", "/.system/Icons/Archive.pic")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/.system/Icons/FileNotExists.pic", "/.system/Icons/FileNotExists.pic")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/.system/Icons/Floppy.pic", "/.system/Icons/Floppy.pic")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/.system/Icons/Folder.pic", "/.system/Icons/Folder.pic")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/.system/Icons/HDD.pic", "/.system/Icons/HDD.pic")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/.system/Icons/Script.pic", ".system/Icons/Script.pic")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/.system/Icons/Trash.pic", "/.system/Icons/Trash.pic")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/.system/Icons/User.pic", "/.system/Icons/User.pic")
		-- Libraries
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/.system/Libraries/BigLetters.lua", "/.system/Libraries/BigLetters.lua")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/.system/Libraries/Bit32.lua", "/.system/Libraries/Bit32.lua")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/.system/Libraries/Color.lua", "/.system/Libraries/Color.lua")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/.system/Libraries/Component.lua", "/.system/Libraries/Component.lua")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/.system/Libraries/Compressor.lua", "/.system/Libraries/Compressor.lua")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/.system/Libraries/Event.lua", "/.system/Libraries/Event.lua")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/.system/Libraries/Filesystem.lua", "/.system/Libraries/Filesystem.lua")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/.system/Libraries/GUI.lua", "/.system/Libraries/GUI.lua")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/.system/Libraries/Image.lua", "/.system/Libraries/Image.lua")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/.system/Libraries/Internet.lua", "/.system/Libraries/Internet.lua")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/.system/Libraries/JSON.lua", "/.system/Libraries/JSON.lua")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/.system/Libraries/Keyboard.lua", "/.system/Libraries/Keyboard.lua")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/.system/Libraries/Network.lua", "/.system/Libraries/Network.lua")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/.system/Libraries/Number.lua", "/.system/Libraries/Number.lua")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/.system/Libraries/Paths.lua", "/.system/Libraries/Paths.lua")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/.system/Libraries/SHA-256.lua", "/.system/Libraries/SHA-256.lua")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/.system/Libraries/Screen.lua", "/.system/Libraries/Screen.lua")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/.system/Libraries/System.lua", "/.system/Libraries/System.lua")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/.system/Libraries/Text.lua", "/.system/Libraries/Text.lua")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/.system/Libraries/Vector.lua", "/.system/Libraries/Vector.lua")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/.system/Libraries/MeowEngine/Main.lua", "/.system/Libraries/MeowEngine/Main.lua")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/.system/Libraries/OpenComputersGL/Main.lua", "/.system/Libraries/OpenComputersGL/Main.lua")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/.system/Libraries/OpenComputersGL/Materials.lua", "/.system/Libraries/OpenComputersGL/Materials.lua")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/.system/Libraries/OpenComputersGL/Renderer.lua", "/.system/Libraries/OpenComputersGL/Renderer.lua")
		-- SettingFiles
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/.system/SettingFiles/0_Screen/Main.lua", "/.system/SettingFiles/0_Screen/Main.lua")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/.system/SettingFiles/0_Screen/Icon.pic", "/.system/SettingFiles/0_Screen/Icon.pic")

		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/.system/SettingFiles/1_Wallpaper/Main.lua", "/.system/SettingFiles/1_Wallpaper/Main.lua")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/.system/SettingFiles/1_Wallpaper/Icon.pic", "/.system/SettingFiles/1_Wallpaper/Icon.pic")

		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/.system/SettingFiles/2_Icons/Main.lua", "/.system/SettingFiles/2_Icons/Main.lua")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/.system/SettingFiles/2_Icons/Icon.pic", "/.system/SettingFiles/2_Icons/Icon.pic")

		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/.system/SettingFiles/3_Tasks/Main.lua", "/.system/SettingFiles/3_Tasks/Main.lua")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/.system/SettingFiles/3_Tasks/Icon.pic", "/.system/SettingFiles/3_Tasks/Icon.pic")

		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/.system/SettingFiles/4_Disks/Main.lua", "/.system/SettingFiles/4_Disks/Main.lua")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/.system/SettingFiles/4_Disks/Icon.pic", "/.system/SettingFiles/4_Disks/Icon.pic")

		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/.system/SettingFiles/5_Network/Main.lua", "/.system/SettingFiles/5_Network/Main.lua")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/.system/SettingFiles/5_Network/Icon.pic", "/.system/SettingFiles/5_Network/Icon.pic")

		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/.system/SettingFiles/6_Localizations/Main.lua", "/.system/SettingFiles/6_Localizations/Main.lua")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/.system/SettingFiles/6_Localizations/Icon.pic", "/.system/SettingFiles/6_Localizations/Icon.pic")

		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/.system/SettingFiles/7_Time/Main.lua", "/.system/SettingFiles/7_Time/Main.lua")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/.system/SettingFiles/7_Time/Icon.pic", "/.system/SettingFiles/7_Time/Icon.pic")

		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/.system/SettingFiles/8_System/Main.lua", "/.system/SettingFiles/8_System/Main.lua")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/.system/SettingFiles/8_System/Icon.pic", "/.system/SettingFiles/8_System/Icon.pic")

		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/.system/SettingFiles/9_Update/Main.lua", "/.system/SettingFiles/9_Update/Main.lua")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/.system/SettingFiles/9_Update/Icon.pic", "/.system/SettingFiles/9_Update/Icon.pic")

		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/.system/SettingFiles/40_Users/Main.lua", "/.system/SettingFiles/40_Users/Main.lua")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/.system/SettingFiles/40_Users/Icon.pic", "/.system/SettingFiles/40_Users/Icon.pic")

		fs.rename("/Localizations", "/Localizations.Old")

		Event.sleep(2)

		-- Localizations
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/Localizations/Arabic.lang", "/Localizations/Arabic.lang")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/Localizations/Belarusian.lang", "/Localizations/Belarusian.lang")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/Localizations/Bengali.lang", "/Localizations/Bengali.lang")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/Localizations/Bulgarian.lang", "/Localizations/Bulgarian.lang")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/Localizations/Chinese.lang", "/Localizations/Chinese.lang")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/Localizations/Danish.lang", "/Localizations/Danish.lang")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/Localizations/Dutch.lang", "/Localizations/Dutch.lang")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/Localizations/English.lang", "/Localizations/English.lang")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/Localizations/Finnish.lang", "/Localizations/Finnish.lang")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/Localizations/French.lang", "/Localizations/French.lang")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/Localizations/German.lang", "/Localizations/German.lang")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/Localizations/Hindi.lang", "/Localizations/Hindi.lang")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/Localizations/Italian.lang", "/Localizations/Italian.lang")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/Localizations/Japanese.lang", "/Localizations/Japanese.lang")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/Localizations/Korean.lang", "/Localizations/Korean.lang")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/Localizations/Lolcat.lang", "/Localizations/Lolcat.lang")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/Localizations/Polish.lang", "/Localizations/Polish.lang")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/Localizations/Portuguese.lang", "/Localizations/Portuguese.lang")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/Localizations/Russian.lang", "/Localizations/Russian.lang")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/Localizations/Slovak.lang", "/Localizations/Slovak.lang")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/Localizations/Spanish.lang", "/Localizations/Spanish.lang")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/Localizations/Ukrainian.lang", "/Localizations/Ukrainian.lang")
		-- Installing and uninstalling programs like Finder.app and File Explorer.app
		-- Settings
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/Programs/Settings.app/Main.lua", "/Programs/Settings.app/Main.lua")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/Programs/Settings.app/Icon.pic", "/Programs/Settings.app/Icon.pic")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/Programs/Settings.app/Localizations/Chinese.lang", "/Programs/Settings.app/Localizations/Chinese.lang")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/Programs/Settings.app/Localizations/Dutch.lang", "/Programs/Settings.app/Localizations/Dutch.lang")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/Programs/Settings.app/Localizations/English.lang", "/Programs/Settings.app/Localizations/English.lang")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/Programs/Settings.app/Localizations/French.lang", "/Programs/Settings.app/Localizations/French.lang")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/Programs/Settings.app/Localizations/German.lang", "/Programs/Settings.app/Localizations/German.lang")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/Programs/Settings.app/Localizations/Italian.lang", "/Programs/Settings.app/Localizations/Italian.lang")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/Programs/Settings.app/Localizations/Japanese.lang", "/Programs/Settings.app/Localizations/Japanese.lang")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/Programs/Settings.app/Localizations/Russian.lang", "/Programs/Settings.app/Localizations/Russian.lang")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/Programs/Settings.app/Localizations/Spanish.lang", "/Programs/Settings.app/Localizations/Spanish.lang")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/Programs/Settings.app/Localizations/Ukrainian.lang", "/Programs/Settings.app/Localizations/Ukrainian.lang")
    	-- File Explorer
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/Programs/File%20Explorer.app/Main.lua", "/Programs/File Explorer.app/Main.lua")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/Programs/File%20Explorer.app/Icon.pic", "/Programs/File Explorer.app/Icon.pic")
		-- Console
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/Programs/Console.app/Main.lua", "/Programs/Console.app/Main.lua")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/Programs/Console.app/Icon.pic", "/Programs/Console.app/Icon.pic")
		-- MineCode IDE
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/Programs/MineCode%20IDE.app/Main.lua", "/Programs/MineCode IDE.app/Main.lua")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/Programs/MineCode%20IDE.app/Icon.pic", "/Programs/MineCode IDE.app/Icon.pic")
		fs.copy("/Applications/MineCode IDE.app/Localizations", "/Programs/MineCode IDE.app/Localizations")
		fs.copy("/Applications/MineCode IDE.app/Extensions", "/Programs/MineCode IDE.app/Extensions")
		-- Painter
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/Programs/Painter.app/Main.lua", "/Programs/Painter.app/Main.lua")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/Programs/Painter.app/Icon.pic", "/Programs/Painter.app/Icon.pic")
		fs.copy("/Applications/Picture Edit.app/Tools", "/Programs/Painter.app/Tools")
		fs.copy("/Applications/Picture Edit.app/Localizations", "/Programs/Painter.app/Localizations")
		fs.copy("/Applications/Picture Edit.app/Extensions", "/Programs/Painter.app/Extensions")
		-- Viewer
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/Programs/Viewer.app/Main.lua", "/Programs/Viewer.app/Main.lua")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/SnowyHill/Programs/Viewer.app/Icon.pic", "/Programs/Viewer.app/Icon.pic")
		fs.copy("/Applications/Picture View.app/Icons", "/Programs/Viewer.app/Icons")
		fs.copy("/Applications/Picture View.app/Localizations", "/Programs/Viewer.app/Localizations")
		fs.copy("/Applications/Picture View.app/Extensions", "/Programs/Viewer.app/Extensions")

		-- Creating Backup folder
		if fs.exists("/Backup") then
			fs.remove("/Backup")
			fs.makeDirectory("/Backup")
		else
			fs.makeDirectory("/Backup")
		end

		fs.rename("/Applications/Picture Edit.app", "/Backup/Picture Edit.app")
		fs.rename("/Applications/Picture View.app", "/Backup/Picture View.app")
		fs.rename("/Applications/Finder.app", "/Backup/Finder.app")

		-- Updating Dock settings
		local s
		s = fs.read(paths.user.settings)

		fs.makeDirectory("/Backup/Users")

		s = string.gsub(s, "/Applications/Finder.app", "/Programs/File Explorer.app")
		s = string.gsub(s, "/Applications/Picture Edit.app", "/Programs/Painter.app")
		s = string.gsub(s, "/Applications/Picture View.app", "/Programs/Viewer.app")
		s = string.gsub(s, "/Applications/Settings.app", "/Programs/Settings.app")
		s = string.gsub(s, "/Applications/MineCode IDE.app", "/Programs/MineCode IDE.app")

		fs.rename(paths.user.settings, "/Backup/Users/Settings.cfg")
		fs.write(paths.user.settings, s)
		-- Installing The eeprom program HillOS uses.
		FlashHillOSUEFI()

		-- Checking if you have Lua 5.3. if you have it then reboot the system.
		if computer.getArchitecture and computer.getArchitecture() == "Lua 5.2" then
			local computer = require("computer")
			computer.setArchitecture("Lua 5.3")
		else
			computer.shutdown(true)
		end
	end

	local ss = window.contentLayout:addChild(GUI.text(1, 1, 0x2D2D2D, "Update IMineOS PC"))
	--ss()
	local iconButton = addButton(window.contentLayout, 1, 36, "Update")
	local wallpaperSwitch = window.contentLayout:addChild(GUI.switchAndLabel(1, 1, 36, 8, 0x66DB80, 0xE1E1E1, 0xFFFFFF, 0xA5A5A5, "Update Settings and Finder", false))
	local efiSwitch = window.contentLayout:addChild(GUI.switchAndLabel(1, 1, 36, 8, 0x66DB80, 0xE1E1E1, 0xFFFFFF, 0xA5A5A5, "Update BIOS", false))
	local function checkLicense()

		end
	local function replaceloader()
		--internet.download(url, text)


		if fs.exists("/Backup") then
			fs.remove("/Backup")
			fs.makeDirectory("/Backup")
		else
			fs.makeDirectory("/Backup")
		end
		--ss.text = "Downloading and installing update"
		--wait(0.1)
		--if fs.exists("/.com.IMineOS.EFI") then
		--	fs.copy("/.com.IMineOS.EFI/", "/Backup/.com.IMineOS.EFI/")
		--	fs.remove("/.com.IMineOS.EFI")
		--elseif fs.exists("/OS__.lua") then
		--	fs.copy("/OS__.lua", "/Backup/OS__.lua")
		--	fs.remove("/OS__.lua")
		--end
		--fs.copy("/.com.IMineOS.EFI/", "/Backup/EFI-OLD/")
		ss.text = "Backing Up"
		fs.copy("/Libraries/", "/Backup/Libraries/")
		fs.remove("/Libraries/")
		fs.makeDirectory("/Libraries")
		internet.download("https://raw.githubusercontent.com/youaregod666/IMineOS_BIOS/master/Libraries/BigLetters.lua", "/Libraries/BigLetters.lua")
		internet.download("https://raw.githubusercontent.com/youaregod666/IMineOS_BIOS/master/Libraries/Bit32.lua", "/Libraries/Bit32.lua")
		internet.download("https://raw.githubusercontent.com/youaregod666/IMineOS_BIOS/master/Libraries/Color.lua", "/Libraries/Color.lua")
		internet.download("https://raw.githubusercontent.com/youaregod666/IMineOS_BIOS/master/Libraries/Component.lua", "/Libraries/Component.lua")
		internet.download("https://raw.githubusercontent.com/youaregod666/IMineOS_BIOS/master/Libraries/Compressor.lua", "/Libraries/Compressor.lua")
		internet.download("https://raw.githubusercontent.com/youaregod666/IMineOS_BIOS/master/Libraries/Event.lua", "/Libraries/Event.lua")
		internet.download("https://raw.githubusercontent.com/youaregod666/IMineOS_BIOS/master/Libraries/Filesystem.lua", "/Libraries/Filesystem.lua")
		internet.download("https://raw.githubusercontent.com/youaregod666/IMineOS_BIOS/master/Libraries/GUI.lua", "/Libraries/GUI.lua")
		internet.download("https://raw.githubusercontent.com/youaregod666/IMineOS_BIOS/master/Libraries/Image.lua", "/Libraries/Image.lua")
		internet.download("https://raw.githubusercontent.com/youaregod666/IMineOS_BIOS/master/Libraries/Internet.lua", "/Libraries/Internet.lua")
		internet.download("https://raw.githubusercontent.com/youaregod666/IMineOS_BIOS/master/Libraries/JSON.lua", "/Libraries/JSON.lua")
		internet.download("https://raw.githubusercontent.com/youaregod666/IMineOS_BIOS/master/Libraries/Keyboard.lua", "/Libraries/Keyboard.lua")
		internet.download("https://raw.githubusercontent.com/youaregod666/IMineOS_BIOS/master/Libraries/Network.lua", "/Libraries/Network.lua")
		internet.download("https://raw.githubusercontent.com/youaregod666/IMineOS_BIOS/master/Libraries/Number.lua", "/Libraries/Number.lua")
		internet.download("https://raw.githubusercontent.com/youaregod666/IMineOS_BIOS/master/Libraries/Paths.lua", "/Libraries/Paths.lua")
		internet.download("https://raw.githubusercontent.com/youaregod666/IMineOS_BIOS/master/Libraries/SHA-256.lua", "/Libraries/SHA-256.lua")
		internet.download("https://raw.githubusercontent.com/youaregod666/IMineOS_BIOS/master/Libraries/Screen.lua", "/Libraries/Screen.lua")
		internet.download("https://raw.githubusercontent.com/youaregod666/IMineOS_BIOS/master/Libraries/System.lua", "/Libraries/System.lua")
		internet.download("https://raw.githubusercontent.com/youaregod666/IMineOS_BIOS/master/Libraries/Text.lua", "/Libraries/Text.lua")
		internet.download("https://raw.githubusercontent.com/youaregod666/IMineOS_BIOS/master/Libraries/Vector.lua", "/Libraries/Vector.lua")
		internet.download("https://raw.githubusercontent.com/youaregod666/IMineOS_BIOS/master/Applications/Settings.app/Modules/9_Update/Main.lua", "/Applications/Settings.app/Modules/9_Update/Main.lua")
		internet.download("https://raw.githubusercontent.com/youaregod666/IMineOS_BIOS/master/Applications/Settings.app/Modules/9_Update/Icon.pic", "/Applications/Settings.app/Modules/9_Update/Icon.pic")
		if fs.exists("/Libraries/MeowEngine") then
			if fs.exists("/Libraries/OpenComputersGL") then
				internet.download("https://raw.githubusercontent.com/youaregod666/IMineOS_BIOS/master/Libraries/MeowEngine/Main.lua", "/Libraries/MeowEngine/Main.lua")
				internet.download("https://raw.githubusercontent.com/youaregod666/IMineOS_BIOS/master/Libraries/OpenComputersGL/Main.lua", "/Libraries/OpenComputersGL/Main.lua")
				internet.download("https://raw.githubusercontent.com/youaregod666/IMineOS_BIOS/master/Libraries/OpenComputersGL/Materials.lua", "/Libraries/OpenComputersGL/Materials.lua")
				internet.download("https://raw.githubusercontent.com/youaregod666/IMineOS_BIOS/master/Libraries/OpenComputersGL/Renderer.lua", "/Libraries/OpenComputersGL/Renderer.lua")
			end
		end
		if	wallpaperSwitch.switch.state == true then
			--internet.download("https://raw.githubusercontent.com/youaregod666/IMineOS_BIOS/master/Libraries/Vector.lua", "/f.lua")
		--end
		--if wallpaperSwitch.Switchstat == true then
			fs.makeDirectory("/Backup/Applications")
			fs.copy("/Applications/Finder.app", "/Backup/Applications/Finder.app")
			fs.copy("/Applications/Settings.app", "/Backup/Applications/Settings.app")
			internet.download("https://raw.githubusercontent.com/youaregod666/IMineOS_BIOS/master/Applications/Finder.app/Main.lua", "/Applications/Finder.app/Main.lua")
			internet.download("https://raw.githubusercontent.com/youaregod666/IMineOS_BIOS/master/Applications/Finder.app/Icon.pic", "/Applications/Finder.app/Icon.pic")
			--internet.download("https://raw.githubusercontent.com/youaregod666/IMineOS_BIOS/master/https://github.com/youaregod666/IMineOS_BIOS/tree/main/Applications/Settings.app/Main.lua", "/Applications/Settings.app/Main.lua")
			internet.download("https://raw.githubusercontent.com/youaregod666/IMineOS_BIOS/master/Applications/Settings.app/Icon.pic", "/Applications/Settings.app/Icon.pic")



		end
		if	efiSwitch.switch.state == true then
			flashEFI("https://raw.githubusercontent.com/youaregod666/IMineOS_BIOS/master/EFI/Minified.lua")
		end
		--fs.remove("/Libraries/" .. text .. ".lua")
		--fs.rename("/Libraries/" .. text ..".lua", "/OS__.lua")

		computer.shutdown(true)
	end

	window.contentLayout:addChild(GUI.text(1, 1, 0x2D2D2D, "Make a Backup"))
	iconButton.onTouch = function()
		replaceloader()
	end
	--space:draw()
	local iconButton2 = addButton(window.contentLayout, 1, 36, "Remove Backup")
	iconButton2.onTouch = function()
		if fs.exists("/Backup") then
			fs.remove("/Backup")
		else
			GUI.alert("No Backup Folder")
		end
	end
	local iconButton3 = addButton(window.contentLayout, 1, 36, "Restore past version")
	iconButton3.onTouch = function()
		if fs.exists("/Backup") then
			fs.remove("/Libraries/")
			fs.copy("/Backup/", "/")
		else
			GUI.alert("No Backup Folder")
		end
	end
	window.contentLayout:addChild(GUI.text(1, 1, 0x2D2D2D, ""))
	window.contentLayout:addChild(GUI.text(1, 1, 0x2D2D2D, "Update to HillOS"))
	local iconButton7 = addButton(window.contentLayout, 1, 36, "Update")
	iconButton7.onTouch = function()
		DownloadHillOS()
	end




		--fs.remove("/Libraries/" .. text .. ".lua")
		--fs.rename("/Libraries/" .. text ..".lua", "/OS__.lua")
	end
--------------------------------------------------------------------------------

return module


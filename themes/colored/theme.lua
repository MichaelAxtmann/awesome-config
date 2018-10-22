-----------------------------------------------------------------------------------------------------------------------
--                                     Shared settings for colored themes                                            --
-----------------------------------------------------------------------------------------------------------------------
local awful = require("awful")

-- This theme inherited from colorless with overwriting some values
local theme = require("themes/colorless/theme")


-- Common
-----------------------------------------------------------------------------------------------------------------------
theme.path = awful.util.get_configuration_dir() .. "themes/colored"

-- Main config
------------------------------------------------------------

theme.panel_height        = 36 -- panel height
theme.border_width        = 4  -- window border width
theme.useless_gap         = 4  -- useless gap

theme.cellnum = { x = 96, y = 58 } -- grid layout property

-- Fonts
------------------------------------------------------------
theme.fonts = {
	main     = "Roboto 13",      -- main font
	menu     = "Roboto 13",      -- main menu font
	tooltip  = "Roboto 13",      -- tooltip font
	notify   = "Play bold 14",   -- redflat notify popup font
	clock    = "Play bold 12",   -- textclock widget font
	qlaunch  = "Play bold 14",   -- quick launch key label font
	keychain = "Play bold 16",   -- key sequence tip font
	title    = "Roboto bold 13", -- widget titles font
	titlebar = "Roboto bold 13", -- client titlebar font
	hotkeys  = {
		main  = "Roboto 14",             -- hotkeys helper main font
		key   = "Iosevka Term Light 14", -- hotkeys helper key font (use monospace for align)
		title = "Roboto bold 16",        -- hotkeys helper group title font
	},
	player   = {
		main = "Play bold 13", -- player widget main font
		time = "Play bold 15", -- player widget current time font
	},
}

theme.cairo_fonts = {
	tag         = { font = "Play", size = 16, face = 1 }, -- tag widget font
	appswitcher = { font = "Play", size = 20, face = 1 }, -- appswitcher widget font
	navigator   = {
		title = { font = "Play", size = 28, face = 1, slant = 0 }, -- window navigation title font
		main  = { font = "Play", size = 22, face = 1, slant = 0 }  -- window navigation  main font
	},
}

-- Main theme settings
-- Make it updatabele since it may depends on common and ancestor theme settings
-----------------------------------------------------------------------------------------------------------------------

-- overwrite ancestor update settings with current theme values
function theme:update()

	-- setup ancestor settings
	self:init()

	-- Set hotkey helper size according current fonts
	--------------------------------------------------------------------------------
	self.service.navigator.keytip["fairv"] = { geometry = { width = 600, height = 440 }, exit = true }
	self.service.navigator.keytip["fairh"] = self.service.navigator.keytip["fairv"]

	self.service.navigator.keytip["tile"] = { geometry = { width = 600, height = 660 }, exit = true }
	self.service.navigator.keytip["tileleft"]   = self.service.navigator.keytip["tile"]
	self.service.navigator.keytip["tiletop"]    = self.service.navigator.keytip["tile"]
	self.service.navigator.keytip["tilebottom"] = self.service.navigator.keytip["tile"]

	self.service.navigator.keytip["grid"] = { geometry = { width = 1400, height = 520 }, column = 2, exit = true }
	self.service.navigator.keytip["usermap"] = { geometry = { width = 1400, height = 580 }, column = 2, exit = true }

	-- Desktop file parser
	--------------------------------------------------------------------------------
	self.service.dfparser.icons.theme         = self.homedir .. "/.icons/ACYLS"
	self.service.dfparser.icons.custom_only   = true
	self.service.dfparser.icons.scalable_only = true

	-- Menu config
	--------------------------------------------------------------------------------
	self.menu.icon_margin  = { 4, 7, 7, 8 }
	self.menu.keytip       = { geometry = { width = 400, height = 380 } }

	-- Gauge style
	--------------------------------------------------------------------------------

	-- Panel widgets
	--------------------------------------------------------------------------------

	-- Default awesome theme vars
	--------------------------------------------------------------------------------
	self.enable_spawn_cursor = false
end

-- End
-----------------------------------------------------------------------------------------------------------------------
theme:update()

return theme

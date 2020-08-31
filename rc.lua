-----------------------------------------------------------------------------------------------------------------------
--                                                   Base setup                                                      --
-----------------------------------------------------------------------------------------------------------------------

-- Configuration file selection
-----------------------------------------------------------------------------------------------------------------------
local rc = "colorless.rc-colorless"

--local rc = "color.red.rc-red"
--local rc = "color.blue.rc-blue"
--local rc = "color.orange.rc-orange"
--local rc = "color.green.rc-green"

-- local rc = "shade.ruby.rc-ruby"
--local rc = "shade.steel.rc-steel"

require(rc)

os.execute("nm-applet &")
os.execute("dropbox start &")
os.execute("keepass2 &")
os.execute("blueman-applet &")


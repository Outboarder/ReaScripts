--[[
Description: Move Edit Cursor Left By 50 ms
Version: 1.0
Author: Outboarder
REAPER: 5.40
Licence: GPL v3
--]]

--[[
Changelog:
+ Initial Release v1.0 (2017-07-05) 
--]]

ms = 50   --> set time in ms

function move_cursor_left()

move = ms/1000
cur_pos = reaper.GetCursorPosition()
reaper.SetEditCurPos( cur_pos - move, 1, 0 )

end

move_cursor_left()
reaper.UpdateArrange()
--[[
Description: Move Edit Cursor (x) ms
Version: 1.0
Author: Outboarder
REAPER: 5.40
Licence: GPL v3
--]]

--[[
Changelog:
+ Initial Release v1.0 (2017-07-05) 
--]]

retval, ms = reaper.GetUserInputs("Move Edit Cursor -/+ Millisecond", 1, "-/+ Millisecond",'') 

function move_cursor_x()

move = ms/1000
cur_pos = reaper.GetCursorPosition()
reaper.SetEditCurPos( cur_pos + move, 1, 0 )

end

move_cursor_x()
reaper.UpdateArrange()

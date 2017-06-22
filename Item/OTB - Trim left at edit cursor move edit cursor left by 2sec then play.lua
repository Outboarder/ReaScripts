--[[
Description: Trim left at edit cursor move edit cursor left by 2sec
Instructions:
Screenshot:
Version: 1.0
Author: Outboarder
Changelog:
REAPER: 5.40
Licence: GPL v3
--]]

--[[
Changelog:
+ Initial Release v1.0 (2017-02-01)
--]]


-------USER AREA---------
edit_cursor_offset = 2   --offset time in sec 

-------------------------

function Main()
  reaper.Undo_BeginBlock() 
  media_item = reaper.GetSelectedMediaItem( 0, 0 )
  if media_item ~= nil then
  cursor_pos =  reaper.GetCursorPosition() 
  reaper.ApplyNudge( 0, 1, 1, 0, cursor_pos, 0, 0 )
  pos = reaper.GetMediaItemInfo_Value( media_item, "D_POSITION"  )
  len = reaper.GetMediaItemInfo_Value( media_item, "D_LENGTH" ) 
  reaper.SetEditCurPos( pos - edit_cursor_offset, 1, 1 ) 
  reaper.Undo_EndBlock("Trim left at edit cursor move edit cursor left by 2sec", 0)
  
  reaper.OnPlayButton()
  end  
end
Main()  
reaper.UpdateArrange()



--[[
Description: Trim selected item to nearest item on left side
Instructions:  SWS needed to run
Screenshot: 
Version: 1.0
Author: Outboarder
REAPER: 5.40
Licence: GPL v3
--]]

--[[
Changelog:
+ Initial Release v1.0 (2017-20-05) 
--]]


function Trim_To_Left_Item()
  reaper.Undo_BeginBlock() 
  media_item = reaper.GetSelectedMediaItem( 0, 0 )
  reaper.Main_OnCommand(reaper.NamedCommandLookup("_SWS_SELPREVITEM"), 0)  
  media_item2 = reaper.GetSelectedMediaItem( 0, 0 )
  
  
  if media_item2 == media_item then 
     media_item2 = reaper.GetSelectedMediaItem( 0, 0 )
     reaper.ApplyNudge( 0, 1, 1, 0, 0, 0, 0 )
  else
    pos2 = reaper.GetMediaItemInfo_Value( media_item2, "D_POSITION"  )
    len2 = reaper.GetMediaItemInfo_Value( media_item2, "D_LENGTH" ) 
    end2 = pos2+len2
    reaper.Main_OnCommand(reaper.NamedCommandLookup("_SWS_SELNEXTITEM"), 0)  
    media_item1 = reaper.GetSelectedMediaItem( 0, 0 )
    reaper.ApplyNudge( 0, 1, 1, 0, end2, 0, 0 )  --trim left
  end
  reaper.Undo_EndBlock("Trim_selected_item_to_nearest_item_on_left_side", 0)
end  

Trim_To_Left_Item()  
reaper.UpdateArrange()

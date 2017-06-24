--[[
Description: Move items (overlap) Crossfade between selected items
Instructions:
Screenshot: 
Version: 1.0
Author: Outboarder
REAPER: 5.50
Licence: GPL v3
--]]

--[[
Changelog:
+ Initial Release v1.0 (2017-16-06) 
--]]

retval, retvals_csv = reaper.GetUserInputs( "Crossfade Overlap Time", 1, "Overlape Length ms", "500" )
crossfade_time = retvals_csv/1000 -- set time in ms 

function Overlap()
  Item_count = reaper.CountSelectedMediaItems( 0 )
   
  for i=0 , Item_count-1 do
    
    media_item = reaper.GetSelectedMediaItem( 0, i )
    if media_item ~= nil then
       item_pos =  reaper.GetMediaItemInfo_Value( media_item, 'D_POSITION' )
       item_length = reaper.GetMediaItemInfo_Value( media_item, 'D_LENGTH' )
       reaper.SetMediaItemInfo_Value(media_item ,'D_FADEOUTLEN_AUTO',crossfade_time)
       item_end = item_pos + item_length - (crossfade_time)
       media_item2 = reaper.GetSelectedMediaItem( 0, i+1 )
       if media_item2 ~= nil then
           reaper.SetMediaItemInfo_Value( media_item2, 'D_POSITION',item_end ) 
           reaper.SetMediaItemInfo_Value(media_item2 ,'D_FADEINLEN_AUTO',crossfade_time)   
       end
     end
  end
end

reaper.Undo_BeginBlock()
Overlap()
reaper.Undo_EndBlock( "Crossfade between selected items", -1 )
reaper.UpdateArrange()


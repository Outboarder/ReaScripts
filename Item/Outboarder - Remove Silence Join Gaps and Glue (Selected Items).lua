--[[
Description: Remove Silence Join Gaps and Glue(Selected Items)
Instructions:
Screenshot: 
Version: 1.0
Author: Outboarder
REAPER: 5.33
Licence: GPL v3
--]]

--[[
Changelog:
+ Initial Release v1.0 (2017-09-02) 
--]]

function Remove_Gaps_Between_Selected_Items_Glue()
     reaper.Main_OnCommand(40315,0)
	 count_sel_items = reaper.CountSelectedMediaItems(0)
	 --retval1, margin = reaper.GetUserInputs("Margin", 1, "ms", '0') 
	 margin = 0
	 for i = 0 ,count_sel_items+1 do
	     media_item1 = reaper.GetMediaItem( 0, i ) 
		 if media_item1 ~= nil then
			 item_pos = reaper.GetMediaItemInfo_Value( media_item1, 'D_POSITION' )
			 item_length = reaper.GetMediaItemInfo_Value( media_item1, 'D_LENGTH' )		 
			 new_pos = item_pos + item_length + (tonumber(margin)*0.001)
			 media_item2 = reaper.GetMediaItem( 0, i+1 ) 
			 if media_item2 ~= nil then
			 reaper.SetMediaItemInfo_Value( media_item2, 'D_POSITION', new_pos )
			 end
		 end
	end	
	reaper.Main_OnCommand(41588,0)
end


function Main()
	reaper.Undo_BeginBlock()			
	Remove_Gaps_Between_Selected_Items_Glue()
	reaper.Undo_EndBlock("Remove_Gaps_Between_Selected_Items_Glue", 0)
end  

Main()  
reaper.UpdateArrange()





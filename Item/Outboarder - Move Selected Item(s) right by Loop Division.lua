--[[
Description: Move Selected Item(s) Right by Time selection 
Instructions:
Screenshot: 
Version: 1.0
Author: Outboarder
REAPER: 5.35
Licence: GPL v3
--]]

--[[
Changelog:
+ Initial Release v1.0 (2017-02-05) 
--]]

function Move_Items_Right_Grid()
	 count_sel_items = reaper.CountSelectedMediaItems(0)
	 startOut , endOut = reaper.GetSet_LoopTimeRange( 0, 0, 0, 0, 0 )
	 lenOut = endOut - startOut
	 if  lenOut > 0 then
			reaper.ApplyNudge(0,0,0,1,lenOut,0,0)
	 end
end


function Main()
	reaper.Undo_BeginBlock()			
	Move_Items_Right_Grid()
	reaper.Undo_EndBlock("Move_Items_Right_Time_Selection", 0)
end  

Main()  
reaper.UpdateArrange()




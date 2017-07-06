--[[
Description: UnFreeze Tracks custom TCP-MCP layout
Instructions: Enter the layout name of the current theme in the User area  "Layout name"
Screenshot:
Version: 1.0
Author: Outboarder
Changelog:
REAPER: 5.33
Licence: GPL v3
--]]

--[[
Changelog:
+ Initial Release v1.0 (2017-17-03)
--]]


------User Area-----
TCP_layout = "aa - Standard"     --Track panel layout name 
MCP_layout = "aa - Standard"     --Mixer Track layout
--------------------


function UnFreeze_Layout()

	reaper.Main_OnCommand(41644,0)  --Track: Unfreeze tracks (restore previously saved items and FX)
	reaper.Main_OnCommand(40689,0)  --Item properties: Unlock
	count_sel_tracks = reaper.CountSelectedTracks( 0 )
	for i = 0 ,count_sel_tracks-1 do
		media_track = reaper.GetSelectedTrack( 0, i )
		reaper.GetSetMediaTrackInfo_String( media_track, "P_TCP_LAYOUT", TCP_layout, 1  )
		reaper.GetSetMediaTrackInfo_String( media_track, "P_MCP_LAYOUT", MCP_layout, 1  )
	end
	 
end

function Main()
	reaper.Undo_BeginBlock()                  
	UnFreeze_Layout()
	reaper.Undo_EndBlock("UnFreeze_Layout", 0)
end  

Main()  
reaper.UpdateArrange()



	

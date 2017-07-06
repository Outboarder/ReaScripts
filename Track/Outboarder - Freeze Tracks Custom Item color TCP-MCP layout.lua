--[[
Description: Freeze Tracks custom Item color and TCP-MCP layout 
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

-----Available Colors-----
blue = reaper.ColorToNative(0,0,255)|0x1000000
red = reaper.ColorToNative(255,0,0)|0x1000000
green = reaper.ColorToNative(0,255,0)|0x1000000
cyan = reaper.ColorToNative(0,255,255)|0x1000000
magenta = reaper.ColorToNative(255,0,255)|0x1000000
yellow = reaper.ColorToNative(255,255,0)|0x1000000
orange = reaper.ColorToNative(255,125,0)|0x1000000
purple = reaper.ColorToNative(125,0,225)|0x1000000
lightblue = reaper.ColorToNative(0,160,200)|0x1000000
lightgreen = reaper.ColorToNative(125,255,155)|0x1000000
pink = reaper.ColorToNative(225,95,155)|0x1000000
brown = reaper.ColorToNative(125,95,25)|0x1000000
gray = reaper.ColorToNative(125,125,125)|0x1000000
white =  reaper.ColorToNative(255,255,255)|0x1000000
Black =  reaper.ColorToNative(0,0,0)|0x1000000


--------User Area--------
color = lightblue                               --choose one of the colors above 
TCP_layout = "bd --- Small Full Meter"          --Track panel layout name 
MCP_layout = "dd --- Session Mixer Blue Fader"  --Mixer Track layout
-------------------------


function Freeze_Layout_TCP_MCP()
	reaper.Main_OnCommand(41223,0)  --Track: Freeze to stereo (render pre-fader, save/remove items and online FX)
	reaper.Main_OnCommand(40421,0)  --Item: Select all items in track
	
	count_sel_tracks = reaper.CountSelectedTracks( 0 )
	for i = 0 ,count_sel_tracks-1 do
		media_track = reaper.GetSelectedTrack( 0, i )
		reaper.GetSetMediaTrackInfo_String( media_track, "P_TCP_LAYOUT", TCP_layout, 1  )
		reaper.GetSetMediaTrackInfo_String( media_track, "P_MCP_LAYOUT", MCP_layout, 1  )
		item_count = reaper.GetTrackNumMediaItems( media_track )
		for j = 0 ,item_count-1 do
			media_item = reaper.GetTrackMediaItem( media_track, j )
			reaper.SetMediaItemInfo_Value( media_item, "I_CUSTOMCOLOR", color )
			reaper.Main_OnCommand(40689,0)  --Item properties: Unlock
		end
	end  
	reaper.Main_OnCommand(40289,0) --Unselect all items  
end

function Main()
	reaper.Undo_BeginBlock()                  
	Freeze_Layout_TCP_MCP()
	reaper.Undo_EndBlock("Freeze_Layout", 0)
end  

Main()  
reaper.UpdateArrange()



	

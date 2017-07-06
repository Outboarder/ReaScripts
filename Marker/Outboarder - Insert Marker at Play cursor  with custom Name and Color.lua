--[[
Description: Insert Marker at Play cursor with Custom Name and Color
Instructions:
Screenshot:
Version: 1.0
Author: Outboarder
Changelog:
REAPER: 5.32
Licence: GPL v3
--]]

--[[
Changelog:
+ Initial Release v1.0 (2017-06-02)
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
lightblue = reaper.ColorToNative(13,165,175)|0x1000000
lightgreen = reaper.ColorToNative(125,255,155)|0x1000000
pink = reaper.ColorToNative(225,95,155)|0x1000000
brown = reaper.ColorToNative(125,95,25)|0x1000000
gray = reaper.ColorToNative(125,125,125)|0x1000000
white =  reaper.ColorToNative(255,255,255)|0x1000000
Black =  reaper.ColorToNative(0,0,0)|0x1000000
---------------------------

---------USER AREA---------

name = "Edit the Script to change the name & color"   --<<<<<<--Marker Name
color = brown      --<<<<<<--Marker Color
--------------------------

function Insert_Marker_Custom_Name_Color()   
	cursor_pos = reaper.GetCursorPosition()
	play_pos = reaper.GetPlayPosition()
	marker_index, num_markersOut, num_regionsOut = reaper.CountProjectMarkers( 0 )
	reaper.AddProjectMarker2( 0, 0, play_pos, 0, name, marker_index+1,color ) 
end

function Main()
	reaper.Undo_BeginBlock()               
	Insert_Marker_Custom_Name_Color()
	reaper.Undo_EndBlock("Insert_Marker_Custom_Name_Color", 0)
end  

Main()  
reaper.UpdateArrange()


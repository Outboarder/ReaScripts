--[[
Description: Cycle Backward Arm and Monitor state thru selected tracks 
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
+ Initial Release v1.0 (2017-23-05)
--]]

Command = "I_RECARM"
Command2 = "I_RECMON"
direction = -1

function msg(m)                         
  reaper.ShowConsoleMsg(tostring(m) .. '\n')
end

function setn(t,n)
    setmetatable(t,{__len=function() return n end})
end

function RotateTable( array, shift ) 
    shift = shift or 1 
    
    if shift > 0 then
      for i = 1, math.abs(shift) do
          table.insert( array, 1, table.remove( array, #array ) )
      end
  else
    for i = 1, math.abs(shift) do
          table.insert( array, #array, table.remove( array, 1 ) )
      end  
  end
end

function Cycle_Compare()
  count_sel_tracks = reaper.CountSelectedTracks( 0 )-1
  solo_array={}
  setn(solo_array, count_sel_tracks+1)
 
  for i = 0 ,count_sel_tracks do
    media_track = reaper.GetSelectedTrack( 0, i )
    solo_state = reaper.GetMediaTrackInfo_Value( media_track, Command)
    solo_state = reaper.GetMediaTrackInfo_Value( media_track, Command2)
      table.insert (solo_array, i+1, solo_state)
      if i >= count_sel_tracks then
      RotateTable(solo_array,direction)
		  for j = 0,count_sel_tracks do 
			media_track = reaper.GetSelectedTrack( 0, j )
			reaper.SetMediaTrackInfo_Value( media_track, Command, solo_array[j+1] )
			reaper.SetMediaTrackInfo_Value( media_track, Command2, solo_array[j+1] )
		  end
      end
    end
end


function Main()
  reaper.Undo_BeginBlock()                  
  Cycle_Compare()
  reaper.Undo_EndBlock("Cycle_Arm", 0)
end  
Main()  
reaper.UpdateArrange()

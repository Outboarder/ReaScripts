--[[
Description: Create Stereo Send from selected tracks to track under mouse (increment send channel)
Instructions:
Screenshot: 
Version: 1.0
Author: Outboarder
REAPER: 5.40
Licence: GPL v3
--]]

--[[
Changelog:
+ Initial Release v1.0 (2017-07-05) 
--]]


function Main()
  reaper.Undo_BeginBlock()   
  
  S_track = reaper.BR_TrackAtMouseCursor()

  if S_track then
  
	  Ct = reaper.CountSelectedTracks( 0 )
	  reaper.SetMediaTrackInfo_Value( S_track, "I_NCHAN", Ct*2 )
	  
	  R_ch = 1023
	  for i = 0 ,Ct-1 do
		R_ch = R_ch + 1 
		R_track = reaper.GetSelectedTrack( 0, i )  
		reaper.CreateTrackSend( R_track, S_track )
		Last_send = reaper.GetTrackNumSends( R_track , 0 )
		reaper.BR_GetSetTrackSendInfo( R_track, 0, Last_send-1, "I_DSTCHAN", 1, R_ch )
	  end
	end
  
  reaper.Undo_EndBlock("Create Stereo Send from selected tracks to track under mouse", 0)
end  

Main()  
reaper.UpdateArrange()













--[[
Description: Create Mono Send from track under mouse to selected tracks (increment send channel)
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
	  Last_send = reaper.GetTrackNumSends( S_track , 0 )-1
	  Ct = reaper.CountSelectedTracks( 0 )
	  R_ch = 1023
	  R_chM = -2
	  for i = 0 ,Ct-1 do
		R_ch = R_ch + 1 
		R_chM = R_chM + 1
		R_track = reaper.GetSelectedTrack( 0, i )
		reaper.SetMediaTrackInfo_Value( R_track, "I_NCHAN", R_chM )
		reaper.CreateTrackSend( S_track, R_track )
		reaper.BR_GetSetTrackSendInfo( S_track, 0, Last_send+i, "I_DSTCHAN", 1, R_ch )    
	  end
	end

  reaper.Undo_EndBlock("Create Mono Send from track under mouse to selected tracks", 0)
end  

Main()  
reaper.UpdateArrange()











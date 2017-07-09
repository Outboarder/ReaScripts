--[[
Description: Create Stereo Send from selected tracks to track under mouse (via channel 3-4)
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



S_track = reaper.BR_TrackAtMouseCursor()

if S_track then
  
  Ct = reaper.CountSelectedTracks( 0 )
  reaper.SetMediaTrackInfo_Value( S_track, "I_NCHAN", Ct*2 )
  
  R_ch = 2
  for i = 0 ,Ct-1 do
     
    R_track = reaper.GetSelectedTrack( 0, i )  
    reaper.CreateTrackSend( R_track, S_track )
    Last_send = reaper.GetTrackNumSends( R_track , 0 )
    reaper.BR_GetSetTrackSendInfo( R_track, 0, Last_send-1, "I_DSTCHAN", 1, R_ch )
  end
end














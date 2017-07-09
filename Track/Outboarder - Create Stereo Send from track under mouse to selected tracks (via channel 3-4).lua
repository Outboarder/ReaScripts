--[[
Description: Create Stereo Send from track under mouse to selected tracks (via channel 3-4)
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
  Last_send = reaper.GetTrackNumSends( S_track , 0 )
  Ct = reaper.CountSelectedTracks( 0 )
  R_ch = 2
  for i = 0 ,Ct-1 do
     
    R_track = reaper.GetSelectedTrack( 0, i )
    reaper.SetMediaTrackInfo_Value( R_track, "I_NCHAN", Ct*2 )
    reaper.CreateTrackSend( S_track, R_track )
    reaper.BR_GetSetTrackSendInfo( S_track, 0, Last_send+i, "I_DSTCHAN", 1, R_ch )
  end
end







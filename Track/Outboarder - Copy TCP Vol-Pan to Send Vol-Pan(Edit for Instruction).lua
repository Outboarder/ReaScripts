--[[
Description: Copy TCP Vol-Pan to Send Vol-Pan 
Instructions:
Screenshot: 
Version: 1.0
Author: Outboarder
REAPER: 5.40
Licence: GPL v3
--]]

--[[
Changelog:
+ v1.0 (2017-07-05) 
+ BETA Release  (2017-06-30) 
--]]


--[[---------------------Instruction-----------------------------
Add     >(send #)    to track name   

Exmaple:

Guitar >2           copy track vol and pan to sent (slot2)
Vocal >1            copy track vol and pan to sent (slot1)
whatever >4         copy track vol and pan to sent (slot4)
--]]


arr1 = {}
arr2 = {}
  
function TCP_vol_to_send(index,MediaTrack,toSend)
    t = tonumber(toSend)- 1
    m = MediaTrack 
    __, volumeOut, panOut = reaper.GetTrackUIVolPan(m)
    reaper.SetTrackSendUIVol( MediaTrack, t, volumeOut, 0 )
    reaper.SetTrackSendUIPan( MediaTrack, t, panOut, 0 )  
    --reaper.defer(TCP_vol_to_send)
end

function Get_track_ID()
  e = -1
  all_tracks_count = reaper.CountTracks( 0 )
  if all_tracks_count > 0 then
    for i = 0 , all_tracks_count-1 do
      MediaTrack = reaper.GetTrack( 0, i )
      name, buf = reaper.GetTrackName( MediaTrack, i )
      
      if string.match(buf,"(>)") == ">" then
        buf = string.match(buf,"(>%d)")
        buf = string.match(buf,"(%d)")
        
        e = e + 1
        arr2[e] = MediaTrack
        arr1[e] = buf

        TCP_vol_to_send(e,arr2[e],arr1[e])
      end       
    end    
  end  
end


local function Main()
  reaper.Undo_BeginBlock()  
  Get_track_ID()    
  reaper.Undo_EndBlock("Copy TCP Vol-Pan to Send Vol-Pan", 0)
end

Main()



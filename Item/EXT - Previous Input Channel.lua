-----------------------------------------------------------
-------------      Previous Input Cannel      -------------
-----------------------------------------------------------
-------  Outboarder        @2017       Reaper 5.50  -------
-----------------------------------------------------------




Count_Tracks = reaper.CountSelectedTracks(0)
for i = 0 ,Count_Tracks-1 do
  
    Media_Track = reaper.GetSelectedTrack(0,i) 
    if Media_Track ~= nil then
    Input_Mono = reaper.GetMediaTrackInfo_Value( Media_Track, 'I_RECINPUT' )
    reaper.SetMediaTrackInfo_Value( Media_Track, 'I_RECINPUT' , Input_Mono-1 )    
    --reaper.SetMediaTrackInfo_Value( Media_Track, 'I_RECINPUT' , Input_Stereo+1023 )  
  end
end
                                 
                 


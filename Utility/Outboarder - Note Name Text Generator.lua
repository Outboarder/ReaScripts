--[[
Description: Note Name Text Generator
Instructions: copy the result from reaper console and paste it in Txt file ,import the txt as midi note names
Screenshot:
Version: 1.0
Author: Outboarder
Changelog:
REAPER: 5.32
Licence: GPL v3
--]]

--[[
Changelog:
+ Initial Release v1.0 (2017-11-02)
--]]


function msg(m)                         
	reaper.ShowConsoleMsg(tostring(m) .. '\n')
end

name = {"C","C#","D","D#","E","F","F#","G","G#","A","A#","B"}
oct = {"-1","0","1","2","3","4","5","6","7","8","9"}

function Note_Names()
	index = -1
	j = -1
		
	for i = 0 , 128 do
		index = index + 1
		n = i%12
		if n == 0 then
			j = j + 1
			o = oct[j+1]
		end
		--msg(tostring(index).." "..tostring(name[n+1]).." "..tostring(o))
		msg(tostring(index).." "..tostring(o).." "..tostring(name[n+1]))
	end
end

local function Main()
	reaper.Undo_BeginBlock()
	retval1, n = reaper.GetUserInputs("Key", 12, "C,C#,D,D#,E,F,F#,G,G#,A,A#,B", 'KickShort,KickLong,Snare,SnareShort,SnareLong,OHat,Ohat,CHat,CHat,TomLow,TomMid,TomHigh') 
	name = {n:match("^([^,]+),([^,]+),([^,]+),([^,]+),([^,]+),([^,]+),([^,]+),([^,]+),([^,]+),([^,]+),([^,]+),([^,]+)$")}
	retval2, o = reaper.GetUserInputs("Octave", 11, "-1,0,1,2,3,4,5,6,7,8,9", 'Electro -> ,Acoustic -> ,Latin -> ,Afro -> ,East -> ,Hardcore -> ,Disco -> , ->, ->,Loop I -> ,Loop II -> ') 
	oct = {o:match("^([^,]+),([^,]+),([^,]+),([^,]+),([^,]+),([^,]+),([^,]+),([^,]+),([^,]+),([^,]+),([^,]+)$")}
	Note_Names()
	reaper.Undo_EndBlock("Note_Name_Gen", 0)
end

Main()
  
  

 

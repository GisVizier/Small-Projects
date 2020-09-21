
Players.PlayerAdded:Connect(function(Player)
	 Player.CharacterAdded:Connect(function(Character)
		PlayerStateData[Player.Name] = STATE_HANDLER:New(Player)

		STATE_HANDLER.PlayerStateData[Player.Name]["BOOL"].startTime = 100
		print(STATE_HANDLER.PlayerStateData[Player.Name]["BOOL"].startTime)

		STATE_HANDLER:ChangeValue(Player,"Attacking",100)
		if STATE_HANDLER:CheckValue(Player,"Attacking") then
    		  print("WORKED")
                end
	end)
	Player.CharacterRemoving:Connect(function(Character)
		STATE_HANDLER:Sweep(Player)
		PlayerStateData[Player.Name] = nil
	end)
end)

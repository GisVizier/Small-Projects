```lua
local StateHandler = {
    PlayerStateData = {}
}

--//Creating New Profile for Player\\--

function StateHandler:New(Player)
    --//Default Values\\--
    StateHandler.PlayerStateData[Player.Name] = {
        ["Attacking"] = {
            startTime = os.clock();
            Duration = 0;
        };
        ["Blocking"] = {
            startTime = os.clock();
            Duration = 0;
        };
        ["Stunned"] = {
            startTime = os.clock();
            Duration = 0;
        };

    };

    --//Setting Metatable and adding Dynamic Values\\--
    setmetatable(StateHandler.PlayerStateData[Player.Name],{
        __index = function(Tab,Index)
            if self.PlayerStateData[Player.Name] then

                rawset(Tab,Index,
                    {
                        startTime = os.clock();
                        Duration = 0;
                    })
                return Tab[Index]
            end
        end;
    })
end

--//Changing Values\\--
function StateHandler:ChangeValue(Player,Index,Duration)
    assert(typeof(Index) == "string", "ONLY ACCEPT STRINGS")
    assert(typeof(Duration) == "number","ONLY ACCEPT NUMBERS")

    if self.PlayerStateData[Player.Name] then
        self.PlayerStateData[Player.Name][Index].startTime = os.clock()
        self.PlayerStateData[Player.Name][Index].Duration = Duration
        print("CHANGED")
    end

end

--//Checking Index\\--
function StateHandler:CheckValue(Player,Index)
    assert(typeof(Index) == "string", "ONLY ACCEPT STRINGS")

    if self.PlayerStateData[Player.Name] and os.clock() - self.PlayerStateData[Player.Name][Index].startTime >= self.PlayerStateData[Player.Name][Index].Duration then
        print("EXECUTED1")
        return true
    else
        print("EXECUTED2")
        return false
    end

end

--//Ending Connection\\--

function StateHandler:Sweep(Player)
    StateHandler.PlayerStateData[Player.Name] = nil
end

return StateHandler```

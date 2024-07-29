if not Global.game_settings or not Global.game_settings.level_id or not Global.game_settings.level_id == "kosugi" then
    return -- If the mission is not Shadow Raid, do not run the script
end

local queue_dialog_original = DialogManager.queue_dialog
function DialogManager:queue_dialog(id, ...)
	local result = queue_dialog_original(self, id, ...)
    if id:match("Play_pln_ko1_02") then -- Plays on entrance to compound | ´into_depot_VO´ ElementDialogue 103463
        local username = managers.network.account:username()
        managers.chat:_receive_message(1, username, "5 minutes remaining", Color("00fcfc"))
        DelayedCalls:Add("4minute", 60, function()
            managers.chat:_receive_message(1, username, "4 minutes remaining", Color("00fcfc"))
        end)
        DelayedCalls:Add("3minute", 120, function()
            managers.chat:_receive_message(1, username, "3 minutes remaining", Color("00fcfc"))
        end)
        DelayedCalls:Add("2minute", 180, function()
            managers.chat:_receive_message(1, username, "2 minutes remaining", Color("00fcfc"))
        end)
        DelayedCalls:Add("1minute", 240, function()
            managers.chat:_receive_message(1, username, "1 minutes remaining", Color("00fcfc"))
        end)
        DelayedCalls:Add("30second", 270, function()
            managers.chat:_receive_message(1, username, "30 seconds remaining", Color("00fcfc"))
        end)
        DelayedCalls:Add("20second", 280, function()
            managers.chat:_receive_message(1, username, "20 seconds remaining", Color("00fcfc"))
        end)
        DelayedCalls:Add("10second", 290, function()
            managers.chat:_receive_message(1, username, "10 seconds remaining", Color("00fcfc"))
        end)
    end
    return result
end
-- Huge thanks to ModeusTheLustfulDemon & Dom on the modworkshop.net discord community for the help

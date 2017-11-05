util.AddNetworkString("mtxad-messa")

hook.Add("PlayerSay","CommandMtx",function(ply,text,team)

	if MTXConfig.Commandes[text] then
		if ply:IsValid() and ply:IsPlayer() then

			net.Start("mtxad-messa")
			net.Send(ply)

		end
	end
end)

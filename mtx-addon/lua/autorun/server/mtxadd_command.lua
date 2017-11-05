util.AddNetworkString("messa")

hook.Add("PlayerSay","CommandMtx",function(ply,text,team)

	if table.HasValue(MTXConfig.Commandes,text) then
		if ply:IsValid() and ply:IsPlayer() then

			net.Start("messa")
			net.Send(ply)

		end
	end
end)

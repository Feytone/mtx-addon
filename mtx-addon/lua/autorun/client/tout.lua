local wi = ScrW()/1920
local he = ScrH()/1080

surface.CreateFont("Helvetica",{font = "Helvetica",size = 20*wi,weight = 450*he})

local bleu = Color(65, 131, 215)
local Bleu = Color(65, 131, 215)
local rouge = Color(150, 40, 27)
local Rouge = Color(150, 40, 27)
local Vert = Color(0, 177, 106)
local vert = Color(0, 177, 106)
local white = Color(255,255,255)

local couleurs = {
[bleu] = true,
[Bleu] = true,
[rouge] = true,
[Rouge] = true,
[Vert] = true,
[vert] = true,
[white] = true
}

local couleuru = ""

if couleurs[MTXConfig.Couleur] then couleuru = MTXConfig.Couleur else print("MTX ADDON : \n \n Mauvaise couleur enregistrée. Choisissez entre Bleu, Vert ou Rouge.") couleuru = bleu end

net.Receive("mtxad-messa", function(len,ply)

			local main = vgui.Create("DFrame")
			main:SetSize(1610*wi,935*he)
			main:Center()
			main:SetDraggable(false)
			main:ShowCloseButton(false)
			main:SetTitle("")
			main:MakePopup()
			main.Paint = function(self,w,h)
				draw.RoundedBox(5,0,0,w,h,couleuru)
				draw.RoundedBox(5,5*wi,5*he,w-10*wi,h-10*he,white)
				draw.RoundedBox(0,15*wi,10*he,100*wi,20*he,couleuru)
				draw.SimpleText("Raccourcis :","Helvetica",65*wi,20*he,white,1,1)
			end

			local raccourcis = {"Entraide Serveurs de Jeu","Présentations de Serveurs","Le Bar"}

			local List	= vgui.Create( "DIconLayout", main )
			List:SetSize( 600*wi , 20*he )
			List:SetPos( 125*wi, 10*he )
			List:SetSpaceY( 0 )
			List:SetSpaceX( 10*wi )

			for k,v in pairs(raccourcis) do
				local ListItem = List:Add( "DButton" )
				ListItem:SetSize( (string.len(v)*8+20)*wi, 20*he )
				ListItem:SetText("")
				ListItem.Paint = function(w,h) 
				draw.RoundedBox(0,0,0,ListItem:GetWide(),20*he,couleuru)
				draw.SimpleText(v,"Helvetica", ListItem:GetWide()/2, 10*he,white,1,1)
				end
				ListItem.DoClick = function()
				if v == "Entraide Serveurs de Jeu" then raca()
				elseif v == "Présentations de Serveurs" then racb()
				elseif v == "Le Bar" then racc() end
				end
			end

			local clob = vgui.Create("DButton",main)
			clob:SetSize(70*wi,20*he)
			clob:SetPos(main:GetWide()-92*wi,10*he)
			clob:SetText("")
			clob.Paint = function() draw.RoundedBox(0,0,0,70*wi,20*he,couleuru) draw.SimpleText("Fermer","Helvetica",35*wi,10*he,white,1,1) end
			clob.DoClick = function() main:Close() end

			local page = vgui.Create("HTML",main)
			page:SetPos(5*wi,30*he)
			page:SetSize(1600*wi,900*he)
			page:OpenURL("https://www.mtxserv.fr/forums/f/garrys-mod.6/")

			function raca()

				local pagea = vgui.Create("HTML",main)
				pagea:SetPos(5*wi,30*he)
				pagea:SetSize(1600*wi,900*he)
				pagea:OpenURL("https://www.mtxserv.fr/forums/f/garrys-mod.6/")

			end

			function racb()

				local pageb = vgui.Create("HTML",main)
				pageb:SetPos(5*wi,30*he)
				pageb:SetSize(1600*wi,900*he)
				pageb:OpenURL("https://www.mtxserv.fr/forums/f/presentation-serveurs-garrysmod/")

			end

			function racc()

				local pagec = vgui.Create("HTML",main)
				pagec:SetPos(5*wi,30*he)
				pagec:SetSize(1600*wi,900*he)
				pagec:OpenURL("https://www.mtxserv.fr/forums/f/le-bar/")

			end

end)

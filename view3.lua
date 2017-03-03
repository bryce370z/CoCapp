-----------------------------------------------------------------------------------------
--
-- view3.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()
local TH8button

function scene:create( event )
	local sceneGroup = self.view

	-- Called when the scene's view does not exist.
	--
	-- INSERT code here to initialize the scene
	-- e.g. add display objects to 'sceneGroup', add touch listeners, etc.

  TH8button = display.newImageRect("TH8.png",display.contentWidth,(display.contentHeight/6)) --creating a button
  TH8button.x = display.contentCenterX
  TH8button.y = display.contentCenterY/2

	-- create a white background to fill screen
	local background = display.newRect( display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight )
background:setFillColor( 1 )

	-- create some text
	local title = display.newText( "Third View", display.contentCenterX, 125, native.systemFont, 32 )
	title:setFillColor( 0 )

	local newTextParams = { text = "Base Design",
							x = display.contentCenterX + 10,
							y = title.y + 215,
							width = 310,
							height = 310,
							font = native.systemFont,
							fontSize = 14,
							align = "center" }
	local summary = display.newText( newTextParams )
	summary:setFillColor( 0 ) -- black

	-- all objects must be added to group (e.g. self.view)
	sceneGroup:insert( background )
	sceneGroup:insert( title )
	sceneGroup:insert( summary )
  sceneGroup:insert( TH8button )
end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase

	if phase == "will" then
-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then
-- Called when the scene is now on screen
--
-- INSERT code here to make the scene come alive
-- e.g. start timers, begin animation, play audio, etc.
local function TH8buttonHandler( event )
  if (event.phase == "began") then
    TH8button.xScale = 0.85
    TH8button.yScale = 0.85
  elseif(event.phase == "moved") then

  elseif(event.phase == "ended" or event.phase == "cancelled") then
  TH8button.xScale = 1
  TH8button.yScale = 1

  end
  return true
end
TH8button:addEventListener("touch", TH8buttonHandler)

	end
end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase

	if event.phase == "will" then
		-- Called when the scene is on screen and is about to move off screen
		--
		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)
	elseif phase == "did" then
		-- Called when the scene is now off screen
	end
end

function scene:destroy( event )
	local sceneGroup = self.view

	-- Called prior to the removal of scene's "view" (sceneGroup)
	--
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
  TH8button:removeSelf()
  TH8button = nil
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene

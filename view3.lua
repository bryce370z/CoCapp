-----------------------------------------------------------------------------------------
--
-- view3.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

local TH8button
local TH8show = false
local img

local TH7button
local TH7show = false

local TH9button
local TH9show = false

local TH10button
local TH10show = false

local picarray = {}
local swipeLeftbtn
local swipeRightbtn



function scene:create( event )
	local sceneGroup = self.view

	-- Called when the scene's view does not exist.
	--
	-- INSERT code here to initialize the scene
	-- e.g. add display objects to 'sceneGroup', add touch listeners, etc.

  TH8button = display.newImageRect("buttonpics/TH8.png",display.contentWidth,(display.contentHeight/20)) --creating a button
  TH8button.x = display.contentCenterX
  TH8button.y = (display.contentCenterY * 1.75) - 40

  TH7button = display.newImageRect("buttonpics/TH7.png", display.contentWidth,(display.contentHeight/20))
  TH7button.x = display.contentCenterX
  TH7button.y = (display.contentCenterY * 1.75) - 60

  TH9button = display.newImageRect("buttonpics/TH9.png",display.contentWidth,(display.contentHeight/20))
  TH9button.x = display.contentCenterX
  TH9button.y = (display.contentCenterY * 1.75) - 20


  TH10button = display.newImageRect("buttonpics/TH10.png",display.contentWidth,(display.contentHeight/20))
  TH10button.x = display.contentCenterX
  TH10button.y = display.contentCenterY * 1.75

  img = display.newImageRect("basepics/base.png", 200, 200)
  img.x = display.contentCenterX
  img.y = display.contentCenterY * 1.3
  img.isVisible = false

	-- create a white background to fill screen
	local background = display.newRect( display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight )
background:setFillColor( 1 )


	-- all objects must be added to group (e.g. self.view)
	sceneGroup:insert( background )
  sceneGroup:insert( TH8button )
  sceneGroup:insert( img )
  sceneGroup:insert( TH7button )
  sceneGroup:insert( TH9button )
  sceneGroup:insert( TH10button )
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
        TH8button.xScale = 1
        TH8button.yScale = 1

    elseif(event.phase == "ended" or event.phase == "cancelled") then
      TH8button.xScale = 1
      TH8button.yScale = 1
      TH8show = true

    end
    if TH8show == true then
      img.isVisible = true
    end

  end

  local function TH7buttonHandler( event )
    if (event.phase == "began") then
      TH7button.xScale = 0.85
      TH7button.yScale = 0.85

    elseif(event.phase == "moved") then
      TH7button.xScale = 1
      TH7button.yScale = 1

    elseif(event.phase == "ended" or event.phase == "cancelled") then
      TH7button.xScale = 1
      TH7button.yScale = 1


    end
  end

  local function TH9buttonHandler( event )
    if (event.phase == "began") then
      TH9button.xScale = 0.85
      TH9button.yScale = 0.85

    elseif(event.phase == "moved") then
      TH9button.xScale = 1
      TH9button.yScale = 1

    elseif(event.phase == "ended" or event.phase == "cancelled") then
      TH9button.xScale = 1
      TH9button.yScale = 1

    end
  end

    local function TH10buttonHandler( event )
      if (event.phase == "began") then
        TH10button.xScale = 0.85
        TH10button.yScale = 0.85

      elseif(event.phase == "moved") then
        TH10button.xScale = 1
        TH10button.yScale = 1

      elseif(event.phase == "ended" or event.phase == "cancelled") then
        TH10button.xScale = 1
        TH10button.yScale = 1

      end
    end


TH8button:addEventListener("touch", TH8buttonHandler)
TH7button:addEventListener("touch", TH7buttonHandler)
TH9button:addEventListener("touch", TH9buttonHandler)
TH10button:addEventListener("touch", TH10buttonHandler)



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
  TH7button:removeSelf()
  TH7button = nil
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene

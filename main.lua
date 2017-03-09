-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- show default status bar (iOS)
display.setStatusBar( display.DefaultStatusBar )

-- include Corona's "widget" library
local widget = require "widget"
local composer = require "composer"
local background

local Menubtn
local firstViewBtn
local secondViewBtn
local thirdViewBtn

local clicked = false
local numclicked = 0

local function onOrientationChange( event )
  local currentOrientation = event.type
  print( "Current orientation: " .. currentOrientation )
end
Runtime:addEventListener( "orientation", onOrientationChange )

background = display.newRect( display.contentCenterX, display.contentCenterY, display.contentWidth,   display.contentHeight )
background:setFillColor( 0 )
background.alpha = 0.5
background.isVisible = false


Menubtn = display.newImageRect("icon2.png", 30, 30)
Menubtn.x = display.contentWidth - 15
Menubtn.y = 10

firstViewBtn = display.newText("Home", display.contentCenterX, display.contentCenterY/2, native.SystemFont, 32)
firstViewBtn:setFillColor( 1 )
firstViewBtn.isVisible = false

secondViewBtn = display.newText("Guides", display.contentCenterX, display.contentCenterY, native.SystemFont, 32)
secondViewBtn:setFillColor( 1 )
secondViewBtn.isVisible = false

thirdViewBtn = display.newText("Base Designs", display.contentCenterX, display.contentCenterY * 1.5, native.SystemFont, 32)
thirdViewBtn:setFillColor( 1 )
thirdViewBtn.isVisible = false






local function firstViewBtnHandler( event )
  if (event.phase == "began") then

  elseif (event.phase == "moved") then

  elseif (event.phase == "ended" or event.phase == "cancelled") then
    clicked = true
    composer.gotoScene( "view1" )
    if (clicked == true) then
      background.isVisible = false
      firstViewBtn.isVisible = false
      secondViewBtn.isVisible = false
      thirdViewBtn.isVisible = false
      numclicked = numclicked + 1
    end
  end
  clicked = false
end

local function secondViewBtnHandler( event )
  if (event.phase == "began") then

  elseif (event.phase == "moved") then

elseif (event.phase == "ended" or event.phase == "cancelled") then
    clicked = true
    composer.gotoScene( "view2" )
    if (clicked == true) then
      background.isVisible = false
      firstViewBtn.isVisible = false
      secondViewBtn.isVisible = false
      thirdViewBtn.isVisible = false
      numclicked = numclicked + 1
    end
  end
  clicked = false
end

local function thirdViewBtnHandler( event )
  if (event.phase == "began") then

  elseif (event.phase == "moved") then

  elseif (event.phase == "ended" or event.phase == "cancelled") then
    clicked = true
    composer.gotoScene( "view3" )
    if (clicked == true) then
      background.isVisible = false
      firstViewBtn.isVisible = false
      secondViewBtn.isVisible = false
      thirdViewBtn.isVisible = false
      numclicked = numclicked + 1
    end
  end
  clicked = false
end

local function MenubtnHandler( event )
  if (event.phase == "began") then
    Menubtn.xScale = 0.85
    Menubtn.yScale = 0.85

  elseif (event.phase == "moved") then

  elseif (event.phase == "ended" or event.phase == "cancelled") then
    Menubtn.xScale = 1
    Menubtn.yScale = 1
    background.isVisible = true
    firstViewBtn.isVisible = true
    secondViewBtn.isVisible = true
    thirdViewBtn.isVisible = true
    numclicked = numclicked + 1
    
    if (numclicked - (math.floor(numclicked/2)*2) == 0) then
      background.isVisible = false
      firstViewBtn.isVisible = false
      secondViewBtn.isVisible = false
      thirdViewBtn.isVisible = false
    end
 
  end
end

Menubtn:addEventListener("touch", MenubtnHandler)
firstViewBtn:addEventListener("touch", firstViewBtnHandler)
secondViewBtn:addEventListener("touch", secondViewBtnHandler)
thirdViewBtn:addEventListener("touch", thirdViewBtnHandler)


-- event listeners for tab buttons:
local function onFirstView( event )
  composer.gotoScene( "view1" )
end

local function onSecondView( event )
  composer.gotoScene( "view2" )
end

local function onThirdView( event )
  composer.gotoScene( "view3" )
end


-- create a tabBar widget with two buttons at the bottom of the screen

-- table to setup buttons
--local tabButtons = {
--{ label="First", defaultFile="icon1.png", overFile="icon1.png", width = 32, height = 32, onPress=onFirstView, selected=true },
--{ label="Second", defaultFile="icon1.png", overFile="icon1.png", width = 32, height = 32, onPress=onSecondView },
--{label="Third", defaultFile="icon1.png", overFile="icon1.png", width = 32, height = 32, onPress=onThirdView},
--}

-- create the actual tabBar widget
--local tabBar = widget.newTabBar{
--top = display.contentHeight - 50,	-- 50 is default height for tabBar widget
-- buttons = tabButtons
--}

onFirstView()	-- invoke first tab button's onPress event manually

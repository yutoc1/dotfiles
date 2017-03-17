import XMonad
import XMonad.Actions.CycleWS
import XMonad.Config
import XMonad.Config.Desktop
import XMonad.Config.Desktop (desktopLayoutModifiers)
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Layout
import XMonad.Layout.DragPane
import XMonad.Layout.MultiToggle
import XMonad.Layout.MultiToggle.Instances
import XMonad.Layout.NoBorders
import XMonad.Layout.Named
import XMonad.Layout.Spacing
import XMonad.Layout.Simplest
import XMonad.Layout.ResizableTile
import XMonad.Layout.ToggleLayouts(toggleLayouts)
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig
import System.IO

baseConfig = desktopConfig

colorBlack = "#454545"
colorBlue = "#857da9"
colorGreen = "#88b986"
colorGray = "#676767"
colorWhite = "#d3d7cf"
colorGrayAlt = "#313131"
colorNormalbg = "#1a1e1b"

myTerminal = "urxvt"
myModMask = mod4Mask
myWorkspaces = ["1","2","3","4","5" ] 
myWsBar = "/usr/bin/xmobar ~/.xmobarrc"

myLayout = (spacing 10 $ ResizableTall 1 (1/55) (1/2) [])
            ||| (noBorders Simplest)

myKeys =
    [  ("M-f", sendMessage $ Toggle FULL),
       ("M-S-.", spawn "amixer set Master 2+"),
       ("M-S-,", spawn "amixer set Master 2-"),
       ("M-S-/", spawn "amixer set Master toggle"),
       ("<XF86AudioLowerVolume>", spawn "amixer set Master 2-"), 
       ("<XF86AudioRaiseVolume>", spawn "amixer set Master 2+"), 
       ("<XF86AudioMute>", spawn "amixer set Master toggle"), 
       ("<XF86MonBrightnessUp>", spawn "xbacklight -inc 2"), 
       ("<XF86MonBrightnessDown>", spawn "xbacklight -dec 2"), 
       ("M-<R>", nextWS),
       ("M-<L>", prevWS)
    ]

main :: IO ()

main = do
    wsbar <- spawnPipe "/usr/bin/xmobar ~/.xmonad/.xmobarrc"  
    xmonad $  defaultConfig{
    borderWidth = 1,
    normalBorderColor = colorBlack,
    focusedBorderColor = colorBlue,
    focusFollowsMouse = True,
    terminal = myTerminal,
    modMask = myModMask,
    workspaces =  myWorkspaces,
    layoutHook = toggleLayouts (avoidStruts $ noBorders Full) $ avoidStruts $ myLayout
} `additionalKeysP` (myKeys) 


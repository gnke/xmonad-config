import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

main = do
spawn "feh --bg-fill ~/Downloads/alien_evolution.jpg"
xmproc <- spawnPipe "/usr/bin/xmobar /home/gerald/.xmonad/.xmobarrc"
xmonad $ defaultConfig
    { manageHook = manageDocks <+> manageHook defaultConfig
    , layoutHook = avoidStruts $ layoutHook defaultConfig
    , focusedBorderColor = "#00FF00"
    , terminal = "terminator"
    } `additionalKeys`
    [ ((mod4Mask .|. shiftMask, xK_z), spawn "gnome-screensaver-command --lock")
    , ((0, xK_Print), spawn "gnome-screenshot")
    ]



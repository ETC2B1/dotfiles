-- XMonad Config used by ETC2B1
-- Author: ETC2B1 - Format: Vic Fryzel

import System.IO
import System.Exit
import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.SetWMName
import XMonad.Layout.Fullscreen
import XMonad.Layout.NoBorders
import XMonad.Layout.Spiral
import XMonad.Layout.Tabbed
import XMonad.Layout.ThreeColumns
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import Graphics.X11.ExtraTypes.XF86
import qualified XMonad.StackSet as W
import qualified Data.Map        as M


myTerminal = "/usr/bin/urxvt"
myScreensaver = "xset s activate"
myXmobarrc = "~/.config/xmonad/xmobar-single.hs"
myLauncher = "$(dmenu)"


myWorkspaces = ["1:term","2:web","3:code","4:music"] ++ map show [6..9]


myManageHook = composeAll
    [ className =? "Gimp"	    --> doFloat
    , className =? "Steam"	    --> doFloat
    , className =? "stalonetray"    --> doIgnore
    ]


myLayout = avoidStruts (
    ThreeColMid 1 (3/100) (1/2) |||
    Tall 1 (3/100) (1/2) |||
    Mirror (Tall 1 (3/100) (1/2)) |||
    tabbed shrinkText tabConfig |||
    Full |||
    spiral (6/7)) |||
    noBorders (fullscreenFull Full)


myNormalBorderColor = "#006600"
myFocusedBorderColor = "#00cc00"

tabConfig = def {
    activeBorderColor = "#00cc00",
    activeTextColor = "#cccccc",
    activeColor = "#000000",
    inactiveBorderColor	= "#006600",
    inactiveTextColor = "#000000",
    inactiveColor = "#000000"
}

xmobarTitleColor = "#cccccc"
xmobarCurrentWorkspaceColor = "#000000"
myBorderWidth = 1


myKeys conf@(XConfig {XMonad.modMask = modMask}) = M.fromList $
  [ ((modMask .|. shiftMask, xK_Return),
     spawn $ XMonad.terminal conf)

  , ((modMask .|. controlMask, xK_l),
     spawn myScreensaver)

  , ((modMask, xK_p),
     spawn myLauncher)

  , ((0, xF86XK_AudioMute),
     spawn "amixer -q set Master toggle")

  , ((0, xF86XK_AudioLowerVolume),
     spawn "amixer -q set Master 5%-")

  , ((0, xF86XK_AudioRaiseVolume),
     spawn "amixer -q set Master 5%+")

  , ((modMask .|. controlMask, xK_m),
     spawn "amixer -q set Master toggle")

  , ((modMask .|. controlMask, xK_j),
     spawn "amixer -q set Master 5%-")

  , ((modMask .|. controlMask, xK_k),
     spawn "amixer -q set Master 5%+")

  , ((modMask .|. shiftMask, xK_c),
     kill)

  , ((modMask, xK_space),
     sendMessage NextLayout)

  , ((modMask .|. shiftMask, xK_space),
     setLayout $ XMonad.layoutHook conf)

  , ((modMask, xK_n),
     refresh)

  , ((modMask, xK_Tab),
     windows W.focusDown)

  , ((modMask, xK_j),
     windows W.focusDown)

  , ((modMask, xK_k),
     windows W.focusUp  )

  , ((modMask, xK_m),
     windows W.focusMaster  )

  , ((modMask, xK_Return),
     windows W.swapMaster)

  , ((modMask .|. shiftMask, xK_j),
     windows W.swapDown  )

  , ((modMask .|. shiftMask, xK_k),
     windows W.swapUp    )

  , ((modMask, xK_h),
     sendMessage Shrink)

  , ((modMask, xK_l),
     sendMessage Expand)

  , ((modMask, xK_t),
     withFocused $ windows . W.sink)

  , ((modMask, xK_comma),
     sendMessage (IncMasterN 1))

  , ((modMask, xK_period),
     sendMessage (IncMasterN (-1)))

  , ((modMask .|. shiftMask, xK_q),
     io (exitWith ExitSuccess))

  , ((modMask, xK_q),
     restart "xmonad" True)
  ]
  ++

  -- mod-[1..9], Switch to workspace N
  -- mod-shift-[1..9], Move client to workspace N
  [((m .|. modMask, k), windows $ f i)
      | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
      , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]




myStartupHook = return ()


main = do
  xmproc <- spawnPipe ("xmobar " ++ myXmobarrc)
  xmonad $ defaults {
      logHook = dynamicLogWithPP $ xmobarPP {
            ppOutput = hPutStrLn xmproc
	  , ppTitle = xmobarColor xmobarTitleColor "" . shorten 100
	  , ppCurrent = xmobarColor xmobarCurrentWorkspaceColor ""
	  , ppSep = "   "
      }
      , manageHook = manageDocks <+> myManageHook
      , startupHook = setWMName "LG3D"
      , handleEventHook = docksEventHook
  }


defaults = defaultConfig {
    terminal		 = myTerminal,
    borderWidth		 = myBorderWidth,
    workspaces		 = myWorkspaces,
    normalBorderColor	 = myNormalBorderColor,
    focusedBorderColor	 = myFocusedBorderColor,

--    keys		 = myKeys,

    layoutHook		 = smartBorders $ myLayout,
    manageHook		 = myManageHook,
    startupHook		 = myStartupHook
}
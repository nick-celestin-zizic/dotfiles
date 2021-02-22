------------------------------------------------------------------------
---IMPORTS
------------------------------------------------------------------------
    -- Base
import XMonad
import XMonad.Config.Desktop
import Data.Monoid
import Data.Maybe (isJust)
import System.IO (hPutStrLn)
import System.Exit (exitSuccess)
import qualified XMonad.StackSet as W

    -- Utilities
import XMonad.Util.Loggers
import XMonad.Util.EZConfig (additionalKeysP, additionalMouseBindings)
import XMonad.Util.NamedScratchpad
import XMonad.Util.Run (safeSpawn, unsafeSpawn, runInTerm, spawnPipe)
import XMonad.Util.SpawnOnce

    -- Hooks
import XMonad.Hooks.DynamicLog (dynamicLog, defaultPP, wrap, pad, xmobarPP, xmobarColor, shorten, PP(..))
import XMonad.Hooks.ManageDocks (avoidStruts, docksStartupHook, manageDocks, ToggleStruts(..))
import XMonad.Hooks.ManageHelpers (isFullscreen, isDialog,  doFullFloat, doCenterFloat) 
import XMonad.Hooks.Place (placeHook, withGaps, smart)
import XMonad.Hooks.SetWMName
import XMonad.Hooks.EwmhDesktops   -- required for xcomposite in obs to work

    -- Actions
import XMonad.Actions.Minimize (minimizeWindow)
import XMonad.Actions.Promote
import XMonad.Actions.RotSlaves (rotSlavesDown, rotAllDown)
import XMonad.Actions.CopyWindow (kill1, copyToAll, killAllOtherCopies, runOrCopy)
import XMonad.Actions.WindowGo (runOrRaise, raiseMaybe)
import XMonad.Actions.WithAll (sinkAll, killAll)
import XMonad.Actions.CycleWS (nextWS, prevWS, shiftToNext, shiftToPrev, WSType(..), shiftNextScreen, shiftPrevScreen) 
import XMonad.Actions.GridSelect (GSConfig(..), goToSelected, bringSelected, colorRangeFromClassName, buildDefaultGSConfig)
import XMonad.Actions.DynamicWorkspaces (addWorkspacePrompt, removeEmptyWorkspace)
import XMonad.Actions.MouseResize
import qualified XMonad.Actions.ConstrainedResize as Sqr

    -- Layouts modifiers
import XMonad.Layout.PerWorkspace (onWorkspace) 
import XMonad.Layout.Renamed (renamed, Rename(CutWordsLeft, Replace))
import XMonad.Layout.WorkspaceDir
import XMonad.Layout.Spacing 
import XMonad.Layout.NoBorders
import XMonad.Layout.LimitWindows (limitWindows, increaseLimit, decreaseLimit)
import XMonad.Layout.WindowArranger (windowArrange, WindowArrangerMsg(..))
import XMonad.Layout.Reflect (reflectVert, reflectHoriz, REFLECTX(..), REFLECTY(..))
import XMonad.Layout.MultiToggle (mkToggle, single, EOT(EOT), Toggle(..), (??))
import XMonad.Layout.MultiToggle.Instances (StdTransformers(NBFULL, MIRROR, NOBORDERS))
import qualified XMonad.Layout.ToggleLayouts as T (toggleLayouts, ToggleLayout(Toggle))

    -- Layouts
import XMonad.Layout.GridVariants (Grid(Grid))
import XMonad.Layout.SimplestFloat
import XMonad.Layout.OneBig
import XMonad.Layout.ThreeColumns
import XMonad.Layout.ResizableTile
import XMonad.Layout.ZoomRow (zoomRow, zoomIn, zoomOut, zoomReset, ZoomMessage(ZoomFullToggle))
import XMonad.Layout.IM (withIM, Property(Role))

    -- Prompts
import XMonad.Prompt (defaultXPConfig, XPConfig(..), XPPosition(Top), Direction1D(..))

------------------------------------------------------------------------
---CONFIG
------------------------------------------------------------------------
myModMask       = mod4Mask  -- Sets modkey to super/windows key
myTerminal      = "st"      -- Sets default terminal
myTextEditor    = "vim"     -- Sets default text editor
myBrowser       = "brave-browser"   -- sets default browser
myFileManager   = "pcmanfm"
myBorderWidth   = 0         -- Sets border width for windows
myWindowGap     = 0

main = do
    xmonad $ ewmh desktopConfig
        { manageHook = ( isFullscreen --> doFullFloat ) <+> manageHook desktopConfig <+> manageDocks
        , logHook = dynamicLog
        , modMask            = myModMask
        , terminal           = myTerminal
        , startupHook        = myStartupHook
        , layoutHook         = myLayoutHook 
        , workspaces         = myWorkspaces
        , borderWidth        = fromInteger myBorderWidth
        , normalBorderColor  = "#292d3e"
        , focusedBorderColor = "#bbc5ff"
        } `additionalKeysP` myKeys 

------------------------------------------------------------------------
---AUTOSTART
------------------------------------------------------------------------
myStartupHook = do
          spawnOnce "urxvtd &" 
          spawnOnce "nitrogen --restore &"
          spawnOnce "picom --vsync -D 3 &"
          spawnOnce "feh --bg-fill -z -r ~/Pictures/wallpapers"
          spawnOnce "xsetroot -cursor_name left_ptr"
          spawnOnce "xset s off"
          setWMName "LG3D"
          spawnOnce "~/.config/polybar/launch.sh &"

------------------------------------------------------------------------
---KEYBINDINGS
------------------------------------------------------------------------
myKeys =
    -- Xmonad
        [ ("M-C-r", spawn "xmonad --recompile")      -- Recompiles xmonad
        , ("M-S-r", spawn "xmonad --restart" >> spawn "~/.config/polybar/launch.sh &")        -- Restarts xmonad
        , ("M-S-<Escape>", io exitSuccess)                  -- Quits xmonad
    
    -- Windows
        , ("M-S-c", kill1)                           -- Kill the currently focused client
        , ("M-S-a", killAll)                         -- Kill all the windows on current workspace

    -- Floating windows
        , ("M-<Delete>", withFocused $ windows . W.sink)  -- Push floating window back to tile.
        , ("M-S-<Delete>", sinkAll)                  -- Push ALL floating windows back to tile.

    -- Windows navigation
        , ("M-m", windows W.focusMaster)             -- Move focus to the master window
        , ("M-j", windows W.focusDown)               -- Move focus to the next window
        , ("M-k", windows W.focusUp)                 -- Move focus to the prev window
        , ("M-S-m", windows W.swapMaster)            -- Swap the focused window and the master window
        , ("M-S-j", windows W.swapDown)              -- Swap the focused window with the next window
        , ("M-S-k", windows W.swapUp)                -- Swap the focused window with the prev window
        , ("M-<Backspace>", promote)                 -- Moves focused window to master, all others maintain order
        , ("M1-S-<Tab>", rotSlavesDown)              -- Rotate all windows except master and keep focus in place
        , ("M1-C-<Tab>", rotAllDown)                 -- Rotate all the windows in the current stack
        , ("M-S-s", windows copyToAll)  
        , ("M-C-s", killAllOtherCopies) 
        
        , ("M-C-M1-<Up>", sendMessage Arrange)
        , ("M-C-M1-<Down>", sendMessage DeArrange)
        , ("M-<Up>", sendMessage (MoveUp 10))             --  Move focused window to up
        , ("M-<Down>", sendMessage (MoveDown 10))         --  Move focused window to down
        , ("M-<Right>", sendMessage (MoveRight 10))       --  Move focused window to right
        , ("M-<Left>", sendMessage (MoveLeft 10))         --  Move focused window to left
        , ("M-S-<Up>", sendMessage (IncreaseUp 10))       --  Increase size of focused window up
        , ("M-S-<Down>", sendMessage (IncreaseDown 10))   --  Increase size of focused window down
        , ("M-S-<Right>", sendMessage (IncreaseRight 10)) --  Increase size of focused window right
        , ("M-S-<Left>", sendMessage (IncreaseLeft 10))   --  Increase size of focused window left
        , ("M-C-<Up>", sendMessage (DecreaseUp 10))       --  Decrease size of focused window up
        , ("M-C-<Down>", sendMessage (DecreaseDown 10))   --  Decrease size of focused window down
        , ("M-C-<Right>", sendMessage (DecreaseRight 10)) --  Decrease size of focused window right
        , ("M-C-<Left>", sendMessage (DecreaseLeft 10))   --  Decrease size of focused window left

    -- Layouts
        , ("M-<Space>", sendMessage NextLayout)                              -- Switch to next layout
        , ("M-S-<Space>", sendMessage ToggleStruts)                          -- Toggles struts
        , ("M-S-b", sendMessage $ Toggle NOBORDERS)                          -- Toggles noborder
        , ("M-S-=", sendMessage (Toggle NBFULL) >> sendMessage ToggleStruts) -- Toggles noborder/full
        , ("M-S-f", sendMessage (T.Toggle "float"))
        , ("M-<KP_Multiply>", sendMessage (IncMasterN 1))   -- Increase number of clients in the master pane
        , ("M-<KP_Divide>", sendMessage (IncMasterN (-1)))  -- Decrease number of clients in the master pane

        , ("M-C-h", sendMessage Shrink)
        , ("M-C-l", sendMessage Expand)
        , ("M-C-j", sendMessage MirrorShrink)
        , ("M-C-k", sendMessage MirrorExpand)

    -- Workspaces
        , ("M-<KP_Add>", nextWS)                                -- Go to next workspace
        , ("M-<KP_Subtract>", prevWS)                           -- Go to previous workspace
        , ("M-S-<KP_Add>", shiftToNext >> nextWS)       -- Shifts focused window to next workspace
        , ("M-S-<KP_Subtract>", shiftToPrev >> prevWS)  -- Shifts focused window to previous workspace
        , ("M-S-0", windows copyToAll)
        , ("M-C-0", killAllOtherCopies)

    -- Open Terminal
        , ("M-<Return>", spawn myTerminal)

    -- My Applications (Super+Key)
        , ("M4-C-b", spawn myBrowser)
        , ("M4-C-f", spawn myFileManager)
        , ("M4-C-d", spawn "discord")
        , ("M4-C-e", spawn "emacs")
        , ("M4-C-w", spawn "feh --bg-fill -z -r ~/Pictures/wallpapers") 
        , ("M4-C-h", spawn (myTerminal ++ " -e htop --sort-key=PERCENT_MEM"))
        , ("M4-C-v", spawn (myTerminal ++ " -e nvim"))

    -- Multimedia Keys
        , ("<XF86AudioMute>",        spawn "amixer set Master toggle")
        , ("<XF86AudioLowerVolume>", spawn "amixer set Master 5%- unmute")
        , ("<XF86AudioRaiseVolume>", spawn "amixer set Master 5%+ unmute")
        ]
                
------------------------------------------------------------------------
---WORKSPACES
------------------------------------------------------------------------
 
myWorkspaces :: [String]   
myWorkspaces = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

------------------------------------------------------------------------
---LAYOUTS
------------------------------------------------------------------------

myLayoutHook = avoidStruts $ mouseResize $ windowArrange $ 
               mkToggle (NBFULL ?? NOBORDERS ?? EOT) $ myDefaultLayout
             where 
                 myDefaultLayout = tall ||| grid ||| threeCol ||| threeRow ||| oneBig

mySpacing = spacingRaw True (Border myBorderWidth myBorderWidth myBorderWidth myBorderWidth) True (Border myWindowGap myWindowGap myWindowGap myWindowGap) True

tall       = renamed [Replace "tall"]     $ limitWindows 12 $ mySpacing $ ResizableTall 1 (3/100) (1/2) []
grid       = renamed [Replace "grid"]     $ limitWindows 12 $ mySpacing $ mkToggle (single MIRROR) $ Grid (16/10)
threeCol   = renamed [Replace "threeCol"] $ limitWindows 3  $ ThreeCol 1 (3/100) (1/2) 
threeRow   = renamed [Replace "threeRow"] $ limitWindows 3  $ Mirror    $ mkToggle (single MIRROR) zoomRow
oneBig     = renamed [Replace "oneBig"]   $ limitWindows 6  $ Mirror    $ mkToggle (single MIRROR) $ mkToggle (single REFLECTX) $ mkToggle (single REFLECTY) $ OneBig (5/9) (8/12)

[colors]
background = #2d2d2d
background-alt = #2d2d2d
foreground = #ffffff
foreground-alt = #55
primary = #ded32e
secondary = #d64937
alert = #d64937
underline = #006F86

[global/wm]
margin-top = 0
margin-bottom = 0

[bar/i3]
bottom = false
width = 100%
height = 35

background = ${colors.background}
foreground = ${colors.foreground}

overline-size = 0
overline-color = #f00
underline-size = 4
underline-color = #00f

border-bottom-size = 0
border-bottom-color = #333

spacing = 1
padding-left = 0
padding-right = 2
module-margin-left = 1
module-margin-right = 2

font-0 = ricty:size=20:pixelsize=20:fontformat=truetype;0
font-1 = ricty:size=20:heavy:fontformat=truetype;-2
font-2 = siji:pixelsize=10;0

modules-left = i3 xwindow
modules-center =
modules-right = cpu memory wlan backlight alsa battery temperature date

tray-position = right
tray-padding = 2
tray-transparent = true
tray-background = #0063ff

[module/xwindow]
type = internal/xwindow
label = %title:0:30:...%

[module/i3]
type = internal/i3
format = <label-state> <label-mode>
index-sort = true
wrapping-scroll = false

; focused = Active workspace on focused monitor
label-focused = %index%
label-focused-background = ${colors.background}
label-focused-foreground = ${colors.foreground}
label-focused-padding = 2

; unfocused = Inactive workspace on any monitor
label-unfocused = %index%
label-unfocused-background = ${colors.background-alt}
label-unfocused-foreground = ${colors.foreground-alt}
label-unfocused-padding = 2

; visible = Active workspace on unfocused monitor
label-visible = %index%
label-visible-background = ${colors.background-alt}
label-visible-foreground = ${colors.foreground-alt}
label-visible-padding = 2

; urgent = Workspace with urgency hint set
label-urgent = %index%
label-urgent-background = ${colors.background-alt}
label-urgent-foreground = ${colors.foreground-alt}
label-urgent-padding = 2

[module/cpu]
type = internal/cpu
interval = 1
format = <label>
format-underline = ${colors.underline}
label = %percentage-cores%

[module/memory]
type = internal/memory
interval = 2
format = <label>
format-prefix-foreground = ${colors.foreground-alt}
format-underline = ${colors.underline} 
label = %percentage_used%%

[module/wlan]
type = internal/network
interface = wlp58s0
interval = 1.0

format-connected = <label-connected>
format-connected-underline = ${colors.underline}
format-disconnected = <label-disconnected>
format-disconnected-underline = ${colors.underline}

label-connected = ⬇ %downspeed% ⬆ %downspeed%
label-disconnected = not connected
label-disconnected-foreground = ${colors.foreground-alt}

[module/backlight]
type = internal/xbacklight
format = <label>
format-underline = ${colors.underline}
label = *%percentage%%

[module/alsa]
type = internal/alsa

format-volume = <label-volume>
format-volume-underline = ${colors.underline}
label-volume = ♪%percentage%%
label-volume-foreground = ${root.foreground}

format-muted = <label-muted>
format-muted-foreground = ${colors.foreground-alt}
format-muted-underline = ${colors.underline}
label-muted = muted

[module/battery]
type = internal/battery
battery = BAT0
adapter = ADP1
full-at = 98

time-format = %H:%M

format-charging = <label-charging>
format-charging-underline = #ffb52a
label-charging = Charging %percentage%%

format-discharging = <label-discharging>
format-discharging-underline = ${colors.underline}
label-discharging = %percentage%% %time%

format-full = <label-full>
format-full-foreground = ${colors.foreground-alt}
format-full-underline = ${colors.underline}
label-full = Full charged

[module/temperature]
type = internal/temperature
thermal-zone = 0
warn-temperature = 60

format = <label>
format-underline = ${colors.underline}
format-warn = <label-warn>
format-warn-underline = ${colors.underline}

label = %temperature%
label-warn = %temperature%
label-warn-foreground = ${colors.secondary}

[module/date]
type = internal/date
interval = 5

date = %a %m/%d
date-alt = %a %d %b %Y

time = %H:%M
time-alt = %H:%M:%S

format = <label>
format-foreground = #FFBB00
format-underline = ${colors.underline}

label = %date% %time%

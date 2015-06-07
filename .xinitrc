#!/bin/sh

#-------------------------------------------------------------------------------
# **Choose WindowManager or DesktopEnvironment
#-------------------------------------------------------------------------------

DEFWM="twm"
#WM="urxvt"
#WM="twm" # X default
#WM="vtwm" # twm+workspace/shadow/3D
#WM="ctwm" # twm+32workspace/backgrounds
#WM="fvwm" # twm+workspace/3D/themes
WM="pekwm" # very lightweight configurable WM +themes/group based on aewm++
#WM="openbox" # lightweight WM +themes based on blackbox / LXDE WM
#WM="fluxbox" # WM +themes/panel/group based on blackbox
#WM="windowmaker" # NeXTStep like WM
#WM="afterstep" # NeXTStep like WM
#WM="qvwm" # win95 like WM
#WM="jwm" # using xlib lightweight win95 like WM / puppy default
#WM="icewm" # lightweight win95 like WM +themes
#WM="lwm" # ultimately lightweight WM +flatlook
##WM="flwm" # lightweight WM using fltk
##WM="tinywm" # ultimately lightweight WM written in around 50 lines of C
##WM="aewm" # lightweight WM +flatlook/panel
#WM="lxde" # very lightweight ENV
#WM="xfce4" # lightweight ENV
#WM="kde" # like Windows ENV
#WM="gnome" # like Mac ENV

#-------------------------------------------------------------------------------
# **Choose Input Method Module
#-------------------------------------------------------------------------------

IM="scim"

#-------------------------------------------------------------------------------
# **Path to Xfiles
#-------------------------------------------------------------------------------

USERXRESOURCES=~/.Xresources
USERXMODMAP=~/.Xmodmap

#-------------------------------------------------------------------------------
# WM Check
#-------------------------------------------------------------------------------

if [ -n "${1}" ] ; then
	if [ -n "${2}" ] ; then
		WM="$2"
	else
		WM="$1"
	fi
fi
if [ -z WM ] ; then
	WM="$DEFWM"
fi

#-------------------------------------------------------------------------------
# Utility Setting
#-------------------------------------------------------------------------------

LANGBAK=$LANG
export LANG="ja_JP.UTF8"

if [ -f $USERXRESOURCES ] ; then
	xrdb -merge $USERXRESOURCES
fi
if [ -f $USERXMODMAP ] ; then
	xmodmap $USERXMODMAP
fi

#unset TERM
#export XTERM='xterm -fa "Meguri" -fs 10 +bdc -cr green -hc blue -ms white -nul -rightbar -sb -vb -bg black -fg gray83'
export XTERM='xterm -fs 10 +bdc -cr green -hc blue -ms white -nul -rightbar -sb -vb -bg black -fg gray83'

#-------------------------------------------------------------------------------
# IM Setting
#-------------------------------------------------------------------------------

if [ $IM == "scim" ] ; then
	export GTK_IM_MODULE="scim"
	export QT_IM_MODULE="scim"
	export XMODIFIERS=@im=SCIM
	scim -d
elif [ $IM == "scim-bridge" ] ; then
	export GTK_IM_MODULE="scim-bridge"
	export QT_IM_MODULE="scim-bridge"
	export XMODIFIERS=@im=SCIM
	scim -d
elif [ $IM == "uim" ] ; then
	export GTK_IM_MODULE="uim"
	export QT_IM_MODULE="uim"
	export XMODIFIERS=@im=uim
	uim-toolbar-gtk&
	uim-xim&
elif [ $IM == "ibus" ] ; then
	export GTK_IM_MODULE="ibus"
	export QT_IM_MODULE="ibus"
	export XMODIFIERS=@im=ibus
	ibus-daemon&
fi

#-------------------------------------------------------------------------------
# WM Setting
#-------------------------------------------------------------------------------

if [ $WM == "step" ] ; then
	xsetroot -solid white
#	xv +noresetroot -root -max -quit /usr/X11R7/share/pixmaps/backgrounds/Plamo/plamoback_c3.png
	ini_mail=/etc/template/mime-mail.sample
	cur_mail=/var/spool/mail/$USER
	if [ -f $ini_mail -a -f $cur_mail ] ; then
		if diff $ini_mail $cur_mail > /dev/null ; then
			[ -x /usr/X11R7/lib/X11/afterstep/plamo_banner ] &&
				/usr/X11R7/lib/X11/afterstep/plamo_banner &
		fi
	fi
elif [ $WM == "twm" ] ; then
	xterm -vb -geometry 80x36+24+4 -fg lightgray -bg black &
elif [ $WM == "qvwm" ] ; then
	xsetroot -solid black
	[ -f /usr/X11R7/share/qvwm/images/logo.xpm ] &&
		qvbanner /usr/X11R7/share/qvwm/images/logo.xpm &
	kterm -vb -km euc -geometry 80x30+10+10 -bg cornsilk &
#elif [ $WM == "twm" -o $WM == "icewm" ] ; then
	xsetroot -solid '#404060'
	# xv +noresetroot -rmode 5 -maxpect -quit "/usr/share/pixmaps/backgrounds/Archlinux_wallpaper_by_platinummonkey.jpg"
	xv +noresetroot -rmode 5 -maxpect -quit "/usr/share/archlinux/wallpaper/archlinux-poolclouds-43.jpg"
#  xv +noresetroot -root -max -quit "/usr/share/pixmaps/backgrounds/1400_1050 Think Asia Map.bmp"
	xterm -vb -geometry 80x36+24+4 -fg lightgray -bg black &
elif [ $WM == "pekwm" ] ; then
	xv +noresetroot -rmode 5 -maxpect -quit "/usr/share/archlinux/wallpaper/archlinux-poolclouds-43.jpg"
	# xv +noresetroot -rmode 5 -maxpect -quit "resources/wallpaper/nature-wallpaper-1366x768-005.jpg"
	wallpaperd
#	xcompmgr -n&
#	osdbattery&
	tint2&
	conky&
	# gkrellm&
#	gtkclock -t "%h%d日(%a) %p%l:%M" &
#	cairo-clock&
#	transset-df .6 -n Conky (T-SATO)
#	transset-df .8 -n tint2
	xscreensaver -no-splash&
fi

# Keep Christmas!!
#if [ `date +%m%d` \> "1222" -a `date +%m%d` \< "1227" ] ; then
#	[ -x /usr/X11R7/bin/xsnow ] && /usr/X11R7/bin/xsnow &
#fi

#-------------------------------------------------------------------------------
# WM Launch
#-------------------------------------------------------------------------------

mesg n

#LAUNCH=/usr/bin/ck-launch-session

case $WM in
	"urxvt") SESSIONCMD=urxvt ;;
	"twm") SESSIONCMD=twm ;;
	"vtwm") SESSIONCMD=vtwm ;;
	"ctwm") SESSIONCMD=ctwm ;;
	"fvwm") SESSIONCMD=fvwm ;;
	"pekwm") SESSIONCMD=pekwm ;;
	"openbox") SESSIONCMD=openbox-session ;;
	"fluxbox") SESSIONCMD=fluxbox ;;
	"windowmaker") SESSIONCMD=wmaker ;;
	"afterstep") SESSIONCMD=afterstep ;;
	"qvwm") SESSIONCMD=qvwm ;;
	"jwm") SESSIONCMD=jwm ;;
	"icewm") SESSIONCMD=icewm ;;
	"lwm") SESSIONCMD=lwm ;;
	"flwm") SESSIONCMD=flwm ;;
	"tinywm") SESSIONCMD=tinywm ;;
	"aewm") SESSIONCMD=aewm ;;
	"lxde") SESSIONCMD=startlxde ;;
	"xfce4") SESSIONCMD=startxfce4 ;;
	"kde") SESSIONCMD=startkde ;;
	"gnome") SESSIONCMD=gnome-session ;;
	*) SESSIONCMD=$DEFWM ;;
esac

exec $LAUNCH $SESSIONCMD


#-------------------------------------------------------------------------------
# Post WM
#-------------------------------------------------------------------------------

export LANG=$LANGBAK

mesg y

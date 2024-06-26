# #!/bin/sh
#
# WORKDIR="$HOME/.config/ags"
#
# function _ags() {
#   pkill ags
#   # ags --inspector &
#    ags &
# }
#
# _ags
# inotifywait --quiet --monitor --event create,modify,delete --recursive $WORKDIR | while read DIRECTORY EVENT FILE; do
#   file_extension=${FILE##*.}
#   case $file_extension in
#     js)
# 	echo "reload JS..."
#   _ags
#     ;;
# 	# css)
# 	# echo "reload CSS..."
# 	# sassc "$WORKDIR/style.scss" "$WORKDIR/style.css"
# 	# ags --run-js "ags.App.resetCss(); ags.App.applyCss('style.css');" #&>/dev/null
# 	#  _ags
# 	# 	;;
# 	   scss)
# 	echo "reload SCSS..."
# 	sassc "$WORKDIR/style.scss" "$WORKDIR/style.css"
# 	ags --run-js "ags.App.resetCss(); ags.App.applyCss('style.css');" #&>/dev/null
# 	    ;;
#   esac
# done
#!/bin/sh
WORKDIR="$HOME/.config/ags"
function _ags() {
  pkill ags
  ags &
}
_ags
while true; do
  inotifywait --quiet --monitor --event modify --recursive $WORKDIR | while read DIRECTORY EVENT FILE; do
    file_extension=${FILE##*.}
    case $file_extension in
      js)
        echo "reload JS..."
        _ags
        ;;
      scss)
        echo "reload SCSS..."
        sassc "$WORKDIR/style.scss" "$WORKDIR/style.css"
        _ags
        ;;
    esac
  done
done

#!/bin/sh

iconGood="<i class='fa fa-check-circle green'></i>"
iconAlert="<i class='fa fa-times-circle red'></i>"
iconFolder="<i class='fa fa-folder-open-o'></i>"
iconNote="<i class='fa fa-sticky-note-o'></i>"

downloadDir='/Users/mknowles/Downloads'

downloadCount=$(ls -l $downloadDir | sed '1d' | wc -l | tr -d ' ')

echo "<h1>WORK LIST</h1>"
echo "<table>"
if [ $downloadCount -gt 0 ];then
    echo "<tr><td>$iconAlert $iconFolder Download folder</td><td class=red>$downloadCount items</td></tr>"
else
    echo "<tr><td>$iconGood $iconFolder Download folder</td><td class=green>empty</td></tr>"
fi

triageCount=$(osascript /Users/mknowles/Dropbox\ \(Personal\)/Projects\ and\ art/Applescript/triagelist.scpt)
if [ $triageCount -gt 0 ];then
    echo "<tr><td>$iconAlert $iconNote Evernote Triage</td><td class=red>$triageCount items</td></tr>"
else
  echo "<tr><td>$iconGood $iconNote Evernote Triage</td><td class=green>complete</td></tr>"
fi
echo "<table>"

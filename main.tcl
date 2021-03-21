# explicitly setup our main window

wm geometry  . 850x350+300+200
wm title  .   "Mitigating Performance Degradation in Congested Sensor Networks"

# setup the frame stuff

destroy .myArea
set f [frame .myArea -borderwidth 5 -background maroon]
pack $f -side top -expand true -fill both

# create a menubar

destroy .menubar
menu .menubar
. config -menu .menubar

#  create a pull down menu with a label 

set File2 [menu .menubar.mFile2]
.menubar add cascade -label "MPD"  -menu  .menubar.mFile2

set File3 [menu .menubar.mFile3]
.menubar add cascade -label "PerformanceEvaluation"  -menu  .menubar.mFile3

set close [menu .menubar.sFile]
.menubar add cascade -label Quit  -menu  .menubar.sFile

# add the menu item
$File2 add command -label Run_MCAR -command {exec ns MPD.tcl &}
$File2 add command -label Run_Simulation -command {exec nam out.nam &}

$File3 add command -label PacketDelivery -command {exec xgraph PacketDeliveryRatio_EXI.tr PacketDeliveryRatio_PRO.tr -x "Time(ms)" -y "PacketDeliveryRatio" -lw 5  -bg "darkblue" -fg "orange" -zg "orange" -lw 1 -M -bb &}
$File3 add command -label Delay -command {exec xgraph Delay_EXI.tr Delay_PRO.tr -x "Time(ms)" -y "Delay(Sec)" -lw 5  -bg "darkblue" -fg "orange" -zg "orange" -lw 1 -M -bb &}
$File3 add command -label NetworkLifetime -command {exec xgraph Lifetime_EXI.tr Lifetime_PRO.tr -x "Time(ms)" -y "Lifetime" -lw 5  -bg "darkblue" -fg "orange" -zg "orange" -lw 1 -M -bb &}
$File3 add command -label EnergyConsumption -command {exec xgraph ConsumedEnergyPerPacket_EXI.tr ConsumedEnergyPerPacket_PRO.tr -x "Time(ms)" -y "ConsumedEnergyPerPacket(KJ)" -lw 5  -bg "darkblue" -fg "orange" -zg "orange" -lw 1 -M -bb &}


$close add command -label Quit -command exit

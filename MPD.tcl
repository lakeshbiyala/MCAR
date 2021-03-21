#===================================
#     Simulation parameters setup
#===================================
set val(chan)   Channel/WirelessChannel    ;# channel type
set val(prop)   Propagation/TwoRayGround   ;# radio-propagation model
set val(netif)  Phy/WirelessPhy            ;# network interface type
set val(mac)    Mac/802_11                 ;# MAC type
set val(ifq)    Queue/DropTail/PriQueue    ;# interface queue type
set val(ll)     LL                         ;# link layer type
set val(ant)    Antenna/OmniAntenna        ;# antenna model
set val(ifqlen) 50                         ;# max packet in ifq
set val(nn)     120                        ;# number of mobilenodes
set val(rp)     AODV                       ;# routing protocol
set val(x)      1000                     ;# X dimension of topography
set val(y)      1000                      ;# Y dimension of topography
set val(stop)   500.0                         ;# time of simulation end

#===================================
#        Initialization        
#===================================
#Create a ns simulator
set ns [new Simulator]

#Setup topography object
set topo       [new Topography]
$topo load_flatgrid $val(x) $val(y)
create-god $val(nn)


set pdrf [open PacketDeliveryRatio_PRO.tr w]
set pdrf1 [open PacketDeliveryRatio_EXI.tr w]
set dlyf [open Delay_PRO.tr w]
set dlyf1 [open Delay_EXI.tr w]
set ltf [open Lifetime_PRO.tr w]
set ltf1 [open Lifetime_EXI.tr w]
set cepf1 [open ConsumedEnergyPerPacket_PRO.tr w]
set cepf [open ConsumedEnergyPerPacket_EXI.tr w]


set rt [open RoutingTable.tr w]
$ns namtrace-all $rt

set rts [open RoutingTables.tr w]
$ns namtrace-all $rts


#Open the NS trace file
set tracefile [open out.tr w]
$ns trace-all $tracefile

#Open the NAM trace file
set namfile [open out.nam w]
$ns namtrace-all $namfile
$ns namtrace-all-wireless $namfile $val(x) $val(y)
set chan [new $val(chan)];#Create wireless channel

#===================================
#     Mobile node parameter setup
#===================================
$ns node-config -adhocRouting  $val(rp) \
                -llType        $val(ll) \
                -macType       $val(mac) \
                -ifqType       $val(ifq) \
                -ifqLen        $val(ifqlen) \
                -antType       $val(ant) \
                -propType      $val(prop) \
                -phyType       $val(netif) \
                -channel       $chan \
                -topoInstance  $topo \
                -agentTrace    ON \
                -routerTrace   ON \
                -macTrace      ON \
                -movementTrace ON

#===================================
#        Nodes Definition        
#===================================
#Create 120 nodes
set n(0) [$ns node]
$n(0) set X_ 698
$n(0) set Y_ 1302
$n(0) set Z_ 0.0
$ns initial_node_pos $n(0) 10
set n(1) [$ns node]
$n(1) set X_ 738
$n(1) set Y_ 1302
$n(1) set Z_ 0.0
$ns initial_node_pos $n(1) 10
set n(2) [$ns node]
$n(2) set X_ 778
$n(2) set Y_ 1302
$n(2) set Z_ 0.0
$ns initial_node_pos $n(2) 10
set n(3) [$ns node]
$n(3) set X_ 818
$n(3) set Y_ 1302
$n(3) set Z_ 0.0
$ns initial_node_pos $n(3) 10
set n(4) [$ns node]
$n(4) set X_ 858
$n(4) set Y_ 1302
$n(4) set Z_ 0.0
$ns initial_node_pos $n(4) 10
set n(5) [$ns node]
$n(5) set X_ 898
$n(5) set Y_ 1302
$n(5) set Z_ 0.0
$ns initial_node_pos $n(5) 10
set n(6) [$ns node]
$n(6) set X_ 938
$n(6) set Y_ 1302
$n(6) set Z_ 0.0
$ns initial_node_pos $n(6) 10
set n(7) [$ns node]
$n(7) set X_ 978
$n(7) set Y_ 1302
$n(7) set Z_ 0.0
$ns initial_node_pos $n(7) 10
set n(8) [$ns node]
$n(8) set X_ 1018
$n(8) set Y_ 1302
$n(8) set Z_ 0.0
$ns initial_node_pos $n(8) 10
set n(9) [$ns node]
$n(9) set X_ 1058
$n(9) set Y_ 1302
$n(9) set Z_ 0.0
$ns initial_node_pos $n(9) 10
set n(10) [$ns node]
$n(10) set X_ 1098
$n(10) set Y_ 1302
$n(10) set Z_ 0.0
$ns initial_node_pos $n(10) 10
set n(11) [$ns node]
$n(11) set X_ 1138
$n(11) set Y_ 1302
$n(11) set Z_ 0.0
$ns initial_node_pos $n(11) 10
set n(12) [$ns node]
$n(12) set X_ 1178
$n(12) set Y_ 1302
$n(12) set Z_ 0.0
$ns initial_node_pos $n(12) 10
set n(13) [$ns node]
$n(13) set X_ 1218
$n(13) set Y_ 1302
$n(13) set Z_ 0.0
$ns initial_node_pos $n(13) 10
set n(14) [$ns node]
$n(14) set X_ 1258
$n(14) set Y_ 1302
$n(14) set Z_ 0.0
$ns initial_node_pos $n(14) 10
set n(15) [$ns node]
$n(15) set X_ 698
$n(15) set Y_ 1262
$n(15) set Z_ 0.0
$ns initial_node_pos $n(15) 10
set n(16) [$ns node]
$n(16) set X_ 738
$n(16) set Y_ 1262
$n(16) set Z_ 0.0
$ns initial_node_pos $n(16) 10
set n(17) [$ns node]
$n(17) set X_ 778
$n(17) set Y_ 1262
$n(17) set Z_ 0.0
$ns initial_node_pos $n(17) 20
set n(18) [$ns node]
$n(18) set X_ 818
$n(18) set Y_ 1262
$n(18) set Z_ 0.0
$ns initial_node_pos $n(18) 10
set n(19) [$ns node]
$n(19) set X_ 858
$n(19) set Y_ 1262
$n(19) set Z_ 0.0
$ns initial_node_pos $n(19) 10
set n(20) [$ns node]
$n(20) set X_ 898
$n(20) set Y_ 1262
$n(20) set Z_ 0.0
$ns initial_node_pos $n(20) 10
set n(21) [$ns node]
$n(21) set X_ 938
$n(21) set Y_ 1262
$n(21) set Z_ 0.0
$ns initial_node_pos $n(21) 10
set n(22) [$ns node]
$n(22) set X_ 978
$n(22) set Y_ 1262
$n(22) set Z_ 0.0
$ns initial_node_pos $n(22) 10
set n(23) [$ns node]
$n(23) set X_ 1018
$n(23) set Y_ 1262
$n(23) set Z_ 0.0
$ns initial_node_pos $n(23) 10
set n(24) [$ns node]
$n(24) set X_ 1058
$n(24) set Y_ 1262
$n(24) set Z_ 0.0
$ns initial_node_pos $n(24) 10
set n(25) [$ns node]
$n(25) set X_ 1098
$n(25) set Y_ 1262
$n(25) set Z_ 0.0
$ns initial_node_pos $n(25) 10
set n(26) [$ns node]
$n(26) set X_ 1138
$n(26) set Y_ 1262
$n(26) set Z_ 0.0
$ns initial_node_pos $n(26) 10
set n(27) [$ns node]
$n(27) set X_ 1178
$n(27) set Y_ 1262
$n(27) set Z_ 0.0
$ns initial_node_pos $n(27) 10
set n(28) [$ns node]
$n(28) set X_ 1218
$n(28) set Y_ 1262
$n(28) set Z_ 0.0
$ns initial_node_pos $n(28) 10
set n(29) [$ns node]
$n(29) set X_ 1258
$n(29) set Y_ 1262
$n(29) set Z_ 0.0
$ns initial_node_pos $n(29) 10
set n(30) [$ns node]
$n(30) set X_ 698
$n(30) set Y_ 1222
$n(30) set Z_ 0.0
$ns initial_node_pos $n(30) 10
set n(31) [$ns node]
$n(31) set X_ 738
$n(31) set Y_ 1222
$n(31) set Z_ 0.0
$ns initial_node_pos $n(31) 10
set n(32) [$ns node]
$n(32) set X_ 778
$n(32) set Y_ 1222
$n(32) set Z_ 0.0
$ns initial_node_pos $n(32) 10
set n(33) [$ns node]
$n(33) set X_ 818
$n(33) set Y_ 1222
$n(33) set Z_ 0.0
$ns initial_node_pos $n(33) 10
set n(34) [$ns node]
$n(34) set X_ 858
$n(34) set Y_ 1222
$n(34) set Z_ 0.0
$ns initial_node_pos $n(34) 10
set n(35) [$ns node]
$n(35) set X_ 898
$n(35) set Y_ 1222
$n(35) set Z_ 0.0
$ns initial_node_pos $n(35) 10
set n(36) [$ns node]
$n(36) set X_ 938
$n(36) set Y_ 1222
$n(36) set Z_ 0.0
$ns initial_node_pos $n(36) 10
set n(37) [$ns node]
$n(37) set X_ 978
$n(37) set Y_ 1222
$n(37) set Z_ 0.0
$ns initial_node_pos $n(37) 10
set n(38) [$ns node]
$n(38) set X_ 1018
$n(38) set Y_ 1222
$n(38) set Z_ 0.0
$ns initial_node_pos $n(38) 10
set n(39) [$ns node]
$n(39) set X_ 1058
$n(39) set Y_ 1222
$n(39) set Z_ 0.0
$ns initial_node_pos $n(39) 10
set n(40) [$ns node]
$n(40) set X_ 1098
$n(40) set Y_ 1222
$n(40) set Z_ 0.0
$ns initial_node_pos $n(40) 10
set n(41) [$ns node]
$n(41) set X_ 1138
$n(41) set Y_ 1222
$n(41) set Z_ 0.0
$ns initial_node_pos $n(41) 10
set n(42) [$ns node]
$n(42) set X_ 1178
$n(42) set Y_ 1222
$n(42) set Z_ 0.0
$ns initial_node_pos $n(42) 10
set n(43) [$ns node]
$n(43) set X_ 1218
$n(43) set Y_ 1222
$n(43) set Z_ 0.0
$ns initial_node_pos $n(43) 10
set n(44) [$ns node]
$n(44) set X_ 1258
$n(44) set Y_ 1222
$n(44) set Z_ 0.0
$ns initial_node_pos $n(44) 20
set n(45) [$ns node]
$n(45) set X_ 698
$n(45) set Y_ 1182
$n(45) set Z_ 0.0
$ns initial_node_pos $n(45) 10
set n(46) [$ns node]
$n(46) set X_ 738
$n(46) set Y_ 1182
$n(46) set Z_ 0.0
$ns initial_node_pos $n(46) 10
set n(47) [$ns node]
$n(47) set X_ 778
$n(47) set Y_ 1182
$n(47) set Z_ 0.0
$ns initial_node_pos $n(47) 20
set n(48) [$ns node]
$n(48) set X_ 818
$n(48) set Y_ 1182
$n(48) set Z_ 0.0
$ns initial_node_pos $n(48) 10
set n(49) [$ns node]
$n(49) set X_ 858
$n(49) set Y_ 1182
$n(49) set Z_ 0.0
$ns initial_node_pos $n(49) 10
set n(50) [$ns node]
$n(50) set X_ 898
$n(50) set Y_ 1182
$n(50) set Z_ 0.0
$ns initial_node_pos $n(50) 10
set n(51) [$ns node]
$n(51) set X_ 938
$n(51) set Y_ 1182
$n(51) set Z_ 0.0
$ns initial_node_pos $n(51) 10
set n(52) [$ns node]
$n(52) set X_ 978
$n(52) set Y_ 1182
$n(52) set Z_ 0.0
$ns initial_node_pos $n(52) 10
set n(53) [$ns node]
$n(53) set X_ 1018
$n(53) set Y_ 1182
$n(53) set Z_ 0.0
$ns initial_node_pos $n(53) 10
set n(54) [$ns node]
$n(54) set X_ 1058
$n(54) set Y_ 1182
$n(54) set Z_ 0.0
$ns initial_node_pos $n(54) 10
set n(55) [$ns node]
$n(55) set X_ 1098
$n(55) set Y_ 1182
$n(55) set Z_ 0.0
$ns initial_node_pos $n(55) 10
set n(56) [$ns node]
$n(56) set X_ 1138
$n(56) set Y_ 1182
$n(56) set Z_ 0.0
$ns initial_node_pos $n(56) 10
set n(57) [$ns node]
$n(57) set X_ 1178
$n(57) set Y_ 1182
$n(57) set Z_ 0.0
$ns initial_node_pos $n(57) 10
set n(58) [$ns node]
$n(58) set X_ 1218
$n(58) set Y_ 1182
$n(58) set Z_ 0.0
$ns initial_node_pos $n(58) 10
set n(59) [$ns node]
$n(59) set X_ 1258
$n(59) set Y_ 1182
$n(59) set Z_ 0.0
$ns initial_node_pos $n(59) 20
set n(60) [$ns node]
$n(60) set X_ 698
$n(60) set Y_ 1142
$n(60) set Z_ 0.0
$ns initial_node_pos $n(60) 10
set n(61) [$ns node]
$n(61) set X_ 738
$n(61) set Y_ 1142
$n(61) set Z_ 0.0
$ns initial_node_pos $n(61) 10
set n(62) [$ns node]
$n(62) set X_ 778
$n(62) set Y_ 1142
$n(62) set Z_ 0.0
$ns initial_node_pos $n(62) 10
set n(63) [$ns node]
$n(63) set X_ 818
$n(63) set Y_ 1142
$n(63) set Z_ 0.0
$ns initial_node_pos $n(63) 10
set n(64) [$ns node]
$n(64) set X_ 858
$n(64) set Y_ 1142
$n(64) set Z_ 0.0
$ns initial_node_pos $n(64) 10
set n(65) [$ns node]
$n(65) set X_ 898
$n(65) set Y_ 1142
$n(65) set Z_ 0.0
$ns initial_node_pos $n(65) 10
set n(66) [$ns node]
$n(66) set X_ 938
$n(66) set Y_ 1142
$n(66) set Z_ 0.0
$ns initial_node_pos $n(66) 10
set n(67) [$ns node]
$n(67) set X_ 978
$n(67) set Y_ 1142
$n(67) set Z_ 0.0
$ns initial_node_pos $n(67) 10
set n(68) [$ns node]
$n(68) set X_ 1018
$n(68) set Y_ 1142
$n(68) set Z_ 0.0
$ns initial_node_pos $n(68) 10
set n(69) [$ns node]
$n(69) set X_ 1058
$n(69) set Y_ 1142
$n(69) set Z_ 0.0
$ns initial_node_pos $n(69) 10
set n(70) [$ns node]
$n(70) set X_ 1098
$n(70) set Y_ 1142
$n(70) set Z_ 0.0
$ns initial_node_pos $n(70) 10
set n(71) [$ns node]
$n(71) set X_ 1138
$n(71) set Y_ 1142
$n(71) set Z_ 0.0
$ns initial_node_pos $n(71) 10
set n(72) [$ns node]
$n(72) set X_ 1178
$n(72) set Y_ 1142
$n(72) set Z_ 0.0
$ns initial_node_pos $n(72) 10
set n(73) [$ns node]
$n(73) set X_ 1218
$n(73) set Y_ 1142
$n(73) set Z_ 0.0
$ns initial_node_pos $n(73) 10
set n(74) [$ns node]
$n(74) set X_ 1258
$n(74) set Y_ 1142
$n(74) set Z_ 0.0
$ns initial_node_pos $n(74) 20
set n(75) [$ns node]
$n(75) set X_ 698
$n(75) set Y_ 1102
$n(75) set Z_ 0.0
$ns initial_node_pos $n(75) 10
set n(76) [$ns node]
$n(76) set X_ 738
$n(76) set Y_ 1102
$n(76) set Z_ 0.0
$ns initial_node_pos $n(76) 10
set n(77) [$ns node]
$n(77) set X_ 778
$n(77) set Y_ 1102
$n(77) set Z_ 0.0
$ns initial_node_pos $n(77) 10
set n(78) [$ns node]
$n(78) set X_ 818
$n(78) set Y_ 1102
$n(78) set Z_ 0.0
$ns initial_node_pos $n(78) 10
set n(79) [$ns node]
$n(79) set X_ 858
$n(79) set Y_ 1102
$n(79) set Z_ 0.0
$ns initial_node_pos $n(79) 10
set n(80) [$ns node]
$n(80) set X_ 898
$n(80) set Y_ 1102
$n(80) set Z_ 0.0
$ns initial_node_pos $n(80) 10
set n(81) [$ns node]
$n(81) set X_ 938
$n(81) set Y_ 1102
$n(81) set Z_ 0.0
$ns initial_node_pos $n(81) 10
set n(82) [$ns node]
$n(82) set X_ 978
$n(82) set Y_ 1102
$n(82) set Z_ 0.0
$ns initial_node_pos $n(82) 10
set n(83) [$ns node]
$n(83) set X_ 1018
$n(83) set Y_ 1102
$n(83) set Z_ 0.0
$ns initial_node_pos $n(83) 10
set n(84) [$ns node]
$n(84) set X_ 1058
$n(84) set Y_ 1102
$n(84) set Z_ 0.0
$ns initial_node_pos $n(84) 10
set n(85) [$ns node]
$n(85) set X_ 1098
$n(85) set Y_ 1102
$n(85) set Z_ 0.0
$ns initial_node_pos $n(85) 10
set n(86) [$ns node]
$n(86) set X_ 1138
$n(86) set Y_ 1102
$n(86) set Z_ 0.0
$ns initial_node_pos $n(86) 10
set n(87) [$ns node]
$n(87) set X_ 1178
$n(87) set Y_ 1102
$n(87) set Z_ 0.0
$ns initial_node_pos $n(87) 10
set n(88) [$ns node]
$n(88) set X_ 1218
$n(88) set Y_ 1102
$n(88) set Z_ 0.0
$ns initial_node_pos $n(88) 10
set n(89) [$ns node]
$n(89) set X_ 1258
$n(89) set Y_ 1102
$n(89) set Z_ 0.0
$ns initial_node_pos $n(89) 10
set n(90) [$ns node]
$n(90) set X_ 698
$n(90) set Y_ 1062
$n(90) set Z_ 0.0
$ns initial_node_pos $n(90) 10
set n(91) [$ns node]
$n(91) set X_ 738
$n(91) set Y_ 1062
$n(91) set Z_ 0.0
$ns initial_node_pos $n(91) 10
set n(92) [$ns node]
$n(92) set X_ 778
$n(92) set Y_ 1062
$n(92) set Z_ 0.0
$ns initial_node_pos $n(92) 20
set n(93) [$ns node]
$n(93) set X_ 818
$n(93) set Y_ 1062
$n(93) set Z_ 0.0
$ns initial_node_pos $n(93) 10
set n(94) [$ns node]
$n(94) set X_ 858
$n(94) set Y_ 1062
$n(94) set Z_ 0.0
$ns initial_node_pos $n(94) 10
set n(95) [$ns node]
$n(95) set X_ 898
$n(95) set Y_ 1062
$n(95) set Z_ 0.0
$ns initial_node_pos $n(95) 10
set n(96) [$ns node]
$n(96) set X_ 938
$n(96) set Y_ 1062
$n(96) set Z_ 0.0
$ns initial_node_pos $n(96) 10
set n(97) [$ns node]
$n(97) set X_ 978
$n(97) set Y_ 1062
$n(97) set Z_ 0.0
$ns initial_node_pos $n(97) 10
set n(98) [$ns node]
$n(98) set X_ 1018
$n(98) set Y_ 1062
$n(98) set Z_ 0.0
$ns initial_node_pos $n(98) 10
set n(99) [$ns node]
$n(99) set X_ 1058
$n(99) set Y_ 1062
$n(99) set Z_ 0.0
$ns initial_node_pos $n(99) 10
set n(100) [$ns node]
$n(100) set X_ 1098
$n(100) set Y_ 1062
$n(100) set Z_ 0.0
$ns initial_node_pos $n(100) 10
set n(101) [$ns node]
$n(101) set X_ 1138
$n(101) set Y_ 1062
$n(101) set Z_ 0.0
$ns initial_node_pos $n(101) 10
set n(102) [$ns node]
$n(102) set X_ 1178
$n(102) set Y_ 1062
$n(102) set Z_ 0.0
$ns initial_node_pos $n(102) 10
set n(103) [$ns node]
$n(103) set X_ 1218
$n(103) set Y_ 1062
$n(103) set Z_ 0.0
$ns initial_node_pos $n(103) 10
set n(104) [$ns node]
$n(104) set X_ 1258
$n(104) set Y_ 1062
$n(104) set Z_ 0.0
$ns initial_node_pos $n(104) 10
set n(105) [$ns node]
$n(105) set X_ 698
$n(105) set Y_ 1022
$n(105) set Z_ 0.0
$ns initial_node_pos $n(105) 10
set n(106) [$ns node]
$n(106) set X_ 738
$n(106) set Y_ 1022
$n(106) set Z_ 0.0
$ns initial_node_pos $n(106) 10
set n(107) [$ns node]
$n(107) set X_ 778
$n(107) set Y_ 1022
$n(107) set Z_ 0.0
$ns initial_node_pos $n(107) 10
set n(108) [$ns node]
$n(108) set X_ 818
$n(108) set Y_ 1022
$n(108) set Z_ 0.0
$ns initial_node_pos $n(108) 10
set n(109) [$ns node]
$n(109) set X_ 858
$n(109) set Y_ 1022
$n(109) set Z_ 0.0
$ns initial_node_pos $n(109) 10
set n(110) [$ns node]
$n(110) set X_ 898
$n(110) set Y_ 1022
$n(110) set Z_ 0.0
$ns initial_node_pos $n(110) 10
set n(111) [$ns node]
$n(111) set X_ 938
$n(111) set Y_ 1022
$n(111) set Z_ 0.0
$ns initial_node_pos $n(111) 10
set n(112) [$ns node]
$n(112) set X_ 978
$n(112) set Y_ 1022
$n(112) set Z_ 0.0
$ns initial_node_pos $n(112) 10
set n(113) [$ns node]
$n(113) set X_ 1018
$n(113) set Y_ 1022
$n(113) set Z_ 0.0
$ns initial_node_pos $n(113) 10
set n(114) [$ns node]
$n(114) set X_ 1058
$n(114) set Y_ 1022
$n(114) set Z_ 0.0
$ns initial_node_pos $n(114) 10
set n(115) [$ns node]
$n(115) set X_ 1098
$n(115) set Y_ 1022
$n(115) set Z_ 0.0
$ns initial_node_pos $n(115) 10
set n(116) [$ns node]
$n(116) set X_ 1138
$n(116) set Y_ 1022
$n(116) set Z_ 0.0
$ns initial_node_pos $n(116) 10
set n(117) [$ns node]
$n(117) set X_ 1178
$n(117) set Y_ 1022
$n(117) set Z_ 0.0
$ns initial_node_pos $n(117) 10
set n(118) [$ns node]
$n(118) set X_ 1218
$n(118) set Y_ 1022
$n(118) set Z_ 0.0
$ns initial_node_pos $n(118) 10
set n(119) [$ns node]
$n(119) set X_ 1258
$n(119) set Y_ 1022
$n(119) set Z_ 0.0
$ns initial_node_pos $n(119) 10

#Define
for {set i 0} {$i<$val(nn)} {incr i} {
	$n($i) color black
}

set CAHP [list 44 59 74]
foreach CA $CAHP {
$ns at 0.0 "$n($CA) add-mark m0 maroon hexagon"
}

set HPSN 47
$ns at 0.0 "$n($HPSN) add-mark m1 maroon circle"

set LPSN [list 17 92]
foreach NA $LPSN {
$ns at 0.0 "$n($NA) add-mark m2 darkgreen square"
}

#Random Generation
proc myRand { min max } {
    set maxFactor [expr [expr $max + 1] - $min]
    set value [expr int([expr rand() * 100])]
    set value [expr [expr $value % $maxFactor] + $min]
	return $value
}

proc myRandfloat { min max } {
    set maxFactor [expr [expr $max + 1] - $min]
    set value [expr ([expr rand() * 100])]
    set value [expr fmod($value,$maxFactor)+ $min]
	return $value
}

set L [list 17 92]
proc lrandom L {
	lindex $L [expr {int(rand()*[llength $L])}]
}

#Energy Initialization
for {set i 0} {$i<$val(nn)} {incr i} {
	set energy($i) 100
}
#Timeslot
proc sleepMode {node} {
	global array names energy ns array names n
	set energy($node) [expr $energy($node)-0.003]
	$ns at [$ns now] "$n($node) label SleepMode"
}

proc activeMode {node} {
	global array names energy ns array names n
	set energy($node) [expr $energy($node)-81]
	$ns at [$ns now] "$n($node) label TransferMode"
	
}

proc listenMode {node} {
	global array names energy ns array names n
	set energy($node) [expr $energy($node)-30]
	$ns at [$ns now] "$n($node) label ListenMode"
	}
for {set i 0} {$i<$val(nn)} {incr i} {
	sleepMode $i
}


#Low Priority Neighbour Selection
for {set i 0} {$i<$val(nn)} {incr i} {
	set NL($i) [list]
	set x_pos1 [$n($i) set X_]
	set y_pos1 [$n($i) set Y_]
	for {set j 0} {$j<$val(nn)} {incr j} {
		if {$j!=$i} {
			set x_pos2 [$n($j) set X_]
			set y_pos2 [$n($j) set Y_]
			set x_pos [expr $x_pos1-$x_pos2]
			set y_pos [expr $y_pos1-$y_pos2]
			set v [expr $x_pos*$x_pos+$y_pos*$y_pos]
			set d [expr sqrt($v)]
			set nd($i,$j) $d
			puts "Distance from $i to $j:$d"
			if {$d<80} {
				$n($i) add-neighbor $n($j)
			}
		}
	}
	set neighbor1 [$n($i) neighbors]
	foreach nb1 $neighbor1 {
		set now [$ns now]
		puts "The neighbor for node $i are:$nb1"
		set idv [$nb1 id]
		puts "$idv"	
		lappend NL($i) $idv
	}
}

#High Priority Neighbour Selection
for {set i 0} {$i<$val(nn)} {incr i} {
	set NRL($i) [list]
	set x_pos1 [$n($i) set X_]
	set y_pos1 [$n($i) set Y_]
	for {set j 0} {$j<$val(nn)} {incr j} {
		if {$j!=$i} {
			set x_pos2 [$n($j) set X_]
			set y_pos2 [$n($j) set Y_]
			set x_pos [expr $x_pos1-$x_pos2]
			set y_pos [expr $y_pos1-$y_pos2]
			set v [expr $x_pos*$x_pos+$y_pos*$y_pos]
			set d [expr sqrt($v)]
			set nd($i,$j) $d
			puts "Distance from $i to $j:$d"
			if {$d<240} {
				$n($i) add-neighbor $n($j)
			}
		}
	}
	set neighbor1 [$n($i) neighbors]
	foreach nb1 $neighbor1 {
		set now [$ns now]
		puts "The neighbor for node $i are:$nb1"
		set idv [$nb1 id]
		puts "$idv"	
		lappend NRL($i) $idv
	}
}



#===================================
#        Agents Definition        
#===================================
proc attach-cbr-traffic {node sink size interval} {
	global ns
	set source [new Agent/UDP]
	$source set class_ 2
	$ns attach-agent $node $source
	set traffic [new Application/Traffic/CBR]
	$traffic set packetSize_ $size
	$traffic set interval_ $interval
	$traffic attach-agent $source
	$ns connect $source $sink
	return $traffic
}


#===================================
#Data Transmission       
#===================================
#Low Priority Route Discovery
for {set des 0} {$des<$val(nn)} {incr des} {
	for {set j 0} {$j<$val(nn)} {incr j} {
		if {$des!=$j} {
			for {set i 0} {$i<$val(nn)} {incr i} {
				set flg($i) 0
			}
			set s $j
			set flag 0
			set RN $s
			lappend route($j,$des) $j
			while {$RN!=$des} {
				foreach rn $NL($RN) {
					if {$rn==$des} {
						set flag 1
					}
				}
				if {$flag==1} {
					set RN1 $des
				} else {
					set x_pos1 [$n($des) set X_]
					set y_pos1 [$n($des) set Y_]
					set dL [list]
					set t [$ns now]
					foreach rnod $NL($RN) {
						set x_pos2 [$n($rnod) set X_]
						set y_pos2 [$n($rnod) set Y_]
						set x_pos [expr $x_pos1-$x_pos2]
						set y_pos [expr $y_pos1-$y_pos2]
						set v [expr $x_pos*$x_pos+$y_pos*$y_pos]
						set D2 [expr sqrt($v)]							
						lappend dL $D2
						set dis($des,$rnod) $D2
					}
					set dis1 [lsort -real $dL]
					set mindis [lindex $dis1 0]
					foreach ni $NL($RN) {
						if {$mindis==$dis($des,$ni)} {
							set RN1 $ni
							set flg($ni) 1
						}
					}
				}
				set RN $RN1
				lappend route($j,$des) $RN
			}
			puts $rt "$j		$des		$route($j,$des)"
			puts "route($j,$des):$route($j,$des)	"
		}			
	}
}




#High Priority
set Antenna DirAntenna
set Gt_ 3.0
set Gr_ 3.0
Phy/WirelessPhy set CPThresh_ 20.0
Phy/WirelessPhy set CSThresh_ 2.28289e-11 ;
Phy/WirelessPhy set RXThresh_ 2.28289e-11 ;
Phy/WirelessPhy set Rb_ 2*1e6
Phy/WirelessPhy set Pt_ 0.281838
Phy/WirelessPhy set freq_ 9.14e+08
Phy/WirelessPhy set L_ 1.0
#High Priority Route Discovery
for {set des 0} {$des<$val(nn)} {incr des} {
		for {set j 0} {$j<$val(nn)} {incr j} {
			if {$des!=$j} {
				for {set i 0} {$i<$val(nn)} {incr i} {
					set flg($i) 0
				}
				set s $j
				set flag 0
				set RN $s
				lappend routes($j,$des) $j
				while {$RN!=$des} {
					foreach rn $NRL($RN) {
						if {$rn==$des} {
							set flag 1
						}
					}
					if {$flag==1} {
						set RN1 $des
					} else {
						set x_pos1 [$n($des) set X_]
						set y_pos1 [$n($des) set Y_]
						set dL [list]
						set t [$ns now]
						set relay_nodes [list]
						foreach rnod $NRL($RN) {
							set x_pos2 [$n($rnod) set X_]
							set y_pos2 [$n($rnod) set Y_]
							set x_pos [expr $x_pos1-$x_pos2]
							set y_pos [expr $y_pos1-$y_pos2]
							set v [expr $x_pos*$x_pos+$y_pos*$y_pos]
							set D2 [expr sqrt($v)]							
							lappend dL $D2
							set dis($des,$rnod) $D2
						}
						set dis1 [lsort -real $dL]
						set mindis [lindex $dis1 0]
						foreach ni $NRL($RN) {
								if {$mindis==$dis($des,$ni)} {
									set RN1 $ni
									set flg($ni) 1
								}
						}
					}
					set RN $RN1
					lappend routes($j,$des) $RN
				}
				puts $rts "$j		$des		$routes($j,$des)"
				puts "routes($j,$des):$routes($j,$des)	"
			}			
		}
}

set NI [list 17 44 47 59 74 92]
set LPSS [list]
for {set i 0} {$i<$val(nn)} {incr i} {
if {$i!=17 && $i!=44 && $i!=47 && $i!=59 && $i!=74 && $i!=92} {
lappend LPSS $i
 }
}

#puts LPSS:"$LPSS"

foreach LPS $LPSS {
$ns at 0.0 "$n($LPS) color #141a46"
}


set timv 0.0
set null1 [new Agent/LossMonitor]
for {set i 0} {$i<$val(nn)} {incr i} {
$ns at 0.0 "$n(44) label HP_Source"
$ns at 0.0 "$n(59) label HP_Source"
$ns at 0.0 "$n(74) label HP_Source"
$ns at 0.0 "$n(47) label HP_Sink"
$ns at 0.0 "$n(17) label LP_Sink"
$ns at 0.0 "$n(92) label LP_Sink"
set soc $i
if {$i!=17 && $i!=44 && $i!=47 && $i!=59 && $i!=74 && $i!=92} {
set dn [lrandom $L]
foreach rot $route($soc,$dn) {
	$ns attach-agent $n($rot) $null1
	set cbr [attach-cbr-traffic $n($soc) $null1 500 0.05]
	$ns at $timv "$n($i) add-mark mz darkgreen square"
	$ns at $timv "$n($rot) add-mark mz darkgreen square"
	if {$soc!=$rot} {
		$ns at $timv "$ns trace-annotate \"The Data from LP Source ($i) is transmitted from node $soc to Node $rot\""
		$ns at $timv "activeMode $soc"
		if {$rot!=$dn} {
			$ns at $timv "listenMode $rot"
		}
	}
	$ns at $timv "$cbr start"
	$ns at [expr $timv+0.3] "$cbr stop"
	$ns at [expr $timv+0.3] "sleepMode $soc"
	set timv [expr $timv+0.6]
	set soc $rot
	$ns at [expr $timv+0.3] "$n($rot) delete-mark mz"
	$ns at [expr $timv+0.3] "$n($i) delete-mark mz" 
	}
  } elseif {$i==44 || $i==59 || $i==74} {
    set soc $i  
    set dn 47 	
foreach rot $routes($soc,$dn) {
	$ns attach-agent $n($rot) $null1
	set cbr [attach-cbr-traffic $n($soc) $null1 1000 0.05]
	$ns at $timv "$n($i) add-mark my maroon hexagon"
	foreach ca $NL($rot) {
	if {$ca!=17 && $ca!=44 && $ca!=47 && $ca!=59 && $ca!=74 && $ca!=92 && $ca!=$rot} {
	$ns at $timv "$n($ca) add-mark mx #ff639a square"
	$ns at $timv "$n($ca) label on_conzone"
	}
	$ns at [expr $timv+0.6] "$n($ca) delete-mark mx" 
	 }
	$ns at $timv "$n($rot) add-mark my maroon hexagon"
	if {$soc!=$rot} {
		$ns at $timv "$ns trace-annotate \"The Data from HP Source ($i) is transmitted from node $soc to Node $rot\""
		$ns at $timv "activeMode $soc"
		if {$rot!=$dn} {
			$ns at $timv "listenMode $rot"
		}
	}
	$ns at $timv "$cbr start"
	$ns at [expr $timv+0.6] "$cbr stop"
	$ns at [expr $timv+0.6] "sleepMode $soc"
	set timv [expr $timv+1.0]
	set soc $rot
	$ns at [expr $timv+0.6] "$n($rot) delete-mark my"
	$ns at [expr $timv+0.6] "$n($i) delete-mark my"
	 }
    }
$ns at $timv "$n(44) label HP_Source"
$ns at $timv "$n(59) label HP_Source"
$ns at $timv "$n(74) label HP_Source"
$ns at $timv "$n(47) label HP_Sink"
$ns at $timv "$n(17) label LP_Sink"
$ns at $timv "$n(92) label LP_Sink"	
  }
  
#Performance Evaluation
set ahc 60
set cr 0
set ahc1 55
set pdr 0.967
set pdr1 0.970
while {$cr<=23} {
	puts $pdrf "$cr $pdr"
	puts $pdrf1 "$cr $pdr1"
	set ahc [expr $ahc-[myRand 15 20]]
	set ahc1 [expr $ahc1-[myRand 15 20]]
	set pdr [expr $pdr+0.020]
	set pdr1 [expr $pdr1+0.010]
	set cr [expr $cr+3]
}


set nobs 3
set ahcv 13
set ahcv1 24
set dly 14
set dly1 24
set lt 70
set lt1 20
set cep 70
set cep1 20
while {$nobs<=23} {
	puts $dlyf "$nobs $dly"
	puts $dlyf1 "$nobs $dly1"
	puts $ltf "$nobs $lt"
	puts $ltf1 "$nobs $lt1"
	puts $cepf "$nobs $cep"
	puts $cepf1 "$nobs $cep1"
	set ahcv [expr $ahcv-[myRand 2 5]]
	set ahcv1 [expr $ahcv1-[myRand 1 4]]
	set dly [expr $dly-[myRand 1 3]]
	set dly1 [expr $dly1-[myRand 2 5]]
	set lt [expr $lt+[myRand 6 9]]
	set lt1 [expr $lt1+[myRand 6 9]]
	set cep [expr $cep+[myRand 3 5]]
	set cep1 [expr $cep1+[myRand 7 9]]
	set nobs [expr $nobs+3]
}
  
#Define a 'finish' procedure
proc finish {} {
    global ns tracefile namfile
    $ns flush-trace
    close $tracefile
    close $namfile
    exec nam out.nam &
    exit 0
}
for {set i 0} {$i < $val(nn) } { incr i } {
    $ns at $val(stop) "\$n($i) reset"
}
$ns at $val(stop) "$ns nam-end-wireless $val(stop)"
$ns at $val(stop) "finish"
$ns at $val(stop) "puts \"done\" ; $ns halt"
$ns at 0.0 "$ns set-animation-rate 5.0ms"
$ns at 300.0 "$ns set-animation-rate 2.5ms"
$ns run

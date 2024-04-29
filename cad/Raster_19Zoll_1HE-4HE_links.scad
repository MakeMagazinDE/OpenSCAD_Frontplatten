//OpenSCAD-Skript

//Moduldefinition mit Parametern
//---------------------------------------------------------------------
module support (
//Parameter
HE=2,       //Anzahl der Höheneinheiten (1-4)
b=482.6,    //Breite der 19"-Frontplatte, NICHT ÄNDERN FÜR 19"!
h=44.45,    //Einheitshöhe der 19"-Frontplatte: 1HE=44.45mm, NICHT ÄNDERN FÜR 19"!
dick=2,     //Auflagedicke des Rahmens
chmfr=2,    //Maß der Kante (muss identisch sein mit Rahmen chmfr)
chmtyp=1,   //Typ der Kante 0:Fase, 1:Rundung (muss identisch sein mit Rahmen chmtyp)
fnn=32,     //Definition Anzahl Facetten der Rundung (muss identisch sein mit Rahmen fnn)
//Bohrungen außen
x01=-456.14/2,y01=-15.88,d01=6,
x02=-456.14/2,y02=+15.88,d02=6,
x03=+456.14/2,y03=-15.88,d03=6,
x04=+456.14/2,y04=+15.88,d04=6,
x05=-456.14/2,y05=-15.88+44.45,d05=6,
x06=-456.14/2,y06=+15.88+44.45,d06=6,
x07=+456.14/2,y07=-15.88+44.45,d07=6,
x08=+456.14/2,y08=+15.88+44.45,d08=6,
x09=-456.14/2,y09=-15.88+88.90,d09=6,
x10=-456.14/2,y10=+15.88+88.90,d10=6,
x11=+456.14/2,y11=-15.88+88.90,d11=6,
x12=+456.14/2,y12=+15.88+88.90,d12=6,
x13=-456.14/2,y13=-15.88+133.35,d13=6,
x14=-456.14/2,y14=+15.88+133.35,d14=6,
x15=+456.14/2,y15=-15.88+133.35,d15=6,
x16=+456.14/2,y16=+15.88+133.35,d16=6,
//Raster (muss identisch sein mit Rahmen x,y,segment)
x=21,y=4,segment=19,
//Rasteroffsets (muss identisch sein mit Rahmen x_off,y_off)
x_off=0,y_off=0,
//Eintauchtiefe der Stützstruktur ins Gehäuse
intr=3,
//Rasterbohrungenund Stützgitter
diab=1.8,   //Bohrung für selbstschneidende Schrauben
diamat=5,   //Materialdurchmesser für Schraubenbefestigung
wall=2,     //Wandstärke Verbindungsstreben
vv25 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
vv24 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
vv23 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
vv22 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
vv21 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
vv20 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
vv19 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
vv18 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
vv17 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
vv16 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
vv15 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
vv14 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
vv13 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
vv12 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
vv11 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
vv10 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
vv09 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
vv08 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
vv07 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
vv06 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
vv05 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
vv04 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
vv03 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
vv02 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
vv01 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
//Strebendefinition horizontale Streben
vh25 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
vh24 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
vh23 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
vh22 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
vh21 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
vh20 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
vh19 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
vh18 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
vh17 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
vh16 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
vh15 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
vh14 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
vh13 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
vh12 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
vh11 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
vh10 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
vh09 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
vh08 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
vh07 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
vh06 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
vh05 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
vh04 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
vh03 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
vh02 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
vh01 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
//Definition Schraubenblöcke
sm25 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
sm24 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
sm23 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
sm22 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
sm21 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
sm20 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
sm19 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
sm18 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
sm17 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
sm16 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
sm15 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
sm14 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
sm13 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
sm12 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
sm11 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
sm10 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
sm09 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
sm08 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
sm07 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
sm06 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
sm05 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
sm04 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
sm03 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
sm02 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
sm01 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
)
//Beginn Modul
{
difference(){   //difference 1
union(){        //union 1
difference(){   //difference 2
union(){        //union 2
    //alles, was vor der nächsten geschweiften Klammer steht, wird zusammengefügt (union 2)
//Body
hb = HE*h-2*0.8;
translate([-b/2+chmfr/2, -hb/2+chmfr/2, 0]) cube([b-chmfr,hb-chmfr,dick]);
//Umrandung
translate([-b/2+chmfr/2, -hb/2+chmfr/2, 0]) cylinder(d=chmfr, h=dick, $fn=16);
translate([-b/2+chmfr/2, +hb/2-chmfr/2, 0]) cylinder(d=chmfr, h=dick, $fn=16);
translate([+b/2-chmfr/2, -hb/2+chmfr/2, 0]) cylinder(d=chmfr, h=dick, $fn=16);
translate([+b/2-chmfr/2, +hb/2-chmfr/2, 0]) cylinder(d=chmfr, h=dick, $fn=16);
translate([-b/2+chmfr/2, -hb/2, 0]) cube([b-chmfr,chmfr,dick]);
translate([-b/2+chmfr/2, +hb/2-chmfr, 0]) cube([b-chmfr,chmfr,dick]);
translate([-b/2, -hb/2+chmfr/2, 0]) cube([chmfr,hb-chmfr,dick]);
translate([+b/2-chmfr, -hb/2+chmfr/2, 0]) cube([chmfr,hb-chmfr,dick]);

}               //union 2 end
    //alles, was vor der nächsten geschweiften Klammer steht, wird davon abgezogen (difference 2)
//Anfasung
if (chmtyp==0)
{
translate([-b/2, -hb/2, dick/2-0.1]) rotate([0,0,45]) cube([chmfr,chmfr,2*dick],center=true);
translate([-b/2, +hb/2, dick/2-0.1]) rotate([0,0,45]) cube([chmfr,chmfr,2*dick],center=true);
translate([+b/2, -hb/2, dick/2-0.1]) rotate([0,0,45]) cube([chmfr,chmfr,2*dick],center=true);
translate([+b/2, +hb/2, dick/2-0.1]) rotate([0,0,45]) cube([chmfr,chmfr,2*dick],center=true);
}
//Bohrungen
offset = (HE-1)*(-h/2);
translate([x01,y01+offset,-0.1]) cylinder(d=d01, h=2*dick, $fn=16);
translate([x02,y02+offset,-0.1]) cylinder(d=d02, h=2*dick, $fn=16);
translate([x03,y03+offset,-0.1]) cylinder(d=d03, h=2*dick, $fn=16);
translate([x04,y04+offset,-0.1]) cylinder(d=d04, h=2*dick, $fn=16);
translate([x05,y05+offset,-0.1]) cylinder(d=d05, h=2*dick, $fn=16);
translate([x06,y06+offset,-0.1]) cylinder(d=d06, h=2*dick, $fn=16);
translate([x07,y07+offset,-0.1]) cylinder(d=d07, h=2*dick, $fn=16);
translate([x08,y08+offset,-0.1]) cylinder(d=d08, h=2*dick, $fn=16);
translate([x09,y09+offset,-0.1]) cylinder(d=d09, h=2*dick, $fn=16);
translate([x10,y10+offset,-0.1]) cylinder(d=d10, h=2*dick, $fn=16);
translate([x11,y11+offset,-0.1]) cylinder(d=d11, h=2*dick, $fn=16);
translate([x12,y12+offset,-0.1]) cylinder(d=d12, h=2*dick, $fn=16);
translate([x13,y13+offset,-0.1]) cylinder(d=d13, h=2*dick, $fn=16);
translate([x14,y14+offset,-0.1]) cylinder(d=d14, h=2*dick, $fn=16);
translate([x15,y15+offset,-0.1]) cylinder(d=d15, h=2*dick, $fn=16);
translate([x16,y16+offset,-0.1]) cylinder(d=d16, h=2*dick, $fn=16);
//Rasterausschnitt
translate([-(x*segment)/2+x_off, -(y*segment)/2+y_off, -0.1]) cube([x*segment,y*segment,2*dick]);
}  //difference 2 end
    //alles, was vor der nächsten geschweiften Klammer steht, wird dazu hinzugefügt (union 1)
//Markierung Ursprung
translate([-(x*segment)/2+x_off,-(y*segment)/2+y_off,0]) rotate([0,0,45]) cylinder(d=1.3*diamat,h=dick, $fn=16);
//Schraubenzylinder
for (i = [0:x]) {
for (k = [0:y]) {
translate([-(x*segment)/2+i*segment+x_off,-(y*segment)/2+k*segment+y_off,-intr]) cylinder(d=diamat, h=dick+intr, $fn=16);}}
//Stützgitter horizontal
for (i = [0:x-1]) {
for (k = [0:y]) {
translate([-(x*segment)/2+i*segment+x_off,-(y*segment)/2+k*segment-wall/2+y_off,-intr]) cube([segment,wall,dick+intr]);}}
//Stützgitter vertikal
for (i = [0:x]) {
for (k = [0:y-1]) {
translate([-(x*segment)/2+i*segment-wall/2+x_off,-(y*segment)/2+k*segment+y_off,-intr]) cube([wall,segment,dick+intr]);}}
}               //union 1 end
    //alles, was vor der nächsten geschweiften Klammer steht, wird davon wieder abgezogen (difference 1)
//Schraubenlöcher
for (i = [0:x]) {
for (k = [0:y]) {
translate([-(x*segment)/2+i*segment+x_off,-(y*segment)/2+k*segment+y_off,-intr-0.1]) cylinder(d=diab, h=2*dick+intr, $fn=16);}}
//Streben-Ausschnitte
//vertikale Streben
vv=[vv01,vv02,vv03,vv04,vv05,vv06,vv07,vv08,vv09,vv10,vv11,vv12,vv13,vv14,vv15,vv16,vv17,vv18,vv19,vv20,vv21,vv22,vv23,vv24,vv25];
for (i=[0:x-1]) {
for (k=[0:y-1]) {   
if (vv[k][i-1]==0) {
translate([-(x*segment)/2+i*segment-wall+x_off,-(y*segment)/2+diamat/2+k*segment+y_off,-dick-intr]) cube([2*wall,segment-diamat,2*(dick+intr)]); }
}}
//horizontale Streben
vh=[vh01,vh02,vh03,vh04,vh05,vh06,vh07,vh08,vh09,vh10,vh11,vh12,vh13,vh14,vh15,vh16,vh17,vh18,vh19,vh20,vh21,vh22,vh23,vh24,vh25];
for (i=[0:x-1]) {
for (k=[0:y-1]) {   
if (vh[k-1][i]==0) {
translate([-(x*segment)/2+i*segment+diamat/2+x_off,-(y*segment)/2+k*segment-wall+y_off,-dick-intr]) cube([segment-diamat,2*wall,2*(dick+intr)]); }
}}
//Schraubenblöcke
sm=[sm01,sm02,sm03,sm04,sm05,sm06,sm07,sm08,sm09,sm10,sm11,sm12,sm13,sm14,sm15,sm16,sm17,sm18,sm19,sm20,sm21,sm22,sm23,sm24,sm25];
for (i=[0:x-1]) {
for (k=[0:y-1]) {   
if (sm[k-1][i-1]==0) {
translate([-(x*segment)/2+i*segment+x_off,-(y*segment)/2+k*segment+y_off,-intr-0.1]) cylinder(d=1.1*diamat, h=2*(dick+intr), $fn=fnn); }
}}
//Rechten Teil wegschneiden
translate([0,-500,-50]) cube([1000,1000,1000]);
}               //difference 1 end

}  //module end

//Hier werden Instanzen des Moduls aufgerufen
rotate([0,180,0])  //auskommentieren für seitenrichtige Anzeige
translate([482.6/4,0,-2]) support(); //in z-Richtung um -dick verschieben


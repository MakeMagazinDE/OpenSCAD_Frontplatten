//OpenSCAD-Skript

//Moduldefinition mit Parametern
//---------------------------------------------------------------------
module support (
//Parameter
b=120,      //Breite der Frontplatte
h=80,       //Höhe der Frontplatte
dick=2,     //Auflagedicke des Rahmens
chmfr=3,    //Maß der Kante (muss identisch sein mit Rahmen chmfr)
chmtyp=1,   //Typ der Kante 0:Fase, 1:Rundung (muss identisch sein mit Rahmen chmtyp)
fnn=32,     //Definition Anzahl Facetten der Rundung (muss identisch sein mit Rahmen fnn)
//Bohrungen außen (muss identisch sein mit Bohrungen Rahmen)
x01=-55,y01=-35,d01=4,
x02=-55,y02=+35,d02=4,
x03=+55,y03=+35,d03=4,
x04=+55,y04=-35,d04=4,
x05=-55,y05=0,d05=4,
x06=+55,y06=0,d06=4,
x07=0,y07=-35,d07=4,
x08=0,y08=+35,d08=4,
x09=-55,y09=-17,d09=4,
x10=+55,y10=+-17,d10=4,
x11=-55,y11=+17,d11=4,
x12=+55,y12=+17,d12=4,
x13=-27,y13=+35,d13=4,
x14=-27,y14=-35,d14=4,
x15=+27,y15=+35,d15=4,
x16=+27,y16=-35,d16=4,
//Raster (muss identisch sein mit Rahmen x,y,segment) 
x=5,y=3,segment=19,
//Rasteroffsets (muss identisch sein mit Rahmen x_off,y_off)
x_off=0,y_off=0,
//Eintauchtiefe der Stützstruktur ins Gehäuse
intr=3,
//Rasterbohrungen und Stützgitter
diab=1.8,   //Bohrung für selbstschneidende Schrauben
diamat=5,   //Materialdurchmesser für Schraubenbefestigung
wall=2,     //Wandstärke Verbindungsstreben
//Strebendefinition vertikale Streben
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
translate([-b/2+chmfr/2, -h/2+chmfr/2, 0]) cube([b-chmfr,h-chmfr,dick]);
//Umrandung
translate([-b/2+chmfr/2, -h/2+chmfr/2, 0]) cylinder(d=chmfr, h=dick, $fn=fnn);
translate([-b/2+chmfr/2, +h/2-chmfr/2, 0]) cylinder(d=chmfr, h=dick, $fn=fnn);
translate([+b/2-chmfr/2, -h/2+chmfr/2, 0]) cylinder(d=chmfr, h=dick, $fn=fnn);
translate([+b/2-chmfr/2, +h/2-chmfr/2, 0]) cylinder(d=chmfr, h=dick, $fn=fnn);
translate([-b/2+chmfr/2, -h/2, 0]) cube([b-chmfr,chmfr,dick]);
translate([-b/2+chmfr/2, +h/2-chmfr, 0]) cube([b-chmfr,chmfr,dick]);
translate([-b/2, -h/2+chmfr/2, 0]) cube([chmfr,h-chmfr,dick]);
translate([+b/2-chmfr, -h/2+chmfr/2, 0]) cube([chmfr,h-chmfr,dick]);

}               //union 2 end
    //alles, was vor der nächsten geschweiften Klammer steht, wird davon abgezogen (difference 2)
//Anfasung
if (chmtyp==0)
{
translate([-b/2, -h/2, dick/2-0.1]) rotate([0,0,45]) cube([chmfr,chmfr,2*dick],center=true);
translate([-b/2, +h/2, dick/2-0.1]) rotate([0,0,45]) cube([chmfr,chmfr,2*dick],center=true);
translate([+b/2, -h/2, dick/2-0.1]) rotate([0,0,45]) cube([chmfr,chmfr,2*dick],center=true);
translate([+b/2, +h/2, dick/2-0.1]) rotate([0,0,45]) cube([chmfr,chmfr,2*dick],center=true);
}
//Bohrungen
translate([x01,y01,-0.1]) cylinder(d=d01, h=2*dick, $fn=fnn);
translate([x02,y02,-0.1]) cylinder(d=d02, h=2*dick, $fn=fnn);
translate([x03,y03,-0.1]) cylinder(d=d03, h=2*dick, $fn=fnn);
translate([x04,y04,-0.1]) cylinder(d=d04, h=2*dick, $fn=fnn);
translate([x05,y05,-0.1]) cylinder(d=d05, h=2*dick, $fn=fnn);
translate([x06,y06,-0.1]) cylinder(d=d06, h=2*dick, $fn=fnn);
translate([x07,y07,-0.1]) cylinder(d=d07, h=2*dick, $fn=fnn);
translate([x08,y08,-0.1]) cylinder(d=d08, h=2*dick, $fn=fnn);
translate([x09,y09,-0.1]) cylinder(d=d09, h=2*dick, $fn=fnn);
translate([x10,y10,-0.1]) cylinder(d=d10, h=2*dick, $fn=fnn);
translate([x11,y11,-0.1]) cylinder(d=d11, h=2*dick, $fn=fnn);
translate([x12,y12,-0.1]) cylinder(d=d12, h=2*dick, $fn=fnn);
translate([x13,y13,-0.1]) cylinder(d=d13, h=2*dick, $fn=fnn);
translate([x14,y14,-0.1]) cylinder(d=d14, h=2*dick, $fn=fnn);
translate([x15,y15,-0.1]) cylinder(d=d15, h=2*dick, $fn=fnn);
translate([x16,y16,-0.1]) cylinder(d=d16, h=2*dick, $fn=fnn);
//Rasterausschnitt
translate([-(x*segment)/2+x_off, -(y*segment)/2+y_off, -0.1]) cube([x*segment,y*segment,2*dick]);
}  //difference 2 end
    //alles, was vor der nächsten geschweiften Klammer steht, wird dazu hinzugefügt (union 1)
//Markierung Ursprung
translate([-(x*segment)/2+x_off,-(y*segment)/2+y_off,0]) rotate([0,0,45]) cylinder(d=1.3*diamat,h=dick, $fn=fnn);
//Schraubenzylinder
for (i = [0:x]) {
for (k = [0:y]) {
translate([-(x*segment)/2+i*segment+x_off,-(y*segment)/2+k*segment+y_off,-intr]) cylinder(d=diamat, h=dick+intr, $fn=fnn);}}
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
translate([-(x*segment)/2+i*segment+x_off,-(y*segment)/2+k*segment+y_off,-intr-0.1]) cylinder(d=diab, h=2*dick+intr, $fn=fnn);}}

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
}               //difference 1 end

}  //module end

//Hier werden Instanzen des Moduls aufgerufen
//rotate([0,180,0])  //auskommentieren für seitenrichtige Anzeige
translate([0,0,-2]) support(); //in z-Richtung um -dick verschieben


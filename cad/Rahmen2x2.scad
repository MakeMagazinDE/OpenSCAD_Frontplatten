//OpenSCAD-Skript

//Moduldefinition mit Parametern

module frame (
//Parameter (chmtyp=0:Fase, chmtyp=1:Rundung)
b=60,      //Breite der Frontplatte
h=60,       //Höhe der Frontplatte
thck=3,     //Auflagedicke des Rahmens (muss identisch sein mit Elementdicke thck)
chmfr=1,    //Maß der Kante (muss identisch sein mit Raster chmfr)
chmtyp=0,   //Typ der Kante 0:Fase, 1:Rundung (muss identisch sein mit Raster chmtyp)
fnn=32,     //Definition Anzahl Facetten der Rundung (muss identisch sein mit Raster fnn)
//Bohrungen außen  (xnn,ynn,dnn müssen identisch sein mit Bohrungen Raster)
x01=-25,y01=-25,d01=4,D01=5.5,hb01=1.2,
x02=-25,y02=+25,d02=4,D02=5.5,hb02=1.2,
x03=+25,y03=+25,d03=4,D03=5.5,hb03=1.2,
x04=+25,y04=-25,d04=4,D04=5.5,hb04=1.2,
x05=-55,y05=0,d05=4,D05=5.5,hb05=1.2,
x06=+55,y06=0,d06=4,D06=5.5,hb06=1.2,
x07=0,y07=+35,d07=4,D07=5.5,hb07=1.2,
x08=0,y08=-35,d08=4,D08=5.5,hb08=1.2,
x09=-55,y09=-17,d09=4,D09=5.5,hb09=1.2,
x10=+55,y10=+-17,d10=4,D10=5.5,hb10=1.2,
x11=-55,y11=+17,d11=4,D11=5.5,hb11=1.2,
x12=+55,y12=+17,d12=4,D12=5.5,hb12=1.2,
x13=-27,y13=+35,d13=4,D13=5.5,hb13=1.2,
x14=-27,y14=-35,d14=4,D14=5.5,hb14=1.2,
x15=+27,y15=+35,d15=4,D15=5.5,hb15=1.2,
x16=+27,y16=-35,d16=4,D16=5.5,hb16=1.2,
//Raster (muss identisch sein mit Raster x,y,segment) 
x=2,y=2,segment=19, 
//Rasteroffsets (muss identisch sein mit Raster x_off,y_off)
x_off=0,y_off=0,
//Schraubenlöcher 2mm-Schraube
skd2=3.6,       //Schraubenkopfdurchmesser 2mm-Schraube
skh2=1.3,       //Schraubenkopfhöhe 2mm-Schraube
dsh2=2.0        //Schaftdurchmesser 2mm-Schraube
)
//Beginn Modul
{
difference(){   //difference 1
union(){        //union 1
difference(){   //difference 2
union(){        //union 2
    //alles, was vor der nächsten geschweiften Klammer steht, wird zusammengefügt (union 2)
//Body
translate([-b/2+chmfr/2, -h/2+chmfr/2, 0]) cube([b-chmfr,h-chmfr,thck]);
//Umrandung Ecken
translate([-b/2+chmfr/2, -h/2+chmfr/2, 0]) cylinder(d=chmfr, h=thck-chmfr/2, $fn=fnn);
translate([-b/2+chmfr/2, +h/2-chmfr/2, 0]) cylinder(d=chmfr, h=thck-chmfr/2, $fn=fnn);
translate([+b/2-chmfr/2, -h/2+chmfr/2, 0]) cylinder(d=chmfr, h=thck-chmfr/2, $fn=fnn);
translate([+b/2-chmfr/2, +h/2-chmfr/2, 0]) cylinder(d=chmfr, h=thck-chmfr/2, $fn=fnn);
//Umrandung Ecken oben
translate([-b/2+chmfr/2, -h/2+chmfr/2, thck-chmfr/2]) sphere(d=chmfr, $fn=fnn);
translate([-b/2+chmfr/2, +h/2-chmfr/2, thck-chmfr/2]) sphere(d=chmfr, $fn=fnn);
translate([+b/2-chmfr/2, -h/2+chmfr/2, thck-chmfr/2]) sphere(d=chmfr, $fn=fnn);
translate([+b/2-chmfr/2, +h/2-chmfr/2, thck-chmfr/2]) sphere(d=chmfr, $fn=fnn);
//Umrandung Kanten unten 
translate([-b/2+chmfr/2, -h/2, 0]) cube([b-chmfr,chmfr,thck-chmfr/2]);
translate([-b/2+chmfr/2, +h/2-chmfr, 0]) cube([b-chmfr,chmfr,thck-chmfr/2]);
translate([-b/2, -h/2+chmfr/2, 0]) cube([chmfr,h-chmfr,thck-chmfr/2]);
translate([+b/2-chmfr, -h/2+chmfr/2, 0]) cube([chmfr,h-chmfr,thck-chmfr/2]);
//Umrandung Kanten oben
translate([-b/2+chmfr/2, -h/2+chmfr/2, thck-chmfr/2]) rotate([0,90,0]) cylinder(d=chmfr, h=b-chmfr, $fn=fnn);
translate([-b/2+chmfr/2, +h/2-chmfr/2, thck-chmfr/2]) rotate([0,90,0]) cylinder(d=chmfr, h=b-chmfr, $fn=fnn);
translate([-b/2+chmfr/2, -h/2+chmfr/2, thck-chmfr/2]) rotate([-90,0,0]) cylinder(d=chmfr, h=h-chmfr, $fn=fnn);
translate([+b/2-chmfr/2, -h/2+chmfr/2, thck-chmfr/2]) rotate([-90,0,0]) cylinder(d=chmfr, h=h-chmfr, $fn=fnn);
}               //union 2 end
    //alles, was vor der nächsten geschweiften Klammer steht, wird davon abgezogen (difference 2)
//Anfasung
if (chmtyp==0)
{
translate([-b/2, -h/2, thck/2-0.1]) rotate([0,0,45]) cube([chmfr,chmfr,2*thck],center=true);
translate([-b/2, +h/2, thck/2-0.1]) rotate([0,0,45]) cube([chmfr,chmfr,2*thck],center=true);
translate([+b/2, -h/2, thck/2-0.1]) rotate([0,0,45]) cube([chmfr,chmfr,2*thck],center=true);
translate([+b/2, +h/2, thck/2-0.1]) rotate([0,0,45]) cube([chmfr,chmfr,2*thck],center=true);
//Anfasung Kanten oben
translate([-b/2, -h/2, thck-chmfr/2]) rotate([45,0,0]) cube([b,chmfr,chmfr]);
translate([-b/2, +h/2, thck-chmfr/2]) rotate([45,0,0]) cube([b,chmfr,chmfr]);
translate([-b/2, -h/2, thck-chmfr/2]) rotate([0,-45,0]) cube([chmfr,h,chmfr]);
translate([+b/2, -h/2, thck-chmfr/2]) rotate([0,-45,0]) cube([chmfr,h,chmfr]);
}
//Abschneiden Unterwölbung, falls chmfr>thck
translate([-b/2, -h/2, -chmfr]) cube([b,h,chmfr]);
//Bohrungen
translate([x01,y01,-0.1]) cylinder(d=d01, h=2*thck, $fn=fnn);
translate([x01,y01,hb01]) cylinder(d=D01, h=2*thck, $fn=fnn);
translate([x02,y02,-0.1]) cylinder(d=d02, h=2*thck, $fn=fnn);
translate([x02,y02,hb02]) cylinder(d=D02, h=2*thck, $fn=fnn);
translate([x03,y03,-0.1]) cylinder(d=d03, h=2*thck, $fn=fnn);
translate([x03,y03,hb03]) cylinder(d=D03, h=2*thck, $fn=fnn);
translate([x04,y04,-0.1]) cylinder(d=d04, h=2*thck, $fn=fnn);
translate([x04,y04,hb04]) cylinder(d=D04, h=2*thck, $fn=fnn);
translate([x05,y05,-0.1]) cylinder(d=d05, h=2*thck, $fn=fnn);
translate([x05,y05,hb05]) cylinder(d=D05, h=2*thck, $fn=fnn);
translate([x06,y06,-0.1]) cylinder(d=d06, h=2*thck, $fn=fnn);
translate([x06,y06,hb06]) cylinder(d=D06, h=2*thck, $fn=fnn);
translate([x07,y07,-0.1]) cylinder(d=d07, h=2*thck, $fn=fnn);
translate([x07,y07,hb07]) cylinder(d=D07, h=2*thck, $fn=fnn);
translate([x08,y08,-0.1]) cylinder(d=d08, h=2*thck, $fn=fnn);
translate([x08,y08,hb08]) cylinder(d=D08, h=2*thck, $fn=fnn);
translate([x09,y09,-0.1]) cylinder(d=d09, h=2*thck, $fn=fnn);
translate([x09,y09,hb09]) cylinder(d=D09, h=2*thck, $fn=fnn);
translate([x10,y10,-0.1]) cylinder(d=d10, h=2*thck, $fn=fnn);
translate([x10,y10,hb10]) cylinder(d=D10, h=2*thck, $fn=fnn);
translate([x11,y11,-0.1]) cylinder(d=d11, h=2*thck, $fn=fnn);
translate([x11,y11,hb11]) cylinder(d=D11, h=2*thck, $fn=fnn);
translate([x12,y12,-0.1]) cylinder(d=d12, h=2*thck, $fn=fnn);
translate([x12,y12,hb12]) cylinder(d=D12, h=2*thck, $fn=fnn);
translate([x13,y13,-0.1]) cylinder(d=d13, h=2*thck, $fn=fnn);
translate([x13,y13,hb13]) cylinder(d=D13, h=2*thck, $fn=fnn);
translate([x14,y14,-0.1]) cylinder(d=d14, h=2*thck, $fn=fnn);
translate([x14,y14,hb14]) cylinder(d=D14, h=2*thck, $fn=fnn);
translate([x15,y15,-0.1]) cylinder(d=d15, h=2*thck, $fn=fnn);
translate([x15,y15,hb15]) cylinder(d=D15, h=2*thck, $fn=fnn);
translate([x16,y16,-0.1]) cylinder(d=d16, h=2*thck, $fn=fnn);
translate([x16,y16,hb16]) cylinder(d=D16, h=2*thck, $fn=fnn);
//Rasterausschnitt
translate([-(x*segment)/2+x_off, -(y*segment)/2+y_off, -0.1]) cube([x*segment,y*segment,2*thck]);
//Schraubenlöcher
for (i = [0:x]) {
for (k = [0:y]) {
translate([-(x*segment)/2+i*segment+x_off,-(y*segment)/2+k*segment+y_off,-0.1]) cylinder(d=dsh2, h=2*thck, $fn=fnn);}}
//Kopflöcher
for (i = [0:x]) {
for (k = [0:y]) {
translate([-(x*segment)/2+i*segment+x_off,-(y*segment)/2+k*segment+y_off,thck-skh2]) cylinder(d=skd2, h=2*thck, $fn=fnn);}}
}  //difference 2 end
    //alles, was vor der nächsten geschweiften Klammer steht, wird dazu hinzugefügt (union 1)


}               //union 1 end
    //alles, was vor der nächsten geschweiften Klammer steht, wird davon wieder abgezogen (difference 1)

}               //difference 1 end

}  //module end
//---------------------------------------------------------------------
//Hier werden Instanzen des Moduls aufgerufen

translate([0,0,0]) frame();

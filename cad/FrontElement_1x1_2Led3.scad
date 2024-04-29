//OpenSCAD-Skript

//Moduldefinition mit Parametern für Frontplattensystem im 19mm-Raster
module FrontElem (
//Frontplattenelement
xwert=1,        //Anzahl der Segmente in horizontaler Richtung
ywert=1,        //Anzahl der Segmente in vertikaler Richtung
segment=18.9,   //Kantenlänge des Segments
hght=3.0,       //Höhe des Rands des Frontplattensegments
thick=1.5,      //verbleibende Dicke des Frontplattensegments
wo=1.0,         //Wandstärke oben
wu=2.0,         //Wandstärke unten
//M3-Schrauben
M3=false,       //Bohrungen für M3-Zylinderkopf-Inbusschraube
skd3=5.6,       //Schraubenkopfdurchmesser M3-Schraube
skh3=3.3,       //Schraubenkopfhöhe M3-Schraube
dsh3=3.1,       //Schaftdurchmesser M3-Schraube
dvst3=7,        //Verstärkung für M3-Schraube
//Schneidschrauben 2mmx6mm
B2mm=true,      //Bohrungen für 2mm-Schneidschrauben
skd2=3.6,       //Schraubenkopfdurchmesser 2mm-Schraube (4.4)
skh2=1.3,       //Schraubenkopfhöhe 2mm-Schraube
dsh2=2.0,       //Schaftdurchmesser 2mm-Schraube
dvst2=4.4,      //Verstärkung für 2mm-Schraube
//Beschriftungsfeld eingesenkt
Btext=6.0,      //Breite Beschriftungsband
Ltext=12,       //Länge Beschriftungsband
Dtext=0.3,      //Tiefe Beschriftungsfeld, oder Null
//LED 3mm
LEDdia=3.0,     //Durchmesser LED
//Quadrat-LED
LEDr=5.0,       //Kantenlänge quadratische LED
//Rechteck-LED
LEDB=5.0,       //Breite der Rechteck-LED
LEDH=3.0,       //Höhe der Rechteck-LED
//Hebel-Kippschalter
KSWdia=6.0,     //Schaftdurchmesser Kippschalter
//Drehschalter
RSWdia=9.2,     //Schaftdurchmesser Drehschalter
RSWdist=9.4,    //Mittenabstand Pin
RSWpin=3.0,     //Durchmesser Pin
//Bohrung für Potischaft 6mm
POTdia=6.8,     //Schaftdurchmesser Poti
//Polklemme M4
TRMdia=4.0,     //Bohrung für Polklemme M4
TRSdia=6.0,     //Bohrung für Telefonbuchse 4mm
//MC-Einbaubuchse
MCdia=11.8,     //Bohrung für MC-Buchse 4mm
MCdist=10.4,    //Abstand Abflachungen
//BNC-Einbaubuchse
BNCdia=9.5,     //Durchmesser Bohrung
BNCdist=8.0,    //Abstand Abflachung
//Panelmeter 3-stellig
PM3B=22.5,      //Breite Panelmeter 3-stellig
PM3H=14.5,      //Höhe Panelmeter 3-stellig
//Panelmeter 4-stellig
PM4B=30.0,      //Breite Panelmeter 4-stellig
PM4H=14.2,      //Höhe Panelmeter 4-stellig
//Kaltgerätestecker
KGSW=27.3,      //Länge Ausschnitt in x-Richtung Kaltgerätestecker
KGSH=20,        //Höhe Ausschnitt in y-Richtung Kaltgerätestecker
KGSR=9          //Rundungsdurchmesser Ausschnitt Kaltgerätestecker

)
//Beginn Modul
{
difference(){   //difference 1
union(){        //union 1
difference(){   //difference 2
union(){        //union 2
    //alles, was vor der nächsten geschweiften Klammer steht, wird zusammengefügt (union 2)
//Körper des Frontplattensegments
cube([xwert*segment, ywert*segment, hght]);


}               //union 2 end
    //alles, was vor der nächsten geschweiften Klammer steht, wird davon abgezogen (difference 2)
//Einsenkung in das Segment
polyhedron(
               points= [[wu,wu,thick],                                  //0 unten
                        [xwert*segment-wu,wu,thick],                    //1 unten
                        [xwert*segment-wu,ywert*segment-wu,thick],      //2 unten
                        [wu,ywert*segment-wu,thick],                    //3 unten
                        [wo,wo,hght+0.01],                              //4 oben
                        [wo,ywert*segment-wo, hght+0.01],               //5 oben
                        [xwert*segment-wo,ywert*segment-wo,hght+0.01],  //6 oben
                        [xwert*segment-wo,wo,hght+0.01],                //7 oben
                       ],
               faces=  [[0,1,2,3],      //Boden
                        [0,4,7,1],      //Deckel
                        [1,7,6,2],      //Front
                        [2,6,5,3],      //Seitenwand rechts
                        [3,5,4,0],      //Rückwand
                        [4,5,6,7]]      //Seitenwand links
               );   
/*
//Bohrung für LED mittig (Mindestgröße 1x1)
translate([xwert*segment/2,ywert*segment/2-3,-0.1])  cylinder(d=LEDdia, h=10, $fn=32);
*/


//Bohrung für 2x 3mm-LED nach unten versetzt mit Textfeld darüber (Mindestgröße 1x1, bei 10mm LED 1x2)
translate([xwert*segment/2-3,ywert*segment/2-3,-0.1])  cylinder(d=LEDdia, h=10, $fn=32);
translate([xwert*segment/2+3,ywert*segment/2-3,-0.1])  cylinder(d=LEDdia, h=10, $fn=32);
translate([xwert*segment/2-Ltext/2,ywert*segment/2,thick-Dtext+0.05])  cube([Ltext, Btext, Dtext]); 


/*
//Bohrung für Kippschalter mittig (Mindestgröße 1x1)
translate([xwert*segment/2,ywert*segment/2,-0.1])  cylinder(d=KSWdia, h=10, $fn=32); 
*/

/*
//Bohrungen für Drehschalter mit Pin (Mindestgröße 2x2)
translate([xwert*segment/2,ywert*segment/2,-0.1])  cylinder(d=RSWdia, h=10, $fn=32);
translate([xwert*segment/2+RSWdist,ywert*segment/2,-0.1])  cylinder(d=RSWpin, h=1.5, $fn=32);
*/

/*
//Bohrung für Potentiometer 3mm-Schaft (Mindestgröße 1x1)
translate([xwert*segment/2,ywert*segment/2,-0.1])  cylinder(d=POTdia, h=10, $fn=32);
*/

/*
//Bohrung für 4mm-Polklemme M4 (Mindestgröße 1x1)
translate([xwert*segment/2,ywert*segment/2,-0.1])  cylinder(d=TRMdia, h=10, $fn=32);
*/       

/*
//Bohrung für 4mm-Telefonbuchse (Mindestgröße 1x1)
translate([xwert*segment/2,ywert*segment/2,-0.1])  cylinder(d=TRSdia, h=10, $fn=32);
*/

/*
//Bohrung für 4mm-MC-Buchse (Mindestgröße 2x2), siehe auch union1 für Abflachungen
translate([xwert*segment/2,ywert*segment/2,-0.1])  cylinder(d=MCdia, h=10, $fn=32);
*/

/*
//Bohrung für BNC-Buchse (Mindestgröße 1x1), siehe auch union1 für Abflachungen
translate([xwert*segment/2,ywert*segment/2,-0.1])  cylinder(d=BNCdia, h=10, $fn=32);
*/

/*
//Ausschnitt Panelmeter 3-stellig (Mindestgröße 2x1)
translate([xwert*segment/2-PM3B/2,ywert*segment/2-PM3H/2,-0.1])  cube([PM3B, PM3H, 10]);
*/

/*
//Ausschnitt Panelmeter 4-stellig (Mindestgröße 2x1)
translate([xwert*segment/2-PM4B/2,ywert*segment/2-PM4H/2,-0.1])  cube([PM4B, PM4H, 10]);
*/       
        
}  //difference 2 end
    //alles, was vor der nächsten geschweiften Klammer steht, wird dazu hinzugefügt (union 1)
//Verstärkungen für Schrauben x-Achse unten
for (x=[0:segment:xwert*segment])
{
if (M3==true) translate([x,0,0]) cylinder(d=dvst3,h=hght,$fn=16);
if (B2mm==true) translate([x,0,0]) cylinder(d=dvst2,h=hght,$fn=16);
}
//Verstärkungen für Schrauben x-Achse oben
for (x=[0:segment:xwert*segment])
{
if (M3==true) translate([x,ywert*segment,0]) cylinder(d=dvst3,h=hght,$fn=16);
if (B2mm==true) translate([x,ywert*segment,0]) cylinder(d=dvst2,h=hght,$fn=16);
}
//Verstärkungen für Schrauben y-Achse links
for (y=[0:segment:ywert*segment])
{
if (M3==true) translate([0,y,0]) cylinder(d=dvst3,h=hght,$fn=16);
if (B2mm==true) translate([0,y,0]) cylinder(d=dvst2,h=hght,$fn=16);
}
//Verstärkungen für Schrauben y-Achse rechts
for (y=[0:segment:ywert*segment])
{
if (M3==true) translate([xwert*segment,y,0]) cylinder(d=dvst3,h=hght,$fn=16);
if (B2mm==true) translate([xwert*segment,y,0]) cylinder(d=dvst2,h=hght,$fn=16);
}

/*
//Abflachungen für 4mm-MC-Buchse (Mindestgröße 2x2)
translate([xwert*segment/2-5,ywert*segment/2+MCdist/2,0])  cube([10,3,thick]);
translate([xwert*segment/2-5,ywert*segment/2-MCdist/2-3,0])  cube([10,3,thick]);
*/

/*
//Abflachungen für BNC-Buchse (Mindestgröße 1x1)
translate([xwert*segment/2-5,ywert*segment/2+BNCdist/2,0])  cube([10,3,thick]);
translate([xwert*segment/2-5,ywert*segment/2-BNCdist/2-3,0])  cube([10,3,thick]);
*/

}               //union 1 end
    //alles, was vor der nächsten geschweiften Klammer steht, wird davon wieder abgezogen (difference 1)
//Bohrungen für Schrauben x-Achse unten
for (x=[0:segment:xwert*segment])
{
if (M3==true) translate([x,0,-0.1]) cylinder(d=dsh3,h=2*hght,$fn=16);
if (M3==true) translate([x,0,hght-skh3]) cylinder(d=skd3,h=2*hght,$fn=16);
if (B2mm==true) translate([x,0,-0.1]) cylinder(d=dsh2,h=2*hght,$fn=16);
if (B2mm==true) translate([x,0,hght-skh2]) cylinder(d=skd2,h=2*hght,$fn=16); 
}
//Bohrungen für Schrauben x-Achse oben
for (x=[0:segment:xwert*segment])
{
if (M3==true) translate([x,ywert*segment,-0.1]) cylinder(d=dsh3,h=2*hght,$fn=16);
if (M3==true) translate([x,ywert*segment,hght-skh3]) cylinder(d=skd3,h=2*hght,$fn=16);
if (B2mm==true) translate([x,ywert*segment,-0.1]) cylinder(d=dsh2,h=2*hght,$fn=16);
if (B2mm==true) translate([x,ywert*segment,hght-skh2]) cylinder(d=skd2,h=2*hght,$fn=16); 
}
//Bohrungen für Schrauben y-Achse links
for (y=[0:segment:ywert*segment])
{
if (M3==true) translate([0,y,-0.1]) cylinder(d=dsh3,h=2*hght,$fn=16);
if (M3==true) translate([0,y,hght-skh3]) cylinder(d=skd3,h=2*hght,$fn=16);
if (B2mm==true) translate([0,y,-0.1]) cylinder(d=dsh2,h=2*hght,$fn=16);
if (B2mm==true) translate([0,y,hght-skh2]) cylinder(d=skd2,h=2*hght,$fn=16); 
}
//Bohrungen für Schrauben y-Achse rechts
for (y=[0:segment:ywert*segment])
{
if (M3==true) translate([xwert*segment,y,-0.1]) cylinder(d=dsh3,h=2*hght,$fn=16);
if (M3==true) translate([xwert*segment,y,hght-skh3]) cylinder(d=skd3,h=2*hght,$fn=16);
if (B2mm==true) translate([xwert*segment,y,-0.1]) cylinder(d=dsh2,h=2*hght,$fn=16);
if (B2mm==true) translate([xwert*segment,y,hght-skh2]) cylinder(d=skd2,h=2*hght,$fn=16); 
}
//Abschneiden Verstärkungen unten
translate([-250,-10,-0.1])
cube([500,10,25]);
//Abschneiden Verstärkungen oben
translate([-250,ywert*segment,-0.1])
cube([500,10,25]);
//Abschneiden Verstärkungen links
translate([-10,-250,-0.1])
cube([10,500,25]);
//Abschneiden Verstärkungen rechts
translate([xwert*segment,-250,-0.1])
cube([10,500,25]);
}               //difference 1 end

}  //module end

//Hier werden Instanzen des Moduls aufgerufen
translate([0,0,0]) FrontElem();


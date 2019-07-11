# minirace-lapcounter


```plantuml

boneclip.scad <-- frame.scad

frame.scad <-- example.scad
rule.scad <-- example.scad

rule.scad <-- gate.scad
gate/*.stl <--  gate.scad

rule.scad <-- gate_ext1.scad
gate/mods/*.stl <-- gate.scad

boneclip.scad <-- parts.scad
frame.scad <-- parts.scad

```

# minirace-lapcounter

## Credits
Thanks to [sablebadger](https://www.thingiverse.com/sablebadger/about) for
his wonderful [Gate](https://www.thingiverse.com/thing:3076267).

This repository includes some stl (modified and not) from his work:

[https://www.thingiverse.com/thing:3076267](https://www.thingiverse.com/thing:3076267)
by [sablebadger](https://www.thingiverse.com/sablebadger/about)
licensed under the Creative Commons - Attribution - Non-Commercial license.



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

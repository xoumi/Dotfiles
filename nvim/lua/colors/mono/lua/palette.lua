local hsl = require("lush.hsl")

local c1 = hsl(350, 50, 70)
local cfg = hsl(100, 0, 90)
local c2 = hsl(270, 50, 80)
local c3 = hsl(215, 70, 75)

return {
  cfg = cfg,
  cfgd = cfg.darken(20),
  cfgdd = cfg.darken(40),
  cfgl = cfg.lighten(20),
  cbg = hsl(100, 0, 10),
  cbgl = hsl(100, 0, 30),
  c1 = c1,
  border = hsl(0, 0, 20),
  c1d = c1.darken(10).saturate(10),
  c1l = c1.lighten(20).saturate(20),
  c2 = c2,
  c3 = c3,
  c2d = c2.darken(10).saturate(10),
  c2l = c2.lighten(10).saturate(-10),
  red = hsl(0, 100, 75),
  green = hsl(120, 55, 80),
  yellow = hsl(45, 100, 80),
  cnone = { fg = "NONE", bg = "NONE" }
}

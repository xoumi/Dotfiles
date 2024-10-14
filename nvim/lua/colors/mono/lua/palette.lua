local hsl = require("lush.hsl")

local c1 = hsl(90, 40, 70)
local cfg = hsl(100, 0, 90)
local c2 = hsl(20, 90, 80)

return {
  cfg = cfg,
  cfgd = cfg.darken(30),
  cfgdd = cfg.darken(50),
  cfgl = cfg.lighten(20),
  cbg = hsl(100, 0, 10),
  cbgl = hsl(100, 0, 30),
  c1 = c1,
  border = hsl(0, 0, 20),
  c1d = c1.darken(10).saturate(10),
  c1l = c1.lighten(20).saturate(20),
  c2 = c2,
  c2d = c2.darken(10).saturate(10),
  c2l = c2.lighten(10).saturate(-10),
  c3 = hsl(45, 60, 80),
  red = hsl(0, 100, 75),
  green = hsl(120, 55, 80),
  yellow = hsl(45, 100, 80),
  cnone = { fg = "NONE", bg = "NONE" }
}

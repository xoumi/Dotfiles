local colors = require("palette")

local gen_template = function(base)
  return {
    a = { bg = colors.cbg.hex, fg = base, gui="bold" },
    b = { bg = colors.border.hex, fg = colors.cfg.hex },
    c = { bg = "NONE", fg = colors.cfg.hex },
  }
end

return {
  normal = gen_template(colors.c1l.hex),
  insert = gen_template(colors.c1d.hex),
  visual = gen_template(colors.c2.hex)
}

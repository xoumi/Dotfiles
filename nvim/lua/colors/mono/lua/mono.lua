local lush = require('lush')
local colors = require('palette')

---@diagnostic disable: undefined-global
local theme = lush(function(injected_functions)
  local sym = injected_functions.sym
  return {
    Normal         {fg = colors.cfg },
    Conceal        ( colors.cnone ), -- Placeholder characters substituted for concealed text (see 'conceallevel')
    -- NonText        { }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    Search         { fg=colors.green, gui="reverse" }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
    CurSearch      { Search, gui="" }, -- Highlighting a search pattern under the cursor (see 'hlsearch')
    -- IncSearch      { }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    -- Substitute     { }, -- |:substitute| replacement text highlighting
    Directory      { Normal, gui="underline" }, -- Directory names (and other special names in listings)
    DiffChange     { bg=colors.yellow.darken(80).saturate(-70) }, -- Diff mode: Added line |diff.txt|
    DiffDelete     { bg=colors.red.darken(80).saturate(-75) }, -- Diff mode: Added line |diff.txt|
    DiffAdd        { bg=colors.green.darken(80).saturate(-80) }, -- Diff mode: Added line |diff.txt|
    DiffText       { bg=colors.green.darken(70).saturate(-70) }, -- Diff mode: Added line |diff.txt|
    EndOfBuffer    ( colors.cnone ), -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
    ErrorMsg       { fg=colors.red }, -- Error messages on the command line
    VertSplit      { fg=colors.border }, -- Column separating vertically split windows
    Folded         { fg=colors.cbgl }, -- Line used for closed folds
    LineNr         { fg=colors.cfgd }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    CursorLineNr   { Normal }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    MatchParen     { gui="underline" }, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    NormalFloat    ( colors.cnone ), -- Normal text in floating windows.
    FloatBorder    { fg=colors.border }, -- Border of floating windows.
    StatusLine     ( colors.cnone ),
    StatusLineNC   ( colors.cnone ),
    -- FloatTitle     { }, -- Title of floating windows.
    -- NormalNC       { }, -- normal text in non-current windows
    -- Pmenu          { }, -- Popup menu: Normal item.
    -- PmenuSel       { }, -- Popup menu: Selected item.
    -- PmenuKind      { }, -- Popup menu: Normal item "kind"
    -- PmenuKindSel   { }, -- Popup menu: Selected item "kind"
    -- PmenuExtra     { }, -- Popup menu: Normal item "extra text"
    -- PmenuExtraSel  { }, -- Popup menu: Selected item "extra text"
    -- PmenuSbar      { }, -- Popup menu: Scrollbar.
    -- PmenuThumb     { }, -- Popup menu: Thumb of the scrollbar.
    -- Question       { }, -- |hit-enter| prompt and yes/no questions
    -- QuickFixLine   { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    -- SpecialKey     { }, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
    Visual         { bg=colors.border }, -- Visual mode selection
    WarningMsg     { fg=colors.yellow }, -- Warning messages
    Winseparator   { fg=colors.border, bg="NONE" }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.

    Comment        { fg = colors.cfgdd }, -- Any comment

    Constant       { }, -- (*) Any constant
    String         { fg=colors.c1l }, --   A string constant: "this is a string"
    Number         { fg=colors.c2 }, --   A number constant: 234, 0xff
    Boolean        { fg=colors.c2, gui="bold" }, --   A boolean constant: TRUE, false
    Character      { String }, --   A character constant: 'c', '\n'
    Float          { Number }, --   A floating point constant: 2.3e10

    Identifier     { fg=colors.cfg, gui="" }, -- (*) Any variable name
    Function       { fg=colors.cfg, gui='italic bold'}, --   Function name (also: methods for classes)

    Statement      { fg=colors.cfgd }, -- (*) Any statement
    Conditional    { fg=colors.c3 }, --   if, then, else, endif, switch, etc.
    Operator       { Conditional }, --   "sizeof", "+", "*", etc.
    Repeat         { fg=colors.cfgd }, --   for, do, while, etc.
    Exception      { Conditional }, --   try, catch, throw
    Keyword        { fg=colors.cfgd }, --   any other keyword

    Type            { fg=colors.cfgd, gui="italic" }, -- (*) int, long, char, etc.

    Special        { fg=colors.c3, gui="bold" }, -- (*) Any special symbol
    Delimiter      { fg=colors.cbgl, gui="bold" },

    Todo           { fg=colors.cbg, bg=colors.c1 }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    DiagnosticError            { fg=colors.red } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticUnderlineWarn    { fg=colors.yellow, gui="underline"},
    DiagnosticUnderlineError    { fg=colors.red, gui="underline"},
    DiagnosticWarn             { fg=colors.yellow } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticInfo             { fg=colors.cfg } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticHint             { fg=colors.cfgd } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticOk               { fg=colors.green } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)

    -- Tree Sitter
    sym"@type.typescript" { String },
    sym"@tag.tsx" { String },
    sym"@tag.attribute.tsx" { fg=colors.cfgd },
    sym"@keyword.repeat.typescript" { fg=colors.c2 },

    -- Plugins
    TelescopeBorder             { fg = colors.border, bg = "NONE" },
    TelescopeNormal             { fg = colors.cfg, bg = "NONE" },
    TelescopePromptCounter      { Normal },
    TelescopeTitle              { fg = colors.cfg },
    TelescopePromptBorder       { fg = colors.border, bg = "NONE"},
    TelescopePromptNormal       { fg = colors.cfg, bg = "NONE"},
    TelescopeMatching           { fg = colors.c1, bg="NONE", gui="bold" },
    LazyGitBorder               {FloatBorder}
  }
end)

-- Return our parsed theme for extension or use elsewhere.
return theme

-- vi:nowrap

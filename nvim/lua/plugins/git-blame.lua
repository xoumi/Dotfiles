return {
  "f-person/git-blame.nvim",
  config = function()
    require("gitblame").setup({
      enabled = true,
      display_virtual_text = false,
      message_template = "<author> • <date>",
      date_format = "%d %b %y",
      schedule_event = "CursorHold"
    })
  end,
}

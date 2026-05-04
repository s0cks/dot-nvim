---@class nvim-prose.Config
---@field wpm? number Words per minute (default: 200)
---@field filetypes? string[] Filetypes to enable (default: { "markdown", "asciidoc" })
---@field placeholders? nvim-prose.Placeholders

---@class nvim-prose.Placeholders
---@field words? string Placeholder for word count (default: "words")
---@field minutes? string Placeholder for reading time (default: "min")

return {
  'skwee357/nvim-prose',
  ---@type nvim-prose.Config
  opts = {
    wpm = 200.0,
    filetypes = { 'markdown', 'asciidoc' },
    placeholders = {
      words = '',
      minutes = '',
    },
  },
}

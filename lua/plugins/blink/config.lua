---@type blink.cmp.Config
return {
  keymap = { preset = 'default', ['<Enter>'] = { 'select_and_accept', 'fallback' } },
  appearance = {
    nerd_font_variant = 'mono',
  },
  completion = {
    documentation = { auto_show = true },
    menu = {
      draw = {
        columns = { { 'kind_icon' }, { 'label', gap = 1 } },
        components = {
          label = {
            text = function(ctx)
              local highlights_info = require('colorful-menu').blink_highlights(ctx)
              if highlights_info ~= nil then
                -- Or you want to add more item to label
                return highlights_info.label
              else
                return ctx.label
              end
            end,
            highlight = function(ctx)
              local highlights = {}
              local highlights_info = require('colorful-menu').blink_highlights(ctx)
              if highlights_info ~= nil then
                highlights = highlights_info.highlights
              end
              for _, idx in ipairs(ctx.label_matched_indices) do
                table.insert(highlights, { idx, idx + 1, group = 'BlinkCmpLabelMatch' })
              end
              -- Do something else
              return highlights
            end,
            -- text = function(ctx)
            --   return require('colorful-menu').blink_components_text(ctx)
            -- end,
            -- highlight = function(ctx)
            --   return require('colorful-menu').blink_components_highlight(ctx)
            -- end,
          },
        },
      },
    },
  },
  snippets = { preset = 'luasnip' },
  sources = {
    default = {
      'lsp',
      'path',
      'snippets',
      'yank',
      'buffer',
      'emoji',
      'gitmoji',
      'nerdfont',
      'env',
    },
    providers = require('plugins.blink.providers'),
  },
  fuzzy = { implementation = 'prefer_rust_with_warning' },
}

---@return LazyPluginSpec
return {
  'olimorris/codecompanion.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'saghen/blink.cmp',
    'nvim-tree/nvim-web-devicons',
    'nvim-telescope/telescope.nvim',
  },
  keys = {
    {
      '<leader>cc',
      '<cmd>CodeCompanion<cr>',
      desc = 'Toggle CodeCompanion',
    },
    {
      '<leader>ca',
      '<cmd>CodeCompanionAdd<cr>',
      desc = 'Add code to AI chat',
    },
    {
      '<leader>cx',
      '<cmd>CodeCompanionActions<cr>',
      desc = 'AI actions',
    },
    {
      '<leader>ct',
      '<cmd>CodeCompanionChat<cr>',
      desc = 'Open CodeCompanion chat',
    },
  },
  opts = {
    opts = {
      log_level = 'DEBUG',
    },
    prompt_library = {
      ['Generate Table-Driven Tests'] = {
        strategy = 'inline',
        description = 'Generate table-driven tests for the function under the cursor',
        opts = {
          index = 3,
          is_default = false,
          is_slash_cmd = true,
          short_name = 'gen-tests',
          auto_submit = true,
          user_args = {
            contains_code = true,
          },
          adapter = {
            name = 'ollama',
            model = 'qwen2.5-coder:7b-instruct-q4_K_M',
          },
        },
        prompts = {
          {
            role = 'system',
            content = [[
You are a strict Test-Driven Development (TDD) utility. 
Your goal is to generate complete, table-driven unit test configurations based on the code provided by the user.
STRICT CONSTRAINTS:
1. Focus your test structure entirely on boundary states, invalid inputs, and return invariants.
2. Output ONLY clean, executable code blocks. No comments, conversational fluff, or '// TODO' stubs.
3. Align the output style tightly with the project language conventions (e.g., if Go, write a standard 'func TestXYZ(t *testing.T)' matrix layout; if C, use standard 'TEST()' macros from GTest/GoogleTest).
]],
          },
          {
            role = 'user',
            content = function(context)
              -- Use the modern helper path location
              local code = require('codecompanion.helpers.code').get_code(context.start_line, context.end_line)
              return 'Analyze this targeted function layout and generate a comprehensive table-driven unit test suite for it:\n\n```'
                .. context.filetype
                .. '\n'
                .. code
                .. '\n```'
            end,
            opts = {
              visible = false,
            },
          },
        },
      },
    },
    strategies = {
      chat = { adapter = 'ollama' },
      inline = { adapter = 'ollama' },
      agent = { adapter = 'ollama' },
    },
    display = {
      chat = { show_tokens = true },
    },
    adapters = {
      ollama = function()
        return require('codecompanion.adapters').extend('ollama', {
          env = {
            model = 'qwen2.5-coder:7b-instruct-q4_K_M',
          },
          parameters = {
            sync = true,
            parameters = {
              model = 'qwen2.5-coder:7b-instruct-q4_K_M',
              options = {
                num_ctx = 2048,
                temperature = 0,
              },
            },
          },
          schema = {
            model = { default = 'qwen2.5-coder:7b-instruct-q4_K_M' },
            num_ctx = {
              default = 2048,
            },
          },
        })
      end,
    },
  },
}

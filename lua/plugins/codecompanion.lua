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
    {
      '<leader>cr',
      '<cmd>CodeCompanion inline prompt="Prose Rewrite"<cr>',
      mode = { 'n', 'v' },
      desc = 'Prose Rewriter (v1.2)',
    },
  },
  opts = {
    opts = {
      log_level = 'DEBUG',
    },
    prompt_library = {
      ['Author Mode'] = {
        strategy = 'chat',
        description = 'Open an editing session with the Gemma Author persona',
        opts = {
          adapter = 'gemma2',
        },
        prompts = {
          {
            role = 'system',
            content = [[You are an AI author named "CodeCompanion" working within the Neovim text editor.\nFollow the user's requirements carefully and to the letter.\nUse the context and attachments the user provides.\n\nDO NOT include git diff formatting (+/- symbols) or line numbers inside the code block unless explicitly asked.\nDO NOT wrap your entire response in triple backticks.\n\nAll responses must be written in the English language.\n\nWhen given a task:\n\n1. Think step-by-step. For complex narrative or structural arc changes, describe your editorial plan first.\n2. Only include relevant prose chunks, avoid repeating unchanged paragraphs.\n3. Align all generated prose precisely with the themes, constraints, and negative rules found in provided style guides (like context/style_guide.md) or context files.\n4. Maintain a creative, focused, and non-judgmental presence, behaving as an expert human editor.\n5. End with a short suggestion for the next user turn.\n]],
            opts = { visible = true },
          },
        },
      },

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

      ['Prose Rewrite'] = {
        strategy = 'inline',
        description = 'Rewrite selected paragraph using prose-rewriter-4b-v1.2',
        opts = {
          short_name = 'prose_rewrite',
          adapter = {
            name = 'prose_rewriter',
          },
          modes = { 'n', 'v' }, -- Allow execution in both normal and visual mode
          auto_submit = true,
          user_args = {
            contains_code = false, -- Tells the editor this is natural text/prose
          },
          user_prompt = false,
        },
        prompts = {
          {
            role = 'source',
            content = function(context)
              -- Safely grabs visual block if active, otherwise falls back to current line/paragraph
              local paragraph = table.concat(context.lines, '\n')
              return '<|im_start|>source ' .. paragraph .. '<|im_end|> <|im_start|>edit match<|im_end|> <|im_start|>rewrite '
            end,
            opts = {
              tag = 'replace',
            },
          },
        },
      },

      ['Humanize Text'] = {
        strategy = 'inline',
        description = 'Rewrite comments or markdown docs to sound completely natural using open-humanizer-4b',
        opts = {
          short_name = 'humanize_text',
          adapter = {
            name = 'humanizer',
          },
          modes = { 'n', 'v' },
          auto_submit = true,
          user_args = {
            contains_code = false,
          },
        },
        prompts = {
          {
            role = 'system',
            content = [[
You are an expert human content editor. Your single task is to rewrite the provided text to make it sound entirely organic, fluent, and human-written. 
STRICT CONSTRAINTS:
1. Eliminate all standard AI tropes, unnatural transitions, repetitive syntax patterns, and structural stiffness.
2. Maintain high technical precision and retain any critical names, code symbols, variables, or functions referenced within the text block.
3. Respond ONLY with the revised, clean string of humanized text. Do not include introductory notes, conversational remarks, or concluding explanations.
]],
            opts = { visible = false },
          },
          {
            role = 'user',
            content = function(context)
              local selected_text = table.concat(context.lines, '\n')
              return 'Please rewrite and improve the flow of this content:\n\n' .. selected_text
            end,
            opts = {
              visible = false,
              tag = 'replace',
            },
          },
        },
      },
    },
    interactions = {
      chat = {
        opts = {
          system_prompt = function(opts)
            if opts.adapter and opts.adapter.name == 'gemma2' then
              return [[You are an AI author named "CodeCompanion" working within the Neovim text editor.
Follow the user's requirements carefully and to the letter.
Use the context and attachments the user provides.

DO NOT include git diff formatting (+/- symbols) or line numbers inside the code block unless explicitly asked.
DO NOT wrap your entire response in triple backticks.

All responses must be written in the English language.

When given a task:

1. Think step-by-step. For complex narrative or structural arc changes, describe your editorial plan first.
2. Only include relevant prose chunks, avoid repeating unchanged paragraphs.
3. Align all generated prose precisely with the themes, constraints, and negative rules found in provided style guides (like context/style_guide.md) or context files.
4. Maintain a creative, focused, and non-judgmental presence, behaving as an expert human editor.
5. End with a short suggestion for the next user turn.]]
            end

            return opts.default_system_prompt
          end,
        },
      },
    },
    strategies = {
      chat = {
        adapter = 'ollama',
      },
      inline = { adapter = 'ollama' },
      agent = { adapter = 'ollama' },
    },
    display = {
      diff = {
        enabled = true, -- Shows clear green/red text additions and removals
      },
      chat = { show_tokens = true },
    },
    adapters = {
      http = {
        gemma2 = function()
          return require('codecompanion.adapters').extend('ollama', {
            name = 'gemma1',
            env = {
              model = 'gemma2:9b-instruct-q4_K_M',
            },
            parameters = {
              sync = true,
              parameters = {
                model = 'gemma2:9b-instruct-q4_K_M',
                options = {
                  num_ctx = 4096,
                  temperature = 0.7,
                },
              },
            },
            schema = {
              model = { default = 'gemma2:9b-instruct-q4_K_M' },
              num_ctx = {
                default = 4096,
              },
            },
          })
        end,
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
        prose_rewriter = function()
          return require('codecompanion.adapters').extend('ollama', {
            name = 'prose_rewriter',
            handlers = {
              -- Formats the message body structure to fit the strict v1.2 chat template
              form_parameters = function(self, params, messages)
                local paragraph = ''
                for _, msg in ipairs(messages) do
                  if msg.content then
                    paragraph = msg.content
                    break
                  end
                end

                return {
                  model = params.model,
                  temperature = params.temperature,
                  messages = {
                    { role = 'source', content = paragraph },
                    { role = 'edit', content = 'match' },
                  },
                }
              end,
            },
            parameters = {
              sync = true,
              parameters = {
                model = 'hf.co/chartreuse-verte/prose-rewriter-1.7b-v2.2:Q8_0',
                temperature = 0.3,
              },
            },
            schema = {
              model = { default = 'hf.co/chartreuse-verte/prose-rewriter-1.7b-v2.2:Q8_0' },
              temperature = { default = 0.3 },
            },
          })
        end,
        humanizer = function()
          return require('codecompanion.adapters').extend('ollama', {
            name = 'humanizer',
            parameters = {
              sync = true,
              parameters = {
                model = 'akhaliq/open-humanizer-4b', -- Needs to match your exact local Ollama model identifier
                options = {
                  num_ctx = 4096,
                  temperature = 0.4, -- Slightly higher temp allows for more fluid prose structures
                },
              },
            },
            schema = {
              model = { default = 'akhaliq/open-humanizer-4b' },
              num_ctx = { default = 4096 },
            },
          })
        end,
      },
    },
  },
}

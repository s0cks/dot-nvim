local M = {}

function M:make_config(overrides)
  return {
    cmd = { 'textlsp' },
    filetypes = { 'text', 'tex', 'org' },
    root_markers = { '.git' },
    settings = {
      textLSP = {
        analysers = {
          -- by default all analysers are disabled in textLSP, since many of them
          -- need custom settings. See github page. LanguageTool is enaled here
          -- only for a quick test.
          languagetool = {
            enabled = true,
            check_text = {
              on_open = true,
              on_save = true,
              on_change = false,
            },
          },
        },
        documents = {
          org = {
            org_todo_keywords = {
              'TODO',
              'IN_PROGRESS',
              'DONE',
            },
          },
        },
      },
    },
  }
end

return M

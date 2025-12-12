local function add_filetype_for_filenames(ft, filenames)
  local mappings = {}
  for _, filename in ipairs(filenames) do
    mappings[filename] = ft
  end

  vim.filetype.add({
    filename = mappings,
  })
end

add_filetype_for_filenames('yaml.taskfile', {
  'Taskfile.yml',
  'Taskfile.yaml',
})

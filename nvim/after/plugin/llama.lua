local status, llama = pcall(require, 'nvim-llama')
if (not status) then
  return
end

--[[ llama.setup({
  debug = false,
  model = llama2,
}) ]]

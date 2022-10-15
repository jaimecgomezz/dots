-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/thbrd/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/thbrd/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/thbrd/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/thbrd/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/thbrd/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["auto-pairs"] = {
    loaded = true,
    path = "/home/thbrd/.local/share/nvim/site/pack/packer/start/auto-pairs",
    url = "https://github.com/jiangmiao/auto-pairs"
  },
  ["coq.artifacts"] = {
    loaded = true,
    path = "/home/thbrd/.local/share/nvim/site/pack/packer/start/coq.artifacts",
    url = "https://github.com/ms-jpq/coq.artifacts"
  },
  coq_nvim = {
    config = { "\27LJ\2\n�\1\0\0\5\0\v\0\r6\0\0\0009\0\1\0005\1\3\0005\2\4\0=\2\5\0015\2\b\0005\3\6\0004\4\0\0=\4\a\3=\3\t\2=\2\n\1=\1\2\0K\0\1\0\fclients\rsnippets\1\0\0\twarn\1\0\0\vkeymap\1\0\1\20manual_complete\5\1\0\1\15auto_start\fshut-up\17coq_settings\6g\bvim\0" },
    loaded = true,
    path = "/home/thbrd/.local/share/nvim/site/pack/packer/start/coq_nvim",
    url = "https://github.com/ms-jpq/coq_nvim"
  },
  ["csv.vim"] = {
    loaded = true,
    path = "/home/thbrd/.local/share/nvim/site/pack/packer/start/csv.vim",
    url = "https://github.com/chrisbra/csv.vim"
  },
  ["ctrlp.vim"] = {
    config = { "\27LJ\2\n�\2\0\0\2\0\f\0\0196\0\0\0'\1\2\0=\1\1\0006\0\0\0)\1\1\0=\1\3\0006\0\0\0'\1\5\0=\1\4\0006\0\0\0'\1\a\0=\1\6\0006\0\0\0'\1\t\0=\1\b\0006\0\0\0005\1\v\0=\1\n\0K\0\1\0\1\0\2\tfile\26.so$|.dat$|.DS_Store$\bdir/.git$|.yardoc|node_modules|log|target|tmp$\24ctrlp_custom_ignore-bottom,order:ttb,min:1,max:20,results:20\23ctrlp_match_window\6c\28ctrlp_working_path_mode\20fd -t f -d 1000\23ctrlp_user_command\22ctrlp_show_hidden\n<c-l>\14ctrlp_map\6g\0" },
    loaded = true,
    path = "/home/thbrd/.local/share/nvim/site/pack/packer/start/ctrlp.vim",
    url = "https://github.com/ctrlpvim/ctrlp.vim"
  },
  ["filetype.nvim"] = {
    config = { "\27LJ\2\ns\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\14overrides\1\0\0\15extensions\1\0\0\1\0\1\acr\fcrystal\nsetup\rfiletype\frequire\0" },
    loaded = true,
    path = "/home/thbrd/.local/share/nvim/site/pack/packer/start/filetype.nvim",
    url = "https://github.com/nathom/filetype.nvim"
  },
  ["fzf-project"] = {
    config = { "\27LJ\2\n�\2\0\0\a\0\v\0\0176\0\0\0)\1\0\0=\1\1\0006\0\0\0'\1\3\0=\1\2\0006\0\0\0005\1\5\0=\1\4\0005\0\6\0006\1\a\0'\3\b\0'\4\t\0'\5\n\0\18\6\0\0B\1\5\1K\0\1\0\30<cmd>FzfSwitchProject<cr>\15<leader>pp\6n\bmap\1\0\2\vsilent\2\fnoremap\2\1\3\0\0\25~/repos/jaimecgomezz\18~/repos/aleph\31fzfSwitchProjectWorkspaces\tnone$fzfSwitchProjectGitInitBehavior%fzfSwitchProjectAlwaysChooseFile\6g\0" },
    loaded = true,
    path = "/home/thbrd/.local/share/nvim/site/pack/packer/start/fzf-project",
    url = "https://github.com/benwainwright/fzf-project"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\6\0\n\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\a\0004\4\3\0005\5\6\0>\5\1\4=\4\b\3=\3\t\2B\0\2\1K\0\1\0\rsections\14lualine_a\1\0\0\1\2\1\0\rfilename\tpath\3\1\foptions\1\0\0\1\0\2\ntheme\fhorizon\18icons_enabled\2\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/home/thbrd/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["null-ls.nvim"] = {
    config = { "\27LJ\2\nW\0\0\4\1\6\0\t6\0\0\0009\0\1\0009\0\2\0009\0\3\0005\2\4\0-\3\0\0=\3\5\2B\0\2\1K\0\1\0\1�\nbufnr\1\0\1\15timeout_ms\3�\15\vformat\bbuf\blsp\bvim�\1\1\2\a\0\14\0\0269\2\0\0'\4\1\0B\2\2\2\15\0\2\0X\3\19�6\2\2\0009\2\3\0029\2\4\0025\4\5\0006\5\6\0=\5\a\4=\1\b\4B\2\2\0016\2\2\0009\2\3\0029\2\t\2'\4\n\0005\5\v\0006\6\6\0=\6\a\5=\1\b\0053\6\f\0=\6\r\5B\2\3\0012\0\0�K\0\1\0\rcallback\0\1\0\0\16BufWritePre\24nvim_create_autocmd\vbuffer\ngroup\faugroup\1\0\0\24nvim_clear_autocmds\bapi\bvim\28textDocument/formatting\20supports_method�\3\1\0\v\0\31\0;6\0\0\0'\2\1\0B\0\2\0029\1\2\0009\1\3\0019\2\2\0009\2\4\0029\3\5\0005\5\27\0004\6\18\0009\a\6\1>\a\1\0069\a\a\1>\a\2\0069\a\b\1>\a\3\0069\a\t\2>\a\4\0069\a\n\1>\a\5\0069\a\v\2>\a\6\0069\a\f\0019\a\r\a5\t\15\0005\n\14\0=\n\16\tB\a\2\2>\a\a\0069\a\f\0029\a\r\a5\t\18\0005\n\17\0=\n\16\tB\a\2\2>\a\b\0069\a\19\1>\a\t\0069\a\19\2>\a\n\0069\a\20\1>\a\v\0069\a\21\2>\a\f\0069\a\22\1>\a\r\0069\a\23\2>\a\14\0069\a\24\1>\a\15\0069\a\25\2>\a\16\0069\a\26\2>\a\17\6=\6\28\0053\6\29\0=\6\30\5B\3\2\1K\0\1\0\14on_attach\0\fsources\1\0\0\frustfmt\ngofmt\vrevive\rprettier\veslint\nshfmt\15shellcheck\rsqlfluff\1\0\0\1\4\0\0\vbundle\texec\frubocop\fcommand\1\0\0\1\4\0\0\vbundle\texec\frubocop\twith\frubocop\15lua_format\rluacheck\ajq\rjsonlint\14codespell\15actionlint\nsetup\15formatting\16diagnostics\rbuiltins\fnull-ls\frequire\0" },
    loaded = true,
    path = "/home/thbrd/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\nW\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\5\0\0\bcss\15javascript\bvim\thtml\nsetup\14colorizer\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/thbrd/.local/share/nvim/site/pack/packer/opt/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-toggleterm.lua"] = {
    loaded = true,
    path = "/home/thbrd/.local/share/nvim/site/pack/packer/start/nvim-toggleterm.lua",
    url = "https://github.com/akinsho/nvim-toggleterm.lua"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n�\5\0\0\a\0\31\0(6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\3=\3\t\0025\3\n\0=\3\v\0025\3\f\0=\3\r\0025\3\15\0005\4\14\0=\4\16\0035\4\20\0005\5\18\0005\6\17\0=\6\19\5=\5\21\4=\4\22\3=\3\23\2B\0\2\0015\0\24\0006\1\25\0'\3\26\0'\4\27\0'\5\28\0\18\6\0\0B\1\5\0016\1\25\0'\3\26\0'\4\29\0'\5\30\0\18\6\0\0B\1\5\1K\0\1\0$<cmd>NvimTreeFindFileToggle<cr>\20<localleader>fb\28<cmd>NvimTreeToggle<cr>\20<localleader>ff\6n\bmap\1\0\2\vsilent\2\fnoremap\2\rrenderer\nicons\vglyphs\1\0\0\bgit\1\0\0\1\0\a\runmerged\aµ\vstaged\b✓\fdeleted\b✕\14untracked\6+\frenamed\b≌\runstaged\aΞ\fignored\6~\19indent_markers\1\0\0\1\0\1\venable\2\23hijack_directories\1\0\2\14auto_open\1\venable\2\tview\1\0\3\21hide_root_folder\2\tside\tleft\nwidth\3\30\factions\1\0\4\15update_cwd\2\18hijack_cursor\2\18disable_netrw\2\20respect_buf_cwd\2\15change_dir\1\0\2\vglobal\2\venable\2\14open_file\1\0\0\1\0\1\17quit_on_open\2\nsetup\14nvim-tree\frequire\0" },
    loaded = true,
    path = "/home/thbrd/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n�\3\0\0\5\0\14\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0005\4\t\0=\4\n\3=\3\v\0025\3\f\0=\3\r\2B\0\2\1K\0\1\0\fmatchup\1\0\1\venable\2\26incremental_selection\fkeymaps\1\0\4\19init_selection\bgnn\22scope_incremental\bgrc\21node_incremental\bgrn\21node_decremental\bgrm\1\0\1\venable\2\14highlight\1\0\2&additional_vim_regex_highlighting\1\venable\2\21ensure_installed\1\0\1\17sync_install\1\1\18\0\0\tbash\15dockerfile\bdot\ago\fgraphql\thtml\thttp\15javascript\tjson\njson5\blua\tmake\vpython\truby\trust\ttoml\tyaml\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/thbrd/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ts-autotag"] = {
    config = { "\27LJ\2\n�\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\14filetypes\1\0\0\1\5\0\0\thtml\15javascript\20javascriptreact\20typescriptreact\nsetup\20nvim-ts-autotag\frequire\0" },
    loaded = true,
    path = "/home/thbrd/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/thbrd/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/thbrd/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/thbrd/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/thbrd/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["sqlite.lua"] = {
    loaded = true,
    path = "/home/thbrd/.local/share/nvim/site/pack/packer/start/sqlite.lua",
    url = "https://github.com/tami5/sqlite.lua"
  },
  tagbar = {
    commands = { "Tagbar", "TagbarToggle" },
    config = { "\27LJ\2\n�\1\0\0\2\0\t\0\0256\0\0\0)\1\1\0=\1\1\0006\0\0\0)\1P\0=\1\2\0006\0\0\0)\1\1\0=\1\3\0006\0\0\0)\1\1\0=\1\4\0006\0\0\0)\1\1\0=\1\5\0006\0\0\0)\1\1\0=\1\6\0006\0\0\0)\1\1\0=\1\a\0006\0\0\0)\1\0\0=\1\b\0K\0\1\0\16tagbar_sort\28tagbar_ignore_anonymous\23tagbar_autoshowtag\26tagbar_show_data_type\19tagbar_compact\21tagbar_autofocus\17tagbar_width\21tagbar_autoclose\6g\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/thbrd/.local/share/nvim/site/pack/packer/opt/tagbar",
    url = "https://github.com/preservim/tagbar"
  },
  ["targets.vim"] = {
    loaded = true,
    path = "/home/thbrd/.local/share/nvim/site/pack/packer/start/targets.vim",
    url = "https://github.com/wellle/targets.vim"
  },
  ["telescope-env.nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\a\0\t\0\0146\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\0015\0\4\0006\1\5\0'\3\6\0'\4\a\0'\5\b\0\18\6\0\0B\1\5\1K\0\1\0*<cmd>Telescope env theme=dropdown<cr>\15<leader>fe\6n\bmap\1\0\2\vsilent\2\fnoremap\2\benv\19load_extension\14telescope\frequire\0" },
    loaded = true,
    path = "/home/thbrd/.local/share/nvim/site/pack/packer/start/telescope-env.nvim",
    url = "https://github.com/LinArcX/telescope-env.nvim"
  },
  ["telescope-frecency.nvim"] = {
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/thbrd/.local/share/nvim/site/pack/packer/opt/telescope-frecency.nvim",
    url = "https://github.com/nvim-telescope/telescope-frecency.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/thbrd/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope-toggleterm.nvim"] = {
    config = { "\27LJ\2\n�\2\0\0\a\0\17\0\0286\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\a\0005\3\5\0006\4\0\0'\6\1\0B\4\2\0029\4\3\0049\4\4\4=\4\6\3=\3\b\2B\0\2\0016\0\0\0'\2\t\0B\0\2\0029\0\n\0'\2\v\0B\0\2\0015\0\f\0006\1\r\0'\3\14\0'\4\15\0'\5\16\0\18\6\0\0B\1\5\1K\0\1\0001<cmd>Telescope toggleterm theme=dropdown<cr>\15<leader>ft\6n\bmap\1\0\2\vsilent\2\fnoremap\2\15toggleterm\19load_extension\14telescope\23telescope_mappings\1\0\0\n<c-k>\1\0\0\18exit_terminal\factions\nsetup\25telescope-toggleterm\frequire\0" },
    loaded = true,
    path = "/home/thbrd/.local/share/nvim/site/pack/packer/start/telescope-toggleterm.nvim",
    url = "https://github.com/da-moon/telescope-toggleterm.nvim"
  },
  ["telescope.nvim"] = {
    after = { "telescope-frecency.nvim" },
    config = { "\27LJ\2\n�\16\0\0\f\0F\0�\0016\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0025\3\4\0004\4\0\0006\5\5\0\18\a\3\0B\5\2\4H\b\2�5\n\6\0<\n\t\4F\b\3\3R\b�\1279\5\a\0005\a\27\0005\b\t\0005\t\b\0=\t\n\b5\t\20\0005\n\f\0009\v\v\1=\v\r\n9\v\14\1=\v\15\n9\v\16\1=\v\17\n9\v\18\2=\v\19\n=\n\21\t5\n\22\0009\v\18\2=\v\19\n=\n\23\t=\t\24\b5\t\25\0=\t\26\b=\b\28\a=\4\29\aB\5\2\0015\5\30\0006\6\31\0'\b\23\0'\t \0'\n!\0\18\v\5\0B\6\5\0016\6\31\0'\b\23\0'\t\"\0'\n#\0\18\v\5\0B\6\5\0016\6\31\0'\b\23\0'\t$\0'\n%\0\18\v\5\0B\6\5\0016\6\31\0'\b\23\0'\t&\0'\n'\0\18\v\5\0B\6\5\0016\6\31\0'\b\23\0'\t(\0'\n)\0\18\v\5\0B\6\5\0016\6\31\0'\b\23\0'\t*\0'\n+\0\18\v\5\0B\6\5\0016\6\31\0'\b\23\0'\t,\0'\n-\0\18\v\5\0B\6\5\0016\6\31\0'\b\23\0'\t.\0'\n/\0\18\v\5\0B\6\5\0016\6\31\0'\b\23\0'\t0\0'\n1\0\18\v\5\0B\6\5\0016\6\31\0'\b\23\0'\t2\0'\n3\0\18\v\5\0B\6\5\0016\6\31\0'\b\23\0'\t4\0'\n5\0\18\v\5\0B\6\5\0016\6\31\0'\b\23\0'\t6\0'\n7\0\18\v\5\0B\6\5\0016\6\31\0'\b\23\0'\t8\0'\n9\0\18\v\5\0B\6\5\0016\6\31\0'\b\23\0'\t:\0'\n;\0\18\v\5\0B\6\5\0016\6\31\0'\b\23\0'\t<\0'\n=\0\18\v\5\0B\6\5\0016\6\31\0'\b\23\0'\t>\0'\n?\0\18\v\5\0B\6\5\0016\6\31\0'\b\23\0'\t@\0'\nA\0\18\v\5\0B\6\5\0016\6\31\0'\b\23\0'\tB\0'\nC\0\18\v\5\0B\6\5\0016\6\31\0'\b\23\0'\tD\0'\nE\0\18\v\5\0B\6\5\1K\0\1\0X<cmd>Telescope buffers previewer=false sort_mru=true ignore_current_buffer=true<cr>\14<c-space>.<cmd>Telescope find_files hidden=true<cr>\n<c-p>&<cmd>Telescope search_history<cr>\15<leader>hs'<cmd>Telescope command_history<cr>\15<leader>hc0<cmd>Telescope oldfiles previewer=false<cr>\15<leader>hf$<cmd>Telescope git_branches<cr>\15<leader>gb#<cmd>Telescope git_commits<cr>\15<leader>gc\"<cmd>Telescope git_status<cr>\15<leader>gs!<cmd>Telescope git_stash<cr>\15<leader>gS/<cmd>Telescope keymaps previewer=false<cr>\15<leader>fk/<cmd>Telescope pickers previewer=false<cr>\15<leader>fp1<cmd>Telescope man_pages previewer=false<cr>\15<leader>fm-<cmd>Telescope live_grep hidden=true<cr>\15<leader>ff#<cmd>Telescope grep_string<cr>\15<leader>fw#<cmd>Telescope colorscheme<cr>\15<leader>fs!<cmd>Telescope registers<cr>\15<leader>fr!<cmd>Telescope filetypes<cr>\15<leader>fb <cmd>Telescope commands<cr>\15<leader>fc%<cmd>Telescope spell_suggest<cr>\az=\bmap\1\0\2\vsilent\2\fnoremap\2\fpickers\rdefaults\1\0\0\22vimgrep_arguments\1\4\0\0\aag\14--vimgrep\r--hidden\rmappings\6n\1\0\0\6i\1\0\0\n<M-p>\19toggle_preview\n<C-j>\24move_selection_next\n<C-k>\28move_selection_previous\n<esc>\1\0\0\nclose\25file_ignore_patterns\1\0\0\1\a\0\0\17node_modules\rcoverage\vtarget\btmp\t.git\ttags\nsetup\1\0\1\ntheme\rdropdown\npairs\1\14\0\0\fbuffers\rcommands\20command_history\19search_history\14man_pages\16colorscheme\14registers\18spell_suggest\fkeymaps\14filetypes\15highlights\fpickers\fpickers\29telescope.actions.layout\22telescope.actions\14telescope\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/thbrd/.local/share/nvim/site/pack/packer/opt/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim",
    wants = { "popup.nvim", "plenary.nvim", "telescope-frecency.nvim", "telescope-fzf-native.nvim" }
  },
  ["toggleterm.nvim"] = {
    config = { "\27LJ\2\nu\0\1\2\0\6\1\0159\1\0\0\a\1\1\0X\1\3�)\1\15\0L\1\2\0X\1\b�9\1\0\0\a\1\2\0X\1\5�6\1\3\0009\1\4\0019\1\5\1\24\1\0\1L\1\2\0K\0\1\0\fcolumns\6o\bvim\rvertical\15horizontal\14direction\1����\3�\3\1\0\a\0\21\0*6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0003\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\0015\0\b\0006\1\t\0'\3\n\0'\4\v\0'\5\f\0\18\6\0\0B\1\5\0016\1\t\0'\3\n\0'\4\r\0'\5\14\0\18\6\0\0B\1\5\0016\1\t\0'\3\n\0'\4\15\0'\5\16\0\18\6\0\0B\1\5\0016\1\t\0'\3\n\0'\4\17\0'\5\18\0\18\6\0\0B\1\5\0016\1\t\0'\3\n\0'\4\19\0'\5\20\0\18\6\0\0B\1\5\1K\0\1\0\27<C-\\><C-n><cmd>bd!<cr>\15<leader>tk\21<C-\\><C-n><C-W>l\15<leader>wl\21<C-\\><C-n><C-W>k\15<leader>wk\21<C-\\><C-n><C-W>j\15<leader>wj\21<C-\\><C-n><C-W>h\15<leader>wh\6t\bmap\1\0\2\vsilent\2\fnoremap\2\15float_opts\1\0\3\vheight\3\1\vborder\vshadow\nwidth\3\1\tsize\1\0\4\17persist_size\2\19shading_factor\0061\14direction\rvertical\17open_mapping\15<leader>tt\0\nsetup\15toggleterm\frequire\0" },
    loaded = true,
    path = "/home/thbrd/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\a\0\t\0\0146\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0015\0\4\0006\1\5\0'\3\6\0'\4\a\0'\5\b\0\18\6\0\0B\1\5\1K\0\1\0\27<cmd>TroubleToggle<cr>\14<leader>e\6n\bmap\1\0\2\vsilent\2\fnoremap\2\1\0\1\15auto_close\2\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/home/thbrd/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/home/thbrd/.local/share/nvim/site/pack/packer/start/vim-commentary",
    url = "https://github.com/tpope/vim-commentary"
  },
  ["vim-cool"] = {
    loaded = true,
    path = "/home/thbrd/.local/share/nvim/site/pack/packer/start/vim-cool",
    url = "https://github.com/romainl/vim-cool"
  },
  ["vim-fugitive"] = {
    config = { "\27LJ\2\n�\1\0\0\a\0\a\0\0145\0\0\0006\1\1\0'\3\2\0'\4\3\0'\5\4\0\18\6\0\0B\1\5\0016\1\1\0'\3\2\0'\4\5\0'\5\6\0\18\6\0\0B\1\5\1K\0\1\0\26<cmd>vert Git log<cr>\15<leader>gl\22<cmd>vert Git<cr>\15<leader>gg\6n\bmap\1\0\2\vsilent\2\fnoremap\2\0" },
    loaded = true,
    path = "/home/thbrd/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-gutentags"] = {
    loaded = true,
    path = "/home/thbrd/.local/share/nvim/site/pack/packer/start/vim-gutentags",
    url = "https://github.com/ludovicchabant/vim-gutentags"
  },
  ["vim-horizon"] = {
    loaded = true,
    path = "/home/thbrd/.local/share/nvim/site/pack/packer/start/vim-horizon",
    url = "https://github.com/ntk148v/vim-horizon"
  },
  ["vim-matchup"] = {
    loaded = true,
    path = "/home/thbrd/.local/share/nvim/site/pack/packer/start/vim-matchup",
    url = "https://github.com/andymass/vim-matchup"
  },
  ["vim-sneak"] = {
    loaded = true,
    path = "/home/thbrd/.local/share/nvim/site/pack/packer/start/vim-sneak",
    url = "https://github.com/justinmk/vim-sneak"
  },
  ["vim-startify"] = {
    config = { "\27LJ\2\n�\a\0\0\6\0\a\0\n6\0\0\0'\2\1\0B\0\2\0016\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2\22<cmd>Startify<cr>\15<leader>vs\6n\bmap�\6\t\t\t\tlet g:ascii = [\n\t\t\t\t\t\t\t\\ \" ██▒   █▓ ██▓ ███▄ ▄███▓ \",\n\t\t\t\t\t\t\t\\ \"▓██░   █▒▓██▒▓██▒▀█▀ ██▒ \",\n\t\t\t\t\t\t\t\\ \" ▓██  █▒░▒██▒▓██    ▓██░ \",\n\t\t\t\t\t\t\t\\ \"  ▒██ █░░░██░▒██    ▒██  \",\n\t\t\t\t\t\t\t\\ \"   ▒▀█░  ░██░▒██▒   ░██▒ \",\n\t\t\t\t\t\t\t\\ \"   ░ ▐░  ░▓  ░ ▒░   ░  ░ \",\n\t\t\t\t\t\t\t\\ \"   ░ ░░   ▒ ░░  ░      ░ \",\n\t\t\t\t\t\t\t\\ \"     ░░   ▒ ░░      ░    \",\n\t\t\t\t\t\t\t\\ \"      ░   ░         ░    \",\n\t\t\t\t\t\t\t\\ \"     ░                   \",\n\t\t\t\t\t\t\t\\ ]\n\t\t\t\tlet g:startify_custom_header = startify#pad(g:ascii + startify#fortune#boxed())\n\t\t\t\tlet g:startify_lists = [{ 'type': 'files',     'header': ['   Recent']  }]\n\t\t\t\bcmd\0" },
    loaded = true,
    path = "/home/thbrd/.local/share/nvim/site/pack/packer/start/vim-startify",
    url = "https://github.com/mhinz/vim-startify"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/thbrd/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-visual-increment"] = {
    loaded = true,
    path = "/home/thbrd/.local/share/nvim/site/pack/packer/start/vim-visual-increment",
    url = "https://github.com/triglav/vim-visual-increment"
  },
  ["vim-wordmotion"] = {
    loaded = true,
    path = "/home/thbrd/.local/share/nvim/site/pack/packer/start/vim-wordmotion",
    url = "https://github.com/chaoren/vim-wordmotion"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
  ["^telescope"] = "telescope.nvim"
}
local lazy_load_called = {['packer.load'] = true}
local function lazy_load_module(module_name)
  local to_load = {}
  if lazy_load_called[module_name] then return nil end
  lazy_load_called[module_name] = true
  for module_pat, plugin_name in pairs(module_lazy_loads) do
    if not _G.packer_plugins[plugin_name].loaded and string.match(module_name, module_pat) then
      to_load[#to_load + 1] = plugin_name
    end
  end

  if #to_load > 0 then
    require('packer.load')(to_load, {module = module_name}, _G.packer_plugins)
    local loaded_mod = package.loaded[module_name]
    if loaded_mod then
      return function(modname) return loaded_mod end
    end
  end
end

if not vim.g.packer_custom_loader_enabled then
  table.insert(package.loaders, 1, lazy_load_module)
  vim.g.packer_custom_loader_enabled = true
end

-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n�\3\0\0\5\0\14\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0005\4\t\0=\4\n\3=\3\v\0025\3\f\0=\3\r\2B\0\2\1K\0\1\0\fmatchup\1\0\1\venable\2\26incremental_selection\fkeymaps\1\0\4\19init_selection\bgnn\22scope_incremental\bgrc\21node_incremental\bgrn\21node_decremental\bgrm\1\0\1\venable\2\14highlight\1\0\2&additional_vim_regex_highlighting\1\venable\2\21ensure_installed\1\0\1\17sync_install\1\1\18\0\0\tbash\15dockerfile\bdot\ago\fgraphql\thtml\thttp\15javascript\tjson\njson5\blua\tmake\vpython\truby\trust\ttoml\tyaml\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: nvim-ts-autotag
time([[Config for nvim-ts-autotag]], true)
try_loadstring("\27LJ\2\n�\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\14filetypes\1\0\0\1\5\0\0\thtml\15javascript\20javascriptreact\20typescriptreact\nsetup\20nvim-ts-autotag\frequire\0", "config", "nvim-ts-autotag")
time([[Config for nvim-ts-autotag]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n�\1\0\0\6\0\n\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\a\0004\4\3\0005\5\6\0>\5\1\4=\4\b\3=\3\t\2B\0\2\1K\0\1\0\rsections\14lualine_a\1\0\0\1\2\1\0\rfilename\tpath\3\1\foptions\1\0\0\1\0\2\ntheme\fhorizon\18icons_enabled\2\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: telescope-toggleterm.nvim
time([[Config for telescope-toggleterm.nvim]], true)
try_loadstring("\27LJ\2\n�\2\0\0\a\0\17\0\0286\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\a\0005\3\5\0006\4\0\0'\6\1\0B\4\2\0029\4\3\0049\4\4\4=\4\6\3=\3\b\2B\0\2\0016\0\0\0'\2\t\0B\0\2\0029\0\n\0'\2\v\0B\0\2\0015\0\f\0006\1\r\0'\3\14\0'\4\15\0'\5\16\0\18\6\0\0B\1\5\1K\0\1\0001<cmd>Telescope toggleterm theme=dropdown<cr>\15<leader>ft\6n\bmap\1\0\2\vsilent\2\fnoremap\2\15toggleterm\19load_extension\14telescope\23telescope_mappings\1\0\0\n<c-k>\1\0\0\18exit_terminal\factions\nsetup\25telescope-toggleterm\frequire\0", "config", "telescope-toggleterm.nvim")
time([[Config for telescope-toggleterm.nvim]], false)
-- Config for: telescope-env.nvim
time([[Config for telescope-env.nvim]], true)
try_loadstring("\27LJ\2\n�\1\0\0\a\0\t\0\0146\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\0015\0\4\0006\1\5\0'\3\6\0'\4\a\0'\5\b\0\18\6\0\0B\1\5\1K\0\1\0*<cmd>Telescope env theme=dropdown<cr>\15<leader>fe\6n\bmap\1\0\2\vsilent\2\fnoremap\2\benv\19load_extension\14telescope\frequire\0", "config", "telescope-env.nvim")
time([[Config for telescope-env.nvim]], false)
-- Config for: ctrlp.vim
time([[Config for ctrlp.vim]], true)
try_loadstring("\27LJ\2\n�\2\0\0\2\0\f\0\0196\0\0\0'\1\2\0=\1\1\0006\0\0\0)\1\1\0=\1\3\0006\0\0\0'\1\5\0=\1\4\0006\0\0\0'\1\a\0=\1\6\0006\0\0\0'\1\t\0=\1\b\0006\0\0\0005\1\v\0=\1\n\0K\0\1\0\1\0\2\tfile\26.so$|.dat$|.DS_Store$\bdir/.git$|.yardoc|node_modules|log|target|tmp$\24ctrlp_custom_ignore-bottom,order:ttb,min:1,max:20,results:20\23ctrlp_match_window\6c\28ctrlp_working_path_mode\20fd -t f -d 1000\23ctrlp_user_command\22ctrlp_show_hidden\n<c-l>\14ctrlp_map\6g\0", "config", "ctrlp.vim")
time([[Config for ctrlp.vim]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\n�\1\0\0\a\0\t\0\0146\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0015\0\4\0006\1\5\0'\3\6\0'\4\a\0'\5\b\0\18\6\0\0B\1\5\1K\0\1\0\27<cmd>TroubleToggle<cr>\14<leader>e\6n\bmap\1\0\2\vsilent\2\fnoremap\2\1\0\1\15auto_close\2\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Config for: vim-fugitive
time([[Config for vim-fugitive]], true)
try_loadstring("\27LJ\2\n�\1\0\0\a\0\a\0\0145\0\0\0006\1\1\0'\3\2\0'\4\3\0'\5\4\0\18\6\0\0B\1\5\0016\1\1\0'\3\2\0'\4\5\0'\5\6\0\18\6\0\0B\1\5\1K\0\1\0\26<cmd>vert Git log<cr>\15<leader>gl\22<cmd>vert Git<cr>\15<leader>gg\6n\bmap\1\0\2\vsilent\2\fnoremap\2\0", "config", "vim-fugitive")
time([[Config for vim-fugitive]], false)
-- Config for: vim-startify
time([[Config for vim-startify]], true)
try_loadstring("\27LJ\2\n�\a\0\0\6\0\a\0\n6\0\0\0'\2\1\0B\0\2\0016\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2\22<cmd>Startify<cr>\15<leader>vs\6n\bmap�\6\t\t\t\tlet g:ascii = [\n\t\t\t\t\t\t\t\\ \" ██▒   █▓ ██▓ ███▄ ▄███▓ \",\n\t\t\t\t\t\t\t\\ \"▓██░   █▒▓██▒▓██▒▀█▀ ██▒ \",\n\t\t\t\t\t\t\t\\ \" ▓██  █▒░▒██▒▓██    ▓██░ \",\n\t\t\t\t\t\t\t\\ \"  ▒██ █░░░██░▒██    ▒██  \",\n\t\t\t\t\t\t\t\\ \"   ▒▀█░  ░██░▒██▒   ░██▒ \",\n\t\t\t\t\t\t\t\\ \"   ░ ▐░  ░▓  ░ ▒░   ░  ░ \",\n\t\t\t\t\t\t\t\\ \"   ░ ░░   ▒ ░░  ░      ░ \",\n\t\t\t\t\t\t\t\\ \"     ░░   ▒ ░░      ░    \",\n\t\t\t\t\t\t\t\\ \"      ░   ░         ░    \",\n\t\t\t\t\t\t\t\\ \"     ░                   \",\n\t\t\t\t\t\t\t\\ ]\n\t\t\t\tlet g:startify_custom_header = startify#pad(g:ascii + startify#fortune#boxed())\n\t\t\t\tlet g:startify_lists = [{ 'type': 'files',     'header': ['   Recent']  }]\n\t\t\t\bcmd\0", "config", "vim-startify")
time([[Config for vim-startify]], false)
-- Config for: filetype.nvim
time([[Config for filetype.nvim]], true)
try_loadstring("\27LJ\2\ns\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\14overrides\1\0\0\15extensions\1\0\0\1\0\1\acr\fcrystal\nsetup\rfiletype\frequire\0", "config", "filetype.nvim")
time([[Config for filetype.nvim]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
try_loadstring("\27LJ\2\nu\0\1\2\0\6\1\0159\1\0\0\a\1\1\0X\1\3�)\1\15\0L\1\2\0X\1\b�9\1\0\0\a\1\2\0X\1\5�6\1\3\0009\1\4\0019\1\5\1\24\1\0\1L\1\2\0K\0\1\0\fcolumns\6o\bvim\rvertical\15horizontal\14direction\1����\3�\3\1\0\a\0\21\0*6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0003\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\0015\0\b\0006\1\t\0'\3\n\0'\4\v\0'\5\f\0\18\6\0\0B\1\5\0016\1\t\0'\3\n\0'\4\r\0'\5\14\0\18\6\0\0B\1\5\0016\1\t\0'\3\n\0'\4\15\0'\5\16\0\18\6\0\0B\1\5\0016\1\t\0'\3\n\0'\4\17\0'\5\18\0\18\6\0\0B\1\5\0016\1\t\0'\3\n\0'\4\19\0'\5\20\0\18\6\0\0B\1\5\1K\0\1\0\27<C-\\><C-n><cmd>bd!<cr>\15<leader>tk\21<C-\\><C-n><C-W>l\15<leader>wl\21<C-\\><C-n><C-W>k\15<leader>wk\21<C-\\><C-n><C-W>j\15<leader>wj\21<C-\\><C-n><C-W>h\15<leader>wh\6t\bmap\1\0\2\vsilent\2\fnoremap\2\15float_opts\1\0\3\vheight\3\1\vborder\vshadow\nwidth\3\1\tsize\1\0\4\17persist_size\2\19shading_factor\0061\14direction\rvertical\17open_mapping\15<leader>tt\0\nsetup\15toggleterm\frequire\0", "config", "toggleterm.nvim")
time([[Config for toggleterm.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n�\5\0\0\a\0\31\0(6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\3=\3\t\0025\3\n\0=\3\v\0025\3\f\0=\3\r\0025\3\15\0005\4\14\0=\4\16\0035\4\20\0005\5\18\0005\6\17\0=\6\19\5=\5\21\4=\4\22\3=\3\23\2B\0\2\0015\0\24\0006\1\25\0'\3\26\0'\4\27\0'\5\28\0\18\6\0\0B\1\5\0016\1\25\0'\3\26\0'\4\29\0'\5\30\0\18\6\0\0B\1\5\1K\0\1\0$<cmd>NvimTreeFindFileToggle<cr>\20<localleader>fb\28<cmd>NvimTreeToggle<cr>\20<localleader>ff\6n\bmap\1\0\2\vsilent\2\fnoremap\2\rrenderer\nicons\vglyphs\1\0\0\bgit\1\0\0\1\0\a\runmerged\aµ\vstaged\b✓\fdeleted\b✕\14untracked\6+\frenamed\b≌\runstaged\aΞ\fignored\6~\19indent_markers\1\0\0\1\0\1\venable\2\23hijack_directories\1\0\2\14auto_open\1\venable\2\tview\1\0\3\21hide_root_folder\2\tside\tleft\nwidth\3\30\factions\1\0\4\15update_cwd\2\18hijack_cursor\2\18disable_netrw\2\20respect_buf_cwd\2\15change_dir\1\0\2\vglobal\2\venable\2\14open_file\1\0\0\1\0\1\17quit_on_open\2\nsetup\14nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: null-ls.nvim
time([[Config for null-ls.nvim]], true)
try_loadstring("\27LJ\2\nW\0\0\4\1\6\0\t6\0\0\0009\0\1\0009\0\2\0009\0\3\0005\2\4\0-\3\0\0=\3\5\2B\0\2\1K\0\1\0\1�\nbufnr\1\0\1\15timeout_ms\3�\15\vformat\bbuf\blsp\bvim�\1\1\2\a\0\14\0\0269\2\0\0'\4\1\0B\2\2\2\15\0\2\0X\3\19�6\2\2\0009\2\3\0029\2\4\0025\4\5\0006\5\6\0=\5\a\4=\1\b\4B\2\2\0016\2\2\0009\2\3\0029\2\t\2'\4\n\0005\5\v\0006\6\6\0=\6\a\5=\1\b\0053\6\f\0=\6\r\5B\2\3\0012\0\0�K\0\1\0\rcallback\0\1\0\0\16BufWritePre\24nvim_create_autocmd\vbuffer\ngroup\faugroup\1\0\0\24nvim_clear_autocmds\bapi\bvim\28textDocument/formatting\20supports_method�\3\1\0\v\0\31\0;6\0\0\0'\2\1\0B\0\2\0029\1\2\0009\1\3\0019\2\2\0009\2\4\0029\3\5\0005\5\27\0004\6\18\0009\a\6\1>\a\1\0069\a\a\1>\a\2\0069\a\b\1>\a\3\0069\a\t\2>\a\4\0069\a\n\1>\a\5\0069\a\v\2>\a\6\0069\a\f\0019\a\r\a5\t\15\0005\n\14\0=\n\16\tB\a\2\2>\a\a\0069\a\f\0029\a\r\a5\t\18\0005\n\17\0=\n\16\tB\a\2\2>\a\b\0069\a\19\1>\a\t\0069\a\19\2>\a\n\0069\a\20\1>\a\v\0069\a\21\2>\a\f\0069\a\22\1>\a\r\0069\a\23\2>\a\14\0069\a\24\1>\a\15\0069\a\25\2>\a\16\0069\a\26\2>\a\17\6=\6\28\0053\6\29\0=\6\30\5B\3\2\1K\0\1\0\14on_attach\0\fsources\1\0\0\frustfmt\ngofmt\vrevive\rprettier\veslint\nshfmt\15shellcheck\rsqlfluff\1\0\0\1\4\0\0\vbundle\texec\frubocop\fcommand\1\0\0\1\4\0\0\vbundle\texec\frubocop\twith\frubocop\15lua_format\rluacheck\ajq\rjsonlint\14codespell\15actionlint\nsetup\15formatting\16diagnostics\rbuiltins\fnull-ls\frequire\0", "config", "null-ls.nvim")
time([[Config for null-ls.nvim]], false)
-- Config for: fzf-project
time([[Config for fzf-project]], true)
try_loadstring("\27LJ\2\n�\2\0\0\a\0\v\0\0176\0\0\0)\1\0\0=\1\1\0006\0\0\0'\1\3\0=\1\2\0006\0\0\0005\1\5\0=\1\4\0005\0\6\0006\1\a\0'\3\b\0'\4\t\0'\5\n\0\18\6\0\0B\1\5\1K\0\1\0\30<cmd>FzfSwitchProject<cr>\15<leader>pp\6n\bmap\1\0\2\vsilent\2\fnoremap\2\1\3\0\0\25~/repos/jaimecgomezz\18~/repos/aleph\31fzfSwitchProjectWorkspaces\tnone$fzfSwitchProjectGitInitBehavior%fzfSwitchProjectAlwaysChooseFile\6g\0", "config", "fzf-project")
time([[Config for fzf-project]], false)
-- Config for: coq_nvim
time([[Config for coq_nvim]], true)
try_loadstring("\27LJ\2\n�\1\0\0\5\0\v\0\r6\0\0\0009\0\1\0005\1\3\0005\2\4\0=\2\5\0015\2\b\0005\3\6\0004\4\0\0=\4\a\3=\3\t\2=\2\n\1=\1\2\0K\0\1\0\fclients\rsnippets\1\0\0\twarn\1\0\0\vkeymap\1\0\1\20manual_complete\5\1\0\1\15auto_start\fshut-up\17coq_settings\6g\bvim\0", "config", "coq_nvim")
time([[Config for coq_nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Tagbar lua require("packer.load")({'tagbar'}, { cmd = "Tagbar", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TagbarToggle lua require("packer.load")({'tagbar'}, { cmd = "TagbarToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType html ++once lua require("packer.load")({'nvim-colorizer.lua'}, { ft = "html" }, _G.packer_plugins)]]
vim.cmd [[au FileType vim ++once lua require("packer.load")({'nvim-colorizer.lua'}, { ft = "vim" }, _G.packer_plugins)]]
vim.cmd [[au FileType css ++once lua require("packer.load")({'nvim-colorizer.lua'}, { ft = "css" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascript ++once lua require("packer.load")({'nvim-colorizer.lua'}, { ft = "javascript" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'telescope.nvim'}, { event = "VimEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end

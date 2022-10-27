cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
    -- bootstrap
    use("wbthomason/packer.nvim")

    -- Creates a single autocommand that resolves the file type when a buffer is opened.
    use({
        "nathom/filetype.nvim",
        config = function()
            require("filetype").setup({
                overrides = {extensions = {cr = "crystal"}}
            })
        end
    })

    -- startup
    -- Speed up loading Lua modules in Neovim to improve startup time.
    -- use({"lewis6991/impatient.nvim"})

    -- colorschemes
    use('ntk148v/vim-horizon')
    use({"cocopon/iceberg.vim"})
    use({"rmehri01/onenord.nvim"})
    use({"bluz71/vim-nightfly-guicolors"})
    use({"andersevenrud/nordic.nvim"})
    use({"ellisonleao/gruvbox.nvim"})
    use({"frenzyexists/aquarium-vim"})
    use({
        "shaunsingh/nord.nvim",
        config = function()
            vim.g.nord_contrast = true
            vim.g.nord_borders = true
            vim.g.nord_uniform_diff_background = true

            require('nord').set()
        end
    })

    -- statusline
    use({
        "nvim-lualine/lualine.nvim",
        requires = {"kyazdani42/nvim-web-devicons", opt = true},
        config = function()
            require("lualine").setup({
                options = {icons_enabled = true, theme = "nord"},
                sections = {lualine_a = {{"filename", path = 1}}}
            })
        end
    })

    -- syntax
    use({
        -- Extends vim's % key to language-specific words.
        {"andymass/vim-matchup"}, {
            "nvim-treesitter/nvim-treesitter",
            run = ":TSUpdate",
            config = function()
                require("nvim-treesitter.configs").setup({
                    auto_install = true,
                    ensure_installed = {
                        "bash", "dockerfile", "dot", "go", "graphql", "html",
                        "http", "javascript", "json", "json5", "lua", "make",
                        "python", "ruby", "rust", "toml", "yaml"
                    },
                    sync_install = false,
                    highlight = {
                        enable = true,
                        additional_vim_regex_highlighting = false
                    },
                    ident = {enable = true},
                    incremental_selection = {
                        enable = true,
                        keymaps = {
                            init_selection = "gnn",
                            node_incremental = "grn",
                            scope_incremental = "grc",
                            node_decremental = "grm"
                        }
                    },
                    matchup = {enable = true}
                })
            end
        }, -- Use treesitter to autoclose and autorename various tag.
        {
            "windwp/nvim-ts-autotag",
            config = function()
                require("nvim-ts-autotag").setup({
                    filetypes = {
                        "html", "javascript", "javascriptreact",
                        "typescriptreact"
                    }
                })
            end
        }
    })

    -- filer
    use({
        "kyazdani42/nvim-tree.lua",
        requires = {"kyazdani42/nvim-web-devicons"},
        config = function()
            require("nvim-tree").setup({
                actions = {
                    open_file = {quit_on_open = true},
                    change_dir = {enable = true, global = true}
                },
                view = {width = 30, side = "left", hide_root_folder = true},
                disable_netrw = true,
                hijack_cursor = true,
                update_cwd = true,
                hijack_directories = {enable = true, auto_open = false},
                renderer = {
                    indent_markers = {enable = true},
                    icons = {
                        glyphs = {
                            git = {
                                staged = "✓",
                                ignored = "~",
                                unstaged = "Ξ",
                                untracked = "+",
                                unmerged = "µ",
                                deleted = "✕",
                                renamed = "≌"
                            }
                        }
                    }
                },
                respect_buf_cwd = true
            })

            local opts = {silent = true, noremap = true}

            map("n", "<localleader>ff", "<cmd>NvimTreeToggle<cr>", opts)
            map("n", "<localleader>fb", "<cmd>NvimTreeFindFileToggle<cr>", opts)
        end
    })

    -- projects
    use({
        "benwainwright/fzf-project",
        config = function()
            g.fzfSwitchProjectAlwaysChooseFile = 0
            g.fzfSwitchProjectGitInitBehavior = "none"
            g.fzfSwitchProjectWorkspaces = {
                "~/repos/jaimecgomezz", "~/repos/aleph", "~/repos/telemetry",
                "~/repos/dry", "~/repos/crates",
                "~/repos/jaimecgomezz/learning", "~/repos/vim"
            }

            local opts = {silent = true, noremap = true}

            map("n", "<leader>pp", "<cmd>FzfSwitchProject<cr>", opts)
        end
    })

    -- search
    use({
        {
            "nvim-telescope/telescope.nvim",
            requires = {
                "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim",
                "telescope-frecency.nvim", "telescope-fzf-native.nvim"
            },
            wants = {
                "popup.nvim", "plenary.nvim", "telescope-frecency.nvim",
                "telescope-fzf-native.nvim"
            },
            event = "VimEnter",
            module = "telescope",
            config = function()
                local telescope = require("telescope")
                local actions = require("telescope.actions")
                local action_layout = require("telescope.actions.layout")

                local unprepared_pickers = {
                    "buffers", "commands", "command_history", "search_history",
                    "man_pages", "colorscheme", "registers", "spell_suggest",
                    "keymaps", "filetypes", "highlights", "pickers", "pickers"
                }

                local pickers = {}
                for _, picker in pairs(unprepared_pickers) do
                    pickers[picker] = {theme = "dropdown"}
                end

                telescope.setup({
                    defaults = {
                        file_ignore_patterns = {
                            "node_modules", "coverage", "target", "tmp", ".git",
                            "tags"
                        },
                        mappings = {
                            i = {
                                ["<esc>"] = actions.close,
                                ["<C-k>"] = actions.move_selection_previous,
                                ["<C-j>"] = actions.move_selection_next,
                                ["<M-p>"] = action_layout.toggle_preview
                            },
                            n = {["<M-p>"] = action_layout.toggle_preview}
                        },
                        vimgrep_arguments = {"ag", "--vimgrep", "--hidden"}
                    },
                    pickers = pickers
                })

                local opts = {silent = true, noremap = true}

                -- pickers
                map("n", "z=", "<cmd>Telescope spell_suggest<cr>", opts)
                map("n", "<leader>fc", "<cmd>Telescope commands<cr>", opts)
                map("n", "<leader>fb", "<cmd>Telescope filetypes<cr>", opts)
                map("n", "<leader>fr", "<cmd>Telescope registers<cr>", opts)
                map("n", "<leader>fs", "<cmd>Telescope colorscheme<cr>", opts)
                map("n", "<leader>fw", "<cmd>Telescope grep_string<cr>", opts)
                map("n", "<leader>ff",
                    "<cmd>Telescope live_grep hidden=true<cr>", opts)

                -- finder pickers
                map("n", "<c-p>", "<cmd>Telescope find_files hidden=true<cr>",
                    opts)
                map("n", "<c-space>",
                    "<cmd>Telescope buffers previewer=false sort_mru=true ignore_current_buffer=true<cr>",
                    opts)
            end
        }, {
            "nvim-telescope/telescope-frecency.nvim",
            after = "telescope.nvim",
            requires = "tami5/sqlite.lua"
        }, {"nvim-telescope/telescope-fzf-native.nvim", run = "make"}, {
            "LinArcX/telescope-env.nvim",
            config = function()
                require("telescope").load_extension("env")

                local opts = {silent = true, noremap = true}

                map("n", "<leader>fe", "<cmd>Telescope env theme=dropdown<cr>",
                    opts)
            end
        }, {
            "da-moon/telescope-toggleterm.nvim",
            requires = {
                "akinsho/nvim-toggleterm.lua", "nvim-telescope/telescope.nvim",
                "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim"
            },
            config = function()
                require("telescope-toggleterm").setup({
                    telescope_mappings = {
                        ["<c-k>"] = require("telescope-toggleterm").actions
                            .exit_terminal
                    }
                })

                require("telescope").load_extension("toggleterm")

                local opts = {silent = true, noremap = true}

                map("n", "<leader>ft",
                    "<cmd>Telescope toggleterm theme=dropdown<cr>", opts)
            end
        }
    })

    -- start page
    use({
        "mhinz/vim-startify",
        config = function()
            cmd([[
				let g:ascii = [
							\ " ██▒   █▓ ██▓ ███▄ ▄███▓ ",
							\ "▓██░   █▒▓██▒▓██▒▀█▀ ██▒ ",
							\ " ▓██  █▒░▒██▒▓██    ▓██░ ",
							\ "  ▒██ █░░░██░▒██    ▒██  ",
							\ "   ▒▀█░  ░██░▒██▒   ░██▒ ",
							\ "   ░ ▐░  ░▓  ░ ▒░   ░  ░ ",
							\ "   ░ ░░   ▒ ░░  ░      ░ ",
							\ "     ░░   ▒ ░░      ░    ",
							\ "      ░   ░         ░    ",
							\ "     ░                   ",
							\ ]
				let g:startify_custom_header = startify#pad(g:ascii + startify#fortune#boxed())
				let g:startify_lists = [{ 'type': 'files',     'header': ['   Recent']  }]
			]])

            map("n", "<leader>vs", "<cmd>Startify<cr>",
                {silent = true, noremap = true})
        end
    })

    -- local files
    use({
        "ctrlpvim/ctrlp.vim",
        config = function()
            g.ctrlp_map = "<c-l>"
            g.ctrlp_show_hidden = 1
            g.ctrlp_user_command = "fd -t f -d 1000"
            g.ctrlp_working_path_mode = "c"
            g.ctrlp_match_window = "bottom,order:ttb,min:1,max:20,results:20"
            g.ctrlp_custom_ignore = {
                dir = ".git$|.yardoc|node_modules|log|target|tmp$",
                file = ".so$|.dat$|.DS_Store$"
            }
        end
    })

    -- motion
    use({
        -- More useful word motions for Vim
        {"chaoren/vim-wordmotion"},
        -- Jump to any location specified by two characters.
        {"justinmk/vim-sneak"},
        -- Adds various text objects to give you more targets to operate on.
        {"wellle/targets.vim"}
    })

    -- highlights
    -- Disables search highlighting when you are done searching and re-enables it when you search again
    use({"romainl/vim-cool"})

    -- git
    -- Fugitive is the premier Vim plugin for Git.
    use({
        "tpope/vim-fugitive",
        config = function()
            local opts = {silent = true, noremap = true}

            map("n", "<leader>gg", "<cmd>vert Git<cr>", opts)
            map("n", "<leader>gl", "<cmd>vert Git log<cr>", opts)
        end
    })

    -- colorizer
    -- A high-performance color highlighter for Neovim which has no external dependencies.
    use({
        "norcalli/nvim-colorizer.lua",
        ft = {"css", "javascript", "vim", "html"},
        config = function()
            require("colorizer").setup({"css", "javascript", "vim", "html"})
        end
    })

    -- utils
    use("tpope/vim-surround")
    use("jiangmiao/auto-pairs")
    use("tpope/vim-commentary")
    use("triglav/vim-visual-increment")

    -- tags
    use("ludovicchabant/vim-gutentags")
    use({
        "preservim/tagbar",
        cmd = {"Tagbar", "TagbarToggle"},
        config = function()
            g.tagbar_autoclose = 1
            g.tagbar_width = 80
            g.tagbar_autofocus = 1
            g.tagbar_compact = 1
            g.tagbar_show_data_type = 1
            g.tagbar_autoshowtag = 1
            g.tagbar_ignore_anonymous = 1
            g.tagbar_sort = 0
        end
    })

    -- terminal
    use({
        "akinsho/toggleterm.nvim",
        config = function()
            require("toggleterm").setup({
                size = function(term)
                    if term.direction == "horizontal" then
                        return 15
                    elseif term.direction == "vertical" then
                        return vim.o.columns * 0.5
                    end
                end,
                open_mapping = [[<leader>tt]],
                shading_factor = "1",
                persist_size = true,
                direction = "vertical",
                float_opts = {border = "shadow", width = 1, height = 1}
            })

            local opts = {silent = true, noremap = true}

            map("t", "<leader>wh", [[<C-\><C-n><C-W>h]], opts)
            map("t", "<leader>wj", [[<C-\><C-n><C-W>j]], opts)
            map("t", "<leader>wk", [[<C-\><C-n><C-W>k]], opts)
            map("t", "<leader>wl", [[<C-\><C-n><C-W>l]], opts)
            map("t", "<leader>tk", [[<C-\><C-n><cmd>bd!<cr>]], opts)
        end
    })

    -- csv
    use({"chrisbra/csv.vim"})

    -- errors
    use({"kyazdani42/nvim-web-devicons"})

    -- completion
    use({
        {
            "ms-jpq/coq_nvim",
            run = "python3 -m coq deps",
            config = function()
                vim.g.coq_settings = {
                    auto_start = "shut-up",
                    keymap = {manual_complete = ""},
                    clients = {snippets = {warn = {}}}
                    -- display = {
                    --     preview = {
                    --         border = {
                    --             {"A", "NormalFloat"}, {"B", "NormalFloat"},
                    --             {"C", "NormalFloat"}, {"D", "NormalFloat"},
                    --             {"E", "NormalFloat"}, {"F", "NormalFloat"},
                    --             {"G", "NormalFloat"}, {"H", "NormalFloat"}
                    --         }
                    --     }
                    -- }
                }
            end
        }, {"ms-jpq/coq.artifacts", branch = "artifacts"}
    })

    -- lint, formatting
    use({
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
            local nls = require("null-ls")

            local diagnostics = nls.builtins.diagnostics
            local formatting = nls.builtins.formatting

            nls.setup({
                sources = {
                    -- GH actions
                    diagnostics.actionlint, -- Spelling
                    diagnostics.codespell, -- python
                    -- diagnostics.flake8,
                    -- formatting.black,
                    -- json
                    diagnostics.jsonlint, formatting.jq, -- lua
                    diagnostics.selene, formatting.lua_format, -- ruby
                    diagnostics.rubocop.with({
                        command = {"bundle", "exec", "rubocop"}
                    }),
                    formatting.rubocop
                        .with({command = {"bundle", "exec", "rubocop"}}),
                    -- sql
                    diagnostics.sqlfluff.with({
                        extra_args = {"--dialect", "postgres"}
                    }),
                    formatting.sqlfluff
                        .with({extra_args = {"--dialect", "postgres"}}),
                    diagnostics.shellcheck, formatting.shfmt, -- sql
                    diagnostics.eslint_d, formatting.prettier, -- javascript
                    diagnostics.revive, formatting.gofmt, -- go
                    formatting.rustfmt -- rust
                },

                on_attach = function(client, bufnr)
                    if client.supports_method("textDocument/formatting") then
                        vim.api.nvim_clear_autocmds({
                            group = augroup,
                            buffer = bufnr
                        })
                        vim.api.nvim_create_autocmd("BufWritePre", {
                            group = augroup,
                            buffer = bufnr,
                            callback = function()
                                -- on 0.8, you should use:
                                vim.lsp.buf.format({
                                    bufnr = bufnr,
                                    timeout_ms = 2000
                                })
                                -- vim.lsp.buf.formatting_sync()
                            end
                        })
                    end
                end
            })
        end
    })

    use({
        "neovim/nvim-lspconfig",
        config = function()
            -- Mappings.
            -- See `:help vim.diagnostic.*` for documentation on any of the below functions
            local opts = {noremap = true, silent = true}
            vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
            vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
            vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
            vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

            -- Use an on_attach function to only map the following keys
            -- after the language server attaches to the current buffer
            local on_attach = function(client, bufnr)
                -- Enable completion triggered by <c-x><c-o>
                vim.api.nvim_buf_set_option(bufnr, 'omnifunc',
                                            'v:lua.vim.lsp.omnifunc')

                -- Mappings.
                -- See `:help vim.lsp.*` for documentation on any of the below functions
                local bufopts = {noremap = true, silent = true, buffer = bufnr}
                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
                vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
                vim.keymap
                    .set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
                vim.keymap.set('n', '<space>wa',
                               vim.lsp.buf.add_workspace_folder, bufopts)
                vim.keymap.set('n', '<space>wr',
                               vim.lsp.buf.remove_workspace_folder, bufopts)
                vim.keymap.set('n', '<space>wl', function()
                    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end, bufopts)
                vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition,
                               bufopts)
                vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
                vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action,
                               bufopts)
                vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
                vim.keymap.set('n', '<space>f', function()
                    vim.lsp.buf.format {async = true}
                end, bufopts)
            end

            local lsp = require('lspconfig')

            lsp.bashls.setup({on_attach = on_attach})
            lsp.dockerls.setup({on_attach = on_attach})
            lsp.elixirls.setup({on_attach = on_attach})
            lsp.gopls.setup({on_attach = on_attach})
            lsp.html.setup({on_attach = on_attach})
            lsp.jsonls.setup({on_attach = on_attach})
            lsp.pylsp.setup({on_attach = on_attach})
            lsp.rust_analyzer.setup({on_attach = on_attach})
            lsp.solargraph.setup({on_attach = on_attach})
            lsp.sqlls.setup({on_attach = on_attach})
        end
    })
    use({
        "simrat39/rust-tools.nvim",
        config = function()
            local rt = require("rust-tools")

            rt.setup({})
        end
    })
    use({
        'williamboman/mason.nvim',
        config = function() require("mason").setup() end
    })
    use({
        'williamboman/mason-lspconfig.nvim',
        config = function() require("mason-lspconfig").setup() end
    })

    -- Completion framework:
    -- use({
    --     {
    --         "hrsh7th/nvim-cmp",
    --         config = function()
    --             -- Completion Plugin Setup
    --             local cmp = require 'cmp'
    --             local capabilities =
    --                 require('cmp_nvim_lsp').default_capabilities()

    --             cmp.setup({
    --                 capabilities = capabilities,
    --                 -- Enable LSP snippets
    --                 snippet = {
    --                     expand = function(args)
    --                         vim.fn["UltiSnips#Anon"](args.body)
    --                     end
    --                 },
    --                 mapping = {
    --                     ['<C-p>'] = cmp.mapping.select_prev_item(),
    --                     ['<C-n>'] = cmp.mapping.select_next_item(),
    --                     -- Add tab support
    --                     ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    --                     ['<Tab>'] = cmp.mapping.select_next_item(),
    --                     ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    --                     ['<C-f>'] = cmp.mapping.scroll_docs(4),
    --                     ['<C-Space>'] = cmp.mapping.complete(),
    --                     ['<C-e>'] = cmp.mapping.close(),
    --                     ['<CR>'] = cmp.mapping.confirm({
    --                         behavior = cmp.ConfirmBehavior.Insert,
    --                         select = true
    --                     })
    --                 },
    --                 -- Installed sources:
    --                 sources = {
    --                     {name = 'path'}, -- file paths
    --                     {name = 'nvim_lsp', keyword_length = 3}, -- from language server
    --                     {name = 'nvim_lsp_signature_help'}, -- display function signatures with current parameter emphasized
    --                     {name = 'nvim_lua', keyword_length = 2}, -- complete neovim's Lua runtime API such vim.lsp.*
    --                     {name = 'buffer', keyword_length = 2}, -- source current buffer
    --                     {name = 'ultisnips', keyword_length = 2}, -- nvim-cmp source for vim-vsnip 
    --                     {name = 'calc'} -- source for math calculation
    --                 },
    --                 window = {
    --                     completion = cmp.config.window.bordered(),
    --                     documentation = cmp.config.window.bordered()
    --                 },
    --                 formatting = {
    --                     fields = {'menu', 'abbr', 'kind'},
    --                     format = function(entry, item)
    --                         local menu_icon = {
    --                             nvim_lsp = 'λ',
    --                             vsnip = '⋗',
    --                             buffer = 'Ω',
    --                             path = '🖫'
    --                         }
    --                         item.menu = menu_icon[entry.source.name]
    --                         return item
    --                     end
    --                 }
    --             })
    --         end
    --     }, -- LSP completion source:
    --     {"hrsh7th/cmp-nvim-lsp"}, -- Useful completion sources:
    --     {"hrsh7th/cmp-nvim-lua"}, {"hrsh7th/cmp-nvim-lsp-signature-help"},
    --     {"hrsh7th/cmp-path"}, {"hrsh7th/cmp-buffer"}, {"SirVer/ultisnips"},
    --     {"honza/vim-snippets"}, {"quangnguyen30192/cmp-nvim-ultisnips"}
    -- })

    use({"puremourning/vimspector"})
end)

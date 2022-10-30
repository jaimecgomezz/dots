vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
    -- bootstrap
    use("wbthomason/packer.nvim")

    -- Creates a single autocommand that resolves the file type when a buffer is opened.
    use({"nathom/filetype.nvim"})

    -- colorschemes
    use({"RRethy/nvim-base16"})

    -- statusline
    use({
        "nvim-lualine/lualine.nvim",
        requires = {"kyazdani42/nvim-web-devicons", opt = true},
        config = function()
            require("lualine").setup({
                options = {icons_enabled = true},
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
        end
    })

    -- projects
    use({
        "benwainwright/fzf-project",
        config = function()
            local vim = vim

            vim.g.fzfSwitchProjectAlwaysChooseFile = 0
            vim.g.fzfSwitchProjectGitInitBehavior = "none"

            require("plugins/projects")
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
            config = [[require("plugins/telescope")]]
        }, {
            "nvim-telescope/telescope-frecency.nvim",
            after = "telescope.nvim",
            requires = "tami5/sqlite.lua"
        }, {"nvim-telescope/telescope-fzf-native.nvim", run = "make"}, {
            "LinArcX/telescope-env.nvim",
            config = function()
                require("telescope").load_extension("env")
            end
        }
    })

    -- start page
    use({"mhinz/vim-startify", config = [[require("plugins/startify")]]})

    -- local files
    use({
        "ctrlpvim/ctrlp.vim",
        config = function()
            local vim = vim

            vim.g.ctrlp_map = "<c-l>"
            vim.g.ctrlp_show_hidden = 1
            vim.g.ctrlp_user_command = "fd -t f -d 1000"
            vim.g.ctrlp_working_path_mode = "c"
            vim.g.ctrlp_match_window =
                "bottom,order:ttb,min:1,max:20,results:20"
            vim.g.ctrlp_custom_ignore = {
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
    use({"tpope/vim-fugitive"})
    use({"sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim"})

    -- colorizer
    -- A high-performance color highlighter for Neovim which has no external dependencies.
    use({
        "norcalli/nvim-colorizer.lua",
        config = function() require("colorizer").setup() end
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
        config = function()
            local vim = vim
            vim.g.tagbar_autoclose = 1
            vim.g.tagbar_width = 80
            vim.g.tagbar_autofocus = 1
            vim.g.tagbar_compact = 1
            vim.g.tagbar_show_data_type = 1
            vim.g.tagbar_autoshowtag = 1
            vim.g.tagbar_ignore_anonymous = 1
            vim.g.tagbar_show_visibility = 1
            vim.g.tagbar_previewwin_pos = ''
            vim.g.tagbar_autopreview = 1
            vim.g.tagbar_sort = 0
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
                    clients = {snippets = {warn = {}}},
                    display = {pum = {source_context = {"", ""}}}
                }
            end
        }, {"ms-jpq/coq.artifacts", branch = "artifacts"}
    })

    -- lint, formatting
    use({"neovim/nvim-lspconfig"})
    use({
        "jose-elias-alvarez/null-ls.nvim",
        config = [[require("plugins/null")]]
    })

    use({
        "simrat39/rust-tools.nvim",
        config = function() require("rust-tools").setup({}) end
    })
    use({
        'williamboman/mason.nvim',
        config = function() require("mason").setup({}) end
    })
    use({
        'williamboman/mason-lspconfig.nvim',
        config = function() require("mason-lspconfig").setup({}) end
    })

    use({
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            vim.opt.list = true

            require("indent_blankline").setup {
                space_char_blankline = " ",
                -- check if this makes it considerably slower
                show_current_context = true,
                show_current_context_start = true,
                use_treesitter = true,
                show_first_indent_level = false,
                show_trailing_blankline_indent = false,
                filetype_exclude = {
                    "terminal", "nofile", "quickfix", "prompt", "startify"
                }
            }
        end
    })
end)

# mydot

Personal dotfiles, synced across machines via git.

Currently includes:

- `nvim/` — LazyVim-based Neovim config (Python + Rust + TypeScript stack, diffview, basedpyright, kanagawa-dragon)

## First-time setup on a new machine

Clone the repo somewhere you keep code:

```bash
mkdir -p ~/Workspace
git clone git@github.com:tz70s/mydot.git ~/Workspace/mydot
```

### Neovim

System prerequisites (macOS + Homebrew):

```bash
brew install neovim fd ripgrep git-delta tree-sitter-cli node
```

- `neovim` — the editor (0.11+)
- `fd` — file finder used by Snacks picker (`<leader>fp` projects scan)
- `ripgrep` — live grep
- `git-delta` — syntax-highlighted git pager
- `tree-sitter-cli` — needed by some treesitter parsers that build from source
- `node` — required by vtsls / tailwindcss / prettier / eslint LSPs

Optional but recommended:

```bash
brew install ghostty                                # GPU terminal
brew install --cask font-jetbrains-mono-nerd-font   # icons in statusline, file tree
rustup-init                                         # rust toolchain (rust-analyzer needs it)
```

Symlink the nvim config into place:

```bash
# back up any existing nvim config first
[ -e ~/.config/nvim ] && mv ~/.config/nvim ~/.config/nvim.bak.$(date +%Y%m%d)
[ -e ~/.local/share/nvim ] && mv ~/.local/share/nvim ~/.local/share/nvim.bak.$(date +%Y%m%d)

mkdir -p ~/.config
ln -s ~/Workspace/mydot/nvim ~/.config/nvim
```

First launch — `lazy.nvim` will install all plugins from `nvim/lazy-lock.json`, then Mason installs language servers on first file open per language:

```bash
nvim
```

Wait for `:Lazy` to finish (it auto-runs). Open a Python / Rust / TS file to trigger Mason installs of `basedpyright`, `ruff`, `rust-analyzer`, `vtsls` etc.

Set git's pager to delta (optional, makes plain `git diff` nicer outside nvim):

```bash
git config --global core.pager delta
git config --global interactive.diffFilter "delta --color-only"
git config --global delta.navigate true
git config --global delta.side-by-side true
git config --global merge.conflictstyle zdiff3
```

## Daily sync

```bash
# start of session
cd ~/Workspace/mydot && git pull

# after editing config
cd ~/Workspace/mydot && git commit -am "tweak X" && git push
```

Editing either `~/.config/nvim/...` or `~/Workspace/mydot/nvim/...` modifies the same files (symlink).

`nvim/lazy-lock.json` pins plugin versions across machines — commit it after any `:Lazy update`.

## Notable keymaps (nvim)

- `<leader>fp` — project switcher (scans `~/Workspace` for git repos)
- `<leader>gvm` — diff current branch vs `main` (full diffview)
- `<leader>gvd` — diff working tree vs index
- `<leader>gh*` — gitsigns hunk navigation
- `<leader>ac` — toggle floating Claude Code terminal
- `gd` / `gr` / `K` — LSP goto-def / references / hover (works inside diffview)

See `nvim/lua/plugins/diffview.lua` for the full diff review keymap set.

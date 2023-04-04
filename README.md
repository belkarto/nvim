# MY NVIM CONF
This repository contains a custom Neovim configuration, designed to optimize your text editing experience and boost productivity. The configuration is easy to set up and comes with a wide range of plugins and settings to enhance your workflow.

## Features

- Efficient keybindings for faster navigation and editing
- Syntax highlighting and auto-completion for various programming languages
- Integrated file explorer and fuzzy finder
- Git integration for version control
- Code snippets and templates for faster coding
- Aesthetically pleasing color schemes and themes

## Installation

1. Clone this repository:

   ```
   git clone https://github.com/belkarto/nvim.git ~/.config/nvim
   ```
2. run the following commands to install nvim and some other stuff you might need.
    ```
    cd ~/.config/nvim
    chmod +x install.sh
    ./install.sh
    ```

4. Open Neovim and run `:PlugInstall` to install the plugins.

5. Restart Neovim to apply the new configuration.

## Keymaps
**Note:** The leader key is <space> you can change it in **lua/conf/remap.lua**
### Normal mode
| key           | Action                                         |
|---------------|------------------------------------------------|
| <leader>u     | show undo tree to track your changes           |
| <leader>s     | select word and change all matching words in the file|
| <leader>ps    | look up a word ot text in all file in working directory|
| <leader>pf    | look up a file in working directory            |
| <leader>pv    | explore files                                  |
| <leader>f     | fix file format                                |
| <leader>n     | fix file indentation                           |
| <leader>,     | go to previous buffer                          |
| <leader>.     | go to next buffer                              |
| <C-\\>        | opens terminal                                 |
| < F3 >          | open nerd tree                                 |
| <leader>gs    | opens Fugitve                                  |
| <leader>a     | add file to harpoon quick menu                 |
| < C-e>         | toggle harpoon quick menu                      |
| < C-p>         | show telescop                                  |

### visual mode
| key           | Action                                         |
|---------------|------------------------------------------------|
| J             | move selected text down                        |
| K             | move selected text up                          |


## Feedback and Contributions

If you have any suggestions, issues, or improvements, please open an issue or submit a pull request. Your contributions are welcome and appreciated!

---

Enjoy your new Neovim experience!

# AstroNvim

My AstroNvim configuration

If you want to use AstroNvim, check out: [AstroNvim](https://github.com/kabinspace/AstroVim)

# How to install my config

You can config `AstroNvim` in both `.config/nvim/lua/user` or `.config/astronvim/lua/user`.
But I recommend doing the second method for easily reinstallation.

Install my config, use:

```bash
  git clone https://github.com/datamonsterr/astrovim_config ~/.config/astronvim/lua/user
```

# Another configuration method

Basically, [AstroNvim](https://github.com/kabinspace/AstroVim) provides us two way to make
an user's customization. You can use an user/init.lua (which I'm using in another_method branch) or
without a user/init.lua (which I'm using in main branch).

**Notes:** You can see that my `another_method` seems not in a single file because I split user/init.lua
to many files and source it back to user/init.lua

Install another_method of my config, use:

```bash
  git clone -b another_method https://github.com/datamonsterr/astrovim_config ~/.config/astronvim/lua/user
```

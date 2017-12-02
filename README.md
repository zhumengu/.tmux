.tmux
=====

自包含，整洁的 `.tmux.conf` 配置文件.

![Screenshot](https://cloud.githubusercontent.com/assets/553208/19740585/85596a5a-9bbf-11e6-8aa1-7c8d9829c008.gif)

安装
------------

环境:

  - tmux **`>= 2.1`** 运行环境 Linux, Mac, OpenBSD, Cygwin or WSL (Bash on
    Ubuntu on Windows)
  - 环境变量 `$TERM` 必须设置为 `xterm-256color`

运行下面命令安装,如果已有配置文件请自行备份.
```bash
curl https://raw.githubusercontent.com/zhumengu/.tmux/master/install.sh | sh
```

[自定义]设置 `~/.tmux.conf.local` 文件 , 主配置文件切勿更改。

[自定义]: #使用-powerline

如果是 Vim 用户, 设置环境变量 `$EDITOR` 为 `vim` 启用 vim 风格按键绑定(参考
tmux 手册).

刚使用 tmux, 推荐阅读 [tmux 2: Productive Mouse-Free
Development][bhtmux2] by [@bphogan].

[bhtmux2]: https://pragprog.com/book/bhtmux2/tmux-2
[@bphogan]: https://twitter.com/bphogan

特性
--------

 - `C-a` 作为第二前导键 `C-b` 仍然支持。
 - visual theme inspired by [Powerline][]
 - 最大化当前面板开关 `<prefix> +`[maximize-pane]
 - SSH aware username and hostname status line information
 - 鼠标支持使用开关 `<prefix> m`
 - automatic usage of [`reattach-to-user-namespace`][reattach-to-user-namespace]
   if available
 - 笔记本电池电量指示器
 - 开机时间显示
 - 当前面板指示 (tmux `>= 2.1`)
 - configurable new windows and panes behavior (optionally retain current path)
 - SSH aware split pane (reconnects to remote server, experimental)
 - copy to OS clipboard (needs [`reattach-to-user-namespace`][reattach-to-user-namespace]
   on macOS, `xsel` or `xclip` on Linux)
 - [Facebook PathPicker][] integration if available
 - [Urlview][] integration if available

[Powerline]: https://github.com/Lokaltog/powerline
[maximize-pane]: http://pempek.net/articles/2013/04/14/maximizing-tmux-pane-new-window/
[reattach-to-user-namespace]: https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard
[Facebook PathPicker]: https://facebook.github.io/PathPicker/
[Urlview]: https://packages.debian.org/stable/misc/urlview

按键绑定说明，tmux 默认使用 Ctrl + b 作为前导键，配置中指定了第二前导键
Ctrl + a, 两者可混用（Ctrl+a 为screen默认按键）
  - `<prefix>` 表示按下 <kbd>Ctrl</kbd> + <kbd>a</kbd> 键, 或者 <kbd>Ctrl</kbd> + <kbd>b</kbd> 键
  - `<prefix> c` 表示按下 <kbd>Ctrl</kbd> + <kbd>a</kbd> 键，或者 <kbd>Ctrl</kbd> + <kbd>b</kbd> 键，随后按 <kbd>c</kbd> 键
  - `<prefix> C-c` 表示按下  <kbd>Ctrl</kbd> + <kbd>a</kbd> 键，或者 <kbd>Ctrl</kbd> + <kbd>b</kbd> 键，随后按 <kbd>Ctrl</kbd> + <kbd>c</kbd> 键

绑定列表：

 - `<prefix> C-c` 创建新窗口
 - `<prefix> e` 使用`$EDITOR` 指定的环境变量编辑配置文件(未设置时使用vim)
 - `<prefix> r` 重新加载配置
 - `<prefix> C-f` lets you switch to another session by name
 - `<prefix> C-h` 与 `<prefix> C-l` 向前向后切换窗口 (默认
   `<prefix> n` 与 `<prefix> p` 被撤销)
 - `<prefix> Tab` 切换到上一个活动窗口
 - `<prefix> h`, `<prefix> j`, `<prefix> k` 与 `<prefix> l` 在各窗格间移动
 - `<prefix> H`, `<prefix> J`, `<prefix> K`, `<prefix> L` 调整窗格大小
 - `<prefix> <` 与 `<prefix> >` 交换窗格位置
 - `<prefix> +` 最大化当前窗格
 - `<prefix> m` 开启鼠标支持
 - `<prefix> U` launches Urlview (if available)
 - `<prefix> F` launches Facebook PathPicker (if available)
 - `<prefix> Enter` enters copy-mode
 - `<prefix> b` 查看剪贴板
 - `<prefix> p` 粘贴
 - `<prefix> P` 粘贴条目
 - `C-l` clears both the screen and the history

Additionally, `vi-choice`, `vi-edit` and `vi-copy` named tables are adjusted
   to closely match [my own Vim configuration][]

[my own Vim configuration]: https://github.com/gpakosz/.vim.git

Bindings for the `vi-choice` mode-table:

- `h` collapses the current tree node
- `l` expands the current tree node
- `H` collapses all the tree nodes
- `L` expands all the tree nodes
- `K` jumps to the start of list (tmux `2.0+`)
- `L` jumps to the end of list (tmux `2.0+`)
- `Escape` cancels the current operation

Bindings for the `vi-edit` mode-table:

- `H` jumps to the start of line
- `L` jumps to the end of line
- `q` cancels the current operation
- `Escape` cancels the current operation

Bindings for the `vi-copy` mode-table:

- `v` begins selection / visual mode
- `C-v` toggles between blockwise visual mode and visual mode
- `H` jumps to the start of line
- `L` jumps to the end of line
- `y` copies the selection to the top paste-buffer
- `Escape` cancels the current operation

The "maximize any pane to a new window with `<prefix> +`" feature is different
from builtin `resize-pane -Z` as it allows you to further split a maximized
pane. It's also more flexible by allowing you to maximize a pane to a new
window, then change window, then go back and the pane is still in maximized
state in its own window. You can then minimize a pane by using `<prefix> +`
either from the source window or the maximized window.

![Maximize pane](https://cloud.githubusercontent.com/assets/553208/9890858/ee3c0ca6-5c02-11e5-890e-05d825a46c92.gif)

Mouse mode allows you to set the active window, set the active pane, resize
panes and automatically switches to copy-mode to select text.

![Mouse mode](https://cloud.githubusercontent.com/assets/553208/9890797/8dffe542-5c02-11e5-9c06-a25b452e6fcc.gif)

自定义
-------------

按 `<prefix> e` 使用系统默认编辑器打开配置文件，取消注释行开启功能项。

### 使用 powerline

Powerline originated as a status-line plugin for Vim. Its popular eye-catching
look is based on the use of special symbols: <img width="80" alt="Powerline Symbols" style="vertical-align: middle;" src="https://cloud.githubusercontent.com/assets/553208/10687156/1b76dda6-796b-11e5-83a1-1634337c4571.png" />

To make use of these symbols, there are several options:

- use a font that already bundles those: this is e.g. the case of the
  [2.030R-ro/1.050R-it version][source code pro] of the Source Code Pro] font
- use a [pre-patched font][powerline patched fonts]
- use your preferred font along with the [Powerline font][powerline font] (that
  only contains the Powerline symbols): [this highly depends on your operating
  system and your terminal emulator][terminal support]
- [patch your preferred font][powerline font patcher] by adding the missing
  Powerline symbols: this is the most difficult way and is no more documented in
  the [Powerline manual]

[source code pro]: https://github.com/adobe-fonts/source-code-pro/releases/tag/2.030R-ro/1.050R-it
[powerline patched fonts]: https://github.com/powerline/fonts
[powerline font]: https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
[powerline font patcher]: https://github.com/powerline/fontpatcher
[terminal support]: http://powerline.readthedocs.io/en/master/usage.html#usage-terminal-emulators
[Powerline manual]: http://powerline.readthedocs.org/en/latest/installation.html#fonts-installation

Please see the [Powerline manual] for further details.

取消配置文件中下面行注释使用 powerline 分隔符（需要字体安装正确）
```
tmux_conf_theme_left_separator_main=''
tmux_conf_theme_left_separator_sub=''
tmux_conf_theme_right_separator_main=''
tmux_conf_theme_right_separator_sub=''
```
### Configuring the status line

Contrary to the first iterations of this configuration, by now you have total
control on the content and order of `status-left` and `status-right`.

Edit the `~/.tmux.conf.local` file (`<prefix> e`) and adjust the
`tmux_conf_theme_status_left` and `tmux_conf_theme_status_right` variables to
your own preferences.

This configuration supports the following builtin variables:

 - `#{battery_bar}`: horizontal battery charge bar
 - `#{battery_percentage}`: battery percentage
 - `#{battery_status}`: is battery charging or discharging?
 - `#{battery_vbar}`: vertical battery charge bar
 - `#{circled_session_name}`: circled session number, up to 20
 - `#{hostname}`: SSH aware hostname information
 - `#{hostname_ssh}`: SSH aware hostname information, blank when no SSH
   connection detected
 - `#{loadavg}`: load average
 - `#{pairing}`: is session attached to more than one client?
 - `#{prefix}`: is prefix being depressed?
 - `#{root}`: is current user root?
 - `#{uptime_d}`: uptime days
 - `#{uptime_h}`: uptime hours
 - `#{uptime_m}`: uptime minutes
 - `#{uptime_s}`: uptime seconds
 - `#{username}`: SSH aware username information
 - `#{username_ssh}`: SSH aware username information, blank when no SSH
   connection detected

### Accessing the macOS clipboard from within tmux sessions

[Chris Johnsen created the `reattach-to-user-namespace`
utility][reattach-to-user-namespace] that makes `pbcopy` and `pbpaste` work
again within tmux.

To install `reattach-to-user-namespace`, use either [MacPorts][] or
[Homebrew][]:

    $ port install tmux-pasteboard

or

    $ brew install reattach-to-user-namespace

Once installed, `reattach-to-usernamespace` will be automatically detected.

[MacPorts]: http://www.macports.org/
[Homebrew]: http://brew.sh/

### Using the configuration under Cygwin within Mintty

**I don't recommend running this configuration with Cygwin anymore. Forking
under Cygwin is extremely slow and this configuration issues a lot of
`run-shell` commands under the hood. As such, you will experience high CPU
usage. As an alternative consider using [Mintty terminal for WSL][wsltty].**

![cygwin](https://cloud.githubusercontent.com/assets/553208/19741789/67a3f3d8-9bc2-11e6-9ecc-499fc0228ee6.png)

It is possible to use this configuration under Cygwin within Mintty, however
support for Unicode symbols and emojis lacks behind Mac and Linux.

Particularly, Mintty's text rendering is implemented with GDI which has
limitations:

- color emojis are only available through DirectWrite starting with Windows 8.1
- display of double width symbols, like the battery discharging symbol indicator
  (U+1F50B) is buggy

To get Unicode symbols displayed properly, you have to use [font linking].
Open `regedit.exe` then navigate to the registry key at
`HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\FontLink\SystemLink`
and add a new entry for you preferred font to link it with the Segoe UI Symbol
font.

![regedit](https://cloud.githubusercontent.com/assets/553208/19741304/71a2f3ae-9bc0-11e6-96aa-4c09a812c313.png)

[font linking]: https://msdn.microsoft.com/en-us/goglobal/bb688134.aspx

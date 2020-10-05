.tmux
=====

自包含，整洁的 `.tmux.conf` 配置文件.

![Screenshot](https://cloud.githubusercontent.com/assets/553208/19740585/85596a5a-9bbf-11e6-8aa1-7c8d9829c008.gif)

安装
------------

需求:

  - 已安装 awk, perl and sed
  - tmux **`>= 2.1`** 运行环境 Linux, Mac, OpenBSD, Cygwin or WSL (Bash on
    Ubuntu on Windows)
  - 环境变量 `$TERM` 必须设置为 `xterm-256color`

运行下面命令安装,如果已有配置文件请自行备份.

```bash
curl https://raw.githubusercontent.com/zhumengu/.tmux/master/install.sh | sh
```

自定义使用 `~/.tmux.conf.local` 文件, 主配置文件切勿更改。

如果是 Vim 用户, 设置环境变量 `$EDITOR` 为 `vim` 启用 vim 风格按键绑定(参考
tmux 手册).

特性
--------

 - 以 vim 按键映射
 - `C-a` 作为前导键
 - 最大化当前面板开关 `<prefix> +`[maximize-pane]
 - 鼠标支持使用开关 `<prefix> m`
 - 笔记本电池电量指示器
 - 开机时间显示
 - 当前面板指示 (tmux `>= 2.1`)

绑定
--------

按键绑定说明，tmux 默认使用 Ctrl + b 作为前导键，配置中指定了第二前导键
Ctrl + a, 两者可混用（Ctrl+a 为screen默认按键）
  - `<prefix>` 表示按下 <kbd>Ctrl</kbd> + <kbd>a</kbd> 键, 或者 <kbd>Ctrl</kbd> + <kbd>b</kbd> 键
  - `<prefix> c` 表示按下 <kbd>Ctrl</kbd> + <kbd>a</kbd> 键，或者 <kbd>Ctrl</kbd> + <kbd>b</kbd> 键，随后按 <kbd>c</kbd> 键
  - `<prefix> C-c` 表示按下  <kbd>Ctrl</kbd> + <kbd>a</kbd> 键，或者 <kbd>Ctrl</kbd> + <kbd>b</kbd> 键，随后按 <kbd>Ctrl</kbd> + <kbd>c</kbd> 键

绑定列表

 - `<prefix> r` 重新加载配置
 - `C-l` 刷新
 - `<prefix> -` 当前窗口分割为上下两个
 - `<prefix> _` 当前窗口分割为左右连个
 - `<prefix> C-c` 创建新窗口
 - `<prefix> e` 使用`$EDITOR` 指定的环境变量编辑配置文件(未设置时使用vim)
 - `<prefix> r` 重新加载配置
 - `<prefix> C-f` 切换会话
 - `<prefix> C-h` 与 `<prefix> C-l` 向前向后切换窗口 (默认
 - `<prefix> n` 与 `<prefix> p` 被撤销)
 - `<prefix> Tab` 切换到上一个活动窗口
 - `<prefix> h`, `<prefix> j`, `<prefix> k` 与 `<prefix> l` 在各窗格间移动
 - `<prefix> H`, `<prefix> J`, `<prefix> K`, `<prefix> L` 调整窗格大小
 - `<prefix> <` 与 `<prefix> >` 交换窗格位置
 - `<prefix> +` 最大化当前窗格
 - `<prefix> m` 开启鼠标支持
 - `<prefix> U` launches Urlview (if available)
 - `<prefix> F` launches Facebook PathPicker (if available)
 - `<prefix> Enter` 拷贝模式
 - `<prefix> b` 查看剪贴板
 - `<prefix> p` 粘贴
 - `<prefix> P` 粘贴条目
 - `<prefix> e` 使用系统默认编辑器打开配置文件


### 使用 powerline


安装 powerline 参考

[source code pro]: https://github.com/adobe-fonts/source-code-pro/releases/tag/2.030R-ro/1.050R-it
[powerline patched fonts]: https://github.com/powerline/fonts
[powerline font]: https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
[terminal support]: http://powerline.readthedocs.io/en/master/usage.html#usage-terminal-emulators
[Powerline manual]: http://powerline.readthedocs.org/en/latest/installation.html#fonts-installation


取消配置文件 "~/.tmux.conf.local" 中以下行注的注释显示 powerline 箭头, 前提是打
过 powerline fonts 补丁

```
tmux_conf_theme_left_separator_main='\uE0B0'
tmux_conf_theme_left_separator_sub='\uE0B1'
tmux_conf_theme_right_separator_main='\uE0B2'
tmux_conf_theme_right_separator_sub='\uE0B3'
```

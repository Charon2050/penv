# penv

[English](https://github.com/Charon2050/penv) | **简体中文**

在便携目录下运行程序的 Windows 脚本。

## 安装（可选）

直接运行 `install-penv.bat`，即可将 `penv` 添加到环境变量 Path 中。

## 命令行用法

- `penv` 进入 penv 环境（默认名称为 `default`）。
- `penv <commands>` 在 penv 环境中单次执行一行命令。
- `penv -u | -use <env name>` 指定环境名称。
- `penv -h | -help` 查看帮助信息。
- `exit` 退出 penv 环境。

便携环境产生的数据默认存放在 `penv/env/<env name>/`，如 `D:/penv/env/default/`。

### 示例

`penv C:/path/to/msedge.exe`
<br/>在便携环境中打开 Edge 浏览器。

`penv -u alice C:/path/to/firefox.exe`
<br/>在名为 `alice` 的便携环境中打开 Firefox 浏览器。


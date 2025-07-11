# penv

**English** | [简体中文](https://github.com/Charon2050/penv/blob/main/README_zh-CN.md)

Run any programs in portable mode in Windows.

## Install (Optional)

run `install-penv.bat`, it will add `penv` to environment variables.

## Usage

- `penv` to enter portable environment.
- `penv <commands>` to temporarily executes a single command in the penv.
- `penv -u | -use <env name>` to use a specific portable environment.
- `penv -h | -help` to show help message.
- `exit` to exit portable environment.

### Examples

`penv C:/path/to/msedge.exe`
<br/>Open Microsoft Edge in portable mode.

`penv -u alice C:/path/to/firefox.exe`
<br/>Open Firefox in portable environment named `alice`

## Environment Variables PATH

You can add Environment Variables PATH in `penv/path.txt` (global) or `penv/env/<env name>/path.txt` (only this environment).

Use `%cd%` as the relative path, where `%cd%` represents the path of `penv.bat`. For example, if `penv.bat` is in `D:/penv/penv.bat`, then `%cd%/Python ` equ to `D:/penv/Python`.

### Examples

For such a directory:

```
penv/
├ env/
├ Python/
│ ├ Python.exe
│ └ ...
├ JAVA/
│ ├ bin/
│ │ ├ java.exe
│ └ ...
├ penv.bat
└ path.txt
```

You can edit `path.txt` like this:

```
%cd%/python
%cd%/JAVA/bin
```

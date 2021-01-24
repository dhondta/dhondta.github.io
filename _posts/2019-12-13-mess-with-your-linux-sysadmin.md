---
layout: post
title: How to mess with your Linux sysadmin
subtitle: When <code class="language-plaintext highlighter-rouge">script</code> is used to log your actions
---

Recently, I noticed a process running `script` on a server for which I had to review the logs. As a reminder, this tool logs every command typed in a terminal but also its output. The running process was :

```session
$ ps aux | grep  log
user  21842  5.0  0.1  22244  2576 pts/0    S+   08:58   0:17 script -f /home/.../user/.log/13-12-19_08-58-30_10.45.99.1_shell.log -q
user  23947  0.0  0.0  14428  1040 pts/1    S+   09:04   0:00 grep --color=auto log
```

The problem with this process arises if you cat the log file while it's already big (e.g. after havin executed a few `find /`). Given the command options used, the `-f` option will flush `cat`'s output while the read is not over yet, ending in an infinite loop while writing to the log file and reading it concurrently from both `script` and `cat` processes.

This causes the log file to fill the disk up to space exhaustion in only a few seconds !

Also see: https://stackoverflow.com/questions/15100504/infinite-loop-on-script-binary

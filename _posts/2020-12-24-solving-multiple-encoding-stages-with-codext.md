---
layout: post
title: Solving a challenge of multi-stage encoding using AI
subtitle: By leveraging the power of the guess feature of <code class="language-plaintext highlighter-rouge">codext</code>
---

The following example shows how to decode a multi-stage encoded data using the guess feature of [`codext`](/python-codext). It allows to recover the original data in only a few seconds using an AI algorithm.

```sh
$ echo -en "cac6d0de40449068e69282906cf282da82865eeeec94f286f0ae8296948ad0ca988a669296c6ac92b0d2d6e2989aec90a27282a0d4f266929ab28282828244407c405ee8dae05edae6ce5ce8f0e8" | codext guess hex
Codecs: hex, rotate-left-1
echo "H4sIAH6yAmAC/wvJyCxWAKJEheLE3IKcVIXikqLMvHQ9APjy3IMYAAAA" > /tmp/msg.txt

$ echo -en "H4sIAH6yAmAC/wvJyCxWAKJEheLE3IKcVIXikqLMvHQ9APjy3IMYAAAA" | codext guess base64
Codecs: base64, gzip
This is a sample string.
```

Briefly, the [guess feature of `codext`](https://python-codext.readthedocs.io/en/latest/features.html#guess-decode-an-arbitrary-input) uses a (pseudo) Graph Search to try decoding stages using the range of codecs available.

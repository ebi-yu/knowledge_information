---
layout: manual
title: プレゼンテーション
category: Advanced
path: '/ja/:id'
language: ja
flag: jp
---

### Markdownからプレゼンテーション作成

- Markdownに慣れてくると、ちょっとした発表資料などもMarkdownで書きたくなります
- そこで、記事の種類で 「presentation」 を選ぶと、プレゼンテーション形式で表示します
- 改ページは、罫線（`----`)で挿入します

#### &lt;プレゼンテーションモードの選択&gt;

<img  width="100%" src="/assets/manual/images/presentation_edit.ja.png" alt="presentation_edit.ja.png" />

#### &lt;プレゼンテーション表示&gt;

<img  width="100%" src="/assets/manual/images/presentation_show.ja.png" alt="presentation_show.ja.png" />


### トラディションの設定

- プレゼンテーションにトラディションを設定したい場合、Markdownの一番上に以下を入力

```
<var transition="fadeIn" />
```

- 各ページ毎に、トラディションや中央寄せ表示をしたい場合、ページの先頭に以下を入力

```
------- // ←改ページ

<var transition="rubberBand" centered="true" />

- そのページの文章
```


# hwGrade2

一个用于生成小学阶段中英双语家庭作业、课堂练习和数学题的历史项目。项目主要使用 LaTeX 排版，并通过 MATLAB 脚本随机生成算术题、英文单词练习和部分图形题素材。

## 主要内容

- `hwcn.tex`：中文家庭作业模板。
- `hwen.tex`：英文、数学、音乐和 Sudoku 综合作业模板。
- `chineseschool*.tex`：中文家庭作业、课堂测验及文字练习模板。
- `mathop.m`：随机生成算术题，输出到 `mathop.txt`。
- `maths.m`：从 `mathfigs/` 中随机组合数学图形题，输出到 `maths.txt`。
- `words.m`：随机生成单词练习，输出到 `wordsen.txt`。
- `fontfigs/`：汉字练习用图片素材。
- `mathfigs/`：数学题图片素材。
- `Sudoku/`：MATLAB Sudoku 生成与求解代码。
- `Sudoku-samples/`：LaTeX Sudoku 示例及测试文件。

仓库中的 PDF 文件是历史编译样例，可用于查看预期版式。

## 使用方式

### 1. 生成随机内容

在 MATLAB 中进入项目目录，然后按需运行：

```matlab
run('mathop.m')
run('maths.m')
run('words.m')
```

这些脚本会更新相应的 `.txt` 片段。脚本使用随机种子，因此每次运行得到的题目可能不同。

### 2. 编译作业

中文模板依赖 XeLaTeX、`xeCJK` 和所需中文字体。例如：

```text
xelatex hwcn.tex
xelatex chineseschool.tex
```

英文综合模板还使用 TikZ、ABC 乐谱和 Sudoku 等 LaTeX 宏包：

```text
pdflatex hwen.tex
```

本项目源自较早的 TeX/MATLAB 环境，部分宏包名称、字体配置或脚本行为在新版本中可能需要调整。建议先参考仓库内的历史 PDF 样例核对输出。

## 隐私与敏感信息

仓库不应提交本地环境变量、密钥、证书、编辑器配置或机器专用路径。相关常见文件模式已加入 `.gitignore`。当前源文件中的“姓名/Name”内容是供学生填写的空白模板，不包含学生个人信息。

## 第三方代码

仓库中的原创脚本和模板采用 MIT 许可证，见 `LICENSE`；以下第三方文件不在 MIT 许可范围内。

`Sudoku/` 中包含带有 BSD 许可证的第三方代码，具体条款见 `Sudoku/license.txt`。`Sudoku-samples/` 和根目录中的部分 `.sty` 文件也保留了原作者署名。第三方文件的许可证和署名不代表整个仓库已采用同一许可证；在重新分发或修改时请分别遵守相应条款。

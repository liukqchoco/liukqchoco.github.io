# 本地热更新预览与发布流程

这份文档是给本站日常修改用的：先在本地网页预览效果，确认没有问题后，再提交并推送到 GitHub Pages。

## 一键启动预览

在仓库根目录运行：

```bash
bash scripts/preview_site.sh
```

脚本会自动选择预览方式：

- 优先使用 conda 环境 `alfolio-local`，地址是 `http://127.0.0.1:4000`。
- 如果找不到 conda 或这个环境，则尝试使用当前 shell 里的 Ruby/Bundler。

启动后保持这个终端开着。修改 Markdown、YAML、BibTeX 或图片后，Jekyll 会自动重新构建页面。浏览器通常会自动刷新；如果没有刷新，手动刷新页面即可。

注意：修改 `_config.yml` 这类站点配置后，通常需要按 `Ctrl+C` 停掉预览服务，然后重新运行脚本。

停止预览服务：

```text
Ctrl+C
```

## 指定运行方式

推荐使用 conda 环境：

```bash
bash scripts/preview_site.sh conda
```

默认环境名是 `alfolio-local`。如果你想换成其他 conda 环境：

```bash
CONDA_ENV=你的环境名 bash scripts/preview_site.sh conda
```

如果你已经手动激活了 conda 环境，也可以使用当前 shell 的 Ruby/Bundler：

```bash
bash scripts/preview_site.sh ruby
```

本地预览默认端口是 `4000`。如果端口被占用，可以换一个端口：

```bash
PORT=5000 bash scripts/preview_site.sh conda
```

然后访问 `http://127.0.0.1:5000`。

## 推荐修改流程

1. 启动本地预览：

   ```bash
   bash scripts/preview_site.sh
   ```

2. 修改网站内容，例如：

   - 首页：`_pages/about.md`
   - 站点标题、姓名、描述：`_config.yml`
   - 社交链接：`_data/socials.yml`
   - 简历数据：`_data/cv.yml`
   - 论文列表：`_bibliography/papers.bib`
   - 项目展示：`_projects/`
   - 头像和图片：`assets/img/`

3. 回到浏览器查看效果。

4. 如果页面没有自动刷新，手动刷新浏览器。

5. 确认效果满意后，在另一个终端检查改动：

   ```bash
   git status
   git diff
   ```

6. 提交并推送：

   ```bash
   git add .
   git commit -m "Update personal website"
   git push
   ```

推送后，GitHub Actions 会自动部署到 GitHub Pages。部署完成后访问 `https://liukqchoco.github.io` 查看线上版本。

## 常见问题

### conda 环境缺 Ruby gems

如果脚本提示缺少 Ruby gems，先安装依赖：

```bash
/Users/liukaiqi/miniconda3/bin/conda run -n alfolio-local bundle install
```

安装完成后重新启动：

```bash
bash scripts/preview_site.sh
```

### 修改后没有立刻生效

先手动刷新浏览器。如果还是没有变化，按 `Ctrl+C` 停掉服务后重新运行：

```bash
bash scripts/preview_site.sh
```

### 端口被占用

conda 和 Ruby 模式默认使用 `4000`。如果端口被占用，可以这样换端口：

```bash
PORT=5000 bash scripts/preview_site.sh conda
```

### 预览成功但线上没更新

推送后需要等待 GitHub Actions 部署完成。可以到 GitHub 仓库的 Actions 页面查看 `Deploy` 工作流是否成功。

## 可选 npm 快捷命令

如果你的本机安装了 Node.js 和 npm，也可以使用这些等价命令：

```bash
npm run preview
npm run preview:conda
npm run preview:docker
npm run preview:ruby
```

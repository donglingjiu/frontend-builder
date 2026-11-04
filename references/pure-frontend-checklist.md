# 纯前端交付清单

项目声明为"纯前端"时，交付前逐项核对：

## 架构
- 无后端依赖（不调用自建 API）
- 数据持久化仅用 localStorage / IndexedDB
- 无运行时 CDN（vendor 本地化：xlsx / docx / pdf-lib / pptxgen / mammoth / pdfjs）
- API Profile（endpoint/key/model）由用户本地配置，密钥不进代码

## 质量
- 双击 index.html 可打开（file:// 兼容）
- 主流程 Chrome / Edge 各跑通一遍
- 控制台无未捕获报错
- 断网时核心交互可用（LLM 调用除外，需友好提示）

## 交付
- README 含 3 步使用说明
- 敏感配置集中在单一入口（如设置页）
- 部署走静态托管（GitHub Pages / 对象存储）

## 红线引用

AI 代码红线见 AutoDev/references/coding-standards/agentic-redlines.md，交付前扫描。

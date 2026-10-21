# 框架探索速查表

探索代码仓时，根据项目框架快速定位关键文件。判断框架：先看 `package.json` 的 dependencies。

---

## Vue 2 / Vue 3

**路由文件**
- `src/router/index.js` 或 `src/router.js`
- 路由注册：`routes` 数组，每项含 `path`、`component`（常用懒加载 `() => import(...)`）
- 嵌套路由：`children` 数组

**菜单/导航**
- 通常是独立的配置文件：`src/config/menu.js`、`src/layout/sidebar.js`、`src/store/menu.js`
- 也可能与路由合并，通过 `meta.title`、`meta.icon` 驱动菜单渲染

**样式**
- 全局变量：`src/styles/variables.scss`、`src/assets/styles/variables.less`
- 全局样式：`src/styles/index.scss`、`src/assets/global.less`
- 组件样式：与 `.vue` 文件同目录，或写在 `<style scoped>` 中

**组件注册**
- 全局注册：`main.js` 中 `Vue.component(...)` 或 `app.component(...)`
- 局部注册：`.vue` 文件的 `components: { ... }` 选项
- 第三方组件库：`main.js` 中 `Vue.use(ElementUI)` / `app.use(ElementPlus)`

**探索重点**：找一个已有页面的 `.vue` 文件，看 `<template>` 结构和 `<script>` 中的 `components` 声明，即可确认组件用法。

---

## React (CRA / Vite / Next.js)

**路由文件**
- CRA/Vite：`src/router/index.tsx`、`src/App.tsx`（集中定义 `<Route>`）
- Next.js：文件即路由，页面在 `pages/` 或 `app/` 目录，无需手动注册

**菜单/导航**
- 通常是配置数组：`src/config/routes.ts`、`src/layout/menu.ts`
- 字段常见：`{ path, name, icon, children }`

**样式**
- CSS Modules：`ComponentName.module.css` / `.module.less`，类名通过 `styles.xxx` 引用
- 全局变量：`src/styles/variables.css`（CSS 自定义属性 `--color-primary`）或 `src/theme.ts`（JS 对象）
- Tailwind：无独立变量文件，颜色/间距在 `tailwind.config.js` 中定义

**组件注册**
- 无需注册，直接 `import` 后使用
- 确认组件路径：从参考页面的 import 语句复制，不要自行推断

**探索重点**：找参考页面的 `.tsx` 文件，看 import 列表和 JSX 结构，即可确认所有组件的来源和用法。

---


## Angular

**路由文件**
- `src/app/app-routing.module.ts`，路由项含 `path`、`component`、`loadChildren`（懒加载模块）
- 子模块路由：各 feature 目录下的 `xxx-routing.module.ts`

**菜单/导航**
- 通常是服务或配置：`src/app/core/nav.service.ts`、`src/app/config/menu.ts`

**样式**
- 全局变量：`src/styles.scss`、`src/styles/variables.scss`
- 组件样式：`component.scss`，通过 `styleUrls` 引用，默认 `ViewEncapsulation.Emulated`（样式隔离）

**组件注册**
- 必须在 NgModule 的 `declarations` 中声明，或使用 Standalone Component（Angular 14+）
- 第三方组件库：在对应 Module 的 `imports` 中引入（如 `NzButtonModule`）

**探索重点**：确认项目是否使用 Standalone Component（无 NgModule），两种模式的组件引入方式完全不同。

---

## 通用探索策略

当框架不确定时，按以下顺序快速定位：

1. 读 `package.json` → 确认框架和主要 UI 组件库
2. 找 `src/main.js` 或 `src/main.ts` → 看全局注册了什么
3. 找一个已有页面 → 从它的 import 语句反推所有组件来源
4. 搜索 `router` 关键词 → 定位路由文件

# 迭代优化日志（OPTIMIZATION_LOG）

> 每次优化追加一条：变更 / 对标来源 / 优点 / 缺点与限制 / 影响面。新条目置顶。

---

## [2026-11-05] OPT-001 单步预览与调试协议

### 变更
- 新增 references/preview-protocol.md：step_id/artifact/diff_summary/check_command/status/rollback 六字段协议 + L1/L2/L3 三级验证
- 新增 CI 结构校验

### 对标来源
- Coze Studio 实时预览
- Flowise 单节点测试
- n8n 节点级执行

### 优点
1. 前端生成从"全部完成才可看"改为"每步可看可验可回滚"
2. check_command 使单步自验可脚本化，接入 CI 无门槛
3. 失败即停 + rollback 指令，避免错误级联到下游阶段

### 缺点 / 已知限制
1. L2 渲染预览需要部署目标，当前仅定义协议未提供实现
2. diff_summary 需人工/Agent 填写，暂无自动生成工具
3. 对需构建的框架页需先补 build 环境约定

### 影响面
- nebula-tools 前端阶段逐步生成时按本协议输出预览

# 单步预览与调试协议（Preview Protocol）

对标：Coze 实时预览 / Flowise 单步测试 / n8n 节点级执行

## 目的
前端代码生成每一步可单独验证、失败可定位可回滚，不再"全部生成完才能看"。

## 协议（每个生成步骤结束时输出）
| 字段 | 类型 | 说明 |
|---|---|---|
| step_id | string | 步骤标识，如 page-index / component-card |
| artifact | path/url | 本步产物（文件或预览 URL） |
| diff_summary | string | 本步改动摘要（增/改/删行数） |
| check_command | string | 单步自验命令，如 npx tsc --noEmit |
| status | pass/fail | 单步自验结果 |
| rollback | string | 失败时回滚指令 |

## 验证分级
- L1 静态检查：lint / typecheck（每步必跑）
- L2 渲染预览：页面级 screenshot / preview URL
- L3 交互验证：关键交互脚本（点击/输入断言）

## 接入方式
1. 步骤完成后立即执行 check_command，status=fail 输出 rollback 并中止后续步骤
2. artifact 随阶段交付物入库，供下一阶段门复核

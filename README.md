## Wechaty Docker & Railway

[![Wechaty](https://wechaty.js.org/img/wechaty-logo.svg)](https://wechaty.js.org)

[![WeChat](https://img.shields.io/badge/--07C160?logo=wechat&logoColor=white)](https://wechaty.js.org/docs/puppet-providers/wechat)
[![Whatsapp](https://img.shields.io/badge/--25D366?logo=whatsapp&logoColor=white)](https://wechaty.js.org/docs/puppet-providers/whatsapp)
[![Deploy on Railway](https://railway.app/button.svg)](https://railway.app/new/template/uwVux8?referralCode=3ypvjJ)

1. 注册账户 <https://railway.app/>
2. 点击导入
3. `wstunnel -t 7001:127.0.0.1:25000 wss://xxxxx.up.railway.app`

```bash
git subtree add --prefix=puppet-padlocal https://github.com/wechaty/puppet-padlocal.git main --squash
```

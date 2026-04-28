# TJNEW
新的拓进

# 1. 拉取远程最新代码
git pull origin main

# 1.5.写你的代码

# 2. 提交所有本地修改
git add .

# 3. 写版本注释（必填！）
git commit -m "修复XX功能/新增XX页面"

# 4. 上传到GitHub
git push origin main


# --------------------------
# 核心操作：打Tag+推送远程（发布前必做）
# --------------------------
# 1. 先切换到main分支，确保代码和远程完全同步
git checkout main
git pull origin main

# 2. 打带注释的Tag（严格遵守语义化版本号，注释和版本说明一致）
git tag -a v1.1.0 -m "新增高压熔炉机器、3条稀土合成链，适配像素工厂v8"

# 3. 推送Tag到GitHub远程仓库（推送后才能在GitHub中选到这个Tag）
git push origin v1.1.0

# --------------------------
# 补充常用命令（错误Tag处理）
# --------------------------
# 查看所有本地Tag
git tag
# 删除错误本地Tag
git tag -d v1.1.0
# 删除错误远程Tag
git push origin --delete v1.1.0
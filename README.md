# TJNEW
新的拓进

# --------------------------
# 核心操作：打Tag+推送远程（发布前必做）
# --------------------------
git pull origin main     拉取远程最新代码

写你的代码


git add .        1. 暂存文件
git commit -m "信息"  2. 本地提交
git tag -a v版本号 -m "描述"  3. 打标签
git push origin main  4. 推代码
git push origin v版本号  5. 推标签


# --------------------------
# 补充常用命令（错误Tag处理）
# --------------------------
# 查看所有本地Tag
git tag
# 删除错误本地Tag
git tag -d v1.1.0
# 删除错误远程Tag
git push origin --delete v1.1.0
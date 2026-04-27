# 屏蔽更新提示
$env:POWERSHELL_UPDATECHECK = "Off"

# 配置区域
$ModName = "war-industry-mod"
$GameModsPath = "C:\Users\86135\AppData\Roaming\Mindustry\mods"

# 1. 检测配置文件
Write-Host "=== Mindustry MOD 打包工具 ===" -ForegroundColor Cyan
$ConfigFile = $null
if (Test-Path "mod.json") { $ConfigFile = "mod.json" }
elseif (Test-Path "mod.hjson") { $ConfigFile = "mod.hjson" }

if (-not $ConfigFile) {
    Write-Host "错误：未找到 mod.json 或 mod.hjson！" -ForegroundColor Red
    Read-Host "按回车退出"
    exit 1
}
Write-Host "找到配置文件：$ConfigFile" -ForegroundColor Green

# 2. 清理旧文件
if (Test-Path "$ModName.jar") { Remove-Item "$ModName.jar" -Force }

# 3. 准备临时目录
$TempDir = Join-Path $env:TEMP "mindustry_build"
if (Test-Path $TempDir) { Remove-Item $TempDir -Recurse -Force }
New-Item -ItemType Directory -Path $TempDir | Out-Null

# 4. 复制文件
$FilesToCopy = @($ConfigFile)
if (Test-Path "assets") { $FilesToCopy += "assets" }
if (Test-Path "content") { $FilesToCopy += "content" }
Copy-Item -Path $FilesToCopy -Destination $TempDir -Recurse -Force

# 5. 打包 JAR
Add-Type -AssemblyName System.IO.Compression.FileSystem
$JarPath = Join-Path $PWD "$ModName.jar"
[System.IO.Compression.ZipFile]::CreateFromDirectory($TempDir, $JarPath, [System.IO.Compression.CompressionLevel]::Optimal, $false)

# 6. 清理临时文件
Remove-Item $TempDir -Recurse -Force
Write-Host "打包成功：$ModName.jar" -ForegroundColor Green

# 7. 安装到游戏
if (Test-Path $GameModsPath) {
    Copy-Item -Path "$ModName.jar" -Destination $GameModsPath -Force
    Write-Host "已安装到游戏目录" -ForegroundColor Green
} else {
    Write-Host "未找到游戏目录，请手动复制" -ForegroundColor Yellow
}

Write-Host "完成！" -ForegroundColor Cyan
Read-Host "按回车退出"
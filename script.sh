#!./pyminish
#!/bin/bash

# ファイルの先頭にshebangがあると、そのインタプリタ（/bin/bash）で実行
# #!/bin/bash: /bin/bash script.sh として実行
# #!./pyminish: ./pyminish script.sh として実行

echo hello
# 外部コマンドでリダイレクト
ls > ls.output
# 内部コマンドでリダイレクト
echo hello > echo.output
# パイプ
ls | wc -l
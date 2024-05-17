#!./pyminish
#!/bin/bash

# ファイルの先頭にshebangがあると、そのインタプリタ（/bin/bash）で実行
# #!/bin/bash: /bin/bash script.sh として実行
# #!./pyminish: ./pyminish script.sh として実行

echo hello
ls > ls.output
echo hello > echo.output
@echo off
Cls
for %%F in (*.sql) do (
sqlplus.exe -s sys/Oracle123@xepdb1 as sysdba @%%F
echo ++++++ACCESO A LA BASE +++++++
)
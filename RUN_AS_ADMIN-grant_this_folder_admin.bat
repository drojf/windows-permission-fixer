:: THIS SCRIPT MUST BE RUN AS ADMINISTRATOR!

:: Make 'Administrators' the owner everything in the current folder recursively
:: This must be done or else icacls will fail if a file or folder is owned by 'SYSTEM', for example
:: /F = which file /R = recursive /A = give ownership to administrators /D Y = answer 'Yes' to any prompts by default
takeown /F %~dp0 /R /A /D Y
:: From https://stackoverflow.com/a/47824339/848627
:: Remove any explict DENY on Administrators
:: Grant administrators explicit permissions
icacls %~dp0 /remove:d Administrators /grant:r Administrators:(OI)(CI)F /T

pause

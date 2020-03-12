:: THIS SCRIPT MUST BE RUN AS ADMINISTRATOR!

:: Make 'Administrators' the owner of the target folder recursively
:: This must be done or else icacls will fail if a file or folder is owned by 'SYSTEM', for example
:: /F = which file /R = recursive /A = give ownership to administrators /D Y = answer 'Yes' to any prompts by default
takeown /F "%~1" /R /A /D Y
:: From https://stackoverflow.com/a/47824339/848627
:: Remove any explict DENY on Administrators
:: Grant administrators explicit permissions
icacls "%~1" /remove:d Administrators /grant:r Administrators:(OI)(CI)F /T

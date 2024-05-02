setlocal tabstop=4
setlocal shiftwidth=4

let b:ale_exclude_highlights = [
  \ 'IntegrationTester', 
  \ 'ApiTester', 
  \ 'CommandsTester', 
  \ 'UnitTester', 
  \ 'is not defined in constructor',
  \ 'Instance property Mockery\\Mock::.*is not defined',
  \ ]



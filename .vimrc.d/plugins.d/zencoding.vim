" zencoding
let g:use_zen_complete_tag = 1
" let g:user_zen_leader_key = '<c-Enter>'
let g:user_zen_settings = {
\  'lang' : 'ja',
\  'locale' : 'ja_JP',
\  'charset' : 'UTF-8',
\  'profile' : 'xhtml',
\  'html' : {
\    'filters' : 'html',
\    'indentation' : '',
\    'default_attributes' : {
\      'meta:js': [{'http-equiv': 'Content-Script-Type'}, {'content': 'text/javascript'}],
\      'meta:css': [{'http-equiv': 'Content-Style-Type'}, {'content': 'text/css'}]
\    },
\  },
\  'perl' : {
\    'indentation' : '',
\    'aliases' : {
\      'req' : "require '|'"
\    },
\    'snippets' : {
\      'use' : "use strict\nuse warnings\n\n",
\      'w' : "warn \"${cursor}\";",
\    },
\  },
\  'css' : {
\    'filters' : 'fc',
\  },
\  'javascript' : {
\    'snippets' : {
\      'jq' : "$(function() {\n\t${cursor}${child}\n});",
\      'jq:each' : "$.each(arr, function(index, item)\n\t${child}\n});",
\      'fn' : "(function() {\n\t${cursor}\n})();",
\      'tm' : "setTimeout(function() {\n\t${cursor}\n}, 100);",
\    },
\  },
\}


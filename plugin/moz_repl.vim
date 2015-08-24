"-----------------------------------------------------------------
" When editing an .html,.css, or .gtpl file, make Firefox refresh
" after the buffer is saved, preserving the current scroll offset.
"
" Requires:
"       [1]  MozRepl must be installed & running in Firefox
"
"       [2]  Netcat (nc) must be on your path.
"
"       [3]  Firefox & vim are both on the same machine (localhost).
"            Actually, you can fix that if you want by adjusting
"            this script + your MosRepl settings but it's probably
"            a bit of a security risk.
"
" Ok, here's how it works:
"
"   I use echo + netcat (nc) to send a dopey little MosRepl
"   script (see below) to Firefox. All the output is tossed
"   away (2>&1 > /dev/null) because MozRepl is chatty.
"
"   Global variables are used (vimXo, vimYo) to capture the X,Y
"   offset of the web page for vim. Maybe there's a way to not
"   use a global, but I don't know that that might be. After saving
"   the buffer and reloading the browser, scroll to the X,Y offset.
"
" See also:
"   http://wiki.github.com/bard/mozrepl/tutorial
"   http://forums.whirlpool.net.au/forum-replies-archive.cfm/495300.html
"
" Aside:  Line continuation in vimscript is a bit weird;
"         it comes at start of the line you want merged,
"         rather than at the end of the line being broken.
"-----------------------------------------------------------------
autocmd BufWriteCmd *.html,*.css,*.gtpl :call Refresh_firefox()
function! Refresh_firefox()
  if &modified
    write
    silent !echo  'vimYo = content.window.pageYOffset;
                 \ vimXo = content.window.pageXOffset;
                 \ BrowserReload();
                 \ content.window.scrollTo(vimXo,vimYo);
                 \ repl.quit();'  |
                 \ nc localhost 4242 2>&1 > /dev/null
  endif
endfunction
"-----------------------------------------------------------------


" ~/.vim/ftdetect/usr_bin_env.vim
fun s:DetectEnv()
  let tokens = split(getline(1))
  if len(tokens) >= 2
    setfiletype tokens[1]
  endif
endfun

autocmd BufNewFile,BufRead * call s:DetectEnv()


" vim-rspec config
let g:rspec_command = "Dispatch RAILS_ENV=test bundle exec rspec {spec}"
"
" RSpec.vim mappings
" map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>t :Dispatch bundle exec rspec %<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>


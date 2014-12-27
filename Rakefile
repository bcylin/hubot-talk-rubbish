task :hubot do
  FileUtils.mkdir_p "scripts"
  FileUtils.ln_s "../src/talk-rubbish.coffee", "scripts/talk-rubbish.coffee", force: true
  sh "./node_modules/hubot/bin/hubot"
end

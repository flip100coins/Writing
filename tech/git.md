#### setup git

1. install git and gh

2. generate ssh keys pairs:
just follow the steps to generate new ssh key or if you want to create your own ssh key by hand:`ssh-keygen -t rsa -C "SOME COMMENT"`
you will get two files which are the private key and public key.

3. use the ssh key on cloned local repository:
`ssh -T -o "IdentitiesOnly=yes" -i ~/.ssh/path_to_private_key git@github.com`

4. Then make sure you replace the HTTPS remote with SSH:
`git remote set-url origin git@github.com:<github-user-name>/<github-repo-name>.git`

5. setup ssh key on github by go to: 
user icon on top left > Settings > SSH and GPG keys -> New SSH key -> paste ....

6. update git config by: (optional)
git config --global user.name "name"
git config --global user.email "email"

7. try:
git status
git pull
git commit
git push


##### setup Obsidian Git plugin
Custom base path: Writing

FILENAME="java-repos.txt"

while read -r repo
do
    git clone https://github.com/DwijeshMishra/$repo
    cd $repo
    git checkout -b feature
    cd ..
    cp project-specific.yaml $repo/  && cp .repo-config  $repo/
    cd $repo
    git commit --amend --reset-author
    git --global config credential.helper 'cache --timeout 3600'
    git config --global user.name  "DwijeshMishra"
    git config --global user.email "dwijeshm3@gmail.com"
    git add . 
    git commit -am"update workflow"
    git push --set-upstream origin feature
done < java-repos.txt

user=$(whoami);
reposdir="C:\Users\\$user\source\repos";
vagrantdir="C:\Users\\$user\Vagrant\DevOps.LDE";
sourcefile="C:\Users\drose\.bash_profile";
function project()
{
cd "$reposdir\integrate."$1;
}
function projects()
{
ls "$reposdir";
}
function home()
{
cd "$reposdir";
}
function push()
{
git add -A;
git commit -m "$1";
git push;
}
function branch()
{
git checkout -b $1 && git push -u origin $1
}

function update()
{
source "$sourcefile";
echo "Update source file at '$sourcefile' complete.";
}
function status()
{
echo "$reposdir\integrate."$1" Status:";
git --git-dir="$reposdir\integrate."$1"\.git" --work-tree="$reposdir\integrate."$1 status;
}

function clone()
{
git clone "https://github.com/IntegrateDev/$1.git"
}
function cleanup()
{
git fetch -p
}
function getuser()
{
echo "Current User is: $user.";
}
function alias()
{
git config --global alias.$1 $2
}
function setremote()
{
git remote rm $user;
git remote add $user ssh://root@$user.dev.corpdomain.local/root/repos/server.git;
git remote -v;
}
function addremote()
{
git remote add $1 ssh://root@$1.dev.corpdomain.local/root/repos/server.git;
git remote -v;
}
function pushremote()
{
git add -A;
git commit -m "commited to VM remote";
git push $1;
}
function rebuild()
{
cd "$vagrantdir";
git pull;
vagrant destroy;
/bin/bash ./FirstRun.sh;
vagrant up;
vagrant ssh;
}
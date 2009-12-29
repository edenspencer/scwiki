SCWiki
======
This is my attempt at a wiki for my first apprenticeship task. The task is to write a wiki using only the core ruby library, TDD, but without using Test::Unit.

It should be considered as not in anyway working until such time as this readme says otherwise. 

### Apache Setup

You'll need  to setup some directory overrides

`<Directory /PATH/TO/Wiki>
    Options FollowSymLinks ExecCGI
    AllowOverride Options FileInfo
</Directory>`
# Koha How-to

The goal of this project is to provide a quick and easy way to immerse yourself in the Koha development process.

The project is for you if you want to
 * join the Koha development team
 * submit your first patch
 * test your first patch

## Getting started

### Open an account on bugzilla

To share patches with the Koha community or to comment bug reports you will need to <a href="https://bugs.koha-community.org/bugzilla3/createaccount.cgi">create an account</a>.

### Koha development environment

You will need a working Koha development environment to contribute to Koha.

The quickest and easiest way to get one is to create a virtual machine using [KohaDevBox](https://github.com/digibib/kohadevbox).

Do not forget to add your bugzilla user credentials to vars/user.yml.

### Set up the How-to

Clone this project:
```
% git clone https://github.com/joubu/koha-howto
```

Then copy the how-to.pl and how-to.tt files to your Koha repo. If you are using a virtual machine created with KohaDevBox you can do the following after cloning the project inside your devbox:
```
% cp /home/vagrant/koha-howto/how-to.pl /home/vagrant/kohaclone/
% cp /home/vagrant/koha-howto/how-to.tt /home/vagrant/kohaclone/koha-tmpl/intranet-tmpl/prog/en/modules/
```

Restart Plack
```
% sudo koha-plack --restart kohadev
```

### Follow the tutorial

With your devbox running, visit [/cgi-bin/koha/how-to.pl](http://localhost:8081/cgi-bin/koha/how-to.pl) and follow the instructions of the tutorial.

The first steps are a quick quizz to make sure you understand the basic principles of our workflow. After this you will then be guided to:
 * Create your first patch
 * Make sure you patch follows our main guidelines
 * Share your patch with the Koha community
 * Apply a patch on a local branch to test it
 * Attach a signed-off patch to our bug tracker

## Dependencies

All the dependencies you need should be installed by KohaDevBox.

In case this is not the case then you should only have to install bugz apart from Koha itself.

```
% apt install bugz
```

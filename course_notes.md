# Modern Web Development with Perl

Thanks for signing up to my workshop on web development with Perl.

In three and a half hours, I hope to persuade you that Modern Perl
bears no relation to the language that you stopped using to write
horrible CGI programs fifteen years ago and that it is well worth
taking a look at when you are deciding which web technology to use.

We'll do that by writing a simple web application using modern Perl
tools. Obviously in three hours we won't be able to create the next
social media sensation, but we should have time to touch on many
useful parts of the modern Perl web development toolkit.

In order to do that, you'll need to bring some equipment. Here's a list:

## A Laptop

It would be great if you could have a Unix-like operating system
installed (Linux or OSX). The examples **should** all work on Windows,
but I can't guarantee it. If you have a Windows laptop, then a good
workaround is to install something like VirtualBox and set-up a Linux
VM. 

## A Database

The application that we write will have a database at its backend.
I'll be working with MySQL (actually MariaDB), but if you're happier
with Postgres or SQLite they should both work fine too. I'll supply
table definitions and some basic data, but if you're using something
other than MySQL it's possible that those files will need some light
editing before you can use them.

## A Web Server or Two

One advantage of modern Perl web applications is that their
implementation is completely separate from their deployment
environment. In order to demonstrate that it would be nice if if you
had a couple of deployment environments installed on you laptop. The
obvious choice is Apache, which means that we can try out both CGI and
mod_perl installations.

But the preferred way to deploy modern Perl apps is as a daemon
process running behind a proxy server. In order to try that, you
should have nginx installed.

## Git

The code for the example application will be available from Github, so
you will need Git installed in order to clone the repository.

## Perl

You'll (obviously, I hope!) need a version of Perl. One advantage of
the Unix-like operating systems, is that they will almost certainly
come with Perl installed. If you're running the examples on Windows,
then I recommend Strawberry Perl.

Your version of Perl should be as recent as possible. The most recent
version is currently is 5.22.1, but anything from 5.10 onwards should
work. If you want to install a more recent version of Perl than you
get with your OS, I recommend `perlbrew`.

## Perl Modules

Modern Perl development is largely a case of plumbing together the
right modules in the right order, so it's highly recommended that you
get familiar with installing modules.

Many of the modules that we will be using are available from your
Linux distribution's standard repositories and can therefore be
installed using `yum`, `apt-get` or whatever similar command you use.

On other operating systems (or if you want more control over the
installation process) you will need to install the modules manually. I
recommend using `cpan` to install App::cpanminus and using `cpanm`
from then on.

The modules you will need are as follows:

* Plack
* Dancer2
* Template
* Moose
* MooseX::NonMoose
* MooseX::MarkAsMethods
* DateTime
* DateTime::Format::Strptime
* DBI
* DBD::*
  This is the database driver for the database system that you are
  using. It will probably be DBD::mysql, DBD::Pg or DBD::SQLite
* DBIx::Class
* DBIx::Class::Schema
* Dancer2::Plugin::DBIC
* DateTime::Format::MySQL (or ::Pg or ::SQLite)

## Example Code

The example code is available on Github. If you want to look at it
before the workshop, please feel free, but be aware that it might well
be updated right up to the last moment as I am tweaking the materials.

The code is at https://github.com/davorg/webdev-workshop/

Please ensure that you have a local checkout of this code before
arriving at the workshop.

## Other Questions

If you have any other questions, please contact me on:

* dave@perlhacks.com
* @davorg
* Perl Hacks (http://perlhacks.com/) - my Perl blog

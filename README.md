## SYNOPSIS

```
$ git@github.com:travail/perl-ZBar-Example.git
$ cd perl-ZBar-Example
$ carton install
$ cpanm --force -l local https://cpan.metacpan.org/authors/id/J/JC/JCRISTY/PerlMagick-6.74.tar.gz
$ carton exec perl bin/zbar.pl
$VAR1 = 'QR-Code';
$VAR1 = 'http://winghills.net/';
$VAR1 = [
          592,
          263
        ];
$VAR2 = [
          587,
          323
];
$VAR3 = [
          649,
          326
        ];
$VAR4 = [
          656,
          265
];
```

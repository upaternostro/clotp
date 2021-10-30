```
                                                           .    .   .. ..@
                                                          ... *.&*@/@&%&#
                CLOTP - Command Line OTP generator      .... (@&&@&,#%&%@%%
                                                      ...&@@&&%&&%%#%%##*#%%.
                                                      ,&#&&&%&&&%%%,##.%#%#.
                                                  ...*&#&&&&&&&%%%%(,,/#*#%((%.
                       ..   ..@@@@@@%          . ..,@&&&&&&&&&%%%%%(/    *//.,(
             .../&&&@#..@&&&&&&&&&&&&&&&&@&&&&&&&@&&&&&&&&&%&%%%%##/.     .. .
           %&%&&%%%##/%&&&&&&&&&&&%%&%&&&&&&&&&&%&&&&&&&&&&%%%&%%#(*.
        .&%#*#(((#((( %%&&&&&%&&&&&%%%%%&&&&&&&%%%%%%%&%&%&&%&&&%#/,
       .&#((***/*/****###%&%%%%#%###%%%%&&%%%%%%%%%%%%%%%%%%%%&%%##%.
     .&%%#(#///////****//(#%%%%%%%%/(#%%%%%%%%%%%%%###%%&%%%%%%#((#(.
  .#/#%%#(((%#**(/#(..   .(//((/(/( .,**///#########(*#%%%%%#(//(/, .
 ./#%%%#((/*./*.%,..     ,. ,/((((*    ,,,*******///*,,#((%#%&&,(((#% .
  ./((#//     ,.*.        *.../((/,                     ..*(%##&&(,/*##&.
   .#*.       ,.,         ,. ,/(//                           .. /%%* .,/(.
    ..                       &*/*/#                          .. %#*   ./*,
                             /((*,.,/(.                      .#%/      .(#.
                               *,*  ..//**.               .*(*/,    .,../,
                               .**/   ..(**                           .  ,
                                ,*#(.   .
                                   .,**
```
Original image by Helena Lopes (available on [Pexels](https://www.pexels.com/photo/white-horse-on-green-grass-1996333/))  
ASCII-art by https://manytools.org/hacker-tools/convert-images-to-ascii-art/

# CLOTP - Command Line OTP generator

Welcome to *CLOTP*, the command line one time password generator.
CLOTP may replace Google Authenticator or similar apps, freeing you from the smartphone lock in.
Please be aware that 2FA (two factor authentication) is there to help you protect your account, not to bug you forcing the use of an app, so care has to be taken preserving private keys.

## Introduction

CLOTP is a command line tool (shell script) that make use of `oathtool` to generate OTPs.

It is based on Vivek Gite's work [Use oathtool Linux command line for 2 step verification (2FA)](https://www.cyberciti.biz/faq/use-oathtool-linux-command-line-for-2-step-verification-2fa/), but tries to simplify user experience, despite the use of basic Linux tools.
Thank you Vivek for your work!

Parts surviving from Vivek's work are GPG encryption and clipboard integration.

## Why did you choose such a silly name?

At first I thought to call it `shotp`, emphasizing the shell environment, but later I realized that CLOTP is very similar to CLOPT, that's the Italian onomatopoeic for a galloping horse (hence the image).

## Dependencies

CLOTP uses `oathtool` to generate OTP, `gpg2` to keep secrets, well, secret and `xclip` to integrate with system clipboard, the latter being optional.

### Fedora

`sudo dnf install oathtool gpg2 xclip`

### CentOS/RHEL

Enable EPEL and esecute:

`sudo yum install oathtool gnupg2 xclip`

### Debian/Ubuntu

`sudo apt install oathtool gnupg2 xclip`

### SUSE/OpenSUSE

`sudo zypper in oath-toolkit gpg2 xclip`

## Installation

Copy `clotp` in a directory part of your `PATH`, for example:

`sudo cp clotp /usr/local/bin`

Adjust permissions if needed:

`sudo chmod 755 /usr/local/bin/clotp`

Install the bash completion hook:

`sudo cp clotp-bash-completion.sh /etc/bash_completion.d`

## Prerequisites

You *do must* have to have a GPG key-couple. GPG configuration is above this documentation, please refer to https://gnupg.org/

## Usage

CLOTP saves its own configuration in the `.clotp` directory in the user home. Here it saves keys and configs for each configured service.

A *service* roughly correspond to an account provided by a issuer. For example, suppose that the issuer is Google, that issuer provides accounts for mail boxes. It is possible to own more than one account for a given issuer, this is why services are recorded in a subdirectory hierarchy inside the `.clotp` directory, where the first subdirectory has the same name as the issuer (i.e. Google) and the sub-subdirectory's name corresponds to the account information. So the hierarchy looks like this:

```
  ${HOME}
     |
     +--> .clotp
             |
             +--> Google
                    |
                    +--> yourname@gmail.com
```

In this case, the service name is `Google/yourname@gmail.com` (please note the slash `/`).

### Operating modes

CLOTP may be used as a shell application, supplying arguments and expecting a result on the standard output, or as an interactive shell application, in which case a menù is presented to the user. To enter interactive mode, launch CLOTP witout parameters.

For security reason, some parameters (those involving secrets) cannot be specified as arguments, but will always be asked on the standard input.

### Creating a new service

You can add a service in two ways:

- importing a `otpauth` URL (see https://github.com/google/google-authenticator/wiki/Key-Uri-Format)
- manually specifing all the parameters

Using the `-i` switch, an `otpauth` URL will be asked on th standard input, parsed by the program and stored in a service named after the issuer and the user contained in that URL.

Using the `-a` switch, CLOTP asks just for the base 64 encoded secret, using the other command line switches to read the rest of parameters.

In both cases, `-k` and `-u` parameters are used to select private and public keys.

### Generating OTP for a service

Simply run 

`clotp -g <servicename>`

or even

`clotp <servicename>`

where `<servicename>` is an existing service. In both cases, you'll be asked for the GPG private key password to decrypt secret.

### Configuration

CLOTP sources its configuration from the `.clotp/clotp.conf` (useful to set GPG keys) and from `.clotp/<servicename>/clotp.conf` (useful for digits, algorithm and other service-specific parameters).

# Thanks

- Vivek Gite, for his excellent article [Use oathtool Linux command line for 2 step verification (2FA)](https://www.cyberciti.biz/faq/use-oathtool-linux-command-line-for-2-step-verification-2fa/)
- Helena Lopes, for the [galloping horse image](https://www.pexels.com/photo/white-horse-on-green-grass-1996333/)

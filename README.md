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

CLOTP uses `oathtool` to generate OTP, `gpg2` to keep secrets, well, secret and `xclip` to integrate with system clipboard.

### Fedora

`sudo dnf install oathtool gpg2 xclip`

## Installation

TBD

## Usage

TBD

# Thanks

- Vivek Gite, for his excellent article [Use oathtool Linux command line for 2 step verification (2FA)](https://www.cyberciti.biz/faq/use-oathtool-linux-command-line-for-2-step-verification-2fa/)
- Helena Lopes, for the [galloping horse image](https://www.pexels.com/photo/white-horse-on-green-grass-1996333/)

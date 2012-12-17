# MusicStand

Autors: Matthias Folz

## Operational Area

This tiny app transform any tablet pc in a music stand.
You can swipe between your notesheets and play freely.

## Installation

    git clone git@github.com:mafolz/music_stand.git
    cd music_stand
    gem install bundler --ri --rdoc
    bundler install
    rackup -p 80
    open http://localhost
    

## Usage

Create for each Sheetset a folder into ./sheets dir.
Place all note sheets as web compatible image filesinto this new folder.

After restarting the app and refresh the browser, you can navigate to the folders 
and open the sheets.

If you navigate with your favorit tablet pc on your server IP,
you can browse the single sheets with a left swipe or a right swipe.




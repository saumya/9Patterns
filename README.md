9 Patterns
================
An [OpenFL][2] application to generate patterns.

Now in [Play Store][5].

### Assets Used

 - [archistico][1]


Commands
```
// sample game : 
openfl create PiratePig
// new game    : 
openfl create project MyGame
//
openfl build neko
openfl run neko
//
openfl test neko
```

### Publishing to Playstore

 - First [generate the keystore][3]
 - [Follow this][4] to add certificate to the app

```
keytool -v -genkey -v -keystore myApp.keystore -alias someName -keyalg RSA -validity 10000
```




[1]: https://www.fontsquirrel.com/fonts/archistico
[2]: http://openfl.org/
[3]: http://stackoverflow.com/questions/11446121/how-do-i-generate-a-keystore-for-google-play/11498282#11498282
[4]: http://www.openfl.org/archive/community/general-discussion/submitting-nme-app-google-play/
[5]: https://play.google.com/store/apps/details?id=com.saumya.ninePatterns&hl=en
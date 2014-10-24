##AHKeychain
####Objective-c Class for managing OSX keychains and keychain items.

_This is project is a derivative of SSKeychain https://github.com/soffes/sskeychain/_

There are four enhancements of this project  


1. It lets the user specify which keychain work with, such as the system keychain or a keychain on an external drive/SD card.

2. The other added feature is the ability to specify an Array of trusted apps granted access to the keychain item.

3. This also gives you the ability to change the __keychain's__ password .

4. The other minor improvement is that it actually updates the keychain item using SecItemUpdate().  SSKeychain actually deletes and re-adds the keychain item which can cause peculiar behavior when an app is not code signed and has proper entitlements.


##Working with a specific keychain.
#####To specify the default login keychain
```Objective-c
AHKeychain *keychain = [AHKeychain loginKeychain];
```
#####To specify the system keychain  
_to write to this keychain you application must run as root_

```Objective-c    
AHKeychain *keychain = [AHKeychain systemKeychain];
```

#####To specify a keychain at a particular path (external drive)
```Objective-c    
AHKeychain *keychain = [AHKeychain keychainAtPath:@"/Volumes/MyExternalHD/Library/Keychains/myextkc.keychain"];
```

#####To create a new user keychain
```Objective-c  
AHKeychain *keychain = [AHKeychain alloc]initCreatingNewKeychain:@"Test Keychain"
													password:@"realfakepsswd"];
```

#####To remove the keychain file. It's Destructive!  
_*calling this method on either the login keychain or the system keychain will fail_
```Objective-c  
[keychain deleteKeychain];
```

##Modifying a keychain item.

#####To add/update an item
```Objective-c  
AHKeychainItem *item = [AHkeychainItem alloc] init];
item.service = @"com.eeaapps.test";
item.account = @"myusername";
item.label = @"AHKeychain Test Keychain Item";
item.password = @"mysecretpass";

// also if you want to allow other app to access the keychain item
NSArray *trustedApps = [NSArray arrayWithObjects:@"/Applications/Mail.app",
                                                 @"/Applications/Preview.app",
 											     nil];
item.trustedApplications = trustedApps;

[keychain saveItem:item error:&error];

```

#####To get an item's password
```Objective-c  
AHKeychainItem *item = [AHkeychainItem alloc] init];
item.service = @"com.eeaapps.test";
item.account = @"myusername";
    
[keychain getItem:item error:&error];
	
NSLog(@"The Password is %@",item.password);
```

#####To remove a keychain item 
```Objective-c  
AHKeychainItem *item = [AHkeychainItem alloc] init];
item.service = @"com.eeaapps.test";
item.account = @"myusername";
[keychain deleteItem:item error:&error];
```

====
##Class Methods for convenience
_there are two keychain constants that refer to standard keychains_
```
kAHKeychainLoginKeychain
kAHKeychainSystemKeychain
```
_You can use either of these, or specify a full path to the keychain file in the following methods_

#####Setting a password
```Objective-c  
[AHKeychain setPassword:@"mysecretpass" 
			    service:@"com.eeaapps.testkc" 
                account:@"myusername" 
               keychain:kAHKeychainLoginKeychain 
                  error:&error];
```

#####Getting a password
```
NSError *error;    
NSString *password = [AHKeychain getPasswordForService:item.service
                                               account:item.account
                                              keychain:kAHKeychainLoginKeychain
                                                 error:&error];
                                                     
NSLog(@"The Password is %@",item.password);
```

---
_See AHKeychain.h and AHKeychainItem.h for more info._


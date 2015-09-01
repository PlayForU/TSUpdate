//
//  main.m
//  TSUpdate
//
//  Created by Fish on 15/7/29.
//  Copyright (c) 2015年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
    //设置uid为0,以root权限启动
    setuid(0);
    setgid(0);
    
    @autoreleasepool
    {
        //判断参数个数
        if (argc == 2)
        {
#ifdef P4U_DAEMON
            //解压缩文件
            printf("uncompress update files...\n");
            NSString* unzip_format = @"/Applications/Play4UStore.app/unzip -o %s -d %@";
            NSString* unzip_cmd = [NSString stringWithFormat:unzip_format, argv[1], @"/private/var/mobile/Media/Play4UStore/update/tmp/"];
            system([unzip_cmd UTF8String]);
            //拷贝文件
            printf("copy update files...\n");
            system("cp -r /private/var/mobile/Media/Play4UStore/update/tmp/Play4UStore.app /Applications/");
            system("cp -r /private/var/mobile/Media/Play4UStore/update/tmp/P4U* /Library/MobileSubstrate/DynamicLibraries/");
            //设置权限
            printf("set permission...\n");
            system("chown -R root:admin /Applications/Play4UStore.app");
            system("chmod -R u=rwx,go=rx /Applications/Play4UStore.app");
            system("chmod ug=rwx,o=rx /Applications/Play4UStore.app");
            system("chown root:wheel /Applications/Play4UStore.app/Play4UStore /Applications/Play4UStore.app/P4UDaemon /Library/MobileSubstrate/DynamicLibraries/P4UTweak* /Applications/Play4UStore.app/libs/* /Applications/Play4UStoree.app/*.png /Applications/Play4UStore.app/*.plist");
            system("chmod u=rwx,go=rx /Library/MobileSubstrate/DynamicLibraries/P4UTweak*.dylib");
            system("chmod ug+s /Applications/Play4UStore.app/P4UDaemon");
            system("chmod u+s /Applications/Play4UStore.app/P4ULn");
            system("chmod u+s /Applications/Play4UStore.app/unzip");
            system("chmod u+s /Applications/Play4UStore.app/P4UUpdate");
            //关闭原来的服务
            printf("shutdown service...\n");
            system("killall -9 P4UDaemon Play4UStore");
            //删除文件
            printf("clean tmp files...\n");
            system("rm -rf /private/var/mobile/Media/Play4UStore/update/tmp");
            //清除图标缓存
            printf("clean icon cache...\n");
            system("su -c /usr/bin/uicache mobile > /dev/null");
            //respring
            printf("respring...\n");
            system("killall -9 SpringBoard backboardd");
            
            //升级完成
            printf("update completed!\n");
            
#else
            //解压缩文件
            printf("uncompress update files...\n");
            NSString* unzip_format = @"/Applications/TouchSprite.app/unzip -o %s -d %@";
            NSString* unzip_cmd = [NSString stringWithFormat:unzip_format, argv[1], @"/private/var/mobile/Media/TouchSprite/update/tmp/"];
            system([unzip_cmd UTF8String]);
            //拷贝文件
            printf("copy update files...\n");
            system("cp -r /private/var/mobile/Media/TouchSprite/update/tmp/TouchSprite.app /Applications/");
            system("cp -r /private/var/mobile/Media/TouchSprite/update/tmp/TS* /Library/MobileSubstrate/DynamicLibraries/");
            //设置权限
            printf("set permission...\n");
            system("chown -R root:admin /Applications/TouchSprite.app");
            system("chmod -R u=rwx,go=rx /Applications/TouchSprite.app");
            system("chmod ug=rwx,o=rx /Applications/TouchSprite.app");
            system("chown root:wheel /Applications/TouchSprite.app/NewTouchSprite /Applications/TouchSprite.app/TSDaemon /Library/MobileSubstrate/DynamicLibraries/TSTweak* /Applications/TouchSprite.app/libs/* /Applications/TouchSprite.app/*.png /Applications/TouchSprite.app/*.plist");
            system("chmod u=rwx,go=rx /Library/MobileSubstrate/DynamicLibraries/TSTweak*.dylib");
            system("chmod ug+s /Applications/TouchSprite.app/TSDaemon");
            system("chmod u+s /Applications/TouchSprite.app/TSLn");
            system("chmod u+s /Applications/TouchSprite.app/unzip");
            system("chmod u+s /Applications/TouchSprite.app/TSUpdate");
            //关闭原来的服务
            printf("shutdown service...\n");
            system("killall -9 TSDaemon NewTouchSprite");
            //删除文件
            printf("clean tmp files...\n");
            system("rm -rf /private/var/mobile/Media/TouchSprite/update/tmp");
            //清除图标缓存
            printf("clean icon cache...\n");
            system("su -c /usr/bin/uicache mobile > /dev/null");
            //respring
            printf("respring...\n");
            system("killall -9 SpringBoard backboardd");
            
            //升级完成
            printf("update completed!\n");
            
#endif
        }
    }
	return 0;
}


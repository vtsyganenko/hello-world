
#import <Foundation/Foundation.h>

int main(int argc, const char* argv[]) {
    @autoreleasepool {
        NSString* path = @"file_work.txt";
        NSLog(@"Checking file: %@", path);

        NSFileManager* fm = [NSFileManager defaultManager];
        BOOL fileAvailable = [fm fileExistsAtPath:path];

        // create if file absence
        if(fileAvailable == NO) {
            NSLog(@"no such file, creating...");
            fileAvailable = [fm createFileAtPath:path contents:nil attributes:nil];
            NSLog(@"file created: %@", fileAvailable ? @"YES" : @"NO");
        }

        if(fileAvailable) {
            // retrieve attributes
            NSDictionary* attr = [fm attributesOfItemAtPath:path error:NULL];
            if(attr == nil) {
                NSLog(@"Unable to retrieve attributes for %@", path);
            }
            else {
                NSLog(@"File size: %@", [attr objectForKey:NSFileSize]);
            }

            NSData* data = [fm contentsAtPath:path];
            NSString* text = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]; //NSASCIIStringEncoding];
            NSLog(@"File contains: [\n%@\n]", text);

            NSLog(@"Input new containing:\n");

            // read command line
            char input[100];
            memset(input, 0, sizeof(input));
            scanf("%[^\n]", input);
            NSString* userInput = [NSString stringWithUTF8String:input];

            data = [userInput dataUsingEncoding:NSUTF8StringEncoding];
            BOOL created = [fm createFileAtPath:path contents:data attributes:nil];
            NSLog(@"File have been written successfully: %@", created ? @"YES" : @"NO");
        }

    }
    return 0;
}

//
//  Animal.h
//  collectionView
//
//  Created by Pamela Iupi Peixinho on 2/11/16.
//  Copyright © 2016 PamelaPeixinho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioToolbox.h>

@interface Animal : NSObject

@property (strong, nonatomic) NSString *typeAnimal;
@property SystemSoundID *soundID;
@property (strong, nonatomic) NSString *iconPath;
//@property (strong, nonatomic) NSURL *url;

- (id)initWithtypeAnimal:(NSString *)aTypeAnimal
                iconPath:(NSString *)aIconPath
                 soundID:(NSURL *)aURL;

- (id)initWithDictionary:(NSDictionary *)dic;

@end

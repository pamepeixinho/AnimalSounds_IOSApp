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
@property (strong, nonatomic) NSString *iconPath;
@property (strong, nonatomic) NSString *nameSound;
@property (strong, nonatomic) NSString *typeSound;

@property (strong, nonatomic) NSURL *url;
@property SystemSoundID *soundID;

- (id)initWithtypeAnimal:(NSString *)aTypeAnimal
                iconPath:(NSString *)aIconPath
               nameSound:(NSString *)aNameSound
               typeSound:(NSString *)aTypeSound;


- (id)initWithDictionary:(NSDictionary *)dic;

@end

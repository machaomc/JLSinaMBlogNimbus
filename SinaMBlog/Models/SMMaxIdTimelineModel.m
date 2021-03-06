//
//  SMMaxIdTimelineModel.m
//  SinaMBlogNimbus
//
//  Created by Lee jimney on 7/27/13.
//  Copyright (c) 2013 jimneylee. All rights reserved.
//

#import "SMMaxIdTimelineModel.h"
#import "NITableViewModel+Private.h"
#import "NITableViewModel.h"
#import "JLNimbusEntity.h"

@interface SMMaxIdTimelineModel()
@end

///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
@implementation SMMaxIdTimelineModel

///////////////////////////////////////////////////////////////////////////////////////////////////
- (id)initWithDelegate:(id<NITableViewModelDelegate>)delegate
{
	self = [super initWithDelegate:delegate];
	if (self) {
	}
	return self;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - Override

///////////////////////////////////////////////////////////////////////////////////////////////////
- (id)apiSharedClient
{
    return [SMAPIClient sharedClient];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)loadDataWithBlock:(void(^)(NSArray* indexPaths, NSError *error))block
                     more:(BOOL)more refresh:(BOOL)refresh
{
    if (more) {
        self.oldMaxId = [NSString stringWithFormat:@"%lld", [self.oldMaxId longLongValue]-1];
    }
    else {
        self.oldMaxId = @"0";
    }
    [super loadDataWithBlock:(void(^)(NSArray* indexPaths, NSError *error))block more:more refresh:refresh];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSArray*)entitiesParsedFromListData:(NSArray*)listDataArray
{
    // 设置当前maxId
    NSDictionary *dic = [listDataArray lastObject];
    self.oldMaxId = [dic objectForKey:@"id"];
	return [super entitiesParsedFromListData:listDataArray];
}

@end

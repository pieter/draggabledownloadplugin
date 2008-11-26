//
//  DraggableExtension.m
//  DraggableDownload
//
//  Created by Pieter de Bie on 26-11-08.
//  Copyright 2008 Pieter de Bie. All rights reserved.
//

#import "DraggableExtension.h"


@implementation DownloadRow (DraggableExtension)

- (void)newMouseDragged:(id)fp8
{
	NSString *path = [[[self entry] downloadFile] aliasedOrOriginalPath];
	NSArray *fileList = [NSArray arrayWithObject:path];

	NSPasteboard *pb = [NSPasteboard pasteboardWithName:NSDragPboard];
	[pb declareTypes: [NSArray arrayWithObject:NSFilenamesPboardType] owner:nil];
	[pb setPropertyList:fileList forType:NSFilenamesPboardType];

	[self dragImage:_iconImage at:NSMakePoint(0,0) offset:NSMakeSize(0,0) event:fp8 
		 pasteboard:pb source:self slideBack:YES];

	[self newMouseDragged:fp8];
}

- (NSDragOperation) newDraggingSourceOperationMaskForLocal:(BOOL)local
{
	return NSDragOperationEvery;
}

@end

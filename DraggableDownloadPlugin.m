//
//  DraggableDownloadPlugin.m
//  DraggableDownload
//
//  Created by Pieter de Bie on 26-11-08.
//  Copyright 2008 Pieter de Bie. All rights reserved.
//

#import "DraggableDownloadPlugin.h"
#import "JRSwizzle.h"
#import "DownloadRow.h"
/**
 * Renames the selector for a given method.
 * Searches for a method with _oldSelector and reassigned _newSelector to that
 * implementation.
 * @return NO on an error and the methods were not swizzled
 */

@implementation DraggableDownloadPlugin

+ (void) load
{
	NSError *error = NULL;

	[DownloadRow jr_swizzleMethod: @selector(mouseDragged:) withMethod: @selector(newMouseDragged:) error:&error];
	if (error)
	{
		NSLog(@"Error loading DraggableDownloads: %@", error);
		return;
	}

	[DownloadRow jr_swizzleMethod: @selector(draggingSourceOperationMaskForLocal:) withMethod: @selector(newDraggingSourceOperationMaskForLocal:) error:&error];
	if (error)
	{
		NSLog(@"Error loading DraggableDownloads: %@", error);
		return;
	}

	NSLog(@"DraggableDownloads plugin loaded successfully");
}

@end

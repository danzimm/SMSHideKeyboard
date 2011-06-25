#import <UIKit/UIKit.h>

@interface UIWindow ()
+ (id)keyWindow;
- (id)firstResponder;
@end


%hook CKBalloonView

- (void)touchesEnded:(id)touch withEvent:(id)event
{

	if ([touch count] == 1 && [[touch anyObject] tapCount] == 1)
		[[[UIWindow keyWindow] firstResponder] resignFirstResponder];
	%orig;
}

%end

#import "MXSegmentedPagerController.h"

@interface MXSegmentedPagerController ()

@property (nonatomic) MXSegmentedPager *segmentedPager;

@end

@implementation MXSegmentedPagerController

- (instancetype)initWithControllers:(NSArray<UIViewController *> *)controllers {
	self = [super initWithNibName:nil bundle:nil];

	self.segmentedPager = MXSegmentedPager.new;
	self.segmentedPager.delegate = self;
	self.segmentedPager.dataSource = self;

	self.viewControllers = controllers;

	return self;
}

- (void)loadView {
    self.view = self.segmentedPager;
}

- (void)setViewControllers:(NSArray<UIViewController *> *)viewControllers {
	_viewControllers = viewControllers;

	for (UIViewController *vc in viewControllers) {
		[self addChildViewController:vc];
		[vc didMoveToParentViewController:self];
	}
}

// MARK: - MXSegmentedPagerControllerDataSource

- (NSInteger)numberOfPagesInSegmentedPager:(MXSegmentedPager *)segmentedPager {
    return self.viewControllers.count;
}

- (UIView *)segmentedPager:(MXSegmentedPager *)segmentedPager viewForPageAtIndex:(NSInteger)index {
    UIViewController *viewController = [self segmentedPager:segmentedPager viewControllerForPageAtIndex:index];
    return viewController.view;
}

- (UIViewController *)segmentedPager:(MXSegmentedPager *)segmentedPager viewControllerForPageAtIndex:(NSInteger)index {
    return self.viewControllers[index];
}

- (NSString *)segmentedPager:(MXSegmentedPager *)segmentedPager titleForSectionAtIndex:(NSInteger)index {
	return self.viewControllers[index].title ?: @"";
}

@end

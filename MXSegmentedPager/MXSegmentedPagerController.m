
#import "MXSegmentedPagerController.h"

@interface MXSegmentedPagerController ()

@property (nonatomic) NSInteger pageIndex;
@property (nonatomic) NSArray<UIViewController *> *viewControllers;

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

@end

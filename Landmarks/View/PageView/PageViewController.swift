//
//  PageViewController.swift
//  Landmarks
//
//  Created by Sundet Mukhtar on 15.09.2024.
//

import SwiftUI
import UIKit

struct PageViewController<Page:View>:UIViewControllerRepresentable {
    
    var pages:[Page];
    @Binding var currentPage: Int
    
    //SwiftUI calls this makeCoordinator() method before makeUIViewController(context:), so that you have access to the coordinator object when configuring your view controller.
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        pageViewController.dataSource = context.coordinator
        pageViewController.delegate = context.coordinator
        return pageViewController;
    }
    
    
    //    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
    //        pageViewController.setViewControllers(
    //            [UIHostingController(rootView: pages[0])], direction: .forward, animated: true)
    //    }
    
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        if let pageViewController = uiViewController as? UIPageViewController{
            pageViewController.setViewControllers(
                [context.coordinator.controllers[currentPage]], direction: .forward, animated: true)
        }
    }
    
    
    
    
    class Coordinator: NSObject,UIPageViewControllerDataSource, UIPageViewControllerDelegate {
        var parent: PageViewController
        var controllers = [UIViewController]()
        init(_ pageViewController: PageViewController) {
            parent = pageViewController
            controllers = parent.pages.map { UIHostingController(rootView: $0) }
        }
        
        func pageViewController(_ pageViewController: UIPageViewController,
                                viewControllerBefore viewController: UIViewController) -> UIViewController?{
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index == 0 {
                return controllers.last
            }
            return controllers[index - 1]
        }
        
        
        func pageViewController(
            _ pageViewController: UIPageViewController,
            viewControllerAfter viewController: UIViewController) -> UIViewController?{
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index + 1 == controllers.count {
                return controllers.first
            }
            return controllers[index + 1]
        }
        
        
        func pageViewController(
            _ pageViewController: UIPageViewController,
            didFinishAnimating finished: Bool,
            previousViewControllers: [UIViewController],
            transitionCompleted completed: Bool) {
                if completed,
                    let visibleViewController = pageViewController.viewControllers?.first,
                    let index = controllers.firstIndex(of: visibleViewController) {
                    parent.currentPage = index
                }
                
            }
    }
    
    
    
}

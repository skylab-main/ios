//
//  TestContainer.swift
//  Skylab
//
//  Created by Serhii Dorohobid on 29.01.2023.
//

import Foundation

/// Import Swinject library
import Swinject

/// extention to Container class where dependencies will be registered
extension Container {
    static let tutorial: Container = {
        /// Create a container that will hold all of your dependencies.
        /// A container is a collection of registered services that are used to resolve dependencies.
        let container = Container()

        /// In this example, we are registering a LoggerProtocolSwinjectTutorial dependency.
        /// The first argument is the type of dependency you want to register, and the second argument is a
        /// closure that returns an instance of that dependency.
        container.register(LoggerSwinjectTutorialProtocol.self) { _ in
//            PlainTextLoggerSwinjectTutorial()
            JSONLoggerSwinjectTutorial() // We can easily switch between implementations here.
        }

        /// The method takes the service type for the component and a factory method. If the component depends on another service,
        /// the factory method can call resolve on the passed in resolver objection to "inject" the dependency. The actual underlying type
        /// of the dependency will be determined later when the component instance is created.
        ///
        /// This dependency was resolved in SwinjectTestPageCoordinator.swift:26
        container.register(SwinjectTestPageViewModelProtocol.self) { resolver in
            let logger = resolver.resolve(LoggerSwinjectTutorialProtocol.self)!
            return SwinjectTestPageViewModel(logger: logger)
        }

        /// In this example, we are registering a SwinjectTestPageSubViewControllerViewModelProtocol dependency.
        container.register(SwinjectTestPageSubViewControllerViewModelProtocol.self) { _ in
            SwinjectTestPageSubViewControllerViewModel()
        }
        
        return container
    }()
}

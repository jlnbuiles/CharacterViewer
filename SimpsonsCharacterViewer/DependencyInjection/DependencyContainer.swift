//
//  DIContainer.swift
//  SimpsonsCharacterViewer
//
//  Created by Julian Builes on 4/25/23.
//

import UIKit

protocol DependencyInjectionProtocol {
    func register<T>(_ type: T.Type, service: Any)
    func resolve<T>(_ type: T.Type) -> T?
}

/**
 *  A simple dependendency injection container.
 *
 *  Once we need to register more than one instance, we'll have to build a way to reference them by an identifier.
 */
final class DependencyContainer: DependencyInjectionProtocol {

    static let shared = DependencyContainer()
    var services: [String: Any] = [:]

    // MARK: - Initializers

    private init() {
        configureContainer()
    }

    // MARK: - DependencyInjectionProtocol conformance

    func register<T>(_ type: T.Type, service: Any) {
        services["\(type)"] = service
    }

    func resolve<T>(_ type: T.Type) -> T? {
        services["\(type)"] as? T
    }

    private func configureContainer() {
        let rootNC = UINavigationController(rootViewController: CharacterListViewController(presenter: CharacterListPresenter()))
        register(UINavigationController.self, service: rootNC)

        let router = ApplicationRouter(navigationController: rootNC)
        register(ApplicationRouter.self, service: router)
    }
}

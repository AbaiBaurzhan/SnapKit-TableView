//
//  PersonView.swift
//  SnapKit TableView
//
//  Created by Абай Бауржан on 24.02.2025.
//

import Foundation

class PersonViewModel {
    private(set) var persons: [Person] = [
        Person(name: "Brus", surname: "Wayne", imageName: "batman"),
        Person(name: "Diana", surname: "Tymiskirskaya", imageName: "wonder woman"),
        Person(name: "Klark", surname: "Kent", imageName: "superman"),
        Person(name: "Barrey", surname: "Kent", imageName: "flash"),
        Person(name: "Artur", surname: "Karry", imageName: "aquaman")
    ]

    func addPerson(_ person: Person) {
        persons.append(person)
    }

    func removePerson(at index: Int) {
        guard index >= 0 && index < persons.count else { return }
        persons.remove(at: index)
    }

    func person(at index: Int) -> Person? {
        guard index >= 0 && index < persons.count else { return nil }
        return persons[index]
    }
}
